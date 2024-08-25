--Consultar la base de datos FastFood_DB
USE FastFood_DB;

--CONSULTAS SQL, avance 3 PI

/*Consulta 1:
�Cu�l es el total de ventas (TotalCompra) a nivel global?*/

SELECT SUM(TotalCompra) AS TotalVenta
	FROM Ordenes;

/*Consulta 2:
�Cu�l es el precio promedio de los productos dentro de cada categor�a?*/

SELECT CategoriaID,
	AVG(Precio) AS PromedioPrecio
	FROM Productos
	GROUP BY CategoriaID;

/*Consulta 3:
�Cu�l es el valor de la orden m�nima y m�xima por cada sucursal?*/

SELECT SucursalID,
	MIN(TotalCompra) AS CompraMinima,
	MAX(TotalCompra) AS CompraMaxima
	FROM Ordenes
	GROUP BY SucursalID;

/*Consulta 4:
�Cu�l es el mayor n�mero de kil�metros recorridos para una entrega?*/

SELECT TOP 1 OrdenID, MAX(KilometrosRecorrer) AS MaxKmRecorridos
	FROM Ordenes
	GROUP BY OrdenID
	ORDER BY MaxKmRecorridos DESC;

/*Consulta 5:
�Cu�l es la cantidad promedio de productos por orden?*/

SELECT OrdenID,
	AVG(Cantidad) AS PromedioProductos
	FROM DetalleOrdenes
	GROUP BY OrdenID;

/*Consulta 6:
�C�mo se distribuye la Facturaci�n Total del Negocio de acuerdo a los m�todos de pago?*/

SELECT TipoPagoID, 
	SUM(TotalCompra) AS TotalCompraTipoPago
	FROM Ordenes
	GROUP BY TipoPagoID;

/*Consulta 7:
�Cual Sucursal tiene el ingreso promedio m�s alto?*/

SELECT TOP 1 SucursalID, 
	AVG(TotalCompra) AS PromedioIngresoSucursal
	FROM Ordenes
	GROUP BY SucursalID
	ORDER BY AVG(TotalCompra) DESC;

/*Consulta 8:
�Cu�les son las sucursales que han generado ventas totales por encima de $ 1000?*/

SELECT SucursalID,
	SUM(TotalCompra) AS VentasTotales
	FROM Ordenes
	GROUP BY SucursalID
	HAVING SUM(TotalCompra)>1000;

/*Consulta 9:
�C�mo se comparan las ventas promedio antes y despu�s del 1 de julio de 2023?*/

SELECT 
	(SELECT AVG(TotalCompra) AS PromedioVentas FROM Ordenes
	WHERE FechaOrdenTomada<'2023-01-07') AS [Promedio Ventas antes del 1 de Julio],
	(SELECT AVG(TotalCompra) AS PromedioVentas FROM Ordenes 
	WHERE FechaOrdenTomada>='2023-01-07') AS [Promedio Ventas despues del 1 de Julio];

/*Consulta 10:
�Durante qu� horario del d�a (ma�ana, tarde, noche) se registra la mayor cantidad de ventas, 
cu�l es el ingreso promedio de estas ventas, y cu�l ha sido el importe m�ximo alcanzado por una orden en dicha jornada?*/

SELECT TOP 1 HorarioVenta, 
		COUNT(OrdenID) AS CantidadVentas,
		AVG(TotalCompra) AS PromedioVentas,
		MAX(TotalCompra) AS ValorMaximoVenta
	FROM Ordenes
	GROUP BY HorarioVenta
	ORDER BY CantidadVentas DESC;


