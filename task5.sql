1. SELECT ContactType, COUNT(ContactType) FROM Contacts GROUP BY ContactType;
2. SELECT CategoryID, AVG(UnitPrice) AS AVG_UNIT_PRICE FROM Products GROUP BY CategoryID ORDER BY AVG_UNIT_PRICE;