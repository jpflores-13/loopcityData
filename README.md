# loopcityData

`loopcityData` is a Bioconductor ExperimentData package that provides
Hi-C loop calls and chromatin interaction data used in the examples and
vignettes of the [loopcity](https://github.com/sarmapar/loopcity) package.

## Datasets

| Object | Description | Source |
|---|---|---|
| `GM12878_10KbLoops` | GM12878 Hi-C loop calls at 10 kb resolution | Rao et al. 2014, GSE63525 |
| `GM12878_10KbLoopsChr21` | Chromosome 21 subset of `GM12878_10KbLoops` | Rao et al. 2014, GSE63525 |
| `K562_hic()` | K562 Hi-C contact matrix (.hic) | Bond et al. 2023, GSE214123 |
| `K562_loops()` | K562 5 kb loop calls | Bond et al. 2023, GSE214123 |
| `K562_CTCF_bw()` | K562 CTCF ChIP-seq signal (bigWig) | Bond et al. 2023, GSE213908 |
| `K562_H3K27ac_bw()` | K562 H3K27ac ChIP-seq signal (bigWig) | Bond et al. 2023, GSE213908 |

The GM12878 objects ship with the package. The K562 files are hosted on
ExperimentHub and downloaded to a local cache on first use.

## Installation

```r
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("loopcityData")
```

Until the package is available on Bioconductor, install from GitHub:

```r
if (!requireNamespace("remotes", quietly = TRUE))
    install.packages("remotes")

remotes::install_github("jpflores-13/loopcityData")
```

## Usage

```r
library(loopcityData)

# Shipped data
data(GM12878_10KbLoops)
data(GM12878_10KbLoopsChr21)

# ExperimentHub data (downloaded on first use)
hic_path     <- K562_hic()
loops_path   <- K562_loops()
ctcf_path    <- K562_CTCF_bw()
h3k27ac_path <- K562_H3K27ac_bw()
```

See the [loopcity vignettes](https://sarmapar.com/loopcity/articles/) for
worked examples using these datasets.
