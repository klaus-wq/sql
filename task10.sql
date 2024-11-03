1. SELECT * FROM Customers
LEFT JOIN Orders
ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.CustomerID is NULL;
2. SELECT 'Customer' As Type, ContactName, City, Country
FROM Customers
UNION
SELECT 'Supplier' As Type, ContactName, City, Country
FROM Suppliers
ORDER BY Type;

2-не учла сортировку