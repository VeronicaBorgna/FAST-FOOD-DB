USE FastFood_DB;

--EXTRA CREDIT

-- Insertar nuevos datos en la tabla Ordenes

INSERT INTO Ordenes (ClienteID, EmpleadoID, SucursalID, MensajeroID, TipoPagoID, OrigenID, HorarioVenta, TotalCompra, KilometrosRecorrer, FechaDespacho, FechaEntrega, FechaOrdenTomada, FechaOrdenLista) VALUES
(1, 1, 1, 1, 1, 1, 'Ma�ana', 1053.51, 5.5, '2023-01-01 08:30:00', '2023-01-01 09:00:00', '2023-01-01 08:00:00', '2023-01-01 08:15:00'),
(2, 2, 2, 2, 2, 2, 'Tarde', 1075.00, 10.0, '2023-02-05 14:30:00', '2023-02-05 15:00:00', '2023-02-05 13:30:00', '2023-02-05 14:00:00'),
(3, 3, 3, 3, 3, 3, 'Noche', 920.00, 2.0, '2023-03-02 19:30:00', '2023-03-02 20:00:00', '2023-03-02 19:00:00', '2023-03-02 19:15:00'),
(4, 4, 4, 4, 4, 4, 'Ma�ana', 930.00, 0.5, '2023-04-05 09:30:00', '2023-04-05 10:00:00', '2023-04-05 09:00:00', '2023-04-05 09:15:00'),
(5, 5, 5, 5, 5, 5, 'Tarde', 955.00, 8.0, '2023-05-03 15:30:00', '2023-05-03 16:00:00', '2023-05-03 15:00:00', '2023-05-03 15:15:00'),
(6, 6, 6, 6, 6, 1, 'Noche', 945.00, 12.5, '2023-06-05 20:30:00', '2023-06-05 21:00:00', '2023-06-05 20:00:00', '2023-06-05 20:15:00'),
(7, 7, 7, 7, 7, 2, 'Ma�ana', 1065.00, 7.5, '2023-07-10 08:30:00', '2023-07-10 09:00:00', '2023-07-10 08:00:00', '2023-07-10 08:15:00'),
(8, 8, 8, 8, 8, 3, 'Tarde', 1085.00, 9.5, '2023-08-05 14:30:00', '2023-08-05 15:00:00', '2023-08-05 14:00:00', '2023-08-05 14:15:00'),
(9, 9, 9, 9, 9, 4, 'Noche', 1095.00, 3.0, '2023-09-02 19:30:00', '2023-09-02 20:00:00', '2023-09-02 19:00:00', '2023-09-02 19:15:00'),
(10, 10, 10, 10, 10, 5, 'Ma�ana', 900.00, 15.0, '2023-10-07 09:30:00', '2023-10-07 10:00:00', '2023-10-07 09:00:00', '2023-10-07 09:15:00'),
(1, 2, 1, 1, 1, 1, 'Ma�ana', 1053.51, 5.5, '2023-01-01 08:30:00', '2023-01-01 09:00:00', '2023-01-01 08:00:00', '2023-01-01 08:15:00'),
(1, 2, 2, 2, 2, 2, 'Tarde', 1075.00, 10.0, '2023-02-05 14:30:00', '2023-02-05 15:00:00', '2023-02-05 13:30:00', '2023-02-05 14:00:00'),
(3, 3, 3, 3, 3, 3, 'Noche', 920.00, 2.0, '2023-03-02 19:30:00', '2023-03-02 20:00:00', '2023-03-02 19:00:00', '2023-03-02 19:15:00'),
(4, 3, 4, 4, 4, 4, 'Ma�ana', 930.00, 0.5, '2023-04-05 09:30:00', '2023-04-05 10:00:00', '2023-04-05 09:00:00', '2023-04-05 09:15:00'),
(4, 5, 5, 5, 5, 5, 'Tarde', 955.00, 8.0, '2023-05-03 15:30:00', '2023-05-03 16:00:00', '2023-05-03 15:00:00', '2023-05-03 15:15:00'),
(6, 6, 6, 6, 6, 1, 'Noche', 945.00, 12.5, '2023-06-05 20:30:00', '2023-06-05 21:00:00', '2023-06-05 20:00:00', '2023-06-05 20:15:00'),
(7, 7, 7, 7, 7, 2, 'Ma�ana', 1065.00, 7.5, '2023-07-10 08:30:00', '2023-07-10 09:00:00', '2023-07-10 08:00:00', '2023-07-10 08:15:00'),
(7, 7, 8, 8, 8, 3, 'Tarde', 1085.00, 9.5, '2023-08-05 14:30:00', '2023-08-05 15:00:00', '2023-08-05 14:00:00', '2023-08-05 14:15:00'),
(9, 7, 9, 9, 9, 4, 'Noche', 1095.00, 3.0, '2023-09-02 19:30:00', '2023-09-02 20:00:00', '2023-09-02 19:00:00', '2023-09-02 19:15:00'),
(1, 10, 10, 10, 10, 5, 'Ma�ana', 900.00, 15.0, '2023-10-07 09:30:00', '2023-10-07 10:00:00', '2023-10-07 09:00:00', '2023-10-07 09:15:00');


SELECT * FROM Ordenes; --Se corrobora que los datos fueron ingresados correctamente

-- Insertar nuevos datos en tabla DetalleOrdenes

INSERT INTO DetalleOrdenes (OrdenID, ProductoID, Cantidad, Precio) VALUES
(2, 1, 3, 23.44),
(3, 2, 5, 45.14),
(2, 3, 4, 46.37),
(4, 4, 4, 42.34),
(3, 5, 1, 18.25),
(4, 6, 4, 20.08),
(5, 7, 2, 13.31),
(6, 8, 2, 20.96),
(7, 9, 4, 30.13),
(8, 10, 3, 38.34),
(12, 1, 3, 23.44),
(13, 2, 5, 45.14),
(14, 3, 4, 46.37),
(15, 4, 4, 42.34),
(16, 5, 1, 18.25),
(17, 6, 4, 20.08),
(18, 7, 2, 13.31),
(18, 8, 2, 20.96),
(18, 9, 4, 30.13),
(19, 10, 3, 38.34);


SELECT * FROM DetalleOrdenes; --Se corrobora que los datos fueron cargados correctamente