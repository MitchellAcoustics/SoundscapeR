test_that("ISO Coordinates are calculated correctly", {
  # Min pleasant, random eventful
  df <- tibble::tibble(
    pleasant = c(1), chaotic = c(5), vibrant = c(1),
    uneventful = c(5), calm = c(1), annoying = c(5),
    eventful = c(1), monotonous = c(5)
  )
  res <- iso_coords(df)
  expect_equal(res[[1]], -1) # Pleasant should be exactly 1
  expect_lt(res[[2]], 0) # Eventful should be negative

  res <- iso_coords((df - 1) * 25, val_range = c(0, 100))
  expect_equal(res[[1]], -1)
  expect_lt(res[[2]], 0)

  # Max pleasant, random eventful
  df <- tibble::tibble(
    pleasant = c(5), chaotic = c(1), vibrant = c(5),
    uneventful = c(1), calm = c(5), annoying = c(1),
    eventful = c(5), monotonous = c(1)
  )
  res <- iso_coords(df)
  expect_equal(res[[1]], 1)
  expect_gt(res[[2]], 0)

  # all neutral
  df <- tibble::tibble(
    pleasant = c(3), chaotic = c(3), vibrant = c(3),
    uneventful = c(3), calm = c(3), annoying = c(3),
    eventful = c(3), monotonous = c(3)
  )
  res <- iso_coords(df)
  expect_equal(res[[1]], 0)
  expect_equal(res[[2]], 0)

  res <- iso_coords((df - 1) * 25, val_range = c(0, 10))
  expect_equal(res[[1]], 0)
  expect_equal(res[[2]], 0)

  # Min eventful, negative pleasant
  df <- tibble::tibble(
    pleasant = c(1), chaotic = c(1), vibrant = c(1),
    uneventful = c(5), calm = c(5), annoying = c(5),
    eventful = c(1), monotonous = c(5)
  )
  res <- iso_coords(df)
  expect_lt(res[[1]], 0)
  expect_equal(res[[2]], -1)

  res <- iso_coords((df - 1) * 25, val_range = c(0, 100))
  expect_lt(res[[1]], 0)
  expect_equal(res[[2]], -1)

  # Max eventful, positive pleasant
  df <- tibble::tibble(
    pleasant = c(5), chaotic = c(5), vibrant = c(5),
    uneventful = c(1), calm = c(1), annoying = c(1),
    eventful = c(5), monotonous = c(1)
  )
  res <- iso_coords(df)
  expect_gt(res[[1]], 0)
  expect_equal(res[[2]], 1)

  res <- iso_coords((df - 1) * 25, val_range = c(0, 100))
  expect_gt(res[[1]], 0)
  expect_equal(res[[2]], 1)
})
