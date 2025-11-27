--Slice by ProductGroup for your chosen brand


--BrandName:-1671135878886367730

--Global

SELECT
   ProductGroup,
   
   Count(*) As TotalOrders,
   sum(Case When Returned=1 Then 1 Else 0 End) As ReturnedOrders,
   
   round( 100.0 * sum(Case When Returned=1 Then 1 Else 0 End)
   /Count(*),
   2
   ) AS ReturnRatePercent
 
 From retours_transactions
 WHERE BrandName = '-1671135878886367730'
 GROUP BY ProductGroup
 ORDER BY ReturnRatePercent DESC;
 
 
 --OnlineVSOffline
 
 SELECT
   ProductGroup,
   CASE
      WHEN Shop >=100 THEN 'Online'
	  ELSE 'offline'
	END As Channel,  
   Count(*) As TotalOrders,
   sum(Case When Returned=1 Then 1 Else 0 End) As ReturnedOrders,
   
   round( 100.0 * sum(Case When Returned=1 Then 1 Else 0 End)
   /Count(*),
   2
   ) AS ReturnRatePercent
 
 From retours_transactions
 WHERE BrandName = '-1671135878886367730'
 GROUP BY ProductGroup, Channel
 ORDER BY ReturnRatePercent DESC;
 
 
