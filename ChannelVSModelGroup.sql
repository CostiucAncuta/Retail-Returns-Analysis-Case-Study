/*
CreatedBy: Ancuta C
CreateDate:13/11/25
Description: Channel vs ModelGrop(ModelGroup)
*/

SELECT
ModelGroup,
CASE
  When Shop >=100 Then 'Online'
  Else 'Offline'
End AS Channel,

Count (*) As TotalOrders,

Sum(Case When Returned = 1 Then 1 Else 0 End) As ReturnedOrders,

Round(
   100.0 * Sum(Case When Returned=1 Then 1 Else 0 End)
   / Count(*),
   2
   ) As ReturnRatePercentage
   
   From retours_transactions
   Group by ModelGroup, Channel
   ORDER BY ReturnRatePercentage DESC
   ;