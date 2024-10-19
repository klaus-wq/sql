1. SELECT ProductName, UnitsInStock FROM Products;
2. SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice < 20;
3. SELECT * FROM Orders WHERE (Freight > 11.7) AND (Freight < 98.1);
4. SELECT * FROM Employees WHERE (TitleOfCourtesy = 'Mr.') OR (TitleOfCourtesy = 'Dr.');
5. SELECT * FROM Suppliers WHERE Country = 'Japan';
6. SELECT * FROM Orders WHERE (EmployeeID = 2) OR (EmployeeID = 4) OR (EmployeeID = 8);
7. SELECT OrderID, ProductID FROM [Order Details] WHERE (UnitPrice > 50) AND (Quantity < 10);