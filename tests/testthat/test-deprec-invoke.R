test_that("invoke_* is deprecated", {
  expect_snapshot({
    . <- invoke(identity, 1)
    . <- invoke_map(identity, list())
    . <- invoke_map_lgl(identity, list())
    . <- invoke_map_int(identity, list())
    . <- invoke_map_dbl(identity, list())
    . <- invoke_map_chr(identity, list())
    . <- invoke_map_raw(identity, list())
  })
})

# invoke ------------------------------------------------------------------

test_that("invoke() evaluates expressions in the right environment", {
  local_options(lifecycle_verbosity = "quiet")

  x <- letters
  f <- toupper
  expect_equal(invoke("f", quote(x)), toupper(letters))
})

test_that("invoke() follows promises to find the evaluation env", {
  local_options(lifecycle_verbosity = "quiet")

  x <- letters
  f <- toupper
  f1 <- function(y) {
    f2 <- function(z) purrr::invoke(z, quote(x))
    f2(y)
  }
  expect_equal(f1("f"), toupper(letters))
})

# invoke_map --------------------------------------------------------------

test_that("invoke_map() works with bare function", {
  local_options(lifecycle_verbosity = "quiet")

  data <- list(1:2, 3:4)

  expected <- list("1 2", "3 4")
  expect_equal(invoke_map(paste, data), expected)
  expect_equal(invoke_map("paste", data), expected)
  expect_equal(invoke_map_chr(paste, data), unlist(expected))

  expect_identical(invoke_map_dbl(`+`, data), c(3, 7))
  expect_identical(invoke_map_int(`+`, data), c(3L, 7L))
  expect_identical(invoke_map_lgl(`&&`, data), c(TRUE, TRUE))

  expect_identical(invoke_map_raw(identity, as.raw(1:3)), as.raw(1:3))
})

test_that("invoke_map() works with bare function with data frames", {
  local_options(lifecycle_verbosity = "quiet")
  skip_if_not_installed("dplyr")

  data <- list(1:2, 3:4)
  ops <- set_names(c(`+`, `-`), c("a", "b"))
  expect_identical(invoke_map_dfr(ops, data), invoke_map_dfc(ops, data))
})

test_that("invoke_map() evaluates expressions in the right environment", {
  local_options(lifecycle_verbosity = "quiet")

  shadowed_object <- letters
  shadowed_fun <- toupper
  expect_equal(
    invoke_map("shadowed_fun", list(quote(shadowed_object))),
    list(toupper(letters))
  )
})

test_that("invoke_maps doesn't rely on c() returning list", {
  local_options(lifecycle_verbosity = "quiet")

  day <- as.Date("2016-09-01")
  expect_equal(invoke_map(identity, list(day)), list(day))
})
