# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import
Adata_tbl <- read_delim("../data/Aparticipants.dat", delim = "-", escape_double = FALSE, trim_ws = TRUE, col_names = c("casenum", "parnum","stimver", "datadate", "qs"))
Anotes_tbl <- read_csv("../data/Anotes.csv")
Bdata_tbl <- read_delim("../data/Bparticipants.dat", delim = "\t", escape_double = FALSE, trim_ws = TRUE, col_names = c("casenum", "parnum","stimver", "datadate", paste0("q",1:10)))
Bnotes_tbl <- read_delim("../data/Bnotes.txt", delim = "\t", escape_double = FALSE, trim_ws = TRUE)
