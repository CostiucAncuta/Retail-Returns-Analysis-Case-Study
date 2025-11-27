/*
CreatedBy: Ancuta C
CreateDate:13/11/25
Description: This querry returns the whole return picture
*/
SELECT 
count(*) as TotalOrders,
Sum(Case when Returned =1 Then 1 Else 0 END) AS ReturnedOrders,
round(
100.0 * sum(Case when Returned =1 Then 1 Else 0 End)
/ count(*),
2
) As ReturnRatePercent
FROM
retours_transactions;



