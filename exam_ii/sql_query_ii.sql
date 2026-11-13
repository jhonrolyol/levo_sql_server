
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
    
-- 4.- Crea un PIVOT que muestre las ventas mensuales para cada producto en el año 1997. La consulta debe incluir las columnas para el nombre del producto y cada mes (Ene, Feb, etc.) mostrando la cantidad total vendida por cada producto en esos meses y agregar una columna con el total general.

-- 5.- Genera un PIVOT que muestre el total de ventas realizadas en cada país por año (1996, 1997 y 1998), no se considera los descuentos. La consulta debe tener las columnas Country, 1996, 1997, y 1998, con los totales de ventas por año en cada país. El formato que aparecerá debe ser en dólares ($).

-- 6.- Crea un resumen de las ventas totales por año. Usa variables para definir el año de inicio y el año de finalización, y luego genera un reporte con el total de ventas por cada año dentro de ese rango,si el usuario quiere cambiar el rango solo debe cambiar el valor de las variables sin afectar al resto del Query.

-- 7.- En base a la tabla Orders, crea un calendario, considerando solo las fechas únicas. Los meses y días deben estar en español. La columna DIA_DEL_ANIO, debe considerar los 365 día del año, si la fecha es 01/01 entonces será el día 1 si la fecha es 31/12 entonces será 365 o 366 según corresponda. La columna ULT_DIA_MES, debe considerar el último día del mes en curso, si el mes tiene 30 días entonces saldrá 30 si es 31 entonces debe mostrar 31 y si el mes trae 28 días entonces mostrará 28. La columna AVANCE_MES es una combinación entre NUM_DIA_MES y ULT_DIA_MES

-- 8.- Obtener un reporte por Vendedor que muestre el número de órdenes y el importe vendido para cada año de operaciones.

-- 9.- Obtener un reporte por Categorias que muestre el importe vendido para cada Categoría.

-- 10.- Procedimiento para Obtener el Historial de Pedidos de un Cliente. Este procedimiento permite consultar el historial de pedidos de un cliente especificando su ID. Muestra detalles como la fecha del pedido, el monto total y el número de productos. Luego de crear el procedimiento valídalo con el cliente: VINET

-- 11.- Procedimiento Almacenado para Agregar un Nuevo Producto. Este procedimiento permite agregar un nuevo producto en la tabla Products, y mostrar el producto ingresado al ejecutar el procedimiento. Para esto se debe considerar: Se agregarán los campos: ProductName, SupplierID, CategoryID, UnitPrice

-- 12.- Procedimiento almacenado para buscar ventas mensuales, con la categoría. Basado en la pregunta 3: Complementarlo con lo siguiente: Agregar la columna Categoria a la Query. Agregar en el Where buscar por categoría basado en el nombre, el usuario puede saber el nombre completo o solo algunos caracteres. Se puede usar like como alternativa. Convertirlo en Procedimiento almacenado con el nombre: SP_ObtenerVentasPorProductoYCategoria





