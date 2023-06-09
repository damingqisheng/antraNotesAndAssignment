use AdventureWorks2019;

--1. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the
-- Production.Product table, with no filter.
Select ProductID, Name, Color, ListPrice from Production.Product;

--2. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the
-- Production.Product table, excludes the rows that ListPrice is 0.
Select ProductID, Name, Color, ListPrice from Production.Product where ListPrice != 0;

--3. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the
--Production.Product table, the rows that are NULL for the Color column.
Select ProductID, Name, Color, ListPrice from Production.Product where Color is null;

--4. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the
--Production.Product table, the rows that are not NULL for the Color column
Select ProductID, Name, Color, ListPrice from Production.Product where Color is not null;

--5. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the
--Production.Product table, the rows that are not NULL for the column Color, and the column
--ListPrice has a value greater than zero.Select ProductID, Name, Color, ListPrice from Production.Product where Color is not null and ListPrice > 0;

--6. Write a query that concatenates the columns Name and Color from the Production.Product
--table by excluding the rows that are null for color.select Name + ' ' + Color "Name and Color" from Production.Product where Color is not null;--7. Write a query that generates the following result set from Production.Product:
--Name And ColorSELECT 'NAME: ' + Name + ' -- COLOR: '+ Color "Name And Color"
FROM Production.Product 
where Color is not null;

--8. Write a query to retrieve the to the columns ProductID and Name from the
--Production.Product table filtered by ProductID from 400 to 500
Select ProductID, Name, Color from Production.Product where ProductID between 400 and 500;

--9. Write a query to retrieve the columns ProductID, Name and color from the
--Production.Product table restricted to the colors black and blueSelect ProductID, Name, Color from Production.Product where Color = 'black' or Color = 'blue';--10. Write a query to get a result set on products that begins with the letter S.Select * from Production.Product p where p.Name like 'S%';--11. Write a query that retrieves the columns Name and ListPrice from the Production.Product
--table. Your result set should look something like the following. Order the result set by the
--Name column.Select name, listPrice from Production.Product order by name;--12. Write a query that retrieves the columns Name and ListPrice from the Production.Product
--table. Your result set should look something like the following. Order the result set by the
--Name column. The products name should start with either 'A' or 'S'Select name, listPrice from Production.Product where name like 'A%' or name like 'S%' order by name;--13. Write a query so you retrieve rows that have a Name that begins with the letters SPO, but is
--then not followed by the letter K. After this zero or more letters can exists. Order the result
--set by the Name column.select name 
from Production.Product
where name like 'SPO%' and name not like 'SPOK%' 
order by name;--14. Write a query that retrieves unique colors from the table Production.Product. Order the
--results in descending manner
select distinct color from Production.Product order by color desc;


--15. Write a query that retrieves the unique combination of columns ProductSubcategoryID and
--Color from the Production.Product table. Format and sort so the result set accordingly to
--the following. We do not want any rows that are NULL.in any of the two columns in the
--result.
select distinct ProductSubcategoryID, Color 
from Production.Product 
where ProductSubcategoryID is not null and Color is not null
order by 1, 2