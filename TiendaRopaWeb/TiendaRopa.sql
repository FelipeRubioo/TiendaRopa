USE [master]
GO
/****** Object:  Database [TiendaRopa]    Script Date: 22/05/2023 12:12:02 p. m. ******/
CREATE DATABASE [TiendaRopa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TiendaRopa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TiendaRopa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TiendaRopa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TiendaRopa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TiendaRopa] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TiendaRopa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TiendaRopa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TiendaRopa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TiendaRopa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TiendaRopa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TiendaRopa] SET ARITHABORT OFF 
GO
ALTER DATABASE [TiendaRopa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TiendaRopa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TiendaRopa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TiendaRopa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TiendaRopa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TiendaRopa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TiendaRopa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TiendaRopa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TiendaRopa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TiendaRopa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TiendaRopa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TiendaRopa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TiendaRopa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TiendaRopa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TiendaRopa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TiendaRopa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TiendaRopa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TiendaRopa] SET RECOVERY FULL 
GO
ALTER DATABASE [TiendaRopa] SET  MULTI_USER 
GO
ALTER DATABASE [TiendaRopa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TiendaRopa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TiendaRopa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TiendaRopa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TiendaRopa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TiendaRopa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TiendaRopa', N'ON'
GO
ALTER DATABASE [TiendaRopa] SET QUERY_STORE = OFF
GO
USE [TiendaRopa]
GO
/****** Object:  User [Felipe]    Script Date: 22/05/2023 12:12:02 p. m. ******/
CREATE USER [Felipe] FOR LOGIN [Felipe] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Carrito]    Script Date: 22/05/2023 12:12:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrito](
	[idCliente] [int] NOT NULL,
	[idPrenda] [int] NOT NULL,
	[cantidad] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 22/05/2023 12:12:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[sexo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 22/05/2023 12:12:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[correo] [nvarchar](50) NOT NULL,
	[contraseña] [nvarchar](50) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prenda]    Script Date: 22/05/2023 12:12:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prenda](
	[idPrenda] [int] IDENTITY(1,1) NOT NULL,
	[idCategoria] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[precio] [int] NOT NULL,
	[talla] [nvarchar](5) NOT NULL,
	[imagen] [nvarchar](50) NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[idPrenda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Carrito] ([idCliente], [idPrenda], [cantidad]) VALUES (1, 2, 4)
INSERT [dbo].[Carrito] ([idCliente], [idPrenda], [cantidad]) VALUES (1, 20, 1)
INSERT [dbo].[Carrito] ([idCliente], [idPrenda], [cantidad]) VALUES (1, 14, 2)
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([idCategoria], [nombre], [sexo]) VALUES (1, N'camisas', N'hombre')
INSERT [dbo].[Categoria] ([idCategoria], [nombre], [sexo]) VALUES (2, N'camisetas', N'hombre')
INSERT [dbo].[Categoria] ([idCategoria], [nombre], [sexo]) VALUES (3, N'shorts', N'hombre')
INSERT [dbo].[Categoria] ([idCategoria], [nombre], [sexo]) VALUES (4, N'pantalones', N'hombre')
INSERT [dbo].[Categoria] ([idCategoria], [nombre], [sexo]) VALUES (5, N'blusas', N'mujer')
INSERT [dbo].[Categoria] ([idCategoria], [nombre], [sexo]) VALUES (6, N'camisetas', N'mujer')
INSERT [dbo].[Categoria] ([idCategoria], [nombre], [sexo]) VALUES (7, N'pantalones', N'mujer')
INSERT [dbo].[Categoria] ([idCategoria], [nombre], [sexo]) VALUES (8, N'faldas', N'mujer')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([idCliente], [correo], [contraseña], [nombre]) VALUES (1, N'felipe@gmail.com', N'rubio', N'felipe')
INSERT [dbo].[Clientes] ([idCliente], [correo], [contraseña], [nombre]) VALUES (2, N'juan@hotmail.com', N'cocoloco', N'juan')
INSERT [dbo].[Clientes] ([idCliente], [correo], [contraseña], [nombre]) VALUES (3, N'cruz@gmail.com', N'fasdf234', N'lopez')
INSERT [dbo].[Clientes] ([idCliente], [correo], [contraseña], [nombre]) VALUES (4, N'sushi@gmail.com', N'loco3421', N'rodrigo')
INSERT [dbo].[Clientes] ([idCliente], [correo], [contraseña], [nombre]) VALUES (5, N'flor34@gmail.com', N'asdf63245', N'flor')
INSERT [dbo].[Clientes] ([idCliente], [correo], [contraseña], [nombre]) VALUES (6, N'josecito@hotmail.com', N'jose123fk', N'jose')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Prenda] ON 

INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (1, 1, N'camisa rosa', 60, N'L', N'camisaHombre2')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (2, 1, N'camisa floreada', 50, N'L', N'camisaHombre3')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (3, 1, N'camisa de cuadros negra', 40, N'M', N'camisaHombre4')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (4, 2, N'camiseta cerveza', 40, N'L', N'camisetaHombre2')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (5, 2, N'camiseta dinosaurio', 30, N'S', N'camisetaHombre3')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (6, 2, N'camiseta cartas', 50, N'S', N'camisetaHombre4')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (7, 3, N'shorts negro', 35, N'XL', N'shortHombre2')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (8, 3, N'shorts verde', 30, N'L', N'shortHombre3')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (9, 3, N'shorts azul', 25, N'M', N'shortHombre4')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (10, 7, N'pantalon beige', 34, N'M', N'pantalonMujer1')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (11, 7, N'pantalon verde', 40, N'S', N'pantalonMujer2')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (12, 7, N'pantalon de cuadros', 35, N'L', N'pantalonMujer4')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (13, 4, N'pantalon camuflage', 42, N'L', N'pantalonHombre4')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (14, 4, N'pantalon aura colorida', 24, N'M', N'pantalonHombre3')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (15, 4, N'pantalon rosa', 36, N'XL', N'pantalonHombre2')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (16, 8, N'falda de cuadros', 28, N'S', N'faldaMujer4')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (17, 8, N'falda floral', 30, N'M', N'faldaMujer2')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (18, 8, N'falda anaranjada', 31, N'M', N'faldaMujer3')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (19, 6, N'camiseta vaquera', 18, N'M', N'camisetaMujer4')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (20, 6, N'camiseta morada', 25, N'S', N'camisetaMujer2')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (21, 6, N'camiseta moño', 14, N'S', N'camisetaMujer3')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (22, 5, N'blusa florada con negro', 25, N'M', N'blusaMujer4')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (23, 5, N'blusa negra con flores', 30, N'L', N'blusaMujer2')
INSERT [dbo].[Prenda] ([idPrenda], [idCategoria], [nombre], [precio], [talla], [imagen]) VALUES (24, 5, N'blusa con franjas', 26, N'L', N'blusaMujer3')
SET IDENTITY_INSERT [dbo].[Prenda] OFF
GO
USE [master]
GO
ALTER DATABASE [TiendaRopa] SET  READ_WRITE 
GO
