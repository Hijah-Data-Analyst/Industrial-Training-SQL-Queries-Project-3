# Industrial Training SQL Analytics Project 3
## Dataset
'industrial_dataset.database'
## Domain
Industrial Data Analysis | SQL | Business Intelligence | Data Governance
---
## Project Objective 
This project analyses industrial data using SQL to generate business intelligence insights across operations, customer behavior, marketing effectiveness, and product performance.

The analytical approach follows a structured governance pipeline:

Data Profiling - Data Quality Validation - Business KPI Analysis - Insight Synthesis - Strategic Recommendations
---
## Dataset Structure
Key attributes I used in analysis:

OrderID, CustomerID, Product, Quantity, UnitPrice, TotalPrice, OrderStatus, CouponCode, ReferralSource, ItemsInCart, Date
---
### DATA EXPLORATION
## Full Dataset View
```sql
SELECT *
FROM industrial_dataset.data_base;
```
## Sample Records
```sql
SELECT *
FROM industrial_dataset.data_base
LIMIT 10;
```
## Schema Inspection
```sql
DESCRIBE industrial_dataset.data_base;
```
## Dataset Size
```sql
SELECT COUNT (*) AS total_rows
FROM industrial_dataset.data_base;
```
### DATA QUALITY & GOVERNANCE
## Missing Coupon Codes
```sql
SELECT COUNT(*) AS null_coupon_codes
FROM industrial_dataset.data_base;
WHERE CouponCode IS NULL
   OR TRIM(CouponCode) = '';
```
## Duplicate Orders
```sql
SELECT OrderID, COUNT(*)
FROM industrial_dataset.data_base
GROUP BY OrderID
HAVING COUNT(*) > 1;
```
## Transaction Anomalies 
```sql
SELECT *
FROM industrial_dataset.data_base
WHERE Quantity < 0
   OR UnitPrice < 0
   OR TotalPrice < 0;
```
## BUSINESS QUESTIONS & INSIGHTS
### Question 1: Which order status contains the highest quantity of items?
```sql
SELECT
OrderStatus,
SUM(Quantity) AS total_quantity
FROM industrial_dataset.data_base
GROUP BY OrderStatus
ORDER BY total_quantity DESC;
```
Insight: Shows distribution of transaction volume across operational statuses, identifying dominant workflow states.
### Question 2: What are the trends in order quantity over time?
```sql
SELECT
Date,
SUM(Quantity) AS total_quantity
FROM industrial_dataset.data_base
GROUP BY Date
ORDER BY Date;
```
Insight: Captures demand fluctuations over time for trend and forecasting analysis.
### Question 3: How does order quantity vary across coupon codes?
```sql
SELECT
CouponCode
SUM(Quantity) AS total_quantity
FROM industrial_dataset.data_base
WHERE CouponCode IS NOT NULL
   AND TRIM(CouponCode) <> ''
GROUP BY CouponCode
ORDER BY total_quantity DESC;
```
Insight: Measures effectiveness of promotional incentives in driving order volume.
### Question 4: How does average total price differ by referral source?
```sql
SELECT
ReferralSource
AVG(TotalPrice) AS average_total_price
FROM industrial_dataset.data_base
GROUP BY ReferralSource
ORDER BY avg_total_price DESC;
```
Insight: Evaluates acquisition channel quality based on customer value contribution.
### Question 5: Which customers have the highest total number of items in their carts?
```sql
SELECT 
CustomerID,
SUM(ItemsInCart) AS total_items
FROM industrial_dataset.data_base
GROUP BY CustomerID
ORDER BY total_items DESC;
```
Insight: Identifies high-engagement customers for segmentation and retention strategies.
### Question 6: How do key performance metrics vary across products?
```sql
SELECT
Product,
SUM(Quantity) AS total_quantity,
AVG(UnitPrice) AS average
AVG(TotalPrice) AS average_total_price
SUM(ItemsInCart) AS total_items_in_cart
FROM industrial_dataset.data_base
GROUP BY Product
ORDER BY total_quantity DESC;
```
Insight: Evaluates product performance across demand, pricing, and basket contribution.
## STRATEGIC RECOMMENDATIONS 
### 1. Demand Decline Investigation
Investigate the observed decline in total quantity over time (based on time-series trend analysis) to identify key drivers such as:
- Customer churn patterns
- Pricing structure changes
- Operational inefficiences
- Seasonal demand shifts

This supports long-term demand forecasting and business stability planning

---
### 2. Order Cancellation & Data Anomaly Reduction
Reduce order cancellatio risk and transactional inconsistencies by strengthening:
- Payment system reliability
- Checkout validation process
- Order verification rules before transaction confirmation

This improves data integrity and reduces revenue leakage caused by invalid transactions.

---
### 3. Marketing Channel Optimizatiom
Strengthen investment in high-performing referral sources while optimizing or reducing low-performing acquisition channels.
Focus should be on:
- High-conversion referral channels
- Cost-efficient customer acquisition sources
- Continuous monitoring of channel performance using average order value metrics

This improves marketing and acquisition efficiency.

---
### 4. Product Stock & Supply Chain Optimization
Ensure sufficient stock availability and supply chain prioritization for high-demand products identified in product performance analysis.
Key actions include:
- Demand-based inventory allocation
- Priority restocking for high-volume products
- Supply chain alignment with product demand trends

This reduces  stockouts and improves customer satisfaction.

---
## CONCLUSION
This SQL analysis revealed important operational, marketing, customer, and product-level patterns within the industrial dataset.

The order status analysis showed that transaction volume is concentrated within a specific operational states, highlighting the importance of monitoring fulfillment efficiency and reducing cancellation-related issues. Time-series analysis of order quantity also indicated fluctuations in customer demand over time, suggesting the need for stronger forecasting and inventory planning strategies.

Marketing analysis demonstrated that promotional performance varies across coupon codes and referral sources, indicating that some acquisition channels contribute higher customer value than others. This provides an opportunity to optimize marketing investement toward high-performing channels and promotional campaigns.

Customer behavior analysis identified a group of highly engaged customers with significantly larger cart sizes, supporting the potential implememtation of customer segmentation and loyalty-based retention strategies.

At the product level, performance metrics varied across products in terms of quantity sold, pricing behavior, and cart contribution. This highlights the need for demand-driven inventory allocation and product prioritization within the supply chain.

---
