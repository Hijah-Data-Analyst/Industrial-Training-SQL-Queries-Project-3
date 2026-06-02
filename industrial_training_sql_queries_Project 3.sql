SELECT * FROM industrial_dataset.data_base;

SELECT *
FROM industrial_dataset.data_base
LIMIT 10;

DESCRIBE industrial_dataset.data_base;

SELECT COUNT(*) AS total_rows
FROM industrial_dataset.data_base;

SELECT COUNT(*) AS null_coupon_codes
FROM industrial_dataset.data_base
WHERE CouponCode IS NULL
   OR TRIM(CouponCode) = '';
   
   SELECT OrderID, COUNT(*)
FROM industrial_dataset.data_base
GROUP BY OrderID
HAVING COUNT(*) > 1;

SELECT *
FROM industrial_dataset.data_base
WHERE Quantity < 0
   OR UnitPrice < 0
   OR TotalPrice < 0;
   
   SELECT
OrderStatus,
SUM(Quantity) AS total_quantity
FROM industrial_dataset.data_base
GROUP BY OrderStatus
ORDER BY total_quantity DESC;

SELECT
Date,
SUM(Quantity) AS total_quantity
FROM industrial_dataset.data_base
GROUP BY Date
ORDER BY Date;

SELECT
CouponCode,
SUM(Quantity) AS total_quantity
FROM industrial_dataset.data_base
WHERE CouponCode IS NOT NULL
   AND TRIM(CouponCode) <> ''
GROUP BY CouponCode
ORDER BY total_quantity DESC;

SELECT
ReferralSource,
AVG(TotalPrice) AS average_total_price
FROM industrial_dataset.data_base
GROUP BY ReferralSource
ORDER BY average_total_price DESC;

SELECT 
CustomerID,
SUM(ItemsInCart) AS total_items
FROM industrial_dataset.data_base
GROUP BY CustomerID
ORDER BY total_items DESC;

SELECT
Product,
SUM(Quantity) AS total_quantity,
AVG(UnitPrice) AS average_unit_price,
AVG(TotalPrice) AS average_total_Price,
SUM(ItemsInCart) AS total_items_in_cart
FROM industrial_dataset.data_base
GROUP BY Product
ORDER BY total_quantity DESC;