# Functions for the forecast submission in the BAN430 mandatory assignment.

# The web app (Google Apps Script) that receives the submissions. Paste the URL
# from "Deploy > Manage deployments" here (it ends with /exec).
submission_endpoint <- "https://script.google.com/macros/s/AKfycbyVw40ga9QPijZ45TS8mvNdQR_Tu1hPB4UFZch12_Nztz8p4yxyIuDxSD2EgjBhk_S2wQ/exec"

quantile_probs <- function() seq(0.05, 0.95, by = 0.05)
quantile_names <- function() sprintf("q%02d", round(quantile_probs() * 100))
submission_targets <- function() {
  c(as.character(as.Date("2026-10-23") + 0:8), "month_mean")
}

#' Make the forecast table from simulated outcomes
#'
#' Turns simulated outcomes into the table that is submitted in the mandatory
#' assignment: one row per target, with the point forecast (the mean of the
#' simulated outcomes) and the 19 quantiles `q05`, `q10`, ..., `q95`.
#'
#' @param sims A matrix or data frame with one column for each of the ten
#'   targets and one row for each simulated outcome. The columns must be named
#'   by the targets: `"2026-10-23"`, ..., `"2026-10-31"` and `"month_mean"`.
#'
#' @return A tibble with the columns `target`, `point`, `q05`, ..., `q95`.
#' @examples
#' sims <- sapply(c(as.character(as.Date("2026-10-23") + 0:8), "month_mean"),
#'                function(x) rnorm(500, mean = 1, sd = 0.2))
#' forecast_table(sims)
#' @export
forecast_table <- function(sims) {
  sims <- as.data.frame(sims, check.names = FALSE)
  if (!all(names(sims) %in% submission_targets())) {
    message("The column names of `sims` should be the targets: ",
            paste(submission_targets(), collapse = ", "), ".")
  }
  rows <- lapply(names(sims), function(nm) {
    x <- sims[[nm]]
    x <- x[is.finite(x)]
    q <- unname(stats::quantile(x, quantile_probs(), type = 7))
    tibble::as_tibble(c(list(target = nm, point = mean(x)),
                        stats::setNames(as.list(q), quantile_names())))
  })
  dplyr::bind_rows(rows)
}

#' Check the forecast table before you submit
#'
#' Checks that the forecast table has the right format: the columns `target`,
#' `point` and the 19 quantiles `q05`, `q10`, ..., `q95`, one row for each of
#' the ten targets, finite numbers and quantiles that do not decrease. It stops
#' with a list of the problems if something is wrong.
#'
#' @param fc The forecast table (a data frame).
#' @return `TRUE`, invisibly, if the table is fine.
#' @export
check_forecast <- function(fc) {
  if (!is.data.frame(fc)) stop("`fc` must be a data frame (a tibble).", call. = FALSE)
  need <- c("target", "point", quantile_names())
  problems <- character()
  warnings <- character()

  missing_cols <- setdiff(need, names(fc))
  extra_cols <- setdiff(names(fc), need)
  if (length(missing_cols)) {
    problems <- c(problems, paste0("Missing columns: ", paste(missing_cols, collapse = ", ")))
  }
  if (length(extra_cols)) {
    problems <- c(problems, paste0("Unknown columns: ", paste(extra_cols, collapse = ", ")))
  }

  if ("target" %in% names(fc)) {
    tg <- as.character(fc$target)
    miss_t <- setdiff(submission_targets(), tg)
    extra_t <- setdiff(tg, submission_targets())
    if (length(miss_t)) problems <- c(problems, paste0("Missing targets: ", paste(miss_t, collapse = ", ")))
    if (length(extra_t)) problems <- c(problems, paste0("Unknown targets: ", paste(extra_t, collapse = ", ")))
    if (anyDuplicated(tg)) problems <- c(problems, "Some targets appear more than once.")
  }

  num_cols <- intersect(setdiff(need, "target"), names(fc))
  if (length(num_cols)) {
    vals <- fc[num_cols]
    if (!all(vapply(vals, is.numeric, logical(1)))) {
      problems <- c(problems, "`point` and the quantiles must be numbers.")
    } else if (any(!is.finite(as.matrix(vals)))) {
      problems <- c(problems, "There are missing or infinite values.")
    } else {
      if (all(quantile_names() %in% names(fc))) {
        q <- as.matrix(fc[quantile_names()])
        if (any(apply(q, 1, function(r) any(diff(r) < 0)))) {
          bad <- if ("target" %in% names(fc)) fc$target[apply(q, 1, function(r) any(diff(r) < 0))] else NA
          problems <- c(problems, paste0("The quantiles must not decrease from q05 to q95 (check: ",
                                         paste(bad, collapse = ", "), ")."))
        }
        if (any(abs(q) > 20)) {
          warnings <- c(warnings, "Some quantiles are larger than 20 in absolute value. Are the prices in NOK/kWh (not in oere)?")
        }
        if (any(fc$point < q[, 1] | fc$point > q[, ncol(q)])) {
          warnings <- c(warnings, "Some point forecasts are outside the interval from q05 to q95.")
        }
      }
    }
  }

  if (length(problems)) {
    stop("The forecast table has problems:\n",
         paste0("- ", problems, collapse = "\n"), call. = FALSE)
  }
  for (w in warnings) warning(w, call. = FALSE)
  message("The forecast table looks fine (", nrow(fc), " targets, ",
          length(quantile_names()), " quantiles).")
  invisible(TRUE)
}

#' Submit your forecast
#'
#' Sends your forecast table to the course's submission server. You can submit
#' as many times as you like before the deadline, and the last submission
#' counts.
#'
#' @param fc The forecast table, see [forecast_table()] and [check_forecast()].
#' @param group The name of your group. It is shown in the results.
#' @param members The names of the group members (only used to match your
#'   submission to your report).
#' @param endpoint The address of the submission server. You do not need to
#'   change this.
#' @return The reply from the server, invisibly.
#' @export
submit_forecast <- function(fc, group, members, endpoint = getOption("ban430.endpoint", submission_endpoint)) {
  check_forecast(fc)
  group <- trimws(as.character(group))
  members <- trimws(as.character(members))
  if (length(group) != 1 || nchar(group) < 2 || nchar(group) > 40) {
    stop("`group` must be one name of 2 to 40 characters.", call. = FALSE)
  }
  if (length(members) != 1 || nchar(members) < 1 || nchar(members) > 200) {
    stop("`members` must be one text with the names of the group members.", call. = FALSE)
  }
  if (grepl("PASTE_THE_WEB_APP_URL_HERE", endpoint, fixed = TRUE)) {
    stop("The submission server is not set up yet.", call. = FALSE)
  }

  need <- c("target", "point", quantile_names())
  fc <- as.data.frame(fc)[need]
  fc$target <- as.character(fc$target)
  payload <- list(
    group = group, members = members,
    forecast = lapply(seq_len(nrow(fc)), function(i) as.list(fc[i, , drop = FALSE]))
  )
  json <- as.character(jsonlite::toJSON(payload, auto_unbox = TRUE, digits = 12))

  h <- curl::new_handle()
  curl::handle_setopt(h, post = TRUE, postfields = json, followlocation = TRUE, timeout = 60)
  curl::handle_setheaders(h, "Content-Type" = "text/plain;charset=utf-8")
  res <- tryCatch(curl::curl_fetch_memory(endpoint, h), error = function(e) {
    stop("Could not reach the submission server. Check your internet connection and try again.",
         call. = FALSE)
  })
  out <- tryCatch(jsonlite::fromJSON(rawToChar(res$content)), error = function(e) NULL)
  if (is.null(out)) {
    stop("Unexpected reply from the submission server (HTTP status ", res$status_code,
         "). Try again, and contact the lecturer if it keeps happening.", call. = FALSE)
  }
  if (!isTRUE(out$ok)) {
    stop("The submission was not accepted: ", out$error, call. = FALSE)
  }
  message("Submission registered for group '", group, "' (", out$received_at,
          "). You can submit again before the deadline, and the last submission counts.")
  invisible(out)
}
