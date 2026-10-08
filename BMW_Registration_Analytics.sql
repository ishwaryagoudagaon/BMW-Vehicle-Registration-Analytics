/* ============================================================
   BMW GERMANY — VEHICLE REGISTRATION ANALYTICS
   SQL Analysis
   ============================================================

   Data Sources:
   1. Monthly BMW registrations — Sep 2025 to Aug 2026
   2. BMW BEV/PHEV registrations
   3. BMW August 2026 detailed model metrics

   Purpose:
   Prepare analytical datasets for the Looker Studio dashboard.
   ============================================================ */


/* ============================================================
   1. REGISTRATION OVERVIEW
   ============================================================ */

-- Monthly BMW registrations by model

SELECT
    Date,
    Model,
    SUM(New_Registrations) AS Registrations
FROM bmw_monthly_model
WHERE Date BETWEEN '2025-09-01' AND '2026-08-01'
GROUP BY
    Date,
    Model
ORDER BY
    Date,
    Registrations DESC;


-- Total registrations by BMW model

SELECT
    Model,
    SUM(New_Registrations) AS Total_Registrations
FROM bmw_monthly_model
WHERE Date BETWEEN '2025-09-01' AND '2026-08-01'
GROUP BY
    Model
ORDER BY
    Total_Registrations DESC;


/* ============================================================
   2. ELECTRIFICATION ANALYSIS
   ============================================================ */

-- BEV and PHEV registrations by month and model

SELECT
    Date,
    Model,
    Powertrain,
    SUM(Registrations) AS Registrations
FROM bmw_ev_phev
WHERE Date BETWEEN '2025-09-01' AND '2026-08-01'
  AND Powertrain IN ('BEV', 'PHEV')
GROUP BY
    Date,
    Model,
    Powertrain
ORDER BY
    Date,
    Powertrain,
    Registrations DESC;


/* ============================================================
   3. AUGUST 2026 DEEP DIVE
   ============================================================ */

-- Detailed BMW model performance for August 2026

SELECT
    Model,
    Total_Registration,
    Diesel,
    Hybrid_Total,
    PHEV,
    BEV,
    AWD
FROM bmw_august_detail
WHERE Report_Date = '2026-08-01'
ORDER BY
    Total_Registration DESC;


/* ============================================================
   END OF BMW REGISTRATION ANALYTICS
   ============================================================ */