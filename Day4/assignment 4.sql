use Northwind;

--1. Create a view named ¡°view_product_order_[your_last_name]¡±, 
--list all products and total ordered quantity for that product.
create view view_product_order_shi as 
select p.productid, p.productname, (select sum(o.quantity) from dbo.[Order Details] o where p.ProductID = o.ProductID) as "total ordered quantity"
FROM dbo.Products p;

select * from view_product_order_shi;

--2. Create a stored procedure ¡°sp_product_order_quantity_[your_last_name]¡± 
--that accept product id as an input and total quantities of order as output parameter.

CREATE PROCEDURE sp_product_order_quantity_shi
	@productid INT,
    @total_ordered_quantity INT OUTPUT
as 
begin
	select @total_ordered_quantity = sum(o.quantity) from dbo.[Order Details] o where o.ProductID = @productid
end;


DECLARE @total_ordered_quantity INT;
DECLARE @productid INT;
set @productid = 1;
EXEC sp_product_order_quantity_shi @productid, @total_ordered_quantity = @total_ordered_quantity OUTPUT;
SELECT @total_ordered_quantity


--3. Create a stored procedure ¡°sp_product_order_city_[your_last_name]¡± 
--that accept product name as an input and top 5 cities that ordered most 
--that product combined with the total quantity of that product ordered from that city as output.
CREATE PROCEDURE sp_product_order_city_shi
	@productname varchar(100),
    @total_ordered_quantity CITY OUTPUT
as 
begin
	select @total_ordered_quantity = sum(o.quantity) from dbo.[Order Details] o where o.ProductID = @productid
end;





