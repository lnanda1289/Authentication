USE [DBAuthentication]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [dbo].[Permissions] DROP CONSTRAINT [FK_Permissions_Roles]
GO
ALTER TABLE [dbo].[Permissions] DROP CONSTRAINT [FK_Permissions_Operations]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14/02/2021 02:35:42 p.m. ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 14/02/2021 02:35:42 p.m. ******/
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 14/02/2021 02:35:42 p.m. ******/
DROP TABLE [dbo].[Permissions]
GO
/****** Object:  Table [dbo].[Operations]    Script Date: 14/02/2021 02:35:42 p.m. ******/
DROP TABLE [dbo].[Operations]
GO
USE [master]
GO
/****** Object:  Database [DBAuthentication]    Script Date: 14/02/2021 02:35:42 p.m. ******/
DROP DATABASE [DBAuthentication]
GO
/****** Object:  Database [DBAuthentication]    Script Date: 14/02/2021 02:35:42 p.m. ******/
CREATE DATABASE [DBAuthentication]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBAuthentication', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DBAuthentication.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBAuthentication_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DBAuthentication_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBAuthentication] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBAuthentication].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBAuthentication] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBAuthentication] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBAuthentication] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBAuthentication] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBAuthentication] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBAuthentication] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBAuthentication] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DBAuthentication] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBAuthentication] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBAuthentication] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBAuthentication] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBAuthentication] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBAuthentication] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBAuthentication] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBAuthentication] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBAuthentication] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBAuthentication] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBAuthentication] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBAuthentication] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBAuthentication] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBAuthentication] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBAuthentication] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBAuthentication] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBAuthentication] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBAuthentication] SET  MULTI_USER 
GO
ALTER DATABASE [DBAuthentication] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBAuthentication] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBAuthentication] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBAuthentication] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DBAuthentication]
GO
/****** Object:  Table [dbo].[Operations]    Script Date: 14/02/2021 02:35:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Operations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 14/02/2021 02:35:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRol] [int] NULL,
	[IdOperation] [int] NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 14/02/2021 02:35:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 14/02/2021 02:35:42 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[CompletNames] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [numeric](18, 0) NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Age] [int] NULL,
	[IdRol] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Operations] ON 

INSERT [dbo].[Operations] ([Id], [Name]) VALUES (1, N'Ver')
INSERT [dbo].[Operations] ([Id], [Name]) VALUES (2, N'Listar')
INSERT [dbo].[Operations] ([Id], [Name]) VALUES (3, N'Filtrar')
INSERT [dbo].[Operations] ([Id], [Name]) VALUES (4, N'Editar')
INSERT [dbo].[Operations] ([Id], [Name]) VALUES (5, N'Crear')
INSERT [dbo].[Operations] ([Id], [Name]) VALUES (6, N'Eliminar')
SET IDENTITY_INSERT [dbo].[Operations] OFF
SET IDENTITY_INSERT [dbo].[Permissions] ON 

INSERT [dbo].[Permissions] ([Id], [IdRol], [IdOperation]) VALUES (1, 1, 1)
INSERT [dbo].[Permissions] ([Id], [IdRol], [IdOperation]) VALUES (2, 2, 1)
INSERT [dbo].[Permissions] ([Id], [IdRol], [IdOperation]) VALUES (3, 2, 2)
INSERT [dbo].[Permissions] ([Id], [IdRol], [IdOperation]) VALUES (4, 2, 3)
INSERT [dbo].[Permissions] ([Id], [IdRol], [IdOperation]) VALUES (5, 3, 1)
INSERT [dbo].[Permissions] ([Id], [IdRol], [IdOperation]) VALUES (6, 3, 2)
INSERT [dbo].[Permissions] ([Id], [IdRol], [IdOperation]) VALUES (7, 3, 3)
INSERT [dbo].[Permissions] ([Id], [IdRol], [IdOperation]) VALUES (8, 3, 4)
INSERT [dbo].[Permissions] ([Id], [IdRol], [IdOperation]) VALUES (9, 4, 1)
INSERT [dbo].[Permissions] ([Id], [IdRol], [IdOperation]) VALUES (10, 4, 2)
INSERT [dbo].[Permissions] ([Id], [IdRol], [IdOperation]) VALUES (11, 4, 3)
INSERT [dbo].[Permissions] ([Id], [IdRol], [IdOperation]) VALUES (12, 4, 4)
INSERT [dbo].[Permissions] ([Id], [IdRol], [IdOperation]) VALUES (13, 4, 5)
INSERT [dbo].[Permissions] ([Id], [IdRol], [IdOperation]) VALUES (14, 4, 6)
SET IDENTITY_INSERT [dbo].[Permissions] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Visitante')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Asistente')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'Editor')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (4, N'Administrador')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [User], [Password], [CompletNames], [Address], [Phone], [Email], [Age], [IdRol]) VALUES (1, N'admon', N'123', N'Juan Perez Rodriguez', N'Calle Falsa 123', CAST(123456789 AS Numeric(18, 0)), N'admin@gmail.com', 27, 4)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Operations] FOREIGN KEY([IdOperation])
REFERENCES [dbo].[Operations] ([Id])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Operations]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Roles] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_Roles]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [DBAuthentication] SET  READ_WRITE 
GO
