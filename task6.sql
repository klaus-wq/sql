1. SELECT Discount * 100 FROM [Order Details];
2. SELECT * FROM [Order Details] WHERE ProductID IN (SELECT ProductId FROM Products WHERE UnitsInStock > 40);
3. SELECT * FROM [Order Details] WHERE ProductID IN   (SELECT ProductId FROM Products WHERE UnitsInStock > 40) AND OrderID IN ( SELECT OrderID FROM Orders WHERE Freight >= 50);