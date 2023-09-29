--Найти мин/стоимость товаров для каждой категории
SELECT
  Categories.CategoryName,
  min(Products.Price) AS min_price_in_category
FROM
  Products
  JOIN Categories USING (CategoryID)
GROUP BY
  CategoryID ---
  ---
  --Вывести ТОП-3 стран по количеству доставленных заказов
  ---
SELECT
  Customers.Country,
  count(*) AS total_order_shipped
FROM
  Orders
  JOIN Customers USING (CustomerID)
GROUP BY
  Country
Order BY
  total_order_shipped DESC
LIMIT
  3 ---
  ---
  --Вывести названия категорий, в которых более 10 товаров
  ---
SELECT
  Categories.CategoryName,
  count(*) AS total_products_in_category
FROM
  Products
  JOIN CAtegories USING (CategoryID)
GROUP BY
  CategoryID
HAVING
  total_products_in_category > 10 ---
  ---
  --Очистить тел/номер поставщикам из USA
  ---
UPDATE
  Suppliers
SET
  Phone = ''
WHERE
  Suppliers.Country = 'USA' ---
  ---
  --Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15
  ---
SELECT
  Employees.FirstName,
  Employees.LastName,
  COUNT(*) as total_order_by_employee
FROM
  Orders
  JOIN Employees USING (EmployeeID)
GROUP BY
  EmployeeID
HAVING
  total_order_by_employee < 15 ---
  ---
  --Вывести товар, который находится на втором месте по ко-ву заказов
  ---
SELECT
  Products.ProductName,
  COUNT(*) AS total_count_orders
FROM
  OrderDetails
  JOIN Products USING (ProductID)
GROUP BY
  ProductID
ORDER BY
  total_count_orders DESC
LIMIT
  1 OFFSET 1