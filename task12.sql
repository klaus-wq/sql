1. UPDATE [Order Details]
SET Discount = 0.2
WHERE Quantity > 50;
2. UPDATE Contacts
SET City = 'Piter', Country = 'Russia'
WHERE City = 'Berlin' AND Country='Germany';
3. INSERT INTO Shippers (CompanyName, Phone)
VALUES ('Green', '(503) 555-9654');
DELETE FROM Shippers
WHERE ShipperID > 3;

Критерий удаления свежих записей - ShipperID > 3.