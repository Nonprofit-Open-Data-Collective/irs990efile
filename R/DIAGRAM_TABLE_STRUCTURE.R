#' @title Create Edgelist Version 1
#' @description Creates an edgelist from XPath expressions by splitting them into hierarchical node pairs.
#' @param xpaths A character vector of XPath expressions.
#' @return A data frame containing the edgelist with two columns representing parent-child relationships.
#' @examples
#' create_edgelist_v1(c("/A/B/C", "/A/D/E"))
#' @export
create_edgelist_v1 <- function(xpaths) {
  xpaths <- gsub("^/", "", xpaths)
  nodes <- strsplit(xpaths, "/")
  xpath.levels <- sapply(nodes, length)
  max.lev <- max(xpath.levels)
  nodes <- lapply(nodes, function(x) { c(x, rep("", max.lev - length(x))) })
  xpath.levels <- data.frame(do.call(cbind, nodes), stringsAsFactors = FALSE)

  df <- NULL
  for (i in 1:ncol(xpath.levels)) {
    for (j in 1:(max.lev - 1)) {
      df <- rbind(df, xpath.levels[j:(j + 1), i])
    }
  }

  df <- as.data.frame(df, stringsAsFactors = FALSE)
  df <- unique(df)
  df <- df[!grepl("$^", df$V2), ]

  return(df)
}

#' @title Create Edgelist Version 2
#' @description Similar to create_edgelist_v1 but removes the prefixes "Return/ReturnData" from XPath expressions.
#' @param xpaths A character vector of XPath expressions.
#' @return A data frame containing the edgelist with two columns representing parent-child relationships.
#' @examples
#' create_edgelist_v2(c("/Return/ReturnData/A/B", "/Return/ReturnData/C/D"))
#' @export
create_edgelist_v2 <- function(xpaths) {
  xpaths <- gsub("^/Return/ReturnData/", "", xpaths)
  nodes <- strsplit(xpaths, "/")
  xpath.levels <- sapply(nodes, length)
  max.lev <- max(xpath.levels)
  nodes <- lapply(nodes, function(x) { c(x, rep("", max.lev - length(x))) })
  xpath.levels <- data.frame(do.call(cbind, nodes), stringsAsFactors = FALSE)

  df <- NULL
  for (i in 1:ncol(xpath.levels)) {
    for (j in 1:(max.lev - 1)) {
      df <- rbind(df, xpath.levels[j:(j + 1), i])
    }
  }

  df <- as.data.frame(df, stringsAsFactors = FALSE)
  df <- unique(df)
  df <- df[!grepl("$^", df$V2), ]

  return(df)
}


#' @title Get Table Names
#' @description Retrieves a unique list of table names from the concordance table.
#' @param concordance A data frame or data.table of concordance data. Defaults to NULL, which fetches the concordance.
#' @return A character vector of unique table names.
#' @examples
#' get_table_names()
#' @export
get_table_names <- function(concordance = NULL) {
  if (is.null(concordance)) {
    concordance <- get_concordance()
  }
  table.names <- unique(concordance$rdb_table)
  return(table.names)
}

#' @title Get Table XPaths
#' @description Retrieves the XPaths associated with a specific table name from the concordance.
#' @param table.name A character string specifying the table name.
#' @return A character vector of XPaths associated with the table name.
#' @examples
#' get_table_xpaths("F9-P03-T01-PROGRAMS-OTHER")
#' @export
get_table_xpaths <- function(table.name = "F9-P07-T01-COMPENSATION") {
  if( ! exists("concordance") ) { concordance <- get_concordance() }
  xpaths <- concordance$xpath[ concordance$rdb_table == table.name ]
  return(xpaths)
}

#' @title Get Node Tree
#' @description Constructs a data.tree structure for a given table based on its XPaths.
#' @param table.name A character string specifying the table name.
#' @return A data.tree object representing the table's hierarchical structure.
#' @examples
#' get_nd("F9-P03-T01-PROGRAMS-OTHER")
#' @export
get_nd <- function(table.name) {
  tpaths <- get_table_xpaths(table.name)
  el <- create_edgelist_v1(tpaths)
  nd <- data.tree::FromDataFrameNetwork(network = el)
  return(nd)
}

#' @title Print Table Structure
#' @description Prints the hierarchical structure of a table.
#' @param table.name A character string specifying the table name.
#' @return None. Prints the table structure to the console.
#' @examples
#' print_table_str("F9-P03-T01-PROGRAMS-OTHER")
#' @export
print_table_str <- function(table.name) {
  nd <- get_nd(table.name)
  print(nd)
}

#' @title Plot Table Structure
#' @description Plots the hierarchical structure of a table using data.tree visualization.
#' @param table.name A character string specifying the table name.
#' @return None. Displays a plot of the table structure.
#' @examples
#' plot_table_str("F9-P03-T01-PROGRAMS-OTHER")
#' @export
plot_table_str <- function(table.name) {
  nd <- get_nd(table.name)
  data.tree::SetGraphStyle(nd, rankdir = "LR")
  data.tree::SetEdgeStyle(nd, arrowhead = "vee", color = "grey20", penwidth = 2)
  data.tree::SetNodeStyle(nd, 
    style = "filled,rounded", 
    shape = "box", 
    fillcolor = "LightBlue", 
    fontname = "helvetica", 
    fontcolor = "black",
    tooltip = data.tree::GetDefaultTooltip )
  plot(nd)
}