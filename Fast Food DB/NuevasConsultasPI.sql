USE FastFood_DB;

/*Eficiencia de los mensajeros: 
¿Cuál es el tiempo promedio desde el despacho hasta la entrega de los pedidos gestionados por todo el equipo de mensajería?*/

SELECT AVG(DATEDIFF(MINUTE, FechaDespacho, FechaEntrega)) AS PromedioEntregas
FROM Ordenes
WHERE MensajeroID IS NOT NULL;

--El tiempo promedio de entrega de pedidos realizada por los mensajeros es de 30 minutos

--Análisis de Ventas por Origen de Orden: ¿Qué canal de ventas genera más ingresos?

SELECT TOP 1 ori.Descripcion, SUM(o.TotalCompra) AS Ingresos 
FROM Ordenes AS o
LEFT JOIN OrigenesOrden AS ori
	ON o.OrigenID = ori.OrigenID
GROUP BY ori.Descripcion
ORDER BY Ingresos DESC;

--El mayor ingreso de Fast Food se genera por compras realizadas de forma presencial en las sucursales.

--Productividad de los Empleados: ¿Cuál es el nivel de ingreso generado por Empleado?

SELECT e.Nombre AS Empleados, SUM(o.TotalCompra) AS Ingresos
FROM Empleados AS e
LEFT JOIN Ordenes AS o
	ON e.EmpleadoID = o.EmpleadoID
GROUP BY e.Nombre
ORDER BY Ingresos DESC;

--El empleado Lucas Miller ha generado los más altos ingresos y Sophia Rodriguez los más bajos

/*Análisis de Demanda por Horario y Día: 
¿Cómo varía la demanda de productos a lo largo del día? 
NOTA: Esta consulta no puede ser implementada sin una definición clara del horario (mañana, tarde, noche) en la base de datos existente. 
Asumiremos que HorarioVenta refleja esta información correctamente.*/

SELECT o.HorarioVenta, p.Nombre AS Productos, SUM(d.Cantidad) AS Demanda
FROM Ordenes AS o
INNER JOIN DetalleOrdenes AS d
	ON o.OrdenID = d.OrdenID
INNER JOIN Productos AS p
	ON d.ProductoID = p.ProductoID
GROUP BY o.HorarioVenta, p.Nombre
ORDER BY o.HorarioVenta DESC;

--La mayor demanda se produce en el horario de la mañana.

--Comparación de Ventas Mensuales: ¿Cuál es la tendencia de los ingresos generados en cada periodo mensual?

SELECT YEAR(FechaOrdenTomada) AS Año,
	   DATENAME(MONTH, FechaOrdenTomada) AS MesTransaccion,
	   SUM(TotalCompra) AS Ingresos
FROM Ordenes
GROUP BY YEAR(FechaOrdenTomada), DATENAME(MONTH, FechaOrdenTomada);

--El mes en que se generaron mayores ingresos fue Mayo.

/*Análisis de Fidelidad del Cliente: 
¿Qué porcentaje de clientes son recurrentes versus nuevos clientes cada mes? 
NOTA: La consulta se enfocaría en la frecuencia de órdenes por cliente para inferir la fidelidad.*/

SELECT c.Nombre AS Cliente, COUNT(o.OrdenID) AS Ordenes
FROM Ordenes AS o
INNER JOIN Clientes AS c
	ON o.ClienteID = c.ClienteID
GROUP BY c.Nombre;

--El cliente Uno es quién más veces ha realizado órdenes.