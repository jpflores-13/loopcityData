## Scripts to (re)create the shipped data objects in data/
## Run from the package root: source("data-raw/make-data.R")

library(data.table)
library(InteractionSet)
library(GenomicRanges)
library(mariner)

## ---- GM12878_10KbLoops -------------------------------------------------------
## Source: GSE63525 (Rao et al. 2014)
## File obtained from: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE63525
##
## The raw loop call file was placed at:
##   data-raw/raw/GSE63525_GM12878_primary+replicate_HiCCUPS_looplist.txt
##
## Steps:
##   1. Read loop calls with data.table::fread
##   2. Bin anchors to 10 kb with mariner::assignToBins
##   3. Save full set + chr21 subset

raw_file <- "data-raw/raw/GSE63525_GM12878_primary+replicate_HiCCUPS_looplist.txt"

GM12878_10KbLoops <- data.table::fread(raw_file) |>
    mariner::assignToBins(binSize = 10e3)

GM12878_10KbLoopsChr21 <- GM12878_10KbLoops[
    seqnames(anchors(GM12878_10KbLoops, "first"))  == "chr21" &
    seqnames(anchors(GM12878_10KbLoops, "second")) == "chr21"
]

usethis::use_data(GM12878_10KbLoops,      overwrite = TRUE)
usethis::use_data(GM12878_10KbLoopsChr21, overwrite = TRUE)
