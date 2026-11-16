
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
	select * from Employees;
	go
	
	select 
		FirstName,
		LastName,
		FirstName + ' ' + LastName as [Nombres y Apellidos]
	from Employees;
	go
	
-- 5.- Muestre los nombres de las ciudades que aparecen en la tabla de empleados. (No mostrar 2 veces un mismo nombre de ciudad).
	select * from Employees;
	go
	
	select distinct
		City
	from Employees;
	go

-- 6.- Muestre los nombres de productos y precios unitarios de la tabla de productos.
	select * from Products;
	go
	
	select 
		ProductName,
		UnitPrice
	from Products;
	go

-- 7.- Muestre de la tabla de empleados que viven en USA.
	select * from Employees;
	go

	select * 
	from Employees
	where Country = 'USA';
	go

-- 8.- Muestre los clientes: listar nombre de la empresa de todos los clientes que viven en las ciudades London, Bräcke, Cowes.
	select * from Customers;
	go
	
	select 
		CompanyName,
		City
	from Customers
	where City in ('London', 'Bräcke', 'Cowes');
	go

-- 9.- Muestre los países con su cantidad de clientes.
	select * from Customers;
	go
	
	select 
		Country,
		count(*) as [Cant. Clientes]
	from Customers
	group by Country
	order by [Cant. Clientes] desc;
	go

-- 10.- Muestre los clientes que tienen la región en blanco (NULL).
	select * from Customers;
	go

	select * 
	from Customers
	where Region is null;
	go

-- 11.- Muestre los 5 productos con mayor precio unitario.
	select * from Products;
	go
	
	select top 5
		ProductName,
		UnitPrice
	from Products
	order by UnitPrice desc;
	go
	
-- 12.- Muestre los 5 productos con menor precio unitario.
	select * from Products;
	go

	select top 5
		ProductName,
		UnitPrice
	from Products
	order by UnitPrice asc;
	go

-- 13.- Muestre el conteo de empleados agrupados por el cargo.
	select * from Employees;
	go
	
	select 
		Title    as Cargo,
		count(*) as [Cant. Empleados]
	from Employees
	group by Title;
	go


-- 14.- Muestre los clientes, cantidad de órdenes y el total de compras efectuadas. Desde la perspectiva cliente se le denomina compra pero para nosotros son las ventas (Orders).
	select * from Customers;
	select * from Orders;
	select * from [Order Details];
	go 

	select top 7
		C.CustomerID                      as CustomerID,
		C.CompanyName                     as CompanyName,
		count(distinct O.OrderID)         as [Cant. Compras],
		sum(OD.UnitPrice * OD.Quantity)   as Total
	from Customers C
	left join Orders O           on C.CustomerID = O.CustomerID 
	left join [Order Details] OD on O.OrderID    = OD.OrderID
	group by C.CustomerID, C.CompanyName
	order by Total desc, CompanyName;
	go 

-- 15.- Respecto a la pregunta 12, muestre los 5 clientes que más compraron. Para traer los 5 clientes debemos de considerarlos en base al monto total en dinero.
	select * from Customers;
	select * from Orders;
	select * from [Order Details];
	go

	select top 5
		C.CompanyName                   as Cliente,
		count(distinct O.OrderID)       as [Cantidad de Ordenes],
		sum(OD.UnitPrice * OD.Quantity) as [Total de Compras]
	from Customers C
	inner join Orders O           on C.CustomerID = O.CustomerID
	inner join [Order Details] OD on O.OrderID    = OD.OrderID
	group by C.CompanyName
	order by [Total de Compras] desc;
	go

-- 16.- Muestre los proveedores y su cantidad de productos que han vendido.
	select * from Customers;
	select * from Products;
	select * from [Order Details];
	go
	
	select top 6
		S.SupplierID,
		S.CompanyName,
		count(distinct P.ProductID) as [Cant. Productos]
	from Suppliers as S
	inner join Products        as P  on S.SupplierID = P.SupplierID
	inner join [Order Details] as OD on P.ProductID  = OD.ProductID
	group by S.SupplierID,S.CompanyName
	order by S.SupplierID;
	go

-- 17.- Muestre la cantidad de pedidos y su valorizado (precio por cantidad) agrupados por año. Ordénalo por año.
	select * from Orders;
	select * from [Order Details];
	go
	
	select 
		year(O.OrderDate)               as Año,
		count(distinct O.OrderID)       as [Cantidad de Pedidos],
		sum(OD.UnitPrice * OD.Quantity) as Valorizado
	from Orders O
	inner join [Order Details] OD on O.OrderID = OD.OrderID
	group by year(O.OrderDate)
	order by Año;
	go
	
-- 18.- Muestre la cantidad de clientes únicos, que compraron cada categoría de productos.
	select * from Categories;
	select * from Products;
	select * from [Order Details];
	select * from Orders;
	go

	select 
		cat.CategoryName             as Categoria,
		count(distinct O.CustomerID) as [Clientes Unicos]
	from Categories Cat
	inner join Products P         on Cat.CategoryID = P.CategoryID
	inner join [Order Details] OD on P.ProductID    = OD.ProductID
	inner join Orders O           on OD.OrderID     = O.OrderID
	group by Cat.CategoryName;
	go
	
-- 19.- Muestre el número de pedido y el importe total por cada uno de ellos.
	select * from [Order Details];
	go

	select top 6
		OrderID                   as [Numero de Pedido],
		sum(UnitPrice * Quantity) as [Importe Total]
	from [Order Details]
	group by OrderID
	order by OrderID;
	go
	
-- 20.- Muestre el promedio de ventas por empleado.
	select * from Employees;
	select * from Orders;
	select * from [Order Details];
	go
	
	select top 5
		E.EmployeeID,
		E.FirstName + ' ' + E.LastName as Empleado,
		avg(OD.UnitPrice * OD.Quantity) as PromedioVentas
	from Employees as E
	inner join Orders          as O  on E.EmployeeID = O.EmployeeID
	inner join [Order Details] as OD on O.OrderID    = OD.OrderID
	group by E.EmployeeID, E.FirstName, E.LastName
	order by E.EmployeeID;
	go

-- 21.- Muestre los clientes y sus ventas que superen los 5000.
	select * from Customers;
	select * from Orders;
	select * from [Order Details];
	go
	
	select top 5
		C.CustomerID,
		C.CompanyName,
		sum(OD.UnitPrice * OD.Quantity) as ImporteTotal
	from Customers as C
	inner join Orders          as O  on C.CustomerID = O.CustomerID
	inner join [Order Details] as OD on O.OrderID    = OD.OrderID
	group by C.CustomerID, C.CompanyName
	having sum(OD.UnitPrice * OD.Quantity) > 5000
	order by ImporteTotal;
	go

-- 22.- Muestre las compras de los clientes en Marzo del 1996, 1997 y 1998.
	select * from Customers;
	select * from Orders;
	select * from [Order Details];
	go
	
	select
		year(O.OrderDate)               as Anio,
		C.CustomerID,
		C.CompanyName,
		O.OrderDate,
		datename(month, O.OrderDate)    as Mes,
		sum(OD.UnitPrice * OD.Quantity) as ImporteTotal
	from Customers as C
	inner join Orders          as O  on C.CustomerID = O.CustomerID
	inner join [Order Details] as OD on O.OrderID    = OD.OrderID
	where (month(O.OrderDate) = 3 and year(O.OrderDate) in (1996, 1997, 1998))
	group by year(O.OrderDate), C.CustomerID, C.CompanyName, O.OrderDate
	order by Anio, O.OrderDate, C.CustomerID;
	go



