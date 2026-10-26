# UK Property Market Analysis | SQL Server & Power BI

## Overview

This project explores residential property transactions across England and Wales between 2018 and 2025, using SQL Server for data preparation and analysis and Power BI to build an interactive dashboard.

The aim is to investigate changes in property prices and transaction volumes over time, compare average and median sale prices, and identify differences in property prices across local authorities.

The project demonstrates practical skills in SQL querying, data transformation, analytical thinking, and interactive data visualisation.

## Dashboard

![England and Wales Property Market Dashboard](dashboard/dashboard-screenshot.png)

The interactive Power BI dashboard allows users to select a year and explore national property market indicators alongside local authority price comparisons.

### Key features

- **National KPIs:** Transaction count, median sale price, average sale price, and year-on-year median price change.
- **Price trends:** Comparison of average and median sale prices from 2018 to 2025.
- **Regional comparison:** Top 10 local authorities ranked by median sale price.
- **Transaction activity:** Annual residential property transaction volumes.
- **Geographic analysis:** A map showing median sale price bands across local authorities in England and Wales.
- **Interactive filtering:** A year slicer for exploring annual market conditions.

## Tools and technologies

- **SQL Server Developer Edition** — data preparation, aggregation, joins and analytical queries.
- **DBeaver** — SQL development and database exploration.
- **Microsoft Power BI Desktop** — dashboard design, visualisation and interactive reporting.
- **DAX** — measures for key performance indicators and year-on-year comparisons.
- **HM Land Registry Price Paid Data** — source data for residential property transactions.

## Data source

The analysis uses HM Land Registry Price Paid Data for England and Wales, covering 2018–2025.

Official source: [HM Land Registry Price Paid Data downloads](https://www.gov.uk/government/statistical-data-sets/price-paid-data-downloads)

The data records residential property transactions lodged for registration. It provides a useful basis for exploring recorded sale prices and transaction activity, but it should not be interpreted as a complete measure of every property sale or changes in the value of an identical set of homes.

## SQL analysis

SQL Server was used to prepare the data for analysis and produce aggregated datasets for Power BI.

The analysis includes:

- Aggregating transaction data by year and property type.
- Calculating average and median sale prices by local authority and year.
- Summarising transaction volumes.
- Calculating year-on-year changes in prices and transaction activity.
- Joining analytical results to local authority boundary codes to support geographic visualisation.
- Preparing summary tables and views for use in Power BI.

The repository includes selected SQL scripts used for the analysis. It does not attempt to reproduce every intermediate query used during development.

## Key questions

The dashboard is designed to investigate the following questions:

1. How did average and median residential sale prices change between 2018 and 2025?
2. How did transaction volumes vary over the same period?
3. Which local authorities recorded the highest median sale prices?
4. How do property prices vary geographically across England and Wales?
5. How do national market indicators change when comparing individual years?

## Initial observations

The national summary data indicates that:

- The median sale price increased from £230,000 in 2018 to £285,000 in 2025.
- Average sale prices rose to a peak in 2022 before declining in subsequent years.
- Transaction volumes fluctuated considerably, with the highest annual total in the supplied period occurring in 2021.
- The highest median-price local authorities are concentrated in and around London.

These observations describe recorded transactions. They do not account for inflation, changes in the mix of properties sold, or differences in property characteristics.

## Methodology and limitations

### Methodology

Transaction data was processed in SQL Server and aggregated into datasets suitable for analysis. Summary data was then connected to Power BI to create the dashboard and its interactive visuals.

Median prices are included alongside averages because the two measures provide different perspectives on the distribution of sale prices. Average prices can be influenced by a relatively small number of high-value transactions, while the median represents the midpoint of recorded sales.

Local authority boundary codes were used to associate price data with geographic areas for mapping.

### Limitations

- The analysis covers recorded transactions within the selected 2018–2025 period.
- Recorded transaction prices are not adjusted for inflation.
- Changes in average and median prices may partly reflect changes in the types and locations of properties sold.
- Transaction counts represent recorded sales in the source data and may be affected by registration timing and data coverage.
- Historical local authority names and boundaries may not align perfectly with the current boundary geography used in the map.
- The report connects to a locally configured SQL Server database. Reproducing or refreshing the report on another machine requires the relevant data tables, views and connection settings.

## Repository structure

```text
UK-Property-Market-Analysis/
├── README.md
├── dashboard/
│   ├── England_Wales_Property_Market.pbix
│   └── dashboard-screenshot.png
├── sql/
│   ├── 01_Avg_Median_Type_Year.sql
│   └── 02_Avg_Median_District_Year.sql
└── docs/
```

## Data attribution and licence

Contains HM Land Registry data © Crown copyright and database right 2025. This data is licensed under the [Open Government Licence v3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).

Refer to the official HM Land Registry documentation for source data definitions, coverage and licensing information.

## Project status

**Status: Initial portfolio version complete.**

The dashboard and selected SQL analysis scripts are available in this repository. Further work could extend the analysis with inflation-adjusted prices, additional property-type comparisons, and deeper investigation of regional market trends.
