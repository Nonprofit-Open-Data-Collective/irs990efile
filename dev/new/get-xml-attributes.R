# Read XML document
doc <- read_xml("your_file.xml")

# Find all nodes that have attributes
nodes_with_attrs <- xml_find_all(doc, "//*[@*]")  # Select nodes that have any attributes

# Extract all attribute names dynamically
all_attrs <- unique(unlist(lapply(nodes_with_attrs, function(node) names(xml_attrs(node)))))

# Create a structured data frame of attributes
attr_df <- nodes_with_attrs %>%
  purrr::map_df(~ {
    node <- .
    data.frame(
      node_name = xml_name(node),  # Store node name
      xpath = xml_path(node),  # Store full XPath
      as.list(xml_attrs(node))  # Extract all attributes
    )
  })

# Print result
print(attr_df)