USE [master]
GO
/****** Object:  Database [Taller]    Script Date: 03/04/2024 16:47:11 ******/
CREATE DATABASE [Taller]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Taller', FILENAME = N'C:\Users\pinij\Taller.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Taller_log', FILENAME = N'C:\Users\pinij\Taller_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Taller] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Taller].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Taller] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Taller] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Taller] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Taller] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Taller] SET ARITHABORT OFF 
GO
ALTER DATABASE [Taller] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Taller] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Taller] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Taller] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Taller] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Taller] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Taller] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Taller] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Taller] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Taller] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Taller] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Taller] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Taller] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Taller] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Taller] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Taller] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Taller] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Taller] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Taller] SET  MULTI_USER 
GO
ALTER DATABASE [Taller] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Taller] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Taller] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Taller] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Taller] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Taller] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Taller] SET QUERY_STORE = OFF
GO
USE [Taller]
GO
/****** Object:  Table [dbo].[Automovil]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Automovil](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdVehiculo] [bigint] NOT NULL,
	[Tipo] [smallint] NULL,
	[CantidadPuertas] [smallint] NULL,
 CONSTRAINT [PK_Automovil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Desperfecto]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Desperfecto](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdVehiculo] [bigint] NULL,
	[Descripcion] [nvarchar](max) NULL,
	[ManoDeObra] [decimal](18, 0) NULL,
	[Tiempo] [int] NULL,
 CONSTRAINT [PK_Desperfecto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesperfectoRepuesto]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesperfectoRepuesto](
	[IdDesperfecto] [bigint] NOT NULL,
	[IdRepuesto] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moto]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moto](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdVehiculo] [bigint] NOT NULL,
	[Cilindrada] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presupuesto]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presupuesto](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[Apellido] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Total] [decimal](18, 0) NULL,
	[IdVehiculo] [bigint] NOT NULL,
 CONSTRAINT [PK_Presupuestoo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Repuesto]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repuesto](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[Precio] [decimal](18, 0) NULL,
	[Descripcion] [nvarchar](max) NULL,
 CONSTRAINT [PK_Repuesto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Marca] [nvarchar](max) NULL,
	[Modelo] [nvarchar](max) NULL,
	[Patente] [nvarchar](max) NULL,
	[Tipo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Vehiculo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AutomovilAlta]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AutomovilAlta]
    @IdVehiculo BIGINT,
    @Tipo SMALLINT,
    @CantidadPuertas SMALLINT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar el nuevo automóvil en la tabla Automovil
    INSERT INTO Automovil (IdVehiculo, Tipo, CantidadPuertas)
    VALUES (@IdVehiculo, @Tipo, @CantidadPuertas);
END
GO
/****** Object:  StoredProcedure [dbo].[DesperfectoAlta]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DesperfectoAlta]
    @IdVehiculo BIGINT,
    @Descripcion VARCHAR(100),
    @ManoDeObra DECIMAL(10, 2),
    @Tiempo INT,
    @DesperfectoId BIGINT OUTPUT -- Parámetro de salida para el ID del desperfecto
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar el nuevo desperfecto en la tabla Desperfecto
    INSERT INTO Desperfecto (IdVehiculo, Descripcion, ManoDeObra, Tiempo)
    VALUES (@IdVehiculo, @Descripcion, @ManoDeObra, @Tiempo);

    -- Obtener el ID del desperfecto recién insertado
    SELECT @DesperfectoId = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[DesperfectoRepuestoAlta]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DesperfectoRepuestoAlta]
    @IdDesperfecto BIGINT,
    @IdRepuesto BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar el nuevo registro en la tabla DesperfectoRepuesto
    INSERT INTO DesperfectoRepuesto (IdDesperfecto, IdRepuesto)
    VALUES (@IdDesperfecto, @IdRepuesto);
END
GO
/****** Object:  StoredProcedure [dbo].[GuardarPresupuesto]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GuardarPresupuesto]
    @Nombre VARCHAR(100),
    @Apellido VARCHAR(100),
    @Email VARCHAR(100),
    @Total DECIMAL(10, 2),
    @IdVehiculo BIGINT,
    @Id BIGINT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Presupuesto (Nombre, Apellido, Email, Total, IdVehiculo)
    VALUES (@Nombre, @Apellido, @Email, @Total, @IdVehiculo);

    SET @Id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[MassiveCharge]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MassiveCharge] AS
BEGIN
    -- Creación de la tabla Temporal que contendrá los Repuestos con sus precios
    CREATE TABLE #TMP_RESPUESTO (
        Nombre VARCHAR(100),
        Precio DECIMAL(18,6)
    )

    -- Se generan los registros en la tabla temporal
    INSERT INTO #TMP_RESPUESTO VALUES 
    ('B356963821', 17.61), ('B881468337', 40.88), ('B867719836', 87.76), ('B397571688', 13.97),
    ('B852883143', 47.97), ('B461882670', 22.68), ('B333520964', 82.28), ('B388445039', 50.71),
    ('B648201513', 21.83), ('B436759416', 35.39), ('B317533243', 22.84), ('B666592414', 58.67),
    ('B443568817', 53.83), ('B316416378', 17.74), ('B252543362', 16.98), ('B453148609', 14.23),
    ('B254958806', 41.19), ('B356963821', 62.58), ('B846487171', 92.91), ('B397571688', 1.04),
    ('B535169105', 90.14), ('B628263302', 78.64), ('B608816685', 93.73), ('B660755442', 43.62),
    ('B659053715', 90.59), ('B556344166', 71.62), ('B216140665', 93.15), ('B843858581', 66.52),
    ('B790077756', 8.91), ('B916071768', 85.46), ('B317533243', 7.97), ('B343454513', 22.91),
    ('B986574036', 65.10), ('B662139869', 3.50), ('B618792223', 6.87), ('B578485476', 49.70),
    ('B132813434', 32.58), ('B776163235', 73.64), ('B215908676', 92.83), ('B871139440', 31.83),
    ('B564893705', 18.91), ('B634131771', 70.35), ('B321187273', 91.96), ('B444737823', 78.73),
    ('B413525993', 9.93), ('B229547877', 97.08), ('B545788950', 11.84), ('B658514562', 8.84),
    ('B736313138', 78.47), ('B840888802', 93.85), ('B883572821', 21.57), ('B493478663', 76.98),
    ('B718838840', 7.41), ('B183671709', 45.53), ('B908384721', 14.73), ('B566417680', 44.04),
    ('B633833113', 33.28), ('B829258206', 41.74), ('B350041352', 85.13), ('B548168477', 7.44),
    ('B765657146', 89.79), ('B830231322', 81.42), ('B816385774', 9.30), ('B857448796', 77.36),
    ('B302875266', 54.89), ('B790507487', 50.41), ('B723629401', 65.36), ('B595728629', 19.94),
    ('B472436824', 65.69), ('B235859870', 66.44), ('B874178252', 42.38), ('B777713850', 40.26),
    ('B550221285', 8.72), ('B816043247', 73.97), ('B607313788', 15.95), ('B396482694', 45.17),
    ('B504021331', 24.52), ('B651475349', 86.77), ('B470409863', 11.81), ('B264135435', 62.58),
    ('B755636151', 33.88), ('B382183955', 0.92), ('B667316286', 0.29), ('B783117048', 41.57),
    ('B812952354', 86.25), ('B621838237', 80.54), ('B665465223', 53.69), ('B881682635', 64.78),
    ('B646289861', 72.01), ('B852115667', 48.73), ('B144635415', 34.23), ('B874863828', 24.70),
    ('B333841476', 41.57), ('B587386017', 45.27), ('B874270576', 42.38), ('B300733136', 25.55),
    ('B611446656', 60.12), ('B801300387', 61.04), ('B845153562', 60.09), ('B943846621', 37.05)

    -- Insertar registros en la tabla definitiva de Repuestos
    INSERT INTO Repuesto (Nombre, Precio)
    SELECT Nombre, Precio
    FROM #TMP_RESPUESTO
    WHERE Precio < 20.0

    -- Reportar los repuestos que no se insertaron
    SELECT Nombre, Precio
    FROM #TMP_RESPUESTO
    WHERE Precio >= 20.0

    -- Limpiar la tabla temporal
    DROP TABLE #TMP_RESPUESTO
END
GO
/****** Object:  StoredProcedure [dbo].[MassiveCharge2]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MassiveCharge2] AS
BEGIN
    -- Creación de la tabla Temporal que contendrá los Repuestos con sus precios
    CREATE TABLE #TMP_RESPUESTO (
        Nombre VARCHAR(100),
        Precio DECIMAL(18,6)
    )

    -- Se generan los registros en la tabla temporal
    INSERT INTO #TMP_RESPUESTO VALUES 
    ('B356963821', 17.61), ('B881468337', 40.88), ('B867719836', 87.76), ('B397571688', 13.97),
    ('B852883143', 47.97), ('B461882670', 22.68), ('B333520964', 82.28), ('B388445039', 50.71),
    ('B648201513', 21.83), ('B436759416', 35.39), ('B317533243', 22.84), ('B666592414', 58.67),
    ('B443568817', 53.83), ('B316416378', 17.74), ('B252543362', 16.98), ('B453148609', 14.23),
    ('B254958806', 41.19), ('B356963821', 62.58), ('B846487171', 92.91), ('B397571688', 1.04),
    ('B535169105', 90.14), ('B628263302', 78.64), ('B608816685', 93.73), ('B660755442', 43.62),
    ('B659053715', 90.59), ('B556344166', 71.62), ('B216140665', 93.15), ('B843858581', 66.52),
    ('B790077756', 8.91), ('B916071768', 85.46), ('B317533243', 7.97), ('B343454513', 22.91),
    ('B986574036', 65.10), ('B662139869', 3.50), ('B618792223', 6.87), ('B578485476', 49.70),
    ('B132813434', 32.58), ('B776163235', 73.64), ('B215908676', 92.83), ('B871139440', 31.83),
    ('B564893705', 18.91), ('B634131771', 70.35), ('B321187273', 91.96), ('B444737823', 78.73),
    ('B413525993', 9.93), ('B229547877', 97.08), ('B545788950', 11.84), ('B658514562', 8.84),
    ('B736313138', 78.47), ('B840888802', 93.85), ('B883572821', 21.57), ('B493478663', 76.98),
    ('B718838840', 7.41), ('B183671709', 45.53), ('B908384721', 14.73), ('B566417680', 44.04),
    ('B633833113', 33.28), ('B829258206', 41.74), ('B350041352', 85.13), ('B548168477', 7.44),
    ('B765657146', 89.79), ('B830231322', 81.42), ('B816385774', 9.30), ('B857448796', 77.36),
    ('B302875266', 54.89), ('B790507487', 50.41), ('B723629401', 65.36), ('B595728629', 19.94),
    ('B472436824', 65.69), ('B235859870', 66.44), ('B874178252', 42.38), ('B777713850', 40.26),
    ('B550221285', 8.72), ('B816043247', 73.97), ('B607313788', 15.95), ('B396482694', 45.17),
    ('B504021331', 24.52), ('B651475349', 86.77), ('B470409863', 11.81), ('B264135435', 62.58),
    ('B755636151', 33.88), ('B382183955', 0.92), ('B667316286', 0.29), ('B783117048', 41.57),
    ('B812952354', 86.25), ('B621838237', 80.54), ('B665465223', 53.69), ('B881682635', 64.78),
    ('B646289861', 72.01), ('B852115667', 48.73), ('B144635415', 34.23), ('B874863828', 24.70),
    ('B333841476', 41.57), ('B587386017', 45.27), ('B874270576', 42.38), ('B300733136', 25.55),
    ('B611446656', 60.12), ('B801300387', 61.04), ('B845153562', 60.09), ('B943846621', 37.05)

    -- Insertar registros en la tabla definitiva de Repuestos
    DECLARE @Nombre VARCHAR(100)
    DECLARE @Precio DECIMAL(18,6)
    DECLARE @PrecioAcumulado DECIMAL(18,6)
    DECLARE cur CURSOR FOR
        SELECT Nombre, Precio
        FROM #TMP_RESPUESTO
        WHERE Precio < 20.0
    OPEN cur
    FETCH NEXT FROM cur INTO @Nombre, @Precio
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Verificar si el repuesto ya existe en la tabla definitiva
        IF EXISTS (SELECT 1 FROM Repuesto WHERE Nombre = @Nombre)
        BEGIN
            -- Obtener el precio acumulado del repuesto
            SELECT @PrecioAcumulado = Precio
            FROM Repuesto
            WHERE Nombre = @Nombre

            -- Actualizar el precio acumulado del repuesto
            UPDATE Repuesto
            SET Precio = @PrecioAcumulado + @Precio
            WHERE Nombre = @Nombre
        END
        ELSE
        BEGIN
            -- Insertar el nuevo repuesto en la tabla definitiva
            INSERT INTO Repuesto (Nombre, Precio)
            VALUES (@Nombre, @Precio)
        END
        FETCH NEXT FROM cur INTO @Nombre, @Precio
    END
    CLOSE cur
    DEALLOCATE cur

    -- Reportar los repuestos que no se insertaron
    SELECT Nombre, Precio
    FROM #TMP_RESPUESTO
    WHERE Precio >= 20.0

    -- Limpiar la tabla temporal
    DROP TABLE #TMP_RESPUESTO
END
GO
/****** Object:  StoredProcedure [dbo].[MotoAlta]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MotoAlta]
	@IdVehiculo bigint,
	@Cilindrada nvarchar(max)

AS
BEGIN


INSERT INTO dbo.Moto(IdVehiculo,Cilindrada)
VALUES(@IdVehiculo,@Cilindrada)

		   
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDesperfectosPorVehiculo]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerDesperfectosPorVehiculo]
    @VehiculoId BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT d.*, r.*
    FROM Desperfecto d
    LEFT JOIN DesperfectoRepuesto dr ON d.Id = dr.IdDesperfecto
    LEFT JOIN Repuesto r ON dr.IdRepuesto = r.Id
    WHERE d.IdVehiculo = @VehiculoId;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPromedioPresupuestosPorMarcaModelo]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerPromedioPresupuestosPorMarcaModelo]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        V.Marca,
        V.Modelo,
        AVG(P.Total) AS PromedioPresupuesto
    FROM 
        Presupuesto P
    INNER JOIN 
        Vehiculo V ON P.IdVehiculo = V.Id
    GROUP BY 
        V.Marca, V.Modelo;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerRepuestoMasUtilizado]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerRepuestoMasUtilizado]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT R.Descripcion AS DescripcionRepuesto,
           V.Marca,
           V.Modelo,
           COUNT(*) AS CantidadUtilizado
    FROM Desperfecto D
    INNER JOIN DesperfectoRepuesto DR ON D.Id = DR.IdDesperfecto
    INNER JOIN Repuesto R ON DR.IdRepuesto = R.Id
    INNER JOIN Vehiculo V ON D.IdVehiculo = V.Id
    GROUP BY R.Descripcion, V.Marca, V.Modelo
    ORDER BY CantidadUtilizado DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerSumatoriaPresupuestosPorTipoVehiculo]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerSumatoriaPresupuestosPorTipoVehiculo]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        CASE
            WHEN V.Tipo = 'Automovil' THEN 'Automovil'
            WHEN V.Tipo = 'Moto' THEN 'Moto'
            ELSE 'Otro'
        END AS TipoVehiculo,
        SUM(P.Total) AS SumatoriaPresupuesto
    FROM
        Presupuesto P
    INNER JOIN
        Vehiculo V ON P.IdVehiculo = V.Id
    GROUP BY
        CASE
            WHEN V.Tipo = 'Automovil' THEN 'Automovil'
            WHEN V.Tipo = 'Moto' THEN 'Moto'
            ELSE 'Otro'
        END;
END
GO
/****** Object:  StoredProcedure [dbo].[RepuestoAlta]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RepuestoAlta]
    @Nombre NVARCHAR(100),
    @Precio DECIMAL(10, 2),
    @Descripcion NVARCHAR(100),
	@RepuestoId BIGINT OUTPUT 

AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Repuesto (Nombre, Precio, Descripcion )
    VALUES (@Nombre, @Precio, @Descripcion);

	SELECT @RepuestoId = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[VehiculoAlta]    Script Date: 03/04/2024 16:47:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VehiculoAlta]
    @Marca VARCHAR(50),
    @Modelo VARCHAR(50),
    @Patente VARCHAR(20),
	@Tipo VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @VehiculoId BIGINT;

    -- Insertar el nuevo vehículo en la tabla Vehiculo
    INSERT INTO Vehiculo (Marca, Modelo, Patente,Tipo)
    VALUES (@Marca, @Modelo, @Patente,@Tipo);

    -- Obtener el ID del vehículo insertado
    SELECT @VehiculoId = SCOPE_IDENTITY();

    -- Devolver el ID del vehículo insertado
    SELECT @VehiculoId AS VehiculoId;
END
GO
USE [master]
GO
ALTER DATABASE [Taller] SET  READ_WRITE 
GO
