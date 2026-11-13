
/*==================================================================================================
  Descripción de la consulta SQL
  
                                              " Examen 2 "
  
           .--.                  
          |o_o |         
          |:_/ |           ---------------------------------------------------
         //   \ \                      Desarrollo de las preguntas
        (|     | )         ---------------------------------------------------        
        /'\_   _/`\   
        \___)=(___/
    
  Contenido
    1.- Atajos de teclado
    2.- Crear o utilizar una tabla
    3 a 12.- Preguntas

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

-- 3.- Genera un resumen de compras para cada cliente (CompanyName) que incluya: El nombre del cliente (CompanyName). La fecha de la primera compra (formateada como dd/MM/yyyy). La fecha de la última compra (formateada como dd/MM/yyyy). El total gastado por cada cliente (formateada en $).
    select * from Customers;
    select * from Orders;
    select * from [Order Details];
    go

    select
        C.CompanyName as [Cliente],
        format(min(O.OrderDate), 'dd/MM/yyyy') as [PrimeraCompra],
        format(max(O.OrderDate), 'dd/MM/yyyy') as [UltimaCompra],
        format(sum(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)), 'C', 'en-US') as [TotalGastado]
    from Customers as C
    inner join Orders          as O  on O.CustomerID = C.CustomerID
    inner join [Order Details] as OD on OD.OrderID   = O.OrderID
    group by C.CustomerID, C.CompanyName
    order by C.CompanyName;
    go
    
-- 4.- Crea un PIVOT que muestre las ventas mensuales para cada producto en el año 1997. La consulta debe incluir las columnas para el nombre del producto y cada mes (Ene, Feb, etc.) mostrando la cantidad total vendida por cada producto en esos meses y agregar una columna con el total general.
    select * from Orders;
    select * from [Order Details];
    select * from Products;
    go
    
    with ventas_mensuales as (
        select
            P.ProductName,
            month(O.OrderDate) as num_mes,
            OD.Quantity
        from Orders as O 
        inner join [Order Details] as OD on OD.OrderID = O.OrderID
        inner join Products        as P  on P.ProductID = OD.ProductID
        where (O.OrderDate >= '19970101' and O.OrderDate <  '19980101')
    ),
    pivote as (
        select
            ProductName,
            isnull([1], 0)  as Ene,
            isnull([2], 0)  as Feb,
            isnull([3], 0)  as Mar,
            isnull([4], 0)  as Abr,
            isnull([5], 0)  as May,
            isnull([6], 0)  as Jun,
            isnull([7], 0)  as Jul,
            isnull([8], 0)  as Ago,
            isnull([9], 0)  as Sep,
            isnull([10], 0) as Oct,
            isnull([11], 0) as Nov,
            isnull([12], 0) as Dic
        from ventas_mensuales
        pivot (
            sum(Quantity)
            for num_mes in ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])
        ) as pv
    )
    select
        ProductName as [ProductName],
        Ene, Feb, Mar, Abr, May, Jun, Jul, Ago, Sep, Oct, Nov, Dic, Ene + Feb + Mar + Abr + May + Jun + Jul + Ago + Sep + Oct + Nov + Dic as [TotalVentas]
    from pivote
    order by [ProductName];
    go
    

-- 5.- Genera un PIVOT que muestre el total de ventas realizadas en cada país por año (1996, 1997 y 1998), no se considera los descuentos. La consulta debe tener las columnas Country, 1996, 1997, y 1998, con los totales de ventas por año en cada país. El formato que aparecerá debe ser en dólares ($).
    with ventas_pais_anio as (
        select
            C.Country,
            year(O.OrderDate) as Anio,
            OD.UnitPrice * OD.Quantity as Importe
        from Customers as C
        inner join Orders          as O  on O.CustomerID = C.CustomerID
        inner join [Order Details] as OD on OD.OrderID   = O.OrderID
        where (O.OrderDate >= '19960101' and O.OrderDate <  '19990101')
    ),
    pivote as (
        select
            Country,
            isnull([1996], 0) as [1996],
            isnull([1997], 0) as [1997],
            isnull([1998], 0) as [1998]
        from ventas_pais_anio
        pivot (
            sum(Importe)
            for Anio in ([1996], [1997], [1998])
        ) as PV
    )
    select
        Country,
        format([1996], 'C', 'en-US') as [Ventas_1996],
        format([1997], 'C', 'en-US') as [Ventas_1997],
        format([1998], 'C', 'en-US') as [Ventas_1998]
    from pivote
    order by Country;
    go

-- 6.- Crea un resumen de las ventas totales por año. Usa variables para definir el año de inicio y el año de finalización, y luego genera un reporte con el total de ventas por cada año dentro de ese rango,si el usuario quiere cambiar el rango solo debe cambiar el valor de las variables sin afectar al resto del Query.
    


-- 7.- En base a la tabla Orders, crea un calendario, considerando solo las fechas únicas. Los meses y días deben estar en español. La columna DIA_DEL_ANIO, debe considerar los 365 día del año, si la fecha es 01/01 entonces será el día 1 si la fecha es 31/12 entonces será 365 o 366 según corresponda. La columna ULT_DIA_MES, debe considerar el último día del mes en curso, si el mes tiene 30 días entonces saldrá 30 si es 31 entonces debe mostrar 31 y si el mes trae 28 días entonces mostrará 28. La columna AVANCE_MES es una combinación entre NUM_DIA_MES y ULT_DIA_MES

-- 8.- Obtener un reporte por Vendedor que muestre el número de órdenes y el importe vendido para cada año de operaciones.

-- 9.- Obtener un reporte por Categorias que muestre el importe vendido para cada Categoría.

-- 10.- Procedimiento para Obtener el Historial de Pedidos de un Cliente. Este procedimiento permite consultar el historial de pedidos de un cliente especificando su ID. Muestra detalles como la fecha del pedido, el monto total y el número de productos. Luego de crear el procedimiento valídalo con el cliente: VINET

-- 11.- Procedimiento Almacenado para Agregar un Nuevo Producto. Este procedimiento permite agregar un nuevo producto en la tabla Products, y mostrar el producto ingresado al ejecutar el procedimiento. Para esto se debe considerar: Se agregarán los campos: ProductName, SupplierID, CategoryID, UnitPrice

-- 12.- Procedimiento almacenado para buscar ventas mensuales, con la categoría. Basado en la pregunta 3: Complementarlo con lo siguiente: Agregar la columna Categoria a la Query. Agregar en el Where buscar por categoría basado en el nombre, el usuario puede saber el nombre completo o solo algunos caracteres. Se puede usar like como alternativa. Convertirlo en Procedimiento almacenado con el nombre: SP_ObtenerVentasPorProductoYCategoria

