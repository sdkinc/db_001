SELECT
  --Вывести ко-во поставщиков не из UK и не из China
  count(*)
FROM
  Suppliers
where
  Country not in ('UK', 'China')
SELECT
  --Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
  Avg(Products.Price) as AvgPrice,
  Max(Products.Price) as MaxPrice,
  Min(Products.Price) as MinPrice,
  count(Products.ProductID) as ProductsCount
FROM
  Products
Where
  CategoryID in (3, 5)
SELECT
  --Вывести общую сумму проданных товаров
  SUM(p.Price * od.Quantity) AS total_sum
FROM
  OrderDetails od
  join Products p on od.ProductID = p.ProductID
SELECT
  --Вывести ко-во стран, которые поставляют напитки
  --тут явно видно 8 стран, но при попытке добавить count мы получим количество записей, а не уникальных стран. Т.е. нужно или вложенный запрос делать, или группировать перед подсчетом, но ни того ни того мы не учили.
  Distinct s.Country
FROM
  Products p
  join Suppliers s on p.SupplierID = s.SupplierID
  join Categories c on p.CategoryID = c.CategoryID
Where
  c.CategoryName = 'Beverages'
SELECT
  Distinct count(s.Country)
FROM
  Products p
  join Suppliers s on p.SupplierID = s.SupplierID
  join Categories c on p.CategoryID = c.CategoryID
Where
  c.CategoryName = 'Beverages'
SELECT
  --Вывести сумму, на которую было отправлено товаров клиентам в Germany
  SUM(p.Price * od.Quantity) as total_shipped_to_germany
FROM
  OrderDetails od
  join Products p on od.ProductID = p.ProductID
  join Orders o on od.OrderID = o.OrderID
  join Customers c on o.CustomerID = c.CustomerID
Where
  c.Country = 'Germany'