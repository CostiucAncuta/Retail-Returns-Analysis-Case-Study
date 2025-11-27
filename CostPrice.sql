--what is the total cost associated with the return
--2.online and offline


--Total Product Costs
SELECT
sum(CostPriceExclVAT) AS TotalProductCosts
FROM
retours_transactions
WHERE ProductGroup = '-453682476182549203';


--Total Product Return Costs
SELECT
sum(CostPriceExclVAT) AS TotalProductReturnCosts,
sum(
    CASE
	   When Shop >=100 THEN 10
	   ELSE 5
	END
) AS TotalReturnHandlingCosts,

sum(CostPriceExclVAT) +
sum (
   CASE 
      WHEN shop >=100 THEN 10
      ELSE 5
   END
) As TotalReturnCosts
FROM
retours_transactions
WHERE Returned = 1
AND ProductGroup = '-453682476182549203';

--Divided by Channel

--Online
SELECT
sum(CostPriceExclVAT) As TotalProductCost
FROM
retours_transactions
WHERE shop >= 100
AND Returned=1;

--Offline
SELECT
sum(CostPriceExclVAT) As TotalProductCost
FROM
retours_transactions
WHERE shop <= 100;

--Total Product Cost per Channel
SELECT
CASE
    WHEN Shop >=100 THEN 'Online'
	ELSE 'Offline'
	END AS Channel,
sum(CostPriceExclVAT) AS TotalProductCost
FROM
retours_transactions
GROUP by Channel


--Return Handling Costs per Channel
SELECT
   CASE 
      WHEN Shop >=100 THEN 'Online'
	  ELSE 'Offline'
	 End as Channel,
	sum (
         CASE 
		    WHEN Returned = 1 AND Shop >=100 THEN 10
		    WHEN Returned = 1 AND Shop <=100 THEN 5
		    Else 0
		END
	) AS ReturnHandlingCost	
FROM
retours_transactions
GROUP By Channel;
