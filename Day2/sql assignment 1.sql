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
--ListPrice has a value greater than zero.

--6. Write a query that concatenates the columns Name and Color from the Production.Product
--table by excluding the rows that are null for color.
--Name And Color
FROM Production.Product 
where Color is not null;

--8. Write a query to retrieve the to the columns ProductID and Name from the
--Production.Product table filtered by ProductID from 400 to 500
Select ProductID, Name, Color from Production.Product where ProductID between 400 and 500;

--9. Write a query to retrieve the columns ProductID, Name and color from the
--Production.Product table restricted to the colors black and blue
--table. Your result set should look something like the following. Order the result set by the
--Name column.
--table. Your result set should look something like the following. Order the result set by the
--Name column. The products name should start with either 'A' or 'S'
--then not followed by the letter K. After this zero or more letters can exists. Order the result
--set by the Name column.
from Production.Product
where name like 'SPO%' and name not like 'SPOK%' 
order by name;
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