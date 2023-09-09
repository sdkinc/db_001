/*Вывести название и стоимость товаров от 20 EUR. */
SELECT
  ProductName,
  Price
FROM
  Products
WHERE
  Price >= 20
  /*Вывести страны поставщиков.*/
SELECT
  DISTINCT Country
FROM
  Suppliers
  /*В упорядоченном по стоимости виде вывести название и стоимость 
   товаров со скидкой в 9% от всех поставщиков, кроме поставщика 1.*/
SELECT
  ProductName,
  Price *.91 AS Price_Low
FROM
  Products
WHERE
  SupplierID <> 1
ORDER BY
  Price
  /*Вывести контактные имена клиентов, кроме тех, что из France и USA.*/
SELECT
  ContactName
FROM
  Customers
WHERE
  Country <> 'France'
  AND Country <> 'USA'