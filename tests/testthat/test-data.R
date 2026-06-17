library(InteractionSet)

test_that("GM12878_10KbLoops loads as a GInteractions object", {
    data(GM12878_10KbLoops)
    expect_s4_class(GM12878_10KbLoops, "GInteractions")
    expect_true(length(GM12878_10KbLoops) > 0)
    expect_true("value" %in% names(mcols(GM12878_10KbLoops)))
})

test_that("GM12878_10KbLoopsChr21 is the chr21 subset", {
    data(GM12878_10KbLoopsChr21)
    expect_s4_class(GM12878_10KbLoopsChr21, "GInteractions")
    expect_equal(length(GM12878_10KbLoopsChr21), 141L)
    chroms <- as.character(
        GenomicRanges::seqnames(anchors(GM12878_10KbLoopsChr21, type = "first"))
    )
    expect_true(all(chroms == "21"))
})

test_that("ExperimentHub accessor functions are exported", {
    expect_true(is.function(K562_hic))
    expect_true(is.function(K562_loops))
    expect_true(is.function(K562_CTCF_bw))
    expect_true(is.function(K562_H3K27ac_bw))
})
