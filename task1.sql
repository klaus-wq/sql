1. Suppliers относится к Products, как один ко многим.
2. Categories относится к Products, как один ко многим.

3. Shippers относится к Orders, как один ко многим.
4. Employees относится к Orders, как один ко многим.
5. Customers относится к Orders, как один ко многим.

6. Orders относится к Products, как многие ко многим посредством [Order Details].
Один заказ может иметь несколько товаров. Один товар может быть в нескольких заказах.
В [Order Details] - пара OrderID - ProductID.

7. Region относится к Territories, как один ко многим.

8. Employees относится к Territories, как многие ко многим посредством EmployeeTerritories.
Один сотрудник может относится ко многим территориям. Одна территория может быть отнесена ко многим сотрудникам.
В EmployeeTerritories - пара EmployeeID - TerritoryID.

9. CustomerCustomerDemo имеет отношение многие ко многим. Пара CustomerID - CustomerTypeID.