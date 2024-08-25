USE FastFood_DB;

--CONSULTAS CON MULTIPLES TABLAS Y JOINs, Avance 4 PI

/*Consulta 1
¿Cómo puedo obtener una lista de todos los productos junto con sus categorías?*/

SELECT
	p.Nombre AS Producto,
	c.Nombre AS Categoria
FROM Productos AS p
INNER JOIN Categorias AS c
ON p.CategoriaID = c.CategoriaID;


/*Consulta 2
¿Cómo puedo saber a qué sucursal está asignado cada empleado?*/

SELECT
	e.Nombre AS NombreEmpleado,
	s.Nombre AS NombreSucursal
FROM Empleados AS e
INNER JOIN Sucursales AS s
ON e.SucursalID = s.SucursalID;


/*Consulta 3
¿Existen productos que no tienen una categoría asignada?*/

SELECT
	p.Nombre AS NombreProducto,
	c.Nombre AS NombreCategoria
FROM Productos AS p
LEFT JOIN Categorias AS c
ON p.CategoriaID = c.CategoriaID
WHERE c.CategoriaID IS NULL;


/*Consulta 4
¿Cómo puedo obtener un detalle completo de las órdenes, incluyendo el Nombre del cliente, 
Nombre del empleado que tomó la orden, y Nombre del mensajero que la entregó?*/

SELECT 
	o.OrdenID AS Orden, HorarioVenta, TotalCompra, KilometrosRecorrer, FechaOrdenTomada,
	c.Nombre AS NombreCliente,
	e.Nombre AS NombreEmpleado,
	m.Nombre AS NombreMensajero
FROM Ordenes AS o 
LEFT JOIN Clientes AS c
	ON o.ClienteID = c.ClienteID
LEFT JOIN Empleados AS e
	ON o.EmpleadoID = e.EmpleadoID
LEFT JOIN Mensajeros AS m
	ON o.MensajeroID = m.MensajeroID;


/*Consulta 5
¿Cuántos artículos correspondientes a cada Categoría de Productos se han vendido en cada sucursal?*/

SELECT s.Nombre AS Sucursal, c.Nombre AS Categoria, SUM(d.Cantidad) AS Ventas
FROM Ordenes AS o
INNER JOIN DetalleOrdenes AS d
	ON o.OrdenID = d.OrdenID
INNER JOIN Sucursales AS s 
	ON o.SucursalID = s.SucursalID
INNER JOIN Productos AS p 
	ON d.ProductoID = p.ProductoID
INNER JOIN Categorias AS c 
	ON p.CategoriaID = c.CategoriaID
GROUP BY s.Nombre, c.Nombre;
