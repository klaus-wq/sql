1. SELECT ContactType, COUNT(ContactType) FROM Contacts GROUP BY ContactType;
2. SELECT CategoryID, AVG(UnitPrice) AS avg_price FROM Products GROUP BY CategoryID ORDER BY avg_price;