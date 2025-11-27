/*
CreatedBy: Ancuta C
CreateDate:13/11/25
Description: Channel vs ProductGroup
*/

SELECT
ProductGroup,
CASE
 WHEN Shop>=100 THEN 'Online'
 ELSE 'Offline'
END AS Channel,

count(*) As TotalOrders,

sum(CASE WHEN Returned=1 THEN 1 ELSE 0 END) AS ReturnedOrders,

round(
100.0 * sum(case when Returned=1 THEN 1 ELSE 0 END)
/Count(*),
2
) As ReturnRatePercent

From retours_transactions
GROUP BY ProductGroup, Channel
--HAVING COUNT(*) >= 100
ORDER BY ProductGroup, Channel, ReturnRatePercent DESC;