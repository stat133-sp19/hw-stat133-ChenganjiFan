context("test summary measures functions")

test_that("aux_mean", {
  expect_equal(aux_mean(10,0.3),3)
  expect_equal(aux_mean(135, 0.2), 27)
  expect_equal(aux_mean(1,0.1),0.1)
})

test_that("aux_variance", {
  expect_equal(aux_variance(10,0.3),2.1)
  expect_equal(aux_variance(135, 0.2), 21.6)
  expect_equal(aux_variance(1,0.1),0.09)
})

test_that("aux_mode", {
  expect_equal(aux_mode(10,0.3),3)
  expect_equal(aux_mode(135, 0.2), 27)
  expect_equal(aux_mode(1,0.1),0)
})

test_that("aux_skewness", {
  expect_equal(round(aux_skewness(10,0.3), digit=2) ,0.28)
  expect_equal(round(aux_skewness(135, 0.2), digit=2), 0.13)
  expect_equal(round(aux_skewness(1,0.1), digit=2),2.67)
})

test_that("aux_kurtosis", {
  expect_equal(round(aux_kurtosis(10,0.3), digit=2),-0.12)
  expect_equal(round(aux_kurtosis(135, 0.2), digit=2), 0)
  expect_equal(round(aux_kurtosis(1,0.1), digit=2),5.11)
})
