/*Scope:

BrandName = -1671135878886367730

ProductGroup = -453682476182549203

Online only (Shop >= 100)
*/

-- ProductGroup online only

SELECT
  --Volume
  Count(*) As TotalOnlineOrders,
  sum(Case When Returned = 1 Then 1 Else 0 End) As ReturnedOnlineOrders,
  Round(
        100.0 *sum(Case When Returned = 1 Then 1 Else 0 End)
		/ Count(*),
		2
	) As OnlineReturnedRatePercent,
	
   --Revenue
   sum(RevenueInclVAT) AS TotalOnlineRevenue,
   sum(Case When Returned = 1 Then RevenueInclVAT Else 0 End) As LostOnlineRevenue,
   round(
       100.0*sum(Case when Returned =1 Then RevenueInclVAT Else 0 End) 
	   /sum(RevenueInclVAT),
	   2
	 ) AS LostOnlineRevenuePercent,
  
   --Product Costs
 sum(CostPriceExclVAT) AS TotalOnlineProductCost,
sum(case when Returned =1 Then  CostPriceExclVAT ELSE 0 END)
     AS OnlineProductCostReturned,

	 
   --Return Handling Costs
     sum(case when Returned = 1 THEN 10 Else 0 END)
       AS OnlineReturnHandlingCost,

  --Total return cost = Product cost returned + handling cost 
    sum(Case when Returned = 1 Then CostPriceExclVAT else 0 END)
    + sum(case when Returned = 1 THEN 10 Else 0 END)
       AS TotalOnlineReturnCosts,

  --Margin Lost due to returns (revenue - product cost, for returned items)
     sum(
	     CASE WHEN Returned =1 Then (RevenueInclVAT - CostPriceExclVAT)
		      Else 0 
		 END) As OnlineGrossMarginLost
FROM retours_transactions
WHERE BrandName = '-1671135878886367730'
AND ProductGroup = '-453682476182549203'
AND Shop >= 100;



