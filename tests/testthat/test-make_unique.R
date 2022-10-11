test_that("make_unique works", {
  vec_unique_num <- 1:10
  vec_unique_char <- LETTERS[1:10]

  vec_dup_num <- c(1, 2, 3, 4, 5, 3, 3, 1, 1)
  vec_dup_num_expected <- c('1 (1)', '2', '3 (1)', '4', '5', '3 (2)', '3 (3)', '1 (2)', '1 (3)')

  vec_dup_char <- c('Bob', 'Bob', 'Bob', 'Billy', 'Billy', 'Sven')
  vec_dup_char_expected <- c('Bob (1)', 'Bob (2)', 'Bob (3)', 'Billy (1)', 'Billy (2)', 'Sven')

  vec_dup_char_vals_clash_with_dedup_solution <- c('Bob', 'Bob', 'Bob', 'Billy', 'Billy', 'Sven', 'Billy (2)')

  vec_dup_char_with_na <- c('Bob', 'Bob', 'Bob', 'Billy', 'Billy', 'Sven', NA, NA)
  vec_dup_char_with_na_expected <-  c('Bob (1)', 'Bob (2)', 'Bob (3)', 'Billy (1)', 'Billy (2)', 'Sven', NA, NA)

  # Numerical inputs
  expect_error(
    make_unique(vec_unique_num),
    NA
  )

  expect_equal(
    make_unique(vec_unique_num),
    vec_unique_num
  )

  expect_equal(
    make_unique(vec_dup_num),
    vec_dup_num_expected
  )


  # Character inputs
  expect_error(
    make_unique(vec_unique_char),
    NA
  )

  expect_equal(
    make_unique(vec_unique_char),
    vec_unique_char
  )

  expect_error(
    make_unique(vec_dup_char),
    NA
  )

  expect_equal(
    make_unique(vec_dup_char),
    vec_dup_char_expected
  )


  expect_error(
    make_unique(vec_dup_char_vals_clash_with_dedup_solution),
    'try again'
  )

  expect_error(
    make_unique(vec_dup_char_vals_clash_with_dedup_solution, wrap_in_brackets = FALSE),
    NA
  )

  # Char with NAs
  expect_error(
    vec_dup_char_with_na,
    NA
  )

  expect_equal(
    make_unique(vec_dup_char_with_na),
    vec_dup_char_with_na_expected
  )
})
