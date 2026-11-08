# Week 1 – SQL Data Exploration

**Individual Work: Sales Data Exploration**

---

## Objective

The objective of this analysis was to explore the UrbanStyle sales dataset, identify duplicate sales records and assess their impact on data quality.

## Analysis Performed

Five SQL queries were developed to:

1. Explore the overall sales dataset.
2. Identify repeated sale IDs.
3. Inspect individual records with repeated sale IDs.
4. Identify exact duplicate records based on business attributes.
5. Measure the impact of exact duplicate records.

## Key Findings

| Metric | Result |
|---|---:|
| Total sales records | 15,234 |
| Unique sale IDs | 10,118 |
| Unique customers | 2,558 |
| Unique products | 350 |
| Exact duplicate groups | 3,456 |
| Records in duplicate groups | 7,759 |
| Excess duplicate records | **4,303** |

## Conclusion

The analysis identified significant duplication in the sales dataset.

A total of 3,456 groups of exact duplicate records were identified, containing 4,303 excess duplicate records.

These findings indicate potential data quality issues requiring further investigation.

**Note:** No source data was modified or deleted during this analysis.

## Deliverables

- [SQL Exploration Queries](individual/week1_sales_exploration.sql)
- [Results Screenshot](individual/week1_results_screenshot.png)

---

*DACA – Data Analytics Career Accelerator | Week 1*š