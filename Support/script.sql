USE [master]
GO
/****** Object:  Database [VentesImmobilieres]    Script Date: 16/04/2020 14:19:23 ******/
CREATE DATABASE [VentesImmobilieres]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VenteImmobilier', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\VenteImmobilier.mdf' , SIZE = 6627328KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VenteImmobilier_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\VenteImmobilier_log.ldf' , SIZE = 2826240KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VentesImmobilieres] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VentesImmobilieres].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VentesImmobilieres] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET ARITHABORT OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VentesImmobilieres] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VentesImmobilieres] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VentesImmobilieres] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VentesImmobilieres] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET RECOVERY FULL 
GO
ALTER DATABASE [VentesImmobilieres] SET  MULTI_USER 
GO
ALTER DATABASE [VentesImmobilieres] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VentesImmobilieres] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VentesImmobilieres] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VentesImmobilieres] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VentesImmobilieres] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VentesImmobilieres', N'ON'
GO
ALTER DATABASE [VentesImmobilieres] SET QUERY_STORE = OFF
GO
USE [VentesImmobilieres]
GO
/****** Object:  Table [dbo].[dvfBien]    Script Date: 16/04/2020 14:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dvfBien](
	[code_type_local] [nvarchar](50) NULL,
	[type_local] [nvarchar](50) NULL,
	[surface_reelle_bati] [nvarchar](50) NULL,
	[nombre_pieces_principales] [nvarchar](50) NULL,
	[surface_terrain] [nvarchar](50) NULL,
	[id_bien] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dvfBien] PRIMARY KEY CLUSTERED 
(
	[id_bien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dvfCadastre]    Script Date: 16/04/2020 14:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dvfCadastre](
	[adresse_nom_voie] [nvarchar](50) NULL,
	[nom_commune] [nvarchar](50) NULL,
	[code_departement] [nvarchar](50) NULL,
	[id_parcelle] [nvarchar](50) NOT NULL,
	[nombre_lots] [nvarchar](50) NULL,
	[longitude] [nvarchar](50) NULL,
	[latitude] [nvarchar](50) NULL,
 CONSTRAINT [PK_dvfCadastre] PRIMARY KEY CLUSTERED 
(
	[id_parcelle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dvfMutation]    Script Date: 16/04/2020 14:19:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dvfMutation](
	[id_mutation] [nvarchar](50) NOT NULL,
	[date_mutation] [datetime2](7) NOT NULL,
	[nature_mutation] [nvarchar](50) NOT NULL,
	[valeur_fonciere] [nvarchar](50) NOT NULL,
	[id_parcelle] [nvarchar](50) NOT NULL,
	[id_bien] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dvfMutation] PRIMARY KEY CLUSTERED 
(
	[id_mutation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dvfMutation]  WITH CHECK ADD  CONSTRAINT [FK_dvfMutation_dvfBien] FOREIGN KEY([id_bien])
REFERENCES [dbo].[dvfBien] ([id_bien])
GO
ALTER TABLE [dbo].[dvfMutation] CHECK CONSTRAINT [FK_dvfMutation_dvfBien]
GO
ALTER TABLE [dbo].[dvfMutation]  WITH CHECK ADD  CONSTRAINT [FK_dvfMutation_dvfCadastre] FOREIGN KEY([id_parcelle])
REFERENCES [dbo].[dvfCadastre] ([id_parcelle])
GO
ALTER TABLE [dbo].[dvfMutation] CHECK CONSTRAINT [FK_dvfMutation_dvfCadastre]
GO
USE [master]
GO
ALTER DATABASE [VentesImmobilieres] SET  READ_WRITE 
GO
