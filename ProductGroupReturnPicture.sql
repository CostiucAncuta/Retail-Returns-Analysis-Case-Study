/*
CreatedBy: Ancuta C
CreateDate:14/11/25
Description: ProductGroup return picture across both channels
*/

SELECT
ProductGroup,
count(*) AS TotalOrders,
sum(Case When Returned=1 THEN 1 ELSE 0 END) As ReturnedOrders,
round(
100.0 *sum(Case When Returned=1 THEN 1 Else 0 END)
/Count(*),
2) AS ReturnedRatePercent
FROM retours_transactions
Group BY ProductGroup
HAVING Count(*) >=100 -- ignore tiny groups
ORDER BY ReturnedRatePercent DESC;