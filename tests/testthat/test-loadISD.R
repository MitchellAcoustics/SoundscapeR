test_that("loadISD() successfully loads a tibble (as list type)", {
    is.list(loadISD())
})

test_that("loadISD() catches incorrect version number", {
    expect_error(loadISD(version = "0.1"), "ISD version not recognised.")
})
