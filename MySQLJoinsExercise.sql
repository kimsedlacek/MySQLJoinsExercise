/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name, c.Name FROM products AS p
INNER JOIN categories AS c
ON p.CategoryID = c.CategoryID     -- ON is what they have in common, the Primary Key and a foreign key
WHERE c.Name = "computers";
 
 SELECT p.Name, c.Name FROM products AS p
 INNER JOIN categories AS c
 ON p.CategoryID = c.CategoryID
 WHERE c.CategoryID = 1; 

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
-- products, primary is ProductID / reviews, primary is ReviewID / reviews hAS a foreign key that is ProductID

SELECT p.Name, p.Price, r.Rating FROM products AS p
INNER JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
-- employee prim key EmployeeID   sales prim key SalesID / foreign key EmployeeID

SELECT e.FirstName, e.LAStName, SUM(S.Quantity) AS "Total Quantity"
FROM employees AS e
INNER JOIN sales AS s
ON e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY SUM(s.Quantity) DESC
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
-- department prim. DepartmentID   category prim. CategoryID / foreign DepartmentID
SELECT * FROM departments;
SELECT * FROM categories;  -- Appliances & Games in categories

SELECT d.Name AS "Department Name", c.Name AS "Category Name" 
FROM departments AS d
INNER JOIN categories AS c
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = "Appliances" OR c.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 -- products primary key ProductID  /  sales prim. key SalesID, foreign key ProductID
 SELECT p.Name, SUM(s.Quantity) AS "Amount Sold", SUM(s.Quantity * s.PricePerUnit) AS "Total Price Sold"
 FROM products AS p
 INNER JOIN sales AS s
 ON p.ProductID = s.ProductID
 WHERE p.Name LIKE '%Hotel%'
 GROUP BY p.ProductID;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
-- products prim. ProductID    reviews prim. ReviewID / foreign key ProductID
SELECT p.Name AS "Product Name", r.Reviewer, r.Rating, r.Comment
FROM products AS p
INNER JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE p.Name LIKE '%Visio%' AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves AS an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and lASt name
-  the name of each product
-  and how many of that product they sold */
-- employees prim. EmployeeID   sales prim. SalesID / other 2 foreign    products prim ProductID
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name AS "Product Name", s.Quantity
FROM employees AS e
INNER JOIN sales AS s
ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p
ON s.ProductID = p.ProductID
ORDER BY e.EmployeeID;
