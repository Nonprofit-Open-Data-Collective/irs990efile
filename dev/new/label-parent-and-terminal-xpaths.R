xpaths <- 
  doc %>% 
  xml_find_all("//*") %>% 
  xml_path()

# Sort XPaths in increasing order (parent nodes come first)
xpaths <- sort(xpaths)

# Function to detect leaf nodes
find_leaf_nodes <- function(xpath_list) {
  leaf_nodes <- c()
  
  for (i in seq_along(xpath_list)) {
    is_leaf <- TRUE
    for (j in seq_along(xpath_list)) {
      if (i != j && startsWith(xpath_list[j], paste0(xpath_list[i], "/"))) {
        is_leaf <- FALSE
        break
      }
    }
    if (is_leaf) {
      leaf_nodes <- c(leaf_nodes, xpath_list[i])
    }
  }
  
  return(leaf_nodes)
}

# Get only the leaf nodes
leaf_xpaths <- find_leaf_nodes(xpaths)

# Print result
print(leaf_xpaths)





# Sort XPaths in increasing order (parent nodes come first)
xpaths <- sort(xpaths)

# Function to detect parent nodes
find_parent_nodes <- function(xpath_list) {
  parent_nodes <- c()
  
  for (i in seq_along(xpath_list)) {
    for (j in seq_along(xpath_list)) {
      if (i != j && startsWith(xpath_list[j], paste0(xpath_list[i], "/"))) {
        parent_nodes <- c(parent_nodes, xpath_list[i])
        break  # No need to check further, it's already confirmed as a parent
      }
    }
  }
  
  return(unique(parent_nodes))  # Remove duplicates
}

# Get only the parent nodes
parent_xpaths <- find_parent_nodes(xpaths)

# Print result
print(parent_xpaths)

