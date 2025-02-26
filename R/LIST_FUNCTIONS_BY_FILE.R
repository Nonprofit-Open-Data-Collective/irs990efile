#' Extract Function Names and Arguments from an R Script
#'
#' Parses an R script to identify function definitions and their arguments.
#'
#' @param file A character string specifying the path to an R script file.
#' @return A data frame containing function names and their respective arguments.
#' @examples
#' extract_functions("script.R")
#' @export
extract_functions <- function(file) {
  lines <- readLines(file, warn = FALSE)
  
  # Regular expression to match function definitions
  func_pattern <- "^([a-zA-Z0-9_\\.]+)\\s*<-\\s*function\\s*\\(([^)]*)\\)"
  
  functions <- lapply(lines, function(line) {
    if (grepl(func_pattern, line)) {
      matches <- regmatches(line, regexec(func_pattern, line))
      func_name <- matches[[1]][2]
      args <- matches[[1]][3]
      return(c(func_name, args))
    }
    return(NULL)
  })
  
  functions <- do.call(rbind, Filter(Negate(is.null), functions))
  
  if (is.null(functions)) {
    return(NULL)
  } else {
    return(data.frame(Function = functions[,1], Arguments = functions[,2], stringsAsFactors = FALSE))
  }
}

#' Generate an ASCII Diagram of Functions and Arguments from R Scripts
#'
#' Reads multiple R script files and generates an ASCII representation
#' listing each file, its contained functions, and their arguments.
#'
#' @param files A character vector of R script file paths.
#' @return Prints an ASCII diagram showing the functions and their arguments.
#' @examples
#' generate_ascii_diagram(c("script1.R", "script2.R"))
#' @export
generate_ascii_diagram <- function(files) {
  ascii_output <- ""
  
  for (file in files) {
    functions_df <- extract_functions(file)
    
    ascii_output <- paste0(ascii_output, "\n", file, "\n")
    ascii_output <- paste0(ascii_output, strrep("-", nchar(file)), "\n")
    
    if (!is.null(functions_df)) {
      for (i in seq_len(nrow(functions_df))) {
        ascii_output <- paste0(
          ascii_output,
          "|-- ", functions_df$Function[i], "(", functions_df$Arguments[i], ")\n"
        )
      }
    } else {
      ascii_output <- paste0(ascii_output, "|-- (No functions found)\n")
    }
  }
  
  cat(ascii_output)
}
