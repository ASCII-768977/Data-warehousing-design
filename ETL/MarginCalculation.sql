
SET SQL_SAFE_UPDATES = 0;

-- Match the cost for each order item
UPDATE Sale INNER JOIN ProductCost ON Sale.Product_ProductID = ProductCost.Product_ProductID 
SET Sale.Cost = ProductCost.UnitCost 
WHERE Sale.Date >= ProductCost.ValidFromDate 
AND Sale.Date < ProductCost.ValidUntilDate;

-- Calculate the margin
UPDATE Sale 
SET Margin = SalePrice - Cost;
