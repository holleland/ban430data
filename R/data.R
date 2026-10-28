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
#' A tibble with 244 rows and 3 columns: quarterly employment in Norway
#' by sex, ages 15-74, live from Statistics Norway's PxWebApi (table
#' 03778, Labour Force Survey, not seasonally adjusted). Still one row
#' per sex per quarter (not yet a tsibble - summing/keying by `Quarter`
#' is still part of the teaching code), but the boilerplate parts are
#' done already: `Quarter` is a proper `yearquarter` (SSB's `"1996K1"`
#' format isn't R's own) and the value column is already named
#' `Employed`. Refreshed by re-running
#' `3_decomposition_features/build_decomposition_data.R` - the query
#' always asks for every quarter currently published, so re-running it in
#' a future course iteration picks up the newest data automatically.
#' \describe{
#'   \item{Sex}{"Males" or "Females"}
#'   \item{Quarter}{quarter (`yearquarter`)}
#'   \item{Employed}{employed persons, thousands}
#' }
#' @source <https://www.ssb.no/statbank/table/03778>
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

#' @format ## `wholesale_raw_lab`
#' A tibble with 319 rows and 2 columns: the same series as `wholesale`
#' above, but left raw (month as character, not yet a tsibble) - used in
#' the Time Series Decomposition lab's wholesale/retail task, where
#' converting `month` to `yearmonth` and building the tsibble is itself
#' part of the exercise.
#' \describe{
#'   \item{month}{month, as character (e.g. `"2000M01"`)}
#'   \item{wholesale and retail sales index}{index value}
#' }
#' @source <https://www.ssb.no/statbank/table/07129>
#' @rdname decomposition
"wholesale_raw_lab"

#' @format ## `wholesale_sa`
#' A tsibble with 319 rows and 2 columns: SSB's own **seasonally
#' adjusted** version of the `wholesale`/`wholesale_raw_lab` series
#' (same table 07129, same NACE=47 filter, `ContentsCode = VerdiinSesong`
#' instead of `Verdiindeks`) - already ready to use, no wrangling needed.
#' Meant for comparing a student's own seasonal adjustment (from the
#' Lab_decomposition.qmd wholesale task) against the statistical agency's
#' official one.
#' \describe{
#'   \item{yearmonth}{month (`yearmonth`)}
#'   \item{index_sa}{index value, seasonally adjusted}
#' }
#' @source <https://www.ssb.no/statbank/table/07129>
#' @rdname decomposition
"wholesale_sa"

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

#' @format ## `hotel_guestnights`
#' A tsibble with 486 rows and 2 columns: monthly hotel guest nights for
#' the whole of Norway, all purposes combined, live from Statistics
#' Norway's PxWebApi (table 14166) - already ready to use, no wrangling
#' needed. Long history with pronounced summer seasonality and a genuine
#' trend-cycle story (steady growth, then the 2020 COVID crash and
#' recovery) - used for the in-class decomposition activity, deliberately
#' a different series from `wholesale` (reserved for the Thursday lab).
#' \describe{
#'   \item{yearmonth}{month (`yearmonth`)}
#'   \item{Guest nights}{number of guest nights at hotels and similar
#'     accommodation establishments}
#' }
#' @source <https://www.ssb.no/statbank/table/14166>
#' @rdname decomposition
"hotel_guestnights"

#' Example datasets: Time series regression session (Bergen traffic lab)
#'
#' Hourly traffic sensor counts and a Norwegian public holiday calendar,
#' used in the Bergen traffic forecast lab (`Lab_regression.qmd`) - an
#' extended, regularly-refreshable version of the same case study as the
#' `WS_traffic.qmd` workshop (which keeps its own static, unrelated CSVs on
#' GitHub - this bundle is only used by the lab). `traffic_danmarksplass`
#' already has the ferry-traffic sensor (Moberg v/Lekven) merged in as its
#' own column - the lab is meant to spend its time on modelling and
#' evaluation, not on rejoining two raw hourly series by datetime, so that
#' join is done once here rather than once per student. It's kept raw
#' (plain tibble, not yet a tsibble) on purpose, since building the tsibble
#' is itself part of the lab's first task. `holidays_no` stays separate -
#' turning it into an `is_holiday` column is kept as a short, explicit
#' lab exercise. Refreshed by re-running
#' `5_regression/build_regressionlab_data.R` - the traffic pull always asks
#' for data up through "today", and the holiday calendar is computed (not
#' downloaded), so re-running it in a future course iteration automatically
#' extends both.
#'
#' @format ## `traffic_danmarksplass`
#' A tibble with hourly rows, 2018-01-01 onwards:
#' \describe{
#'   \item{datetime}{date-time, hourly resolution (Europe/Oslo)}
#'   \item{vehicles}{vehicles counted at Danmarksplass ("ved ladestasjon") in the previous hour}
#'   \item{moberg}{vehicles counted at Moberg v/Lekven (Halhjem ferry-arrival traffic) in the previous hour}
#' }
#' @source <https://www.vegvesen.no/trafikkdata/>, stations 14630V805616 (Danmarksplass) and 41273V805613 (Moberg v/Lekven)
#' @rdname regressionlab
"traffic_danmarksplass"

#' @format ## `holidays_no`
#' A tibble with one row per Norwegian public holiday date, 2018-2027:
#' fixed dates (New Year's Day, Labour Day, Constitution Day, Christmas,
#' Boxing Day) plus the Easter-relative dates (Palm Sunday through Easter
#' Monday, Ascension Day, Whit Sunday/Monday), computed from Easter Sunday
#' rather than downloaded - see `compute_norwegian_holidays()` in the build
#' script for the (deterministic) rule.
#' \describe{
#'   \item{date}{holiday date}
#' }
#' @rdname regressionlab
"holidays_no"

#' Example datasets: Exponential smoothing session (ETS lab)
#'
#' Two series used in the ETS lab (`Lab_ets.qmd`) alongside `hotel_guestnights`
#' (already bundled under the `decomposition` topic), chosen so that
#' different ETS(Error,Trend,Season) setups each turn out to be the genuine
#' best choice on a held-out test set - `hotel_guestnights` has real trend
#' and season, so Holt-Winters wins there, but neither of these two does.
#' Refreshed by re-running `6_ETS/build_ets_data.R` - both queries always ask
#' for data up through "today", so re-running it in a future course
#' iteration automatically extends both.
#'
#' @format ## `exchange_usdnok`
#' A tsibble with 200+ rows: monthly average USD/NOK spot exchange rate,
#' 2010 onwards - close to a random walk, with no real trend or season, so
#' simple exponential smoothing is hard to beat and an un-damped trend
#' actively hurts.
#' \describe{
#'   \item{month}{month (`yearmonth`)}
#'   \item{rate}{average USD/NOK spot rate that month}
#' }
#' @source <https://app.norges-bank.no/query/#/en/exchange_rate>
#' @rdname ets_lab
"exchange_usdnok"

#' @format ## `population_no`
#' A tsibble with 115+ rows: Norway's national population at the start of
#' each quarter, 1997 Q4 onwards - a strong, smooth trend with essentially
#' no seasonality, so a damped trend model wins and a seasonal term doesn't
#' help.
#' \describe{
#'   \item{quarter}{quarter (`yearquarter`)}
#'   \item{population}{population at the start of the quarter}
#' }
#' @source <https://www.ssb.no/statbank/table/01222>
#' @rdname ets_lab
"population_no"

#' @format ## `policy_rate_no`
#' A tsibble with 200+ rows: Norges Bank's key policy rate ("styringsrenten"),
#' monthly, 2010 onwards - the dramatic damped-vs-linear-trend illustration.
#' Trained only through the end of the rapid 2022-2023 hiking cycle, a plain
#' (undamped) Holt trend extrapolates continued hikes indefinitely, while
#' the actual rate plateaued and then started cutting - a damped trend
#' tracks that far better.
#' \describe{
#'   \item{month}{month (`yearmonth`)}
#'   \item{rate}{key policy rate that month, percent}
#' }
#' @source <https://app.norges-bank.no/query/#/en/interest>
#' @rdname ets_lab
"policy_rate_no"

#' Global land-ocean temperature index
#'
#' NASA GISS Surface Temperature Analysis (GISTEMP v4), annual mean
#' land-ocean temperature index, 1880 onwards. Used in the "Example: Global
#' temperature" slides in the ARIMA session (`ARIMA_part2.qmd`).
#'
#' @format ## `global_temp`
#' A tsibble with 144 rows and 3 columns:
#' \describe{
#'   \item{Year}{year}
#'   \item{No_Smoothing}{annual mean temperature anomaly relative to the
#'   1951-1980 base period, degrees Celsius}
#'   \item{Lowess.5.}{same series, smoothed with a 5-year LOWESS}
#' }
#' @source <https://data.giss.nasa.gov/gistemp/>
"global_temp"

#' Mean monthly temperature in Bergen
#'
#' Monthly mean temperature at the Bergen - Florida weather station (SN50540),
#' January 1949 to September 2026, as published by the Norwegian
#' Meteorological Institute (seklima.met.no). Used in the "Bergen mean
#' temperature" example in the seasonal ARIMA session.
#'
#' @format ## `bergentemp_monthly`
#' A tsibble with 933 rows and 2 columns:
#' \describe{
#'   \item{ym}{month (`yearmonth`)}
#'   \item{meantemp}{mean temperature that month, degrees Celsius}
#' }
#' @source <https://seklima.met.no>
"bergentemp_monthly"

#' Daily electricity spot prices in Norway
#'
#' Daily mean day-ahead spot prices for the five Norwegian price areas
#' (NO1-NO5), from 1 December 2021 onwards, as published by
#' hvakosterstrommen.no (Nord Pool day-ahead prices). Used in the mandatory
#' assignment. This is a snapshot; the range of the dates is the date the
#' snapshot was built.
#'
#' The prices are in NOK/kWh **excluding VAT** (mva), grid tariffs and taxes.
#' (Note that the Norwegian consumer prices quoted in the media usually include
#' VAT, which is 25 percent in NO1, NO2, NO3 and NO5 and zero in NO4.)
#' The daily value is the plain mean of the hourly prices that day, and only
#' complete days are included. The monthly mean is the plain mean of the
#' daily means.
#'
#' @format ## `elprices_daily`
#' A tsibble keyed by `area`, with one row per area and day:
#' \describe{
#'   \item{area}{price area: "NO1" (East), "NO2" (South), "NO3" (Mid), "NO4" (North) or "NO5" (West)}
#'   \item{date}{date}
#'   \item{price}{daily mean spot price, NOK/kWh excluding VAT}
#'   \item{n_hours}{number of hourly prices that day (24, or 23 and 25 on the daylight saving days)}
#' }
#' @source <https://www.hvakosterstrommen.no>
"elprices_daily"

#' Daily prices of the Microsoft stock
#'
#' Daily stock prices for Microsoft (MSFT) from 3 January 2005, downloaded
#' from Yahoo Finance with the tidyquant package. Used in the lecture on
#' volatility forecasting (ARCH and GARCH). The data are a snapshot, so they
#' end at the date they were downloaded. Use `adjusted` to calculate returns,
#' since it accounts for dividends and stock splits.
#'
#' @format ## `msft`
#' A tibble with one row for each trading day and 7 columns:
#' \describe{
#'   \item{date}{trading day}
#'   \item{open}{opening price, USD}
#'   \item{high}{highest price of the day, USD}
#'   \item{low}{lowest price of the day, USD}
#'   \item{close}{closing price, USD}
#'   \item{volume}{number of shares traded}
#'   \item{adjusted}{closing price adjusted for dividends and splits, USD}
#' }
#' @source <https://finance.yahoo.com/quote/MSFT>
"msft"

#' Weekly sales for 45 Walmart stores
#'
#' Weekly sales for 45 Walmart stores from February 2010 to October 2012, with
#' information on holidays, temperature, fuel prices, the consumer price index
#' and the unemployment rate. The data are publicly available on Kaggle under a
#' CC0 licence. Used in the Walmart lab.
#'
#' @format ## `walmart`
#' A tibble with 6,435 rows (143 weeks for each of the 45 stores) and 8 columns:
#' \describe{
#'   \item{Store}{store number, 1 to 45}
#'   \item{Date}{the date of the Friday of the sales week}
#'   \item{Weekly_Sales}{sales for the store in the week, USD}
#'   \item{Holiday_Flag}{1 if the week contains a special holiday (Super Bowl, Labour Day, Thanksgiving or Christmas), otherwise 0}
#'   \item{Temperature}{temperature on the day of sale, degrees Fahrenheit}
#'   \item{Fuel_Price}{cost of fuel in the region, USD per gallon}
#'   \item{CPI}{prevailing consumer price index}
#'   \item{Unemployment}{prevailing unemployment rate, percent}
#' }
#' @source <https://www.kaggle.com/datasets/yasserh/walmart-dataset>
"walmart"

#' Data sets from the BAN430 exam in spring 2023 (V23)
#'
#' The two data sets that were attached to the spring 2023 exam: a Norwegian
#' house price index (Assignment 2) and waiting times at the Panama canal
#' (Assignment 3). Load both with `data(V23)`.
#'
#' @format ## `houseprices`
#' A tsibble with 72 quarterly observations (2005 Q1 to 2022 Q4) and 3 columns:
#' \describe{
#'   \item{quarter}{year and quarter of the observation}
#'   \item{priceindex}{(unadjusted) price index}
#'   \item{seasonally_adjusted}{seasonally adjusted price index (Statistics Norway)}
#' }
#' @source Statistics Norway, <https://www.ssb.no/en/priser-og-prisindekser/boligpriser-og-boligprisindekser/statistikk/prisindeks-for-brukte-boliger>
#' @rdname V23
"houseprices"

#' @format ## `panamacanal`
#' A grouped tibble (by `vessel_type` and `transit_bound`) with 2,223 rows and
#' 12 columns, weekly from 2019 W01 to 2021 W51. `year_week` is a character
#' column and has to be converted with `yearweek()` before it is used as the
#' index of a tsibble, as in the exam.
#' \describe{
#'   \item{year_week}{year and week of the observation, as text}
#'   \item{vessel_type}{vessel type}
#'   \item{transit_bound}{direction of the transit, `"North"` or `"South"`}
#'   \item{waiting_time}{weekly average waiting time, hours}
#'   \item{transits_lag_1}{average number of transits per week, the week before}
#'   \item{sog_lag_1}{average speed over ground in knots of vessels heading to the canal, the week before}
#'   \item{gatun_level_mt_lag_1}{Gatun lake level in metres, the week before}
#'   \item{visibility_culebra_lag_1, visibility_limon_lag_1, visibility_corozal_lag_1, visibility_gatun_lag_1}{visibility in miles at the four stations, the week before}
#'   \item{waiting_time_lag_1}{waiting time in hours, the week before}
#' }
#' @source Fuentes and Adland (2023), <https://doi.org/10.1016/j.trd.2023.103694>.
#'   The visibility variables are from the ERA5 climate model.
#' @rdname V23
"panamacanal"

#' Data sets from the BAN430 exam in spring 2024 (V24)
#'
#' The data sets that were used in the spring 2024 exam: registered cases of
#' gonorrhea in Norway (Assignment 2) and the filling degree of the Norwegian
#' water reservoirs, with the capacity of the areas (Assignment 3). Load all
#' three with `data(V24)`. The Walmart data used in Assignment 1 are in the
#' `walmart` data set.
#'
#' @format ## `gonorrhea`
#' A tsibble with 375 monthly observations (January 1993 to March 2024),
#' keyed by `decease`:
#' \describe{
#'   \item{yearmonth}{year and month of the observation}
#'   \item{decease}{name of the disease (only gonorrhea)}
#'   \item{count}{number of registered cases in the month}
#' }
#' @source The Norwegian Surveillance System for Communicable Diseases (MSIS),
#'   Norwegian Institute of Public Health, <https://allvis.fhi.no/msis>
#' @rdname V24
"gonorrhea"

#' @format ## `reservoirs`
#' A tsibble with 4,578 weekly observations (1995 W01 to 2024 W13), keyed by `area`:
#' \describe{
#'   \item{yearweek}{year and week of the observation}
#'   \item{area}{reservoir area: `"VASS 1"`, `"VASS 2"` or `"VASS 3"`}
#'   \item{filling_degree}{filling degree as a fraction of full capacity}
#' }
#' @source NVE, <https://www.nve.no/energi/analyser-og-statistikk/magasinstatistikk/>
#' @rdname V24
"reservoirs"

#' @format ## `nve_capacities`
#' A tibble with the storage capacity of the reservoir areas (9 rows):
#' \describe{
#'   \item{Area}{area: `"VASS 1"` to `"VASS 3"`, `"NO 1"` to `"NO 5"` and `"NORGE"`}
#'   \item{Capacity (TWh)}{capacity in terawatt hours}
#' }
#' @source NVE, <https://www.nve.no/energi/analyser-og-statistikk/magasinstatistikk/>
#' @rdname V24
"nve_capacities"
