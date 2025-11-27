/*
CreatedBy: Ancuta C
CreateDate:14/11/25
Description:  Global BrandName & BrandNameVSChannel
*/

--global
SELECT
BrandName,
count(*) AS TotalOrders, 
sum(Case When Returned=1 THEN 1 ELSE 0 END) As ReturnedOrders, 
Round(
100.0 * SUM(CASE When Returned=1 THEN 1 Else 0 END) / count(*),
2) AS ReturnedRatePercent
From retours_transactions
Where BrandName IS NOT NULL
Group BY BrandName
HAVING Count(*) >=10000
AND SUM(CASE WHEN Returned = 1 THEN 1 ELSE 0 END) > 0
ORDER BY ReturnedRatePercent DESC, ReturnedOrders DESC;



--BrandNameVSChannel
SELECT
BrandName,
CASE
  When Shop >=100 Then 'Online'
  Else 'Offline'
End AS Channel,
count(*) AS TotalOrders, 
sum(Case When Returned=1 THEN 1 ELSE 0 END) As ReturnedOrders, 
Round(
100.0 * SUM(CASE When Returned=1 THEN 1 Else 0 END) / count(*),
2
) AS ReturnedRatePercent
FROM
retours_transactions
WHERE BrandName IN ('-1671135878886367730', '-3734237314099258167', '-9078538943288567323', '8855638714846779199')
Group BY BrandName, Channel
HAVING COUNT(*) >= 1000
   AND SUM(CASE WHEN Returned = 1 THEN 1 ELSE 0 END) > 0
ORDER BY ReturnedRatePercent DESC;