/*
CreatedBy: Ancuta C
CreateDate:13/11/25
Description: This querry returns the whole picture per channel
*/

SELECT 
CASE
WHEN Shop>=100 THEN 'Online'
ELSE 'Offline'
END AS Channel,

count(*) AS TotalOrders,
sum(Case When Returned = 1 THEN 1 ELSE 0 END) AS ReturnedOrders,

Round(
100.0 * sum(Case WHEN Returned = 1 THEN 1 ELSE 0 END)
/ count(*),
2
) As ReturnedPercent
FROM
retours_transactions
GROUP BY
Channel;