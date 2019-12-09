library(XML)
url <- "http://www.ggobi.org/book/data/olive.xml"
##url <- "C:/EMNOMIA/Specs/Specs Planet/AIR6488_B43FB_NR/antenna.xml"
## parse the xml document and get the top-level XML node
doc <- xmlParse(url)
top <- xmlRoot(doc)

## create the data frame
df <- cbind(
    ## get all the labels for the first column (groups)
    X = unlist(doc["//record//@label"], use.names = FALSE), 
    read.table(
        ## get all the records as a character vector
        text = xmlValue(top[["data"]][["records"]]), 
        ## get the column names from 'variables'
        col.names = xmlSApply(top[["data"]][["variables"]], xmlGetAttr, "name"), 
        ## assign the NA values to 'na' in the records
        na.strings = "na"
    )
)

## result
head(df)

library(XML)
doc<-xmlParse("http://www.ggobi.org/book/data/olive.xml")
xmldf <- xmlToDataFrame(nodes = getNodeSet(doc, "//record"))
View(xmldf)

setwd("C:/EMNOMIA/Data Science Specialization/Courses/Course 3/Week 1/Quiz")
library(XML)
if (!file.exists("data")){
    dir.create("data")
}
fileUrl <- "C:/EMNOMIA/Specs/Specs Planet/AIR6488_B43FB_NR/antenna.xml"
restDataFrame <- xmlTreeParse(sub("s", "", fileUrl), useInternal=TRUE)
##restDataFrame <- xmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <- xmlRoot(restDataFrame)
xmlName(rootNode)
names(rootNode)
zip <- xpathSApply(rootNode, "//zipcode", xmlValue)
rootNode[[1]]
rootNode[[1]][[1]]
rootNode[[1]][[1]][[1]]
all <- xmlSApply(rootNode, xmlValue)
sum(zip == 21231)






library(XML)
url <- "C:/EMNOMIA/Specs/Specs Planet/AIR6488_B43FB_NR/antenna.xml"
xmldoc <- xmlParse(url)
rootNode <- xmlRoot(xmldoc)
rootNode[1]
data <- xmlSApply(rootNode,function(x) xmlSApply(x, xmlValue))
antenna <- data.frame(t(data),row.names=NULL)


library(XML)
library(data.table)
url <- "C:/EMNOMIA/Specs/Specs Planet/AIR6488_B43FB_NR/antenna.xml"
xmldoc <- xmlParse(url)
rootNode <- xmlRoot(xmldoc)
a<-rootNode[19]
for (icol in 1:19){
    data <- xmlSApply(rootNode[[icol]],function(x) xmlSApply(x, xmlValue))
    antenna <- data.table(t(data),row.names=NULL)
}


library(XML)
url <- "C:/EMNOMIA/Specs/Specs Planet/AIR6488_B43FB_NR/antenna.xml"
plantfile <- xmlParse(url)
plant.df <- as.data.frame(t(xpathSApply(plantfile,"//VirtualPorts",function(x) xmlSApply(x,xmlValue))))





require(XML)
xmlToDF = function(doc, xpath, isXML = TRUE, usewhich = TRUE, verbose = TRUE) {
    
    if (!isXML) 
        doc = xmlParse(doc)
    #### get the records for that form
    nodeset <- getNodeSet(doc, xpath)
    
    ## get the field names
    var.names <- lapply(nodeset, names)
    
    ## get the total fields that are in any record
    fields = unique(unlist(var.names))
    
    ## extract the values from all fields
    dl = lapply(fields, function(x) {
        if (verbose) 
            print(paste0("  ", x))
        xpathSApply(proc, paste0(xpath, "/", x), xmlValue)
    })
    
    ## make logical matrix whether each record had that field
    name.mat = t(sapply(var.names, function(x) fields %in% x))
    df = data.frame(matrix(NA, nrow = nrow(name.mat), ncol = ncol(name.mat)))
    names(df) = fields
    fields
    ## fill in that data.frame
    for (icol in 1:ncol(name.mat)) {
        rep.rows = name.mat[, icol]
        if (usewhich)
            rep.rows = which(rep.rows)
        df[rep.rows, icol] = dl[[icol]]
    }

    return(df)
}




doc <- xmlParse("C:/EMNOMIA/Specs/Specs Planet/AIR6488_B43FB_NR/antenna.xml")
xmlToDF(doc, xpath = "/export/dataset1")
xmlToDF("C:/EMNOMIA/Specs/Specs Planet/AIR6488_B43FB_NR/antenna.xml", xpath = "/export/dataset1", isXML = FALSE)
 

library(xml2)
library(dplyr)
pg <- read_xml("C:/EMNOMIA/Specs/Specs Planet/AIR6488_B43FB_NR/antenna.xml")
# get all the <record>s
recs <- xml_find_all(pg, "//Uid")

# extract and clean all the columns
vals <- trimws(xml_text(recs))

# extract and clean (if needed) the area names
labs <- trimws(xml_attr(recs, "label"))

# mine the column names from the two variable descriptions
# this XPath construct lets us grab either the <categ.> or <real.> tags
# and then grabs the 'name' attribute of them
cols <- xml_attr(xml_find_all(pg, "//data/variables/*[self::categoricalvariable or
                                                      self::realvariable]"), "name")

# this converts each set of <record> columns to a data frame
# after first converting each row to numeric and assigning
# names to each column (making it easier to do the matrix to data frame conv)
dat <- do.call(rbind, lapply(strsplit(vals, "\ +"),
                             function(x) {
                                 data.frame(rbind(setNames(as.numeric(x),cols)))
                             }))

# then assign the area name column to the data frame
dat$area_name <- labs

head(dat)


###################

library(xml2)
library(dplyr)
library(purrr)
library(stringr)

# From the root node:
# If has_children, then recurse.
# Otherwise, attributes, value and children (nested) to data frame.

xml_to_df <- function(doc, ns = xml_ns(doc)) {
    node_to_df <- function(node) {
        # Filter the attributes for ones that aren't namespaces
        # x <- list(.index = 0, .name = xml_name(node, ns))
        x <- list(.name = xml_name(node, ns))
        # Attributes as column headers, and their values in the first row
        attrs <- xml_attrs(node)
        if (length(attrs) > 0) {attrs <- attrs[!grepl("xmlns", names(attrs))]}
        if (length(attrs) > 0) {x <- c(x, attrs)}
        # Build data frame manually, to avoid as.data.frame's good intentions
        children <- xml_children(node)
        if (length(children) >= 1) {
            x <- 
                children %>%
                # Recurse here
                map(node_to_df) %>%
                split_by(".name") %>%
                map(bind_rows) %>%
                map(list) %>%
                {c(x, .)}
            attr(x, "row.names") <- 1L
            class(x) <- c("tbl_df", "data.frame")
        } else {
            x$.value <- xml_text(node)
        }
        x
    }
    node_to_df(doc)
}

xml_df <- xml_to_df(read_xml("C:/EMNOMIA/Specs/Specs Planet/AIR6488_B43FB_NR/antenna.xml"))


################
###################

library(xml2)
library(dplyr)
library(purrr)
library(stringr)

# From the root node:
# If has_children, then recurse.
# Otherwise, attributes, value and children (nested) to data frame.

xml_to_df <- function(doc, ns = xml_ns(doc)) {
    node_to_df <- function(node) {
        # Filter the attributes for ones that aren't namespaces
        # x <- list(.index = 0, .name = xml_name(node, ns))
        x <- list(.name = xml_name(node, ns))
        # Attributes as column headers, and their values in the first row
        attrs <- xml_attrs(node)
        if (length(attrs) > 0) {attrs <- attrs[!grepl("xmlns", names(attrs))]}
        if (length(attrs) > 0) {x <- c(x, attrs)}
        # Build data frame manually, to avoid as.data.frame's good intentions
        children <- xml_children(node)
        if (length(children) >= 1) {
            x <- 
                children %>%
                # Recurse here
                as_tibble(transpose(map(node_to_df))) %>% 
                mutate(name=unlist(nameg)) %>%
                map(bind_rows) %>%
                map(list) %>%
                {c(x, .)}
            attr(x, "row.names") <- 1L
            class(x) <- c("tbl_df", "data.frame")
        } else {
            x$.value <- xml_text(node)
        }
        x
    }
    node_to_df(doc)
}

xml_df <- xml_to_df(read_xml("C:/EMNOMIA/Specs/Specs Planet/AIR6488_B43FB_NR/antenna.xml"))

##############

library(XML)
library(plyr) 
# xml <- '<ResidentialProperty>........'
doc <- xmlParse("C:/EMNOMIA/Specs/Specs Planet/AIR6488_B43FB_NR/antenna.xml", asText =  TRUE)
df1 <- do.call(rbind.fill, lapply(doc['//AntennaModel'], function(x) { 
    names <- xpathSApply(x, './/.', xmlName) 
    names <- names[which(names == "text") - 1]
    values <- xpathSApply(x, ".//text()", xmlValue)
    return(as.data.frame(t(setNames(values, names)), stringsAsFactors = FALSE))
}))
df2 <- do.call(rbind.fill, lapply(doc['//AntennaModel/Ports'], function(x) { 
    names <- xpathSApply(x, './/.', xmlName) 
    names <- names[which(names == "text") - 1]
    values <- xpathSApply(x, ".//text()", xmlValue)
    return(as.data.frame(t(setNames(values, names)), stringsAsFactors = FALSE))
}))
df3 <- do.call(rbind.fill, lapply(doc['//AntennaModel/ElectricalControllers'], function(x) { 
    names <- xpathSApply(x, './/.', xmlName) 
    names <- names[which(names == "text") - 1]
    values <- xpathSApply(x, ".//text()", xmlValue)
    return(as.data.frame(t(setNames(values, names)), stringsAsFactors = FALSE))
}))
df4 <- do.call(rbind.fill, lapply(doc['//AntennaModel/Patterns'], function(x) { 
    names <- xpathSApply(x, './/.', xmlName) 
    names <- names[which(names == "text") - 1]
    values <- xpathSApply(x, ".//text()", xmlValue)
    return(as.data.frame(t(setNames(values, names)), stringsAsFactors = FALSE))
}))
df5 <- do.call(rbind.fill, lapply(doc['//AntennaModel/Beamforming'], function(x) { 
    names <- xpathSApply(x, './/.', xmlName) 
    names <- names[which(names == "text") - 1]
    values <- xpathSApply(x, ".//text()", xmlValue)
    return(as.data.frame(t(setNames(values, names)), stringsAsFactors = FALSE))
}))


library(XML)
library(plyr) 
# xml <- '<ResidentialProperty>........'
doc <- xmlParse("C:/EMNOMIA/Specs/Specs Planet/AIR6488_B43FB_NR/antenna.xml", asText =  TRUE)
df <- do.call(rbind.fill, lapply(doc['//AntennaModel/Ports'], function(x) { 
    names <- xpathSApply(x, './/.', xmlName) 
    names <- names[which(names == "text") - 1]
    values <- xpathSApply(x, ".//text()", xmlValue)
    return(as.data.table(t(setNames(values, names)), stringsAsFactors = FALSE))
}))
df3 <- do.call(rbind.fill, lapply(doc['//AntennaModel/Patterns'], function(x) { 
    names <- xpathSApply(x, './/.', xmlName) 
    names <- names[which(names == "text") - 1]
    values <- xpathSApply(x, ".//text()", xmlValue)
    return(as.data.table(t(setNames(values, names)), stringsAsFactors = FALSE))
}))
df4 <- do.call(rbind.fill, lapply(doc['//AntennaModel/Patterns'], function(x) { 
    names <- xpathSApply(x, './/.', xmlName) 
    names <- names[which(names == "text") - 1]
    values <- xpathSApply(x, ".//text()", xmlValue)
    return(as.data.table(t(setNames(values, names)), stringsAsFactors = FALSE))
}))

