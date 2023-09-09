/*Вывести название и стоимость в USD одного самого дорогого проданного товара*/
SELECT
  DISTINCT ProductName,
  Price * 1.06 AS PriceUSD
FROM
  OrderDetails
  JOIN Products ON OrderDetails.ProductID = Products.ProductID
ORder BY
  Price DESC
LIMIT
  1
  /*Вывести два самых дорогих товара из категории Beverages из USA*/
SELECT
  *
FROM
  Products
  JOIN Categories ON Products.CategoryID = Categories.CategoryID
  JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE
  Categories.CategoryName = 'Beverages'
  AND Suppliers.Country = 'USA'
ORDER BY
  Products.Price DESC
LIMIT
  2
  /*Удалить товары с ценой менее 5 EUR*/
DELETE FROM
  Products
WHERE
  Price < 5
  /*Вывести список стран, которые поставляют напитки*/
SELECT
  DISTINCT Suppliers.Country
FROM
  Products
  JOIN Categories ON Products.CategoryID = Categories.CategoryID
  JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE
  Categories.CategoryName = 'Beverages'
ORDER BY
  Products.Price DESC
  /*Очистить поле ContactName у всех клиентов не из China*/
UPDATE
  Customers
SET
  ContactName = ''
WHere
  NOT Country = 'China'