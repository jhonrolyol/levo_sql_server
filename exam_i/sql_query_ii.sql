
/*==================================================================================================
  Descripción de la consulta SQL
  
                                              " Examen 1 "
  
           .--.                  
          |o_o |         
          |:_/ |           ---------------------------------------------------
         //   \ \                    Desarrollo de las preguntas
        (|     | )         ---------------------------------------------------        
        /'\_   _/`\   
        \___)=(___/
    
  Contenido
    1.- Atajos de teclado
    2.- Crear o utilizar una tabla
    3 a 22.- Preguntas 

                                         Jhon R. Ordoñez
                                    (rolyordonezleon@gmail.com)
                                                                                            ><(((º>
==================================================================================================*/

-- 1.- Atajos de teclado
    -- Ctrl + s: guardar
    -- Ctrl + e o F5: ejecutar el código (recuerda seleccionar el código que deseas ejecutar)
    -- Seleccionar el código --> clic derecho --> Ejecutar: ejecutar el código (esta opción me gusta más)
    -- ...

-- 2.- Crear o utilizar una tabla
	use Northwind;
	go

-- 3.- Muestre los registros de la tabla de empleados.
	select * from Employees;
	go 

-- 4.- Muestre los nombres y apellidos de los empleados.
	select 
		FirstName,
		LastName,
		FirstName + ' ' + LastName as [Nombres y Apellidos]
	from Employees;
	go

-- 5.- Muestre los nombres de las ciudades que aparecen en la tabla de empleados. (No mostrar 2 veces un mismo nombre de ciudad).
	select distinct
		City
	from Employees;
	go

-- 6.- Muestre los nombres de productos y precios unitarios de la tabla de productos.
	select 
		ProductName,
		UnitPrice
	from Products;
	go

-- 7.- Muestre de la tabla de empleados que viven en USA.
	select * 
	from Employees
	where Country = 'USA';
	go

-- 8.- Muestre los clientes: listar nombre de la empresa de todos los clientes que viven en las ciudades London, Bräcke, Cowes.
	select 
		CompanyName,
		City
	from Customers
	where City in ('London', 'Bräcke', 'Cowes');
	go

-- 9.- Muestre los países con su cantidad de clientes.
	select 
		Country,
		count(*) as [Cantidad de Clientes]
	from Customers
	group by Country
	order by [Cantidad de Clientes] desc;
	go

-- 10.- Muestre los clientes que tienen la región en blanco (NULL).
	select * 
	from Customers
	where Region is null;
	go

-- 11.- Muestre los 5 productos con mayor precio unitario.
	select top 5
		ProductName,
		UnitPrice
	from Products
	order by UnitPrice desc;
	go
	
-- 12.- Muestre los 5 productos con menor precio unitario.
	select top 5
		ProductName,
		UnitPrice
	from Products
	order by UnitPrice asc;
	go

-- 13.- Muestre el conteo de empleados agrupados por el cargo.
	select 
		Title as Cargo,
		count(*) as [Cantidad de Empleados]
	from Employees
	group by Title;
	go


-- 14.- Muestre los clientes, cantidad de órdenes y el total de compras efectuadas. Desde la perspectiva cliente se le denomina compra pero para nosotros son las ventas (Orders).
	



-- 15.- Respecto a la pregunta 12, muestre los 5 clientes que más compraron. Para traer los 5 clientes debemos de considerarlos en base al monto total en dinero.
	select top 5
		c.CompanyName as Cliente,
		count(distinct o.OrderID) as [Cantidad de Ordenes],
		sum(od.UnitPrice * od.Quantity) as [Total de Compras]
	from Customers c
		inner join Orders o on c.CustomerID = o.CustomerID
		inner join [Order Details] od on o.OrderID = od.OrderID
	group by c.CompanyName
	order by [Total de Compras] desc;
	go

-- 16.- Muestre los proveedores y su cantidad de productos que han vendido.


-- 17.- Muestre la cantidad de pedidos y su valorizado (precio por cantidad) agrupados por año. Ordénalo por año.
	select 
		year(o.OrderDate) as Año,
		count(distinct o.OrderID) as [Cantidad de Pedidos],
		sum(od.UnitPrice * od.Quantity) as Valorizado
	from Orders o
		inner join [Order Details] od on o.OrderID = od.OrderID
	group by year(o.OrderDate)
	order by Año;
	go
	
-- 18.- Muestre la cantidad de clientes únicos, que compraron cada categoría de productos.
	select 
		cat.CategoryName as Categoria,
		count(distinct o.CustomerID) as [Clientes Unicos]
	from Categories cat
		inner join Products p on cat.CategoryID = p.CategoryID
		inner join [Order Details] od on p.ProductID = od.ProductID
		inner join Orders o on od.OrderID = o.OrderID
	group by cat.CategoryName;
	go
	
-- 19.- Muestre el número de pedido y el importe total por cada uno de ellos.
	select 
		OrderID as [Numero de Pedido],
		sum(UnitPrice * Quantity) as [Importe Total]
	from [Order Details]
	group by OrderID
	order by OrderID;
	go
	
-- 20.- Muestre el promedio de ventas por empleado.
	
-- 21.- Muestre los clientes y sus ventas que superen los 5000.

-- 22.- Muestre las compras de los clientes en Marzo del 1996, 1997 y 1998.





