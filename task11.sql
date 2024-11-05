1. INSERT INTO Employees(LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City,
Region, PostalCode, Country, HomePhone, Extension)
VALUES ('Petrov', 'Petr', 'Sales Representative', 'Mr.', '1970-06-30T00:00:00.000', '1995-01-02T00:00:00.000', '20 Green Street',
'Seattle', 'WA', '98563', 'USA', '(206) 555-6524', '6988');
2. INSERT INTO EmployeeTerritories (EmployeeID, TerritoryID)
VALUES (12, 95054);
3. INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShipVia, Freight, ShipName,
ShipAddress, ShipCity, ShipPostalCode, ShipCountry)
VALUES ('LONEP', 12, '1995-07-05T00:00:00.000', '1995-08-16T00:00:00.000',
1, 100, 'Hanari Carnes', 'Sierras de Granada 999', 'México D.F.', '05022', 'Mexico');