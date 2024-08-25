--Crear base de datos Fast Food DataBase
CREATE DATABASE FastFood_DB
ON 
( NAME = 'FastFood_DB_Data',
  FILENAME = 'C:\SQL_BaseDatos\FastFood_DB_Data.mdf',
  SIZE = 50MB,
  MAXSIZE = 1GB,
  FILEGROWTH = 5MB )
LOG ON
( NAME = 'FastFood_DB_Log',
  FILENAME = 'C:\SQL_BaseDatos\FastFood_DB_Log.ldf',
  SIZE = 25MB,
  MAXSIZE = 256MB,
  FILEGROWTH = 5MB );

--Activar la base de datos FastFood_DB
  USE FastFood_DB;

--GENERAR LAS TABLAS QUE COMPONEN LA BASE DE DATOS FastFood_DB

--Crear la tabla Categorias
  CREATE TABLE Categorias (
	CategoriaID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR(255) NOT NULL);
	
--Crear la tabla Productos
  CREATE TABLE Productos (
	ProductoID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR (255) NOT NULL,
	CategoriaID INT,
	Precio DECIMAL (10,2) NOT NULL);

--Crear la tabla Clientes
  CREATE TABLE Clientes (
	ClienteID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR (255) NOT NULL,
	Dirección VARCHAR (255)); 

--Crear la tabla Empleados
  CREATE TABLE Empleados (
	EmpleadoID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR (255) NOT NULL,
	Posicion VARCHAR (255),
	Departamento VARCHAR (255),
	SucursalID INT,
	Rol VARCHAR (255));
	
--Crear la tabla Sucursales
  CREATE TABLE Sucursales (
	SucursalID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR (255) NOT NULL,
	Direccion VARCHAR (255));

--Crear la tabla Origenes de orden
  CREATE TABLE OrigenesOrden (
	OrigenID INT PRIMARY KEY IDENTITY,
	Descripcion VARCHAR (255) NOT NULL);

--Crear la tabla Tipos de pago
  CREATE TABLE TiposPago (
	TipoPagoID INT PRIMARY KEY IDENTITY,
	Descripcion VARCHAR (255) NOT NULL);

--Crear la tabla Mensajeros
  CREATE TABLE Mensajeros (
	MensajeroID INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR (255) NOT NULL,
	EsExterno BIT NOT NULL);

--Crear la tabla Ordenes
  CREATE TABLE Ordenes (
	OrdenID INT PRIMARY KEY IDENTITY,
	ClienteID INT,
	EmpleadoID INT,
	SucursalID INT,
	MensajeroID INT,
	TipoPagoID INT,
	OrigenID INT,
	HorarioVenta VARCHAR (255), --mañana-tarde-noche
	TotalCompra DECIMAL (10,2),
	KilometrosRecorrer DECIMAL (10,2), --en caso que haya entregas a domicilio
	FechaDespacho DATETIME, --fecha y hora que el pedido se entrega al repartidor
	FechaEntrega DATETIME, --fecha y hora que el pedido llega al cliente
	FechaOrdenTomada DATETIME, --fecha y hora que se genera la orden
	FechaOrdenLista DATETIME); --fecha y hora que esta listo el pedido en la cocina

--Crear la tabla Detalle de ordenes
  CREATE TABLE DetalleOrdenes (
	OrdenID INT,
	ProductoID INT,
	Cantidad INT,
	Precio DECIMAL (10,02),
	PRIMARY KEY (OrdenID,ProductoID));

--GENERAR LAS RELACIONES ENTRE LAS TABLAS

--Generar relacion entre las tablas Productos y Categorias

ALTER TABLE Productos
ADD CONSTRAINT Fk_Productos_Categorias
FOREIGN KEY (CategoriaID) REFERENCES Categorias (CategoriaID);

--Generar relacion entre las tablas Empoleados y Sucursales

ALTER TABLE Empleados
ADD CONSTRAINT Fk_Empleados_Sucursales
FOREIGN KEY (SucursalID) REFERENCES Sucursales (SucursalID);

--Generar relacion entre la tabla Ordenes y las tablas Clientes, Empleados, Sucursales, Mensajeros, TiposPago, OrigenesOrden

ALTER TABLE Ordenes
ADD CONSTRAINT Fk_Ordenes_Clientes
FOREIGN KEY (ClienteID) REFERENCES Clientes (ClienteID);

ALTER TABLE Ordenes
ADD CONSTRAINT Fk_Ordenes_Empleados
FOREIGN KEY (EmpleadoID) REFERENCES Empleados (EmpleadoID);

ALTER TABLE Ordenes
ADD CONSTRAINT Fk_Ordenes_Sucursales
FOREIGN KEY (SucursalID) REFERENCES Sucursales (SucursalID);

ALTER TABLE Ordenes
ADD CONSTRAINT Fk_Ordenes_Mensajeros
FOREIGN KEY (MensajeroID) REFERENCES Mensajeros (MensajeroID);

ALTER TABLE Ordenes
ADD CONSTRAINT Fk_Ordenes_TiposPago
FOREIGN KEY (TipoPagoID) REFERENCES TiposPago (TipoPagoID);

ALTER TABLE Ordenes
ADD CONSTRAINT Fk_Ordenes_Origenes
FOREIGN KEY (OrigenID) REFERENCES OrigenesOrden (OrigenID);

--Generar la conexion con la tabla DetalleOrdenes

ALTER TABLE DetalleOrdenes
ADD CONSTRAINT Fk_Detalle_Ordenes
FOREIGN KEY (OrdenID) REFERENCES Ordenes (OrdenID);

ALTER TABLE DetalleOrdenes
ADD CONSTRAINT Fk_Detalle_Productos
FOREIGN KEY (ProductoID) REFERENCES Productos (ProductoID);