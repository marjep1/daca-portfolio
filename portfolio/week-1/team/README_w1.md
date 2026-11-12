# Sales Data Overview

## Overview

This analysis provides a high-level overview of the UrbanStyle sales
dataset and highlights key data quality issues identified during the
initial exploration.

## Key Figures

-   **Total sales records:** 15,234
-   **Largest transaction:** 2,170.40
-   **Smallest transaction:** -1,405.32

## Data Quality Findings

The initial review identified the following issues:

  Finding                                                   Records   Share of total
  ------------------------------------------------ ---------------- ----------------
  Duplicate sales records                                     5,116              34%
  Records without a customer ID                               1,487              10%
  Records with a negative sales amount                          305               2%
  Missing sales records for March--November 2025     Not quantified              ---

## Interpretation

-   **Duplicate records:** A substantial proportion of the dataset is
    flagged as duplicate sales records. These should be investigated to
    determine whether they are true duplicates or legitimate repeated
    transactions before any records are removed.
-   **Missing customer IDs:** These records cannot be directly linked to
    a customer. This may limit customer-level analysis, segmentation,
    and customer behaviour reporting.
-   **Negative sales amounts:** Negative values may represent returns,
    refunds, or corrections. Their meaning should be verified before
    treating them as errors.
-   **Missing period:** Sales records for March--November 2025 appear to
    be missing. This gap should be investigated because it may affect
    time-series analysis, monthly comparisons, and trend reporting.

## Conclusion and Recommended Next Steps

The dataset contains 15,234 sales records, but the identified data
quality issues may affect the reliability of further analysis. Before
calculating final sales performance metrics, the following steps are
recommended:

1.  Investigate duplicate records and define a consistent deduplication
    rule.
2.  Review records without customer IDs and assess whether the missing
    information can be recovered.
3.  Check the source and business meaning of negative sales amounts.


