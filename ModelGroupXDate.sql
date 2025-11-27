--brand + product group + model group + online only, sliced by MONTH


SELECT
    substr(Order_Date_FK, 1, 4) || '-' || substr(Order_Date_FK, 5, 2) AS OrderMonth,
	
    COUNT(*) AS TotalOnlineOrders,
    SUM(CASE WHEN Returned = 1 THEN 1 ELSE 0 END) AS ReturnedOnlineOrders,
    ROUND(
        100.0 * SUM(CASE WHEN Returned = 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS OnlineReturnRatePercent

FROM retours_transactions
WHERE BrandName    = '-1671135878886367730'
  AND ProductGroup  = '-453682476182549203'
  AND ModelGroup    = '-4124706989267335995'
  AND Shop >= 100
GROUP BY OrderMonth
ORDER BY OrderMonth;
