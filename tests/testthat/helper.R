library(checkmate)
library(mlr3)
lapply(list.files(system.file("testthat", package = "mlr3"),
  pattern = "^helper.*\\.[rR]$", full.names = TRUE), source)

expect_filter = function(f, task = NULL) {
  expect_r6(f, "Filter",
    public = c(
      "packages", "feature_types", "task_types", "param_set", "scores",
      "calculate")
  )

  expect_character(f$packages, any.missing = FALSE, unique = TRUE)
  expect_subset(f$task_types, c(mlr_reflections$task_types$type, NA))
  expect_subset(f$feature_types, mlr_reflections$task_feature_types)
  expect_class(f$param_set, "ParamSet")
  expect_function(f$calculate, args = c("task", "nfeat"), ordered = TRUE)
  expect_numeric(f$scores, names = "unique")
  if (!is.null(task)) {
    expect_names(names(f$scores), permutation.of = task$feature_names)
  }
}
