/*
CreatedBy: Ancuta C
CreateDate:14/11/25
Description: Basket Classification
*/

SELECT
SaleDocumentNumber,
count(*) As ItemInBasket,
sum(CASE When Returned=1 THEN 1 ELSE 0 END) AS ItemsReturned,
Round (
100.0 * sum(case when Returned=1 Then 1 ELSE 0 END)/ Count(*),
2) AS BasketReturnPercent
from retours_transactions
Group BY SaleDocumentNumber;