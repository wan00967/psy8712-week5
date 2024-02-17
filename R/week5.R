# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import
Adata_tbl <- read_delim("../data/Aparticipants.dat", delim = "-", escape_double = FALSE, trim_ws = TRUE, col_names = c("casenum", "parnum","stimver", "datadate", "qs"))
Anotes_tbl <- read_csv("../data/Anotes.csv")
Bdata_tbl <- read_delim("../data/Bparticipants.dat", delim = "\t", escape_double = FALSE, trim_ws = TRUE, col_names = c("casenum", "parnum","stimver", "datadate", paste0("q",1:10)))
Bnotes_tbl <- read_delim("../data/Bnotes.txt", delim = "\t", escape_double = FALSE, trim_ws = TRUE)

# Data cleaning
Aclean_tbl<- Adata_tbl %>%
  separate("qs", into = c("q1","q2","q3","q4","q5"), sep = "-") %>%
  mutate(datadate=mdy_hms(datadate)) %>%
  mutate(across(starts_with("q"), as.integer)) %>%
  left_join(Anotes_tbl, by = "parnum") %>%
  filter(is.na(notes))
ABclean_tbl <- Bdata_tbl %>%
  mutate(datadate=mdy_hms(datadate)) %>%
  mutate(across(starts_with("q"), as.integer)) %>%
  left_join(Bnotes_tbl, by = "parnum") %>%
  filter(is.na(notes)) %>%
  bind_rows(Aclean_tbl, .id = "lab") %>%
  select(-notes)