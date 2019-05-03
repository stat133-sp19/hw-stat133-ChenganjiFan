context("test check functions")

test_that("check_prob", {
  expect_true(check_prob(1))
  expect_error(check_prob(-1))
  expect_error(check_prob(1,2))
})

test_that("check_trials", {
  expect_true(check_trials(1))
  expect_error(check_trials(-1))
  expect_error(check_trials(1,2))
})

test_that("check_success", {
  expect_true(check_success(1,2))
  expect_error(check_success(3,2))
  expect_error(check_success(-1,2))
})
