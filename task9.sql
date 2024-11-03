1. SELECT Products.ProductName, Products.UnitPrice FROM Products JOIN [Order Details] ON [Order Details].UnitPrice < 20 AND Products.ProductID = [Order Details].ProductID;
2. SELECT Orders.Freight, Customers.CompanyName FROM Orders FULL JOIN Customers ON Orders.CustomerID = Customers.CustomerID ORDER BY Freight;
Выдача получилась объёмнее за счёт того, что возвращаются все записи, входящие в обе таблицы (объединяются две таблицы).
Для Paris spécialités и FISSA Fabrica Inter. Salchichas S.A. Freight = NULL, потому что у этих компаний нет заказов.
3. SELECT Employees.FirstName, Employees.LastName, Orders.Freight FROM Employees CROSS JOIN Orders WHERE Employees.EmployeeID = Orders.EmployeeID;
4. SELECT Products.ProductName, [Order Details].UnitPrice FROM Products INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID;