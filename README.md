# Retail-Returns-Analysis-Case-Study
Overview
This case study explores a retail dataset containing sales, returns, revenue, and cost information across multiple brands, channels, and product groups. The goal was to analyze return behavior, identify patterns, and derive insights that could support business decisions around merchandising, customer behavior, and operational efficiency.
The analysis was performed using SQL for data slicing and aggregation, with additional spreadsheet modeling for quick visual comparisons.
 1. Dataset Summary

The dataset included the following relevant fields (renamed for clarity):

BrandName

ModelGroup

Channel (Online vs Offline)

OriginalSaleAmountInclVAT

RevenueInclVAT

CostPriceExclVAT

Returned (0/1 flag)

Additional fields describing product attributes

Total volume: several thousand rows across multiple seasons.

2. Objective

To answer four key questions:

Which brands drive the highest return rates and return costs?

How does return behavior differ by channel (online vs offline)?

Within the most popular brand(s), which model groups show recurring patterns?

Where do profitability and return behavior diverge?

The aim was not only to compute return percentages but also to understand patterns that could inform operational decisions.

3. Methodology

A step-by-step structured approach:

3.1 Data Cleaning & Preparation

Ensured numerical consistency in revenue & cost fields

Normalized brand and model group naming

Verified binary return flag (Returned = 1)

Converted returns into derived metrics (return rate, return cost)

3.2 SQL-driven slicing

Segmented the dataset by:

Brand

Channel

Model group

Volume vs return rate intersections

Example SQL snippet used to compute returned orders:

SUM(CASE WHEN Returned = 1 THEN 1 ELSE 0 END) AS ReturnedOrders


Additional SQL snippets (e.g., return rate, profitability segmentation) will be added as separate files.

3.3 Analysis Framework

For each slice:

Calculate sales volume

Calculate return rate

Compare revenue vs return cost

Identify outliers or disproportionate behavior

Highlight high-risk product clusters

4. Key Insights
4.1 Brand-Level Findings (Global View)
A. Concentration of returns

A small group of brands accounted for a disproportionate share of returns:

The top 3 brands represented over 65% of all returned orders.

Among high-volume brands, one brand stood out with significantly elevated return rates.

This justified focusing the deeper analysis on:

The three highest-return brands

The second most popular brand (high volume + high return rate)

B. Return rate vs popularity mismatch

One of the most popular brands also had the highest return rate, indicating:

Fit or sizing inconsistency

Product quality deviation

Different customer expectations for that brand

These are classic early-warning signals in retail supply chains.

4.2 Channel-Level Behavior (Focused on Selected Brands)
A. Higher online return rates

As expected, the online channel showed noticeably higher return rates across the four selected brands.

Even for footwear (where fit uncertainty is somewhat lower than in apparel), this pattern remains consistent with:

Size guessing

Color expectation mismatch

Product imagery variance

B. Offline outliers

A few offline return spikes occurred in:

High-priced model groups

High seasonal promotional items

Often linked to post-purchase dissatisfaction or quality checks failing at store level.

4.3 Deep Dive: Most Popular Brand – Model Group Segmentation

Once narrowed to a single brand, slicing by ModelGroup revealed:

Two model groups contributed the majority of returns while representing a significantly smaller share of revenue.

These groups also showed higher return costs relative to their revenue contribution, making them operationally expensive.

One model group had a healthy sales volume but return rates nearing 40%, indicating a design, quality, or sizing issue.

This type of segmentation mirrors how commercial and supply chain teams evaluate assortment health.

5. Operational Interpretation (Business Insights)

This analysis supported several business insights relevant to retail operations:

SKU Rationalization: Certain model groups should be reviewed or redesigned.

Channel Strategy: Online sizing/fit guidance could reduce avoidable returns.

Brand Monitoring: High-performing but high-return brands require attention to maintain margins.

Cost Optimization: Return-heavy models may erode profitability despite strong sales.

These insights help stakeholders understand where their attention and resources are most needed.

6. Skills Demonstrated

This project highlights competencies highly relevant in solution consulting and data-driven problem-solving:

Structured analytical reasoning

SQL slicing, grouping, aggregation, and conditional metrics

Turning raw data into actionable insights

Business interpretation of return patterns

Clear communication through concise summary and visual tables

Understanding of retail behavior and supply chain implications

7. Next Steps / Extensions

Planned improvements to this case study include:

Adding SQL scripts for each analysis step

Visual charts (bar, line, segmentation matrices)

Revenue vs return cost comparison visuals

Sensitivity analysis on top-return model groups

A clean PDF version summarizing main findings

Summary

This case demonstrated a full analytical workflow—from raw dataset to actionable insight—using SQL, structured thinking, and business interpretation. While simplified, the approach mirrors the logic used in real operational and supply chain analytics, and it reflects my interest in working with data-driven decision-making, process understanding, and functional improvement.
