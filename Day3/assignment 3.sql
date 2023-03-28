use Northwind;
--1. List all cities that have both Employees and Customers.
select distinct city 
from employees
where city in (
	select distinct city
	from customers
)

--2. List all cities that have Customers but no Employee.
--a. Use sub-query
--b. Do not use sub-query
select distinct city 
from customers
where city not in (
	select distinct city
	from Employees
)

--3. List all products and their total order quantities throughout all orders
select p.ProductID, p.ProductName, (select sum(o.OrderID) from [Order Details] o where o.ProductID = p.ProductID) [total order quantities] from Products p;


--4. List all Customer Cities and total products ordered by that city.
select distinct City from Customers order by City;

--5. List all Customer Cities that have at least two customers.
--a. Use union
select city from Customersexceptselect city from customersgroup by cityhaving COUNT(*)=1union select city from customersgroup by cityhaving COUNT(*)=0

--b. Use sub-query and no union
select distinct c1.city 
from Customers c1 
where (select count(c2.CustomerID) from Customers c2 where c2.City = c1.City) >= 2;

--6. List all Customer that have ordered at least two different kinds of products.
select c.CustomerID from Customers c where (select count(*) from Orders o where o.CustomerID = c.CustomerID) > 1;

--7. List all Customers who have ordered products, but have the ¡®ship city¡¯ on the order different from their own customer cities.
select c.CustomerID from Customers c where c.City not in (select o.ShipCity from Orders o where o.CustomerID = c.CustomerID);

--8. List 5 most popular products, their average price, and the customer city that ordered most quantity of it.
select top 5 o.ProductID, o.average, (
SELECT TOP 1 temp.ShipCity
FROM (
  SELECT COUNT(o1.OrderID) AS total, o2.ShipCity
  FROM [Order Details] o1
  LEFT JOIN Orders o2 ON o1.OrderID = o2.OrderID 
  where o1.ProductID = o.ProductID
  GROUP BY o2.ShipCity 
) AS temp
ORDER BY temp.total DESC) "city"
from (select productID, avg(UnitPrice) as average, count(*) as total
from [Order Details] group by ProductID) o 
order by total desc;

--9.List all cities that have never ordered something but we have employees there.
--a. Use sub-query
--b. Do not use sub-query
select o.ShipCity as city from (SELECT COUNT(o1.OrderID) AS totalorder, o2.ShipCity, count(o2.EmployeeID) as totalemployee 
  FROM [Order Details] o1
  LEFT JOIN Orders o2 ON o1.OrderID = o2.OrderID 
  GROUP BY o2.ShipCity) o where o.totalorder = 0 and totalemployee > 0;



--10.List one city, if exists, 
--that is the city from where the employee sold most orders (not the product quantity) is, 
--and also the city of most total quantity of products ordered from. (tip: join  sub-query)
select (select top 1 City from Orders o join [Order Details] od on o.OrderID=od.OrderID join Employees e on e.EmployeeID = o.EmployeeIDgroup by e.EmployeeID,e.Cityorder by COUNT(*) desc) as MostOrderedCity,(select top 1 City from Orders o join [Order Details] od on o.OrderID=od.OrderID join Employees e on e.EmployeeID = o.EmployeeIDgroup by e.EmployeeID,e.Cityorder by sum(Quantity) desc) as MostQunatitySoldCity--11. How do you remove the duplicates record of a table?
-- I can use the "distinct" keyword