context("test bins functions")

test_that("bin_choose", {
  expect_equal(bin_choose(n=5, k=2),choose(5,2))
  expect_equal(bin_choose(5, 0), choose(5,0))
  expect_equal(bin_choose(5, 1:3),choose(5, 1:3))
})

test_that("bin_probability", {
  expect_equal(bin_probability(2, 5, 0.5),0.3125)
  expect_error(bin_probability(10, 5, 0.5))
  expect_equal(bin_probability(55, 100, 0.45), dbinom(55,100,0.45))
})

test_that("bin_distribution", {
  expect_equal(class(bin_distribution(5,0.5)), c("bindis", "data.frame"))
  expect_equal(bin_distribution(5,0.5)[[2]][1], dbinom(0,5,0.5))
  expect_equal(bin_distribution(5,0.5)[[2]][5], dbinom(4,5,0.5))
})

test_that("bin_cumulative", {
  expect_equal(class(bin_cumulative(5,0.5)), c("bincum", "data.frame"))
  expect_equal(bin_cumulative(5,0.5)[[3]][1], dbinom(0,5,0.5))
  expect_equal(bin_cumulative(5,0.5)[[3]][2], (dbinom(0,5,0.5)+dbinom(1,5,0.5)))
})
