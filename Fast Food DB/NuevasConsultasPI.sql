USE FastFood_DB;

/*Eficiencia de los mensajeros: 
�Cu�l es el tiempo promedio desde el despacho hasta la entrega de los pedidos gestionados por todo el equipo de mensajer�a?*/

SELECT AVG(DATEDIFF(MINUTE, FechaDespacho, FechaEntrega)) AS PromedioEntregas
FROM Ordenes
WHERE MensajeroID IS NOT NULL;

--El tiempo promedio de entrega de pedidos realizada por los mensajeros es de 30 minutos

--An�lisis de Ventas por Origen de Orden: �Qu� canal de ventas genera m�s ingresos?

SELECT TOP 1 ori.Descripcion, SUM(o.TotalCompra) AS Ingresos 
FROM Ordenes AS o
LEFT JOIN OrigenesOrden AS ori
	ON o.OrigenID = ori.OrigenID
GROUP BY ori.Descripcion
ORDER BY Ingresos DESC;

--El mayor ingreso de Fast Food se genera por compras realizadas de forma presencial en las sucursales.

--Productividad de los Empleados: �Cu�l es el nivel de ingreso generado por Empleado?

SELECT e.Nombre AS Empleados, SUM(o.TotalCompra) AS Ingresos
FROM Empleados AS e
LEFT JOIN Ordenes AS o
	ON e.EmpleadoID = o.EmpleadoID
GROUP BY e.Nombre
ORDER BY Ingresos DESC;

--El empleado Lucas Miller ha generado los m�s altos ingresos y Sophia Rodriguez los m�s bajos

/*An�lisis de Demanda por Horario y D�a: 
�C�mo var�a la demanda de productos a lo largo del d�a? 
NOTA: Esta consulta no puede ser implementada sin una definici�n clara del horario (ma�ana, tarde, noche) en la base de datos existente. 
Asumiremos que HorarioVenta refleja esta informaci�n correctamente.*/

SELECT o.HorarioVenta, p.Nombre AS Productos, SUM(d.Cantidad) AS Demanda
FROM Ordenes AS o
INNER JOIN DetalleOrdenes AS d
	ON o.OrdenID = d.OrdenID
INNER JOIN Productos AS p
	ON d.ProductoID = p.ProductoID
GROUP BY o.HorarioVenta, p.Nombre
ORDER BY o.HorarioVenta DESC;

--La mayor demanda se produce en el horario de la ma�ana.

--Comparaci�n de Ventas Mensuales: �Cu�l es la tendencia de los ingresos generados en cada periodo mensual?

SELECT YEAR(FechaOrdenTomada) AS A�o,
	   DATENAME(MONTH, FechaOrdenTomada) AS MesTransaccion,
	   SUM(TotalCompra) AS Ingresos
FROM Ordenes
GROUP BY YEAR(FechaOrdenTomada), DATENAME(MONTH, FechaOrdenTomada);

--El mes en que se generaron mayores ingresos fue Mayo.

/*An�lisis de Fidelidad del Cliente: 
�Qu� porcentaje de clientes son recurrentes versus nuevos clientes cada mes? 
NOTA: La consulta se enfocar�a en la frecuencia de �rdenes por cliente para inferir la fidelidad.*/

SELECT c.Nombre AS Cliente, COUNT(o.OrdenID) AS Ordenes
FROM Ordenes AS o
INNER JOIN Clientes AS c
	ON o.ClienteID = c.ClienteID
GROUP BY c.Nombre;

--El cliente Uno es qui�n m�s veces ha realizado �rdenes.