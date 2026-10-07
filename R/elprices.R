#' Update the daily electricity price data
#'
#' Downloads the days that are missing in `elprices_daily` (or in a previously
#' updated copy of it) from hvakosterstrommen.no, and returns the updated
#' data. The data in the package is a snapshot, so this is how you get the
#' newest days. Only the missing days are downloaded, so it is quick to run
#' again later.
#'
#' The prices are the same as in `elprices_daily`: NOK/kWh excluding VAT, with
#' the daily value being the mean of the hourly prices. Only complete days are
#' returned. Today's prices are normally complete, and tomorrow's prices are
#' published around 13:00 Norwegian time (use `to = Sys.Date() + 1`).
#'
#' @param data The data to update. Defaults to the snapshot `elprices_daily`.
#' @param to The last date to download. Defaults to today.
#' @param refetch_days The last this many days in `data` are downloaded again,
#'   in case they were incomplete the last time.
#'
#' @return A tsibble in the same format as `elprices_daily`.
#' @examples
#' \dontrun{
#' library(ban430data)
#' elprices <- update_elprices()
#' # later in the month, keep the old copy and add the new days:
#' elprices <- update_elprices(elprices)
#' }
#' @export
update_elprices <- function(data = ban430data::elprices_daily,
                            to = Sys.Date(), refetch_days = 3) {
  data <- tibble::as_tibble(data)
  to <- as.Date(to)
  from <- max(data$date) - refetch_days + 1
  if (from > to) return(tsibble::as_tsibble(data, key = area, index = date))

  grid <- expand.grid(date = seq(from, to, by = "day"),
                      area = unique(data$area), stringsAsFactors = FALSE)
  new <- dplyr::bind_rows(lapply(seq_len(nrow(grid)), function(i) {
    read_price_day(grid$date[i], grid$area[i])
  }))

  old <- data[data$date < from, ]
  out <- dplyr::arrange(dplyr::bind_rows(old, new), area, date)
  n_new <- nrow(out) - nrow(data)
  message("Prices now run to ", max(out$date), " (", max(n_new, 0),
          " new area-days).")
  tsibble::as_tsibble(out, key = area, index = date)
}

read_price_day <- function(date, area) {
  url <- sprintf("https://www.hvakosterstrommen.no/api/v1/prices/%s_%s.json",
                 format(date, "%Y/%m-%d"), area)
  x <- tryCatch(suppressWarnings(jsonlite::fromJSON(url)), error = function(e) NULL)
  if (is.null(x) || length(x) == 0 || nrow(x) < 23) return(NULL)
  tibble::tibble(area = area, date = date,
                 price = mean(x$NOK_per_kWh), n_hours = nrow(x))
}
