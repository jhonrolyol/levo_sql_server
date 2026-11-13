
/*==================================================================================================
  Descripción de la consulta SQL
  
                                              " Ejercicicos "
  
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
    3 a 20 .- Preguntas

                                         Jhon R. Ordoñez
                                    (rolyordonezleon@gmail.com)
                                                                                            ><(((º>
==================================================================================================*/

-- 1.- Atajos de teclado
    -- Ctrl + s: guardar
    -- Ctrl + e o F5: ejecutar el código (recuerda seleccionar el código que deseas ejecutar)
    -- Seleccionar el código --> clic derecho --> Ejecutar: ejecutar el código
    -- ...

-- 2.- Crear o utilizar una tabla
	use Northwind;
	go
    
-- 3.- Obtener todas las columnas de la tabla Region.
    select * from Region;
    go

-- 4.- Obtener los FirstName y LastName de la tabla Employees.
    select * from Employees;
    go

    select
	    FirstName,
        LastName,
        FirstName + ' ' + LastName as [Full name]
    from Employees;
    go 

-- 5.- Obtener las columnas FirstName y LastName de la tabla Employees. Ordenados por la columna LastName.

-- 6.- Genere una lista de selección de la tabla Employees, donde obtenga las siguientes columnas. EmployeeID. LastName y FirstName (Concatenadas). Country, Region y City (Concatenada)

-- 7.- Obtener las filas de la tabla orders ordenadas por la columna Freight de mayor a menor; las columnas que presentara son: OrderID, OrderDate, ShippedDate, CustomerID and Freight.

-- 8.- Obtener los empleados tengan el valor null en la columna region.

-- 9.- Encontrar todos los apellidos (LastName) en la tabla Employees que comiencen con la letra T

-- 10.- Para recuperar el apellido de los Empleados cuya primera letra A y contenga M

-- 11.- Liste la información de los pedidos sin embarcar (ShippedDate)

-- 12.- Liste todos los campos de la tabla Suppliers cuya columna Región sea NULL.

-- 13.- Obtener los empleados ordenados alfabéticamente por FirstName y LastName

-- 14.- Obtener los empleados cuando la columna title tenga el valor de Sales. Representatives y el campo city tenga los valores de Seattle o Redmond.

-- 15.- Obtener las columnas company name, contact title, city y country de los clientes que están en la Ciudad de México o alguna ciudad de España excepto Madrid.

-- 16.- Obtener la lista de órdenes, y mostrar una columna en donde se calcule el impuesto del 10% cuando el valor de la columna Freight >= 480.

-- 17.- Obtener el número de empleados para cada ciudad.

-- 18.- Muestre los empleados que más hayan colocado pedidos para los países Germany y Brazil.

-- 19.- Obtener un reporte en donde se muestre la cantidad de ordenes por cada vendedor.


-- 20.- Muestre el total de ventas agrupando por categoría de productos.





