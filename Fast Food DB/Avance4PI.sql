USE FastFood_DB;

--CONSULTAS CON MULTIPLES TABLAS Y JOINs, Avance 4 PI

/*Consulta 1
�C�mo puedo obtener una lista de todos los productos junto con sus categor�as?*/

SELECT
	p.Nombre AS Producto,
	c.Nombre AS Categoria
FROM Productos AS p
INNER JOIN Categorias AS c
ON p.CategoriaID = c.CategoriaID;


/*Consulta 2
�C�mo puedo saber a qu� sucursal est� asignado cada empleado?*/

SELECT
	e.Nombre AS NombreEmpleado,
	s.Nombre AS NombreSucursal
FROM Empleados AS e
INNER JOIN Sucursales AS s
ON e.SucursalID = s.SucursalID;


/*Consulta 3
�Existen productos que no tienen una categor�a asignada?*/

SELECT
	p.Nombre AS NombreProducto,
	c.Nombre AS NombreCategoria
FROM Productos AS p
LEFT JOIN Categorias AS c
ON p.CategoriaID = c.CategoriaID
WHERE c.CategoriaID IS NULL;


/*Consulta 4
�C�mo puedo obtener un detalle completo de las �rdenes, incluyendo el Nombre del cliente, 
Nombre del empleado que tom� la orden, y Nombre del mensajero que la entreg�?*/

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
�Cu�ntos art�culos correspondientes a cada Categor�a de Productos se han vendido en cada sucursal?*/

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
