/*
CreatedBy: Ancuta C
CreateDate:14/11/25
Description: How many baskets are fully returned vs partially returned vs kept?
*/

with basket AS (
SELECT
SaleDocumentNumber,
Count(*) AS ItemsInBasket,
sum(Case When Returned=1 THEN 1 ELSE 0 END) AS ItemsReturned
FROM retours_transactions
Group BY SaleDocumentNumber
)
SELECT 
 CASE 
    When ItemsReturned = 0 THEN 'No Returns'
	When ItemsReturned = ItemsInBasket THEN 'Full Return'
	Else 'Partial Return'
END As BasketType,
Count(*) AS NumberOfBaskets
FROM basket
GROUP BY BasketType;