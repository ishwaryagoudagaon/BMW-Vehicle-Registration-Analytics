# BMW Germany --- Vehicle Registration Analytics

## 📌 Project Overview

BMW Germany --- Vehicle Registration Analytics explores new BMW
passenger-car registrations in Germany using KBA-based registration
data. The project turns registration data into an interactive Looker
Studio dashboard for reviewing monthly trends, comparing models, and
understanding BEV/PHEV registration patterns.

This project analyses **registrations**, not sales revenue, profit, or
customer behaviour.

### Data Coverage

-   **Registration Overview:** September 2025--August 2026
-   **Electrification Analysis:** January 2024--August 2026
-   **August 2026 Deep Dive:** August 2026

------------------------------------------------------------------------

## 🎯 Business Objectives

### 1. Registration Overview

Understand overall BMW registration activity and identify the models
with the highest registration volumes.

Questions include: - How many BMW vehicles were registered during the
selected period? - How did registrations change month to month? - Which
models had the highest registration totals? - What were the average
monthly registrations and number of models represented?

### 2. Electrification Analysis

Compare battery-electric vehicles (BEVs) and plug-in hybrid electric
vehicles (PHEVs).

Questions include: - How does the BEV/PHEV registration mix change over
time? - Which BMW models have the highest BEV registrations? - Which BMW
models have the highest PHEV registrations?

### 3. August 2026 Deep Dive

Explore model-level registration and drivetrain metrics for August 2026.

Questions include: - Which models had the highest total registrations? -
Which models had the highest BEV and PHEV registrations? - How do
selected powertrain categories compare by model? - Which models had the
highest all-wheel-drive (AWD) registrations?

------------------------------------------------------------------------

## 👥 Stakeholders

  -----------------------------------------------------------------------
  Stakeholder                         Questions they may want to answer
  ----------------------------------- -----------------------------------
  Business / Strategy                 How are BMW registrations changing
                                      over time?

  Product / Model Planning            Which models have the highest
                                      registration volumes?

  Electrification Analysis            How do BEV and PHEV registrations
                                      compare?

  Market Research                     Which models contribute most to the
                                      observed registration mix?

  Analysts                            How do registration patterns differ
                                      by month, model, and powertrain?
  -----------------------------------------------------------------------

The dashboard prioritises useful business questions and clear
comparisons rather than displaying as many metrics as possible.

------------------------------------------------------------------------

## 🏗️ Analytics Architecture

The project workflow is organised around the following stages:

``` text
KBA-based / Public Registration Data
                 ↓
          CSV Data Preparation
                 ↓
       Separate Analytical Datasets
                 ↓
          SQL Analysis Queries
                 ↓
       Google Sheets / Data Sources
                 ↓
        Google Looker Studio
                 ↓
    Interactive BMW Registration Dashboard
```

The datasets are kept separate because they have different time coverage
and levels of detail. Combining them without checking their grain and
overlapping measures could double-count registrations.

**Implementation note:** Document the SQL execution environment
accurately. Do not describe BigQuery as part of the implemented pipeline
unless the queries are actually executed there.

------------------------------------------------------------------------

## 📊 Dashboard Philosophy

The dashboard is designed to help users understand the main story
quickly and explore registration data without inspecting raw tables.

It prioritises: - Clear metric labels and definitions - Consistent date
ranges for time-based comparisons - Model-level comparisons -
Appropriate charts for trends and composition - Limited visual clutter -
Separation of long-term trends from a single-month snapshot - Avoiding
double-counting across overlapping powertrain categories

------------------------------------------------------------------------

## 📈 Dashboard Structure

### 1. Registration Overview

**KPIs** - Total Registrations - Average Monthly Registrations - Top
Model - Number of Models

**Visualisations** - Monthly BMW Registrations - Registrations by Model

**Purpose:** Monitor registration trends and compare BMW model
performance from September 2025 through August 2026.

### 2. Electrification Analysis

**KPIs** - BEV Registrations - PHEV Registrations

**Visualisations** - Monthly BEV vs PHEV registration composition - BEV
Registrations by Model - PHEV Registrations by Model

**Purpose:** Compare BEV and PHEV registration volumes and identify
leading models. The source data spans January 2024 through August 2026;
make each chart's selected date range clear.

### 3. August 2026 Deep Dive

**KPIs** - Total Registrations --- August 2026 - BEV Registrations -
PHEV Registrations --- August 2026 - Diesel Registrations

**Visualisations** - Selected powertrain registrations by model - August
2026 Registrations by Model - August 2026 AWD Registrations by Model

**Purpose:** Compare model-level registration totals and selected
powertrain/drivetrain metrics for August 2026.

------------------------------------------------------------------------

## 🗃️ Data Sources and Preparation

  -----------------------------------------------------------------------
  Dataset                 Coverage                Purpose
  ----------------------- ----------------------- -----------------------
  Monthly model           September 2025--August  Overall trends and
  registrations           2026                    model rankings

  EV/PHEV registrations   January 2024--August    Electrification trends
                          2026                    and model comparisons

  August 2026 model       August 2026             Detailed model,
  metrics                                         powertrain, and AWD
                                                  analysis
  -----------------------------------------------------------------------

The dashboard describes the data as KBA-based. Add exact source URLs,
extraction dates, and reuse notes in `data/README.md` or
`docs/data_sources.md` so that data provenance can be verified.

### Data Quality Considerations

-   Store dates consistently and use the correct monthly grain.
-   Repeated model names across different months are expected; check
    duplicates using the appropriate date-and-model combination.
-   Do not combine datasets without checking their time coverage, grain,
    and overlapping measures.
-   Do not add hybrid totals to their subcategories if this would
    double-count registrations.
-   Do not label registration counts as sales, revenue, or profit.

------------------------------------------------------------------------

## 🧮 SQL Analysis

The repository can contain one consolidated SQL file:

``` text
sql/
└── BMW_Registration_Analytics.sql
```

Organise it into three sections: 1. **Registration Overview** ---
monthly registrations and model rankings 2. **Electrification Analysis**
--- BEV/PHEV registrations by month, model, and powertrain 3. **August
2026 Deep Dive** --- detailed August model metrics

Use the actual table and column names from the prepared datasets.
Document the SQL dialect and execution environment, and distinguish
validated, executed queries from illustrative queries.

------------------------------------------------------------------------

## 🗂️ Project Structure

Suggested repository structure:

``` text
BMW-Germany-Registration-Analytics/
│
├── README.md
├── sql/
│   └── BMW_Registration_Analytics.sql
├── data/
│   ├── bmw_germany_registrations_sep2025_aug2026.csv
│   ├── bmw_germany_ev_phev_registrations.csv
│   ├── bmw_germany_model_metrics_august2026.csv
│   └── README.md
├── Looker_Studio/
│   ├── BMW_Germany_Registration_Analytics.pdf
│   └── dashboard_screenshots/
│       ├── overview.png
│       ├── electrification.png
│       └── august_2026_deep_dive.png
└── docs/
    └── data_sources.md
```

This is a suggested structure. Keep only files and folders that are
actually included in your repository, and update filenames to match your
files.

------------------------------------------------------------------------

## 🛠️ Tools

  Tool                   Role
  ---------------------- ------------------------------------------------------------
  CSV                    Stores prepared registration datasets
  Google Sheets          Data review/preparation, if used in the workflow
  SQL                    Analytical queries for trends and comparisons
  Google Looker Studio   Interactive dashboard and visualisation
  GitHub                 Version control, documentation, and portfolio presentation

List Python or BigQuery as implemented tools only if they were actually
used in this project.

------------------------------------------------------------------------

## 📌 Limitations

-   The analysis covers only the periods available in the supplied
    datasets.
-   The August 2026 deep dive is a single-month snapshot and cannot
    establish a trend on its own.
-   The data supports registration analysis, not conclusions about
    revenue, profitability, customer satisfaction, or market share
    without additional validated data.
-   Results depend on the definitions, coverage, and quality of the
    underlying datasets.
