#' Daily temperature in Bergen (Florida)
#'
#' Data downloaded from seklima.met.no.
#'
#' @format ## `bergentemp`
#' A tsibble with 8,767 rows and 2 columns:
#' \describe{
#'   \item{date}{date}
#'   \item{meanTemp}{Average temperatuer in celsius}
#' }
#' @source <https://seklima.met.no>
"bergentemp"

#' Simulated hourly offshore wind power production, two locations
#'
#' Five years (2015-2019) of simulated hourly power production for two
#' proposed Norwegian offshore wind farm locations. Used in the Time
#' Series Graphics lab (the "which site would you build first" case).
#'
#' @format ## `windpower`
#' A tsibble with 87,648 rows and 3 columns, keyed by `Place`:
#' \describe{
#'   \item{Place}{wind farm location: "Utsira Nord" or "Sørlig Nordsjø 2"}
#'   \item{powerprod}{hourly power production, MW}
#'   \item{datetime}{date-time, hourly resolution}
#' }
"windpower"

#' Example datasets: Time series graphics session
#'
#' A bundle of small example datasets used in the "Time series graphics"
#' (BAN430 session 2) code companion and lecture notes. `a10`,
#' `melsyd_economy`, `recent_production` and `vic_elec_2012` are ready-made
#' tsibbles for the plotting demos. `bergen`, `tute1` and `z_month` are
#' left raw/unconverted on purpose, for the "building a tsibble" and
#' "handling different time formats" live-coding exercises.
#'
#' @format ## `a10`
#' A tsibble with 204 rows and 2 columns: total monthly Australian
#' antidiabetic drug sales (from `PBS`, ATC2 group "A10").
#' \describe{
#'   \item{Month}{month (`yearmonth`)}
#'   \item{Cost}{cost, $ million}
#' }
#' @rdname timeseriesgraphics
"a10"

#' @format ## `bergen`
#' A plain tibble (**not yet a tsibble**) with 23,991 rows and 4 columns:
#' daily average temperature in Bergen (Florida).
#' \describe{
#'   \item{name}{weather station name}
#'   \item{station}{weather station ID}
#'   \item{date}{date, as character, format `"dd.mm.yyyy"`}
#'   \item{temp}{average daily temperature in Celsius}
#' }
#' @source <https://seklima.met.no>
#' @rdname timeseriesgraphics
"bergen"

#' @format ## `melsyd_economy`
#' A tsibble with 282 rows and 4 columns: weekly economy-class passenger
#' numbers on the Melbourne-Sydney route (from `ansett`).
#' \describe{
#'   \item{Week}{week (`yearweek`)}
#'   \item{Airports}{route, always "MEL-SYD"}
#'   \item{Class}{travel class, always "Economy"}
#'   \item{Passengers}{passengers, '000}
#' }
#' @rdname timeseriesgraphics
"melsyd_economy"

#' @format ## `recent_production`
#' A tsibble with 42 rows and 7 columns: quarterly Australian production
#' from 2000 onwards (from `aus_production`).
#' \describe{
#'   \item{Quarter}{quarter (`yearquarter`)}
#'   \item{Beer}{beer production, megalitres}
#'   \item{Tobacco}{tobacco and cigarette production, tonnes}
#'   \item{Bricks}{clay brick production, millions}
#'   \item{Cement}{cement production, thousand tonnes}
#'   \item{Electricity}{electricity production, GWh}
#'   \item{Gas}{gas production, petajoules}
#' }
#' @rdname timeseriesgraphics
"recent_production"

#' @format ## `tute1`
#' A tibble with 100 rows and 4 columns: quarterly sales, advertising
#' budget and GDP for a small company, 1981-2005 (not yet a tsibble).
#' \describe{
#'   \item{Quarter}{date of the first day of the quarter}
#'   \item{Sales}{quarterly sales}
#'   \item{AdBudget}{advertising budget}
#'   \item{GDP}{gross domestic product}
#' }
#' @source <http://OTexts.com/fpp3/extrafiles/tute1.csv>
#' @rdname timeseriesgraphics
"tute1"

#' @format ## `vic_elec_2012`
#' A tsibble with 17,568 rows and 5 columns: half-hourly Victorian
#' electricity demand for 2012 (from `vic_elec`, filtered to
#' `year(Time) == 2012`).
#' \describe{
#'   \item{Time}{date-time, 30 minute resolution}
#'   \item{Demand}{electricity demand, MW}
#'   \item{Temperature}{temperature in Melbourne, Celsius}
#'   \item{Date}{calendar date}
#'   \item{Holiday}{whether the day is a public holiday}
#' }
#' @rdname timeseriesgraphics
"vic_elec_2012"

#' @format ## `z_month`
#' A tibble with 12 rows and 2 columns: a small simulated monthly example
#' for the "build a tsibble from scratch" demo. `Month` is left as
#' character on purpose, for students to convert themselves.
#' \describe{
#'   \item{Month}{month, as character (e.g. `"2020 Jan"`)}
#'   \item{y}{a simulated value}
#' }
#' @rdname timeseriesgraphics
"z_month"

#' Example datasets: Time series decomposition session
#'
#' A bundle of small example datasets used in the "Adjustments,
#' Transformations and Time Series Decomposition" (BAN430 session 3)
#' slides. Most are left in the same raw shape as their original source
#' (or API response) so the slides'/activity's own wrangling code
#' (renaming columns, converting to the right time class, filtering,
#' `as_tsibble()`) does the actual teaching work.
#'
#' @format ## `employment`
#' A tibble with 214 rows and 3 columns: quarterly employment in Norway
#' by sex, ages 15-74 (Statistics Norway). Not yet a tsibble.
#' \describe{
#'   \item{Sex}{"Male" or "Female"}
#'   \item{Quarter}{quarter, as character (e.g. `"1996K1"`)}
#'   \item{Employed persons (1 000 persons)}{employed persons, thousands}
#' }
#' @source Statistics Norway
#' @rdname decomposition
"employment"

#' @format ## `cpi`
#' A tibble with 564 rows and 2 columns: Norwegian Consumer Price Index
#' (2015=100), monthly, from Statistics Norway's PxWebApi (table 03013,
#' all-item index). Not yet a tsibble. Refreshed by re-running
#' `3_decomposition_features/build_decomposition_data.R` - the query
#' always asks for every month currently published, so re-running it in
#' a future course iteration picks up the newest data automatically.
#' \describe{
#'   \item{month}{month, as character (e.g. `"1979M01"`)}
#'   \item{cpi}{Consumer Price Index, 2015=100}
#' }
#' @source <https://www.ssb.no/statbank/table/03013>
#' @rdname decomposition
"cpi"

#' @format ## `wholesale`
#' A tsibble with 319 rows and 2 columns: monthly value index
#' (unadjusted) for "Retail trade, except of motor vehicles and
#' motorcycles" in Norway, live from Statistics Norway's PxWebApi (table
#' 07129) - already ready to use, no wrangling needed.
#' \describe{
#'   \item{yearmonth}{month (`yearmonth`)}
#'   \item{Wholesale and retail sales index}{index value}
#' }
#' @source <https://www.ssb.no/statbank/table/07129>
#' @rdname decomposition
"wholesale"

#' @format ## `bigmac_norway`
#' A tsibble with 41 rows and 4 columns: Norway's Big Mac price
#' (semi-annual, 2002-2026), already joined to an annual Norwegian CPI -
#' ready to use directly, so the in-class inflation-adjustment activity
#' takes ~5 minutes instead of being spent finding and merging data. The
#' most recent 1-2 rows can have `cpi = NA` if Statistics Norway hasn't
#' published that year's CPI yet.
#' \describe{
#'   \item{date}{date of that survey round}
#'   \item{local_price}{Big Mac price in NOK}
#'   \item{dollar_price}{Big Mac price converted to US dollars}
#'   \item{cpi}{annual average Consumer Price Index (2015=100), from `cpi` above}
#' }
#' Only Norway is bundled here. The full Economist dataset covers ~57
#' countries back to 2000 and is one `readr::read_csv()` away from the
#' source URL below if you want to look at another country.
#' @source <https://raw.githubusercontent.com/TheEconomist/big-mac-data/master/output-data/big-mac-raw-index.csv>,
#'   full repo: <https://github.com/TheEconomist/big-mac-data>
#' @rdname decomposition
"bigmac_norway"
