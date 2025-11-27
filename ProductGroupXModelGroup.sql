/*Scope:

BrandName = -1671135878886367730

ProductGroup = -453682476182549203

Online only (Shop >= 100)
*/

SELECT
    ModelGroup,
	
	
  --Volume
  Count(*) AS TotalOnlineOrders,
  Sum(CASE When Returned = 1 Then 1 Else 0 END) As ReturnedOnlineOrders,
  Round(
      100.0 * Sum(Case When Returned =1 Then 1 Else 0 End)
	  /count(*),
	  2
	) AS OnlineReturnRatePercent,
	
  --Revenue
  sum(RevenueInclVAT) AS TotalOnlineRevenue,
  sum(CASE WHEN Returned =1 THEN RevenueInclVAT ELSE 0 END)
      AS LostOnlineRevenue,
	  
--Product Costs
  sum(CostPriceExclVAT) AS TotalOnlineProductCosts,
  sum(CASE When Returned =1 Then CostPriceExclVAT Else 0 END)
      AS OnlineProductCostReturned,
	  
  --Return Handling Cost
  SUM(CASE WHEN Returned = 1 THEN 10 ELSE 0 END) 
        AS OnlineReturnHandlingCost,

    -- Total Return Cost
    SUM(CASE WHEN Returned = 1 THEN CostPriceExclVAT ELSE 0 END)
    + SUM(CASE WHEN Returned = 1 THEN 10 ELSE 0 END)
        AS TotalOnlineReturnCost,

    -- Gross Margin Lost
    SUM(
        CASE WHEN Returned = 1 
             THEN (RevenueInclVAT - CostPriceExclVAT)
             ELSE 0
        END
    ) AS OnlineGrossMarginLost

FROM retours_transactions
WHERE BrandName   = '-1671135878886367730'
  AND ProductGroup = '-453682476182549203'
  AND Shop >= 100

GROUP BY ModelGroup
HAVING COUNT(*) >= 100     -- optional: remove tiny noise
ORDER BY TotalOnlineReturnCost DESC;   -- shows the biggest money-burners first
	  