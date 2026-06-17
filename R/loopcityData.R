#' loopcityData: Experimental data for the loopcity package
#'
#' @description
#' Provides Hi-C loop calls and processed chromatin interaction data used in
#' examples and vignettes for the loopcity package.
#'
#' Small datasets are shipped directly and accessible via \code{data()}.
#' Larger files (K562 Hi-C contact matrices, ChIP-seq bigWig tracks) are
#' retrieved on demand from ExperimentHub using the accessor functions below.
#'
#' @section Direct data objects:
#' \describe{
#'   \item{\code{\link{GM12878_10KbLoops}}}{All GM12878 10 kb Hi-C loop calls
#'     as a \code{GInteractions} object.}
#'   \item{\code{\link{GM12878_10KbLoopsChr21}}}{Chromosome 21 subset of
#'     \code{GM12878_10KbLoops}.}
#' }
#'
#' @section ExperimentHub accessors:
#' \describe{
#'   \item{\code{\link{K562_hic}}}{Path to the K562 Hi-C \code{.hic} file.}
#'   \item{\code{\link{K562_loops}}}{Path to the K562 5 kb loop calls
#'     \code{.txt} file.}
#'   \item{\code{\link{K562_CTCF_bw}}}{Path to K562 CTCF ChIP-seq bigWig.}
#'   \item{\code{\link{K562_H3K27ac_bw}}}{Path to K562 H3K27ac ChIP-seq
#'     bigWig.}
#' }
#'
"_PACKAGE"


## ---- Internal helper -------------------------------------------------------

#' @importFrom AnnotationHub query
.eh <- function() ExperimentHub::ExperimentHub()

.get_resource <- function(title) {
    eh   <- .eh()
    hits <- query(eh, c("loopcityData", title))
    if (length(hits) == 0L)
        stop(
            "ExperimentHub record '", title, "' not found. ",
            "Try BiocManager::install('loopcityData') to refresh cache."
        )
    hits[[1L]]
}


## ---- ExperimentHub accessors -----------------------------------------------

#' K562 Hi-C contact matrix (.hic)
#'
#' Returns the local cache path to the K562 WT Hi-C \code{.hic} file
#' (GSE214123, MEGA merge, 0 h time-point) from Bond et al. 2023.
#' The file is downloaded from ExperimentHub on first use and cached locally.
#'
#' @return Character scalar — path to the cached \code{.hic} file.
#' @export
#' @examples
#' if (interactive()) {
#'     hic_path <- K562_hic()
#' }
K562_hic <- function() .get_resource("K562_hic")

#' K562 5 kb loop calls
#'
#' Returns the local cache path to the K562 WT 5 kb Hi-C loop call \code{.txt}
#' file (GSE214123, 0 h time-point) from Bond et al. 2023.
#'
#' @return Character scalar — path to the cached loop calls \code{.txt} file.
#' @export
#' @examples
#' if (interactive()) {
#'     loops_path <- K562_loops()
#' }
K562_loops <- function() .get_resource("K562_loops")

#' K562 CTCF ChIP-seq signal (bigWig)
#'
#' Returns the local cache path to the K562 WT CTCF ChIP-seq merged bigWig
#' (GSE213908, PMA 0 h) from Bond et al. 2023.
#'
#' @return Character scalar — path to the cached bigWig file.
#' @export
#' @examples
#' if (interactive()) {
#'     ctcf_path <- K562_CTCF_bw()
#' }
K562_CTCF_bw <- function() .get_resource("K562_CTCF_bw")

#' K562 H3K27ac ChIP-seq signal (bigWig)
#'
#' Returns the local cache path to the K562 WT H3K27ac ChIP-seq merged bigWig
#' (GSE213908, PMA 0 h) from Bond et al. 2023.
#'
#' @return Character scalar — path to the cached bigWig file.
#' @export
#' @examples
#' if (interactive()) {
#'     h3k27ac_path <- K562_H3K27ac_bw()
#' }
K562_H3K27ac_bw <- function() .get_resource("K562_H3K27ac_bw")


## ---- Shipped data documentation --------------------------------------------

#' GM12878 Hi-C loop calls at 10 kb resolution
#'
#' All autosomal Hi-C loop calls for GM12878 cells at 10 kb resolution,
#' stored as a \code{GInteractions} object.
#'
#' @format A \code{GInteractions} object with loop anchor coordinates in hg38.
#' @source GEO accession GSE63525 (Rao et al. 2014, Cell).
#' @examples
#' data(GM12878_10KbLoops)
#' GM12878_10KbLoops
"GM12878_10KbLoops"

#' GM12878 Hi-C loop calls on chromosome 21 (10 kb resolution)
#'
#' Chromosome 21 subset of \code{\link{GM12878_10KbLoops}}, used in package
#' examples and tests.
#'
#' @format A \code{GInteractions} object.
#' @source Subset of \code{\link{GM12878_10KbLoops}}.
#' @seealso \code{\link{GM12878_10KbLoops}}
#' @examples
#' data(GM12878_10KbLoopsChr21)
#' GM12878_10KbLoopsChr21
"GM12878_10KbLoopsChr21"
