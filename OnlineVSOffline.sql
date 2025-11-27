/*
CreatedBy: Ancuta C
CreateDate:13/11/25
Description: Slicing Per Channel
*/


--Total Returns per Channel
--OnlineShop
SELECT
count(*) AS TotalOnlineOrders,
sum(
   CASE WHEN Returned = 1 Then 1 Else 0 END) AS RetournedOnlineOrders,
round(100.0 * sum(CASE WHEN Returned = 1 Then 1 Else 0 END)/count(*),2
)AS RetournedOnlineRatePercent
FROM
retours_transactions
Where shop >=100;

--Offline Store
SELECT
count(*) AS TotalOfflineOrders,
sum(
   CASE WHEN Returned = 1 Then 1 Else 0 END) AS RetournedOfflineOrders,
round(100.0 * sum(CASE WHEN Returned = 1 Then 1 Else 0 END)/count(*),2
)AS RetournedOflineRatePercent
FROM
retours_transactions
Where shop <=100;


--OfflineXOnline
SELECT
    CASE 
        WHEN Shop >= 100 THEN 'Online'
        ELSE 'Offline'
    END AS Channel,
    COUNT(*) AS TotalOrders,
    SUM(CASE WHEN Returned = 1 THEN 1 ELSE 0 END) AS ReturnedOrders,
    ROUND(
        100.0 * SUM(CASE WHEN Returned = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS ReturnedRatePercent
FROM retours_transactions
GROUP BY Channel;
	

