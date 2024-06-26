USE [master]
GO
/****** Object:  Database [Zoo]    Script Date: 15.04.2024 10:34:11 ******/
CREATE DATABASE [Zoo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Zoo', FILENAME = N'C:\Users\i21nguyenki\Zoo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Zoo_log', FILENAME = N'C:\Users\i21nguyenki\Zoo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Zoo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Zoo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Zoo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Zoo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Zoo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Zoo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Zoo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Zoo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Zoo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Zoo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Zoo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Zoo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Zoo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Zoo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Zoo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Zoo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Zoo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Zoo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Zoo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Zoo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Zoo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Zoo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Zoo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Zoo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Zoo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Zoo] SET  MULTI_USER 
GO
ALTER DATABASE [Zoo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Zoo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Zoo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Zoo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Zoo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Zoo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Zoo] SET QUERY_STORE = OFF
GO
USE [Zoo]
GO
/****** Object:  User [verwaltungUser]    Script Date: 15.04.2024 10:34:11 ******/
CREATE USER [verwaltungUser] FOR LOGIN [verwaltung] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [tierarztUser]    Script Date: 15.04.2024 10:34:11 ******/
CREATE USER [tierarztUser] FOR LOGIN [tierarzt] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [pflegerUser]    Script Date: 15.04.2024 10:34:11 ******/
CREATE USER [pflegerUser] FOR LOGIN [pfleger] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [personalabteilungUser]    Script Date: 15.04.2024 10:34:11 ******/
CREATE USER [personalabteilungUser] FOR LOGIN [personalabteilung] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [handwerkerUser]    Script Date: 15.04.2024 10:34:11 ******/
CREATE USER [handwerkerUser] FOR LOGIN [handwerker] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [verwalterRole]    Script Date: 15.04.2024 10:34:11 ******/
CREATE ROLE [verwalterRole]
GO
/****** Object:  DatabaseRole [pflegerRole]    Script Date: 15.04.2024 10:34:11 ******/
CREATE ROLE [pflegerRole]
GO
/****** Object:  DatabaseRole [personalerRole]    Script Date: 15.04.2024 10:34:11 ******/
CREATE ROLE [personalerRole]
GO
/****** Object:  DatabaseRole [personaler]    Script Date: 15.04.2024 10:34:11 ******/
CREATE ROLE [personaler]
GO
/****** Object:  DatabaseRole [handwerkerRole]    Script Date: 15.04.2024 10:34:11 ******/
CREATE ROLE [handwerkerRole]
GO
/****** Object:  DatabaseRole [arztRole]    Script Date: 15.04.2024 10:34:11 ******/
CREATE ROLE [arztRole]
GO
ALTER ROLE [arztRole] ADD MEMBER [tierarztUser]
GO
ALTER ROLE [pflegerRole] ADD MEMBER [pflegerUser]
GO
ALTER ROLE [personalerRole] ADD MEMBER [personalabteilungUser]
GO
ALTER ROLE [handwerkerRole] ADD MEMBER [handwerkerUser]
GO
/****** Object:  Schema [handwerk]    Script Date: 15.04.2024 10:34:12 ******/
CREATE SCHEMA [handwerk]
GO
/****** Object:  Schema [hr]    Script Date: 15.04.2024 10:34:12 ******/
CREATE SCHEMA [hr]
GO
/****** Object:  Schema [tierpflege]    Script Date: 15.04.2024 10:34:12 ******/
CREATE SCHEMA [tierpflege]
GO
/****** Object:  Schema [verwaltung]    Script Date: 15.04.2024 10:34:12 ******/
CREATE SCHEMA [verwaltung]
GO
/****** Object:  Table [dbo].[Gehege]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gehege](
	[Gehege_ID] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NULL,
	[Objekt_Nr] [smallint] NULL,
	[letzte_Reinigung] [datetime2](0) NULL,
 CONSTRAINT [PK_Gehege] PRIMARY KEY CLUSTERED 
(
	[Gehege_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tiere]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiere](
	[Tier_ID] [smallint] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Tierart_Nr] [smallint] NULL,
	[Anzahl] [smallint] NULL,
	[Gehege_Nr] [smallint] NULL,
 CONSTRAINT [PK_Tiere] PRIMARY KEY CLUSTERED 
(
	[Tier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [tierpflege].[Gehege_Tieranzahl]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [tierpflege].[Gehege_Tieranzahl] AS
SELECT g.Bezeichnung, COUNT(t.Tier_ID) AS Anzahl
FROM Gehege g, Tiere t
WHERE g.Gehege_ID=t.Gehege_Nr
GROUP BY g.Bezeichnung;

--CREATE VIEW Tierart_Tieranzahl AS
--SELECT ta.Bezeichnung, COUNT(t.Tier_ID) AS Anzahl_Tiere
--FROM Tiere t, Tierarten ta
--WHERE ta.Bezeichnung=t.Bezeichnung
--GROUP BY ta.Bezeichnung;

--CREATE VIEW Tierklasse_Tieranzahl AS
--SELECT tk.Bezeichnung, COUNT(t.Tier_ID) as Anzahl
--FROM Tiere t, Tierart ta, Tiergattung tg, Tierklasse tk
--WHERE tg.Tierklasse_Nr=tk.Tierklasse_ID
--AND ta.Tiergattung_Nr=tg.Tiergattung_ID
--AND t.Tierart_Nr=ta.Tierart_ID
--GROUP BY tk.Bezeichnung;

--CREATE VIEW Abteilung_Mitarbeiteranzahl AS
--SELECT a.Bezeichnung, COUNT(MitArb_ID) AS Anzahl
--FROM Mitarbeiter m, Abteilung a
--WHERE m.Abt_NR = a.Abt_ID
--GROUP BY a.Bezeichnung;

--CREATE VIEW Tätigkeit_Mitarbeiteranzahl AS
--SELECT t.Bezeichnung, COUNT(m.MitArb_ID) AS Anzahl
--FROM Mitarbeiter m, Taetigkeit t
--WHERE m.Taetigkeit_Nr=t.Taetigkeit_ID
--GROUP BY t.Bezeichnung;

--CREATE VIEW Gehegebetreuung_Mitarbeiteranzahl AS
--SELECT g.Bezeichnung, COUNT(m.MitArb_ID) AS Anzahl
--FROM Gehege g, Gehegebetreuung gb, Mitarbeiter m
--WHERE g.Gehege_ID=gb.Gehege_Nr
--AND m.MitArb_ID=gb.Mitarbeiter_Nr
--GROUP BY g.Bezeichnung;

--CREATE VIEW Wohnort_Mitarbeiteranzahl AS
--SELECT m.Ort, COUNT(m.MitArb_ID) as Anzahl
--FROM Mitarbeiter m, Mitarbeiter ma
--WHERE m.Ort=ma.Ort
--AND m.MitArb_ID=ma.MitArb_ID
--GROUP BY m.Ort;

--CREATE VIEW Futterpläne AS
--SELECT t.Tier_ID, t.Name, ta.Bezeichnung, f.Futter_Name, fm.Menge, fr.Häufigkeit
--FROM Futter f, Futtermenge fm, Futterration fr, Tiere t, Tierart ta
--WHERE f.Futter_ID=fm.Futter_Nr
--AND fr.Rations_ID=fm.Rations_Nr
--AND t.Tier_ID=fr.Tier_Nr
--AND ta.Tierart_ID=t.Tier_ID;

--CREATE VIEW Futtertyp_Einkauf AS
--SELECT f.Futter_Name, SUM(e.Menge) AS Menge
--FROM Futter f, Einkauf e
--WHERE f.Futter_ID=e.Futter_Nr
--GROUP BY f.Futter_Name;

--CREATE VIEW Objektart_Anzahl AS
--SELECT oa.Bezeichnung, COUNT(o.Objekt_ID) AS Anzahl
--FROM Objekte o, Objektart oa
--WHERE o.Objektart_Nr = oa.Objektart_ID
--GROUP BY oa.Bezeichnung;

--CREATE VIEW Gehege_Objekt_Anzahl AS
--SELECT o.Bezeichnung, COUNT(g.Gehege_ID) AS Anzahl
--FROM Objekte o, Gehege g
--WHERE o.Objekt_ID = g.Objekt_Nr
--GROUP BY o.Bezeichnung;
GO
/****** Object:  Table [dbo].[Tierart]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tierart](
	[Tierart_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Bezeichnung] [nvarchar](255) NOT NULL,
	[Tiergattung_Nr] [smallint] NULL,
 CONSTRAINT [PK_Tierart] PRIMARY KEY CLUSTERED 
(
	[Tierart_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [tierpflege].[Tierart_Tieranzahl]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE VIEW Gehege_Tieranzahl AS
--SELECT g.Bezeichnung, COUNT(t.Tier_ID) AS Anzahl
--FROM Gehege g, Tiere t
--WHERE g.Gehege_ID=t.Gehege_Nr
--GROUP BY g.Bezeichnung;

CREATE VIEW [tierpflege].[Tierart_Tieranzahl] AS
SELECT ta.Bezeichnung, COUNT(t.Tier_ID) AS Anzahl_Tiere
FROM Tiere t, Tierart ta
WHERE ta.Bezeichnung=t.Name
GROUP BY ta.Bezeichnung;

--CREATE VIEW Tierklasse_Tieranzahl AS
--SELECT tk.Bezeichnung, COUNT(t.Tier_ID) as Anzahl
--FROM Tiere t, Tierart ta, Tiergattung tg, Tierklasse tk
--WHERE tg.Tierklasse_Nr=tk.Tierklasse_ID
--AND ta.Tiergattung_Nr=tg.Tiergattung_ID
--AND t.Tierart_Nr=ta.Tierart_ID
--GROUP BY tk.Bezeichnung;

--CREATE VIEW Abteilung_Mitarbeiteranzahl AS
--SELECT a.Bezeichnung, COUNT(MitArb_ID) AS Anzahl
--FROM Mitarbeiter m, Abteilung a
--WHERE m.Abt_NR = a.Abt_ID
--GROUP BY a.Bezeichnung;

--CREATE VIEW Tätigkeit_Mitarbeiteranzahl AS
--SELECT t.Bezeichnung, COUNT(m.MitArb_ID) AS Anzahl
--FROM Mitarbeiter m, Taetigkeit t
--WHERE m.Taetigkeit_Nr=t.Taetigkeit_ID
--GROUP BY t.Bezeichnung;

--CREATE VIEW Gehegebetreuung_Mitarbeiteranzahl AS
--SELECT g.Bezeichnung, COUNT(m.MitArb_ID) AS Anzahl
--FROM Gehege g, Gehegebetreuung gb, Mitarbeiter m
--WHERE g.Gehege_ID=gb.Gehege_Nr
--AND m.MitArb_ID=gb.Mitarbeiter_Nr
--GROUP BY g.Bezeichnung;

--CREATE VIEW Wohnort_Mitarbeiteranzahl AS
--SELECT m.Ort, COUNT(m.MitArb_ID) as Anzahl
--FROM Mitarbeiter m, Mitarbeiter ma
--WHERE m.Ort=ma.Ort
--AND m.MitArb_ID=ma.MitArb_ID
--GROUP BY m.Ort;

--CREATE VIEW Futterpläne AS
--SELECT t.Tier_ID, t.Name, ta.Bezeichnung, f.Futter_Name, fm.Menge, fr.Häufigkeit
--FROM Futter f, Futtermenge fm, Futterration fr, Tiere t, Tierart ta
--WHERE f.Futter_ID=fm.Futter_Nr
--AND fr.Rations_ID=fm.Rations_Nr
--AND t.Tier_ID=fr.Tier_Nr
--AND ta.Tierart_ID=t.Tier_ID;

--CREATE VIEW Futtertyp_Einkauf AS
--SELECT f.Futter_Name, SUM(e.Menge) AS Menge
--FROM Futter f, Einkauf e
--WHERE f.Futter_ID=e.Futter_Nr
--GROUP BY f.Futter_Name;

--CREATE VIEW Objektart_Anzahl AS
--SELECT oa.Bezeichnung, COUNT(o.Objekt_ID) AS Anzahl
--FROM Objekte o, Objektart oa
--WHERE o.Objektart_Nr = oa.Objektart_ID
--GROUP BY oa.Bezeichnung;

--CREATE VIEW Gehege_Objekt_Anzahl AS
--SELECT o.Bezeichnung, COUNT(g.Gehege_ID) AS Anzahl
--FROM Objekte o, Gehege g
--WHERE o.Objekt_ID = g.Objekt_Nr
--GROUP BY o.Bezeichnung;
GO
/****** Object:  Table [dbo].[Tiergattung]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiergattung](
	[Tiergattung_ID] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NOT NULL,
	[Tierklasse_Nr] [smallint] NULL,
 CONSTRAINT [PK_Art] PRIMARY KEY CLUSTERED 
(
	[Tiergattung_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tierklasse]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tierklasse](
	[Tierklasse_ID] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Tierklasse] PRIMARY KEY CLUSTERED 
(
	[Tierklasse_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [tierpflege].[Tierklasse_Tieranzahl]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE VIEW Gehege_Tieranzahl AS
--SELECT g.Bezeichnung, COUNT(t.Tier_ID) AS Anzahl
--FROM Gehege g, Tiere t
--WHERE g.Gehege_ID=t.Gehege_Nr
--GROUP BY g.Bezeichnung;

--CREATE VIEW Tierart_Tieranzahl AS
--SELECT ta.Bezeichnung, COUNT(t.Tier_ID) AS Anzahl_Tiere
--FROM Tiere t, Tierart ta
--WHERE ta.Bezeichnung=t.Name
--GROUP BY ta.Bezeichnung;

CREATE VIEW [tierpflege].[Tierklasse_Tieranzahl] AS
SELECT tk.Bezeichnung, COUNT(t.Tier_ID) as Anzahl
FROM Tiere t, Tierart ta, Tiergattung tg, Tierklasse tk
WHERE tg.Tierklasse_Nr=tk.Tierklasse_ID
AND ta.Tiergattung_Nr=tg.Tiergattung_ID
AND t.Tierart_Nr=ta.Tierart_ID
GROUP BY tk.Bezeichnung;

--CREATE VIEW Abteilung_Mitarbeiteranzahl AS
--SELECT a.Bezeichnung, COUNT(MitArb_ID) AS Anzahl
--FROM Mitarbeiter m, Abteilung a
--WHERE m.Abt_NR = a.Abt_ID
--GROUP BY a.Bezeichnung;

--CREATE VIEW Tätigkeit_Mitarbeiteranzahl AS
--SELECT t.Bezeichnung, COUNT(m.MitArb_ID) AS Anzahl
--FROM Mitarbeiter m, Taetigkeit t
--WHERE m.Taetigkeit_Nr=t.Taetigkeit_ID
--GROUP BY t.Bezeichnung;

--CREATE VIEW Gehegebetreuung_Mitarbeiteranzahl AS
--SELECT g.Bezeichnung, COUNT(m.MitArb_ID) AS Anzahl
--FROM Gehege g, Gehegebetreuung gb, Mitarbeiter m
--WHERE g.Gehege_ID=gb.Gehege_Nr
--AND m.MitArb_ID=gb.Mitarbeiter_Nr
--GROUP BY g.Bezeichnung;

--CREATE VIEW Wohnort_Mitarbeiteranzahl AS
--SELECT m.Ort, COUNT(m.MitArb_ID) as Anzahl
--FROM Mitarbeiter m, Mitarbeiter ma
--WHERE m.Ort=ma.Ort
--AND m.MitArb_ID=ma.MitArb_ID
--GROUP BY m.Ort;

--CREATE VIEW Futterpläne AS
--SELECT t.Tier_ID, t.Name, ta.Bezeichnung, f.Futter_Name, fm.Menge, fr.Häufigkeit
--FROM Futter f, Futtermenge fm, Futterration fr, Tiere t, Tierart ta
--WHERE f.Futter_ID=fm.Futter_Nr
--AND fr.Rations_ID=fm.Rations_Nr
--AND t.Tier_ID=fr.Tier_Nr
--AND ta.Tierart_ID=t.Tier_ID;

--CREATE VIEW Futtertyp_Einkauf AS
--SELECT f.Futter_Name, SUM(e.Menge) AS Menge
--FROM Futter f, Einkauf e
--WHERE f.Futter_ID=e.Futter_Nr
--GROUP BY f.Futter_Name;

--CREATE VIEW Objektart_Anzahl AS
--SELECT oa.Bezeichnung, COUNT(o.Objekt_ID) AS Anzahl
--FROM Objekte o, Objektart oa
--WHERE o.Objektart_Nr = oa.Objektart_ID
--GROUP BY oa.Bezeichnung;

--CREATE VIEW Gehege_Objekt_Anzahl AS
--SELECT o.Bezeichnung, COUNT(g.Gehege_ID) AS Anzahl
--FROM Objekte o, Gehege g
--WHERE o.Objekt_ID = g.Objekt_Nr
--GROUP BY o.Bezeichnung;
GO
/****** Object:  Table [dbo].[Abteilung]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abteilung](
	[Abt_ID] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NULL,
 CONSTRAINT [PK_Abteilung] PRIMARY KEY CLUSTERED 
(
	[Abt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mitarbeiter]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mitarbeiter](
	[Mitarbeiter_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NULL,
	[Vorname] [nvarchar](10) NULL,
	[Strasse] [nvarchar](30) NULL,
	[PLZ] [nvarchar](255) NULL,
	[Ort] [nvarchar](255) NULL,
	[Tätigkeit_Nr] [smallint] NULL,
	[Geschlecht] [nvarchar](1) NULL,
	[aktiv] [bit] NOT NULL,
 CONSTRAINT [PK_Mitarbeiter] PRIMARY KEY CLUSTERED 
(
	[Mitarbeiter_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tätigkeit]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tätigkeit](
	[Tätigkeit_ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Bezeichnung] [nvarchar](255) NOT NULL,
	[Abteilung_Nr] [smallint] NULL,
 CONSTRAINT [PK_Taetigkeit] PRIMARY KEY CLUSTERED 
(
	[Tätigkeit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [hr].[Abteilung_Mitarbeiteranzahl]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [hr].[Abteilung_Mitarbeiteranzahl] AS
SELECT a.Bezeichnung, COUNT(*) AS Anzahl
FROM Mitarbeiter m
JOIN Tätigkeit t ON t.Tätigkeit_ID = m.Tätigkeit_Nr
JOIN Abteilung a ON a.Abt_ID = t.Abteilung_Nr
GROUP BY a.Bezeichnung;
GO
/****** Object:  View [hr].[Tätigkeit_Mitarbeiteranzahl]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [hr].[Tätigkeit_Mitarbeiteranzahl] AS
SELECT t.Bezeichnung, COUNT(*) AS Anzahl
FROM Mitarbeiter m
JOIN Tätigkeit t ON t.Tätigkeit_ID = m.Tätigkeit_Nr
GROUP BY t.Bezeichnung;
GO
/****** Object:  Table [dbo].[Gehegebetreuung]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gehegebetreuung](
	[Mitarbeiter_Nr] [smallint] NOT NULL,
	[Gehege_Nr] [smallint] NOT NULL,
 CONSTRAINT [PK_Gehegebetreuung] PRIMARY KEY CLUSTERED 
(
	[Mitarbeiter_Nr] ASC,
	[Gehege_Nr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [tierpflege].[Gehegebetreuung_Mitarbeiteranzahl]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [tierpflege].[Gehegebetreuung_Mitarbeiteranzahl] AS
SELECT g.Bezeichnung, COUNT(m.Mitarbeiter_ID) AS Anzahl
FROM Gehege g, Gehegebetreuung gb, Mitarbeiter m
WHERE g.Gehege_ID=gb.Gehege_Nr
AND m.Mitarbeiter_ID=gb.Mitarbeiter_Nr
GROUP BY g.Bezeichnung;
GO
/****** Object:  View [hr].[Wohnort_Mitarbeiteranzahl]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [hr].[Wohnort_Mitarbeiteranzahl] AS
SELECT m.Ort, COUNT (*) AS Anzahl
FROM Mitarbeiter m
GROUP BY m.Ort
GO
/****** Object:  Table [dbo].[Futter]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Futter](
	[Futter_ID] [smallint] NOT NULL,
	[Futter_Name] [nvarchar](255) NULL,
	[Futter_Beschreibung] [nvarchar](255) NULL,
 CONSTRAINT [PK_Futter] PRIMARY KEY CLUSTERED 
(
	[Futter_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Futtermenge]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Futtermenge](
	[Futter_Nr] [smallint] NOT NULL,
	[Rations_Nr] [smallint] NOT NULL,
	[Menge] [smallint] NULL,
 CONSTRAINT [PK_Futtermenge] PRIMARY KEY CLUSTERED 
(
	[Futter_Nr] ASC,
	[Rations_Nr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Futterration]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Futterration](
	[Rations_ID] [smallint] NOT NULL,
	[Tier_Nr] [smallint] NOT NULL,
	[Häufigkeit] [smallint] NULL,
 CONSTRAINT [PK_Futterration_1] PRIMARY KEY CLUSTERED 
(
	[Rations_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [tierpflege].[Futterpläne]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [tierpflege].[Futterpläne] AS
SELECT t.Tier_ID, t.Name, ta.Bezeichnung, f.Futter_Name, fm.Menge, fr.Häufigkeit
FROM Futter f, Futtermenge fm, Futterration fr, Tiere t, Tierart ta
WHERE f.Futter_ID=fm.Futter_Nr
AND fr.Rations_ID=fm.Rations_Nr
AND t.Tier_ID=fr.Tier_Nr
AND ta.Tierart_ID=t.Tier_ID;
GO
/****** Object:  Table [verwaltung].[Einkauf]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [verwaltung].[Einkauf](
	[Einkauf_ID] [int] IDENTITY(1,1) NOT NULL,
	[Futter_Nr] [smallint] NULL,
	[Datum] [datetime2](7) NULL,
	[Mitarbeiter_Nr] [smallint] NULL,
	[Verkäufer] [nvarchar](255) NULL,
	[Menge] [decimal](6, 2) NULL,
	[Markenname] [nvarchar](255) NULL,
	[Steuersatz_in_Prozent] [decimal](4, 2) NULL,
	[Bruttopreis_gesamt] [decimal](15, 2) NULL,
 CONSTRAINT [PK_Einkauf] PRIMARY KEY CLUSTERED 
(
	[Einkauf_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [verwaltung].[Futtertyp_Einkauf]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [verwaltung].[Futtertyp_Einkauf] AS
SELECT f.Futter_Name, SUM(e.Menge) AS Menge
FROM Futter f, Einkauf e
WHERE f.Futter_ID=e.Futter_Nr
GROUP BY f.Futter_Name;
GO
/****** Object:  Table [dbo].[Objektart]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Objektart](
	[Objektart_ID] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Objektart] PRIMARY KEY CLUSTERED 
(
	[Objektart_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Objekte]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Objekte](
	[Objekt_ID] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NULL,
	[Objektart_Nr] [smallint] NOT NULL,
 CONSTRAINT [PK_Objekte] PRIMARY KEY CLUSTERED 
(
	[Objekt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [handwerk].[Objektart_Anzahl]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [handwerk].[Objektart_Anzahl] AS
SELECT oa.Bezeichnung, COUNT(o.Objekt_ID) AS Anzahl
FROM Objekte o, Objektart oa
WHERE o.Objektart_Nr = oa.Objektart_ID
GROUP BY oa.Bezeichnung;
GO
/****** Object:  View [handwerk].[Gehege_Objekt_Anzahl]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [handwerk].[Gehege_Objekt_Anzahl] AS
SELECT o.Bezeichnung, COUNT(g.Gehege_ID) AS Anzahl
FROM Objekte o, Gehege g
WHERE o.Objekt_ID = g.Objekt_Nr
GROUP BY o.Bezeichnung;
GO
/****** Object:  Table [dbo].[MedizinischeUntersuchung]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedizinischeUntersuchung](
	[MedUntersuchung_ID] [int] IDENTITY(1,1) NOT NULL,
	[Mitarbeiter_Nr] [smallint] NULL,
	[Tier_Nr] [smallint] NULL,
	[Datum] [datetime2](0) NULL,
	[Befunde] [nvarchar](max) NULL,
	[nächste_Untersuchung] [datetime2](7) NULL,
 CONSTRAINT [PK_MedizinischeUntersuchung] PRIMARY KEY CLUSTERED 
(
	[MedUntersuchung_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [tierpflege].[Tierart_MedizinischeUntersuchungen]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [tierpflege].[Tierart_MedizinischeUntersuchungen] AS
SELECT ta.Bezeichnung, COUNT(m.MedUntersuchung_ID) AS Anzahl
FROM MedizinischeUntersuchung m, Tierart ta, Tiere t
WHERE t.Tierart_Nr = ta.Tierart_ID
GROUP BY ta.Bezeichnung;
GO
/****** Object:  Table [dbo].[Futtertransport]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Futtertransport](
	[Futtertransport_ID] [int] IDENTITY(1,1) NOT NULL,
	[Mitarbeiter_Nr] [smallint] NOT NULL,
	[Futter_Nr] [smallint] NOT NULL,
 CONSTRAINT [PK_Futtertransport] PRIMARY KEY CLUSTERED 
(
	[Futtertransport_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lager]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lager](
	[Lager_ID] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NOT NULL,
	[Lagerart_Nr] [smallint] NOT NULL,
	[Objekt_Nr] [smallint] NOT NULL,
 CONSTRAINT [PK_Lager] PRIMARY KEY CLUSTERED 
(
	[Lager_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lagerart]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lagerart](
	[Lagerart_ID] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Lagerart] PRIMARY KEY CLUSTERED 
(
	[Lagerart_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tiertransport]    Script Date: 15.04.2024 10:34:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiertransport](
	[Tiertransport_ID] [int] IDENTITY(1,1) NOT NULL,
	[Tier_Nr] [smallint] NOT NULL,
	[Mitarbeiter_Nr] [smallint] NOT NULL,
 CONSTRAINT [PK_Tiertransport] PRIMARY KEY CLUSTERED 
(
	[Tiertransport_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Abteilung] ([Abt_ID], [Bezeichnung]) VALUES (1, N'Tierpflege')
INSERT [dbo].[Abteilung] ([Abt_ID], [Bezeichnung]) VALUES (2, N'Verwaltung')
INSERT [dbo].[Abteilung] ([Abt_ID], [Bezeichnung]) VALUES (3, N'Handwerk')
GO
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [Futter_Beschreibung]) VALUES (1, N'Frischfleisch', N'Schwein, Rind')
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [Futter_Beschreibung]) VALUES (2, N'Pflanzen', N'Blätter, Kräuter, Gräßer, Pilze')
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [Futter_Beschreibung]) VALUES (3, N'Früchte', N'Orangen, Äpfel, Bananen, Melonen')
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [Futter_Beschreibung]) VALUES (4, N'Fisch', N'Hering, kleine Wassertiere, Krebse')
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [Futter_Beschreibung]) VALUES (5, N'Insekten', N'Spinnen, Würmer, Ameisen, Raupen, Heuschrecken')
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [Futter_Beschreibung]) VALUES (6, N'Trockenfutter', N'Körner, Samen, Nüsse')
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [Futter_Beschreibung]) VALUES (7, N'Lebende Nahrung', N'Kaninchen, Mäuse, Vögel')
INSERT [dbo].[Futter] ([Futter_ID], [Futter_Name], [Futter_Beschreibung]) VALUES (8, N'Aufbaufutter', N'Vitamine, Mineralien')
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 17, 2000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 18, 2500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 19, 1800)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 20, 1500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 21, 1500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 27, 3000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 28, 2500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 29, 3200)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 48, 4000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 57, 600)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (1, 58, 800)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 1, 3000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 3, 2000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 5, 2500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 7, 2000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 8, 1500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 9, 2500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 22, 4000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 23, 3000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 25, 6000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 33, 300)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 34, 250)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 36, 400)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 43, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 44, 250)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 45, 150)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 46, 100)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 52, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 59, 800)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 63, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 78, 9)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 81, 400)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 83, 200)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 86, 2000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (2, 87, 3000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 2, 2000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 4, 1500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 6, 1700)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 10, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 11, 400)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 12, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 13, 600)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 14, 800)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 15, 400)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 16, 550)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 24, 3500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 33, 200)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 34, 190)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 37, 340)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 61, 30)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 64, 100)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 80, 300)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 81, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 83, 600)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 84, 300)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 85, 400)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (3, 86, 2200)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 30, 1500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 31, 800)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 32, 750)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 35, 280)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 41, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 62, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 68, 400)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 69, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 70, 300)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 71, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 72, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 73, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 74, 200)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (4, 79, 6)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 26, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 45, 150)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 49, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 50, 400)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 51, 300)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 52, 2000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 53, 50)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 56, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 59, 1600)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 60, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 63, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 75, 15)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 76, 16)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 77, 17)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (5, 82, 300)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 23, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 36, 50)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 43, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 44, 200)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 46, 60)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 53, 100)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 54, 100)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 61, 20)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 65, 30)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 67, 20)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 83, 500)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (6, 85, 250)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 31, 1460)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 38, 750)
GO
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 39, 530)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 40, 480)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 42, 1000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 48, 2000)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (7, 66, 800)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 11, 50)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 14, 30)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 16, 40)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 47, 30)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 55, 20)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 65, 20)
INSERT [dbo].[Futtermenge] ([Futter_Nr], [Rations_Nr], [Menge]) VALUES (8, 72, 50)
GO
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (1, 1, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (2, 1, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (3, 2, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (4, 2, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (5, 3, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (6, 3, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (7, 4, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (8, 5, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (9, 6, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (10, 7, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (11, 8, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (12, 9, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (13, 10, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (14, 11, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (15, 12, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (16, 13, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (17, 14, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (18, 15, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (19, 16, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (20, 17, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (21, 18, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (22, 19, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (23, 20, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (24, 20, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (25, 21, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (26, 22, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (27, 23, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (28, 24, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (29, 25, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (30, 26, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (31, 27, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (32, 28, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (33, 29, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (34, 30, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (35, 31, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (36, 32, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (37, 33, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (38, 34, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (39, 35, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (40, 36, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (41, 37, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (42, 37, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (43, 38, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (44, 39, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (45, 40, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (46, 41, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (47, 41, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (48, 42, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (49, 43, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (50, 44, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (51, 45, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (52, 46, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (53, 47, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (54, 48, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (55, 48, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (56, 49, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (57, 50, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (58, 50, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (59, 51, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (60, 52, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (61, 53, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (62, 54, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (63, 55, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (64, 56, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (65, 56, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (66, 57, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (67, 58, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (68, 59, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (69, 60, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (70, 61, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (71, 62, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (72, 62, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (73, 63, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (74, 64, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (75, 65, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (76, 66, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (77, 67, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (78, 68, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (79, 70, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (80, 71, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (81, 72, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (82, 72, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (83, 73, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (84, 74, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (85, 75, 1)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (86, 76, 2)
INSERT [dbo].[Futterration] ([Rations_ID], [Tier_Nr], [Häufigkeit]) VALUES (87, 77, 2)
GO
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (1, N'Elefantentempel', 9, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (2, N'Savanne', 10, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (3, N'Affen-Käfig 1', 6, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (4, N'Affen-Käfig 2', 6, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (5, N'Affen-Käfig 3', 6, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (6, N'Affen-Käfig 4', 6, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (7, N'Löwen-Käfig', 7, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (8, N'Leoparden-Käfig', 7, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (9, N'Tiger-Käfig', 7, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (10, N'Erdmännchenbau', 10, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (11, N'Schildkröten-Wiese', 10, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (12, N'Terrarium 1', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (13, N'Terrarium 2', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (14, N'Terrarium 3', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (15, N'Terrarium 4', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (16, N'Terrarium 5', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (17, N'Terrarium 6', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (18, N'Terrarium 7', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (19, N'Terrarium 8', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (20, N'Terrarium 9', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (21, N'Terrarium 10', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (22, N'Terrarium 11', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (23, N'Terrarium 12', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (24, N'Volliere 1', 11, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (25, N'Volliere 2', 11, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (26, N'Volliere 3', 11, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (27, N'Volliere 4', 11, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (28, N'Flamingoteich', 11, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (29, N'Aquarium 1', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (30, N'Aquarium 2', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (31, N'Aquarium 3', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (32, N'Aquarium 4', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (33, N'Aquarium 5', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (34, N'Vitrine 1', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (35, N'Vitrine 2', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (36, N'Vitrine 3', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (37, N'Ameisenbau', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (38, N'Aquarium 6', 8, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (39, N'Flusspferd-Park', 9, NULL)
INSERT [dbo].[Gehege] ([Gehege_ID], [Bezeichnung], [Objekt_Nr], [letzte_Reinigung]) VALUES (40, N'Nashorn-Anlage', 9, NULL)
GO
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (1, 27)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (3, 2)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (4, 1)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (5, 1)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (7, 5)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (7, 6)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (8, 12)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (8, 13)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (10, 5)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (10, 6)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (12, 2)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (13, 2)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (14, 12)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (14, 13)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (15, 10)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (15, 11)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (16, 3)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (16, 4)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (18, 7)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (18, 8)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (18, 9)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (20, 10)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (20, 11)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (21, 3)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (21, 4)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (23, 7)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (23, 8)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (23, 9)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (24, 33)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (24, 38)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (25, 24)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (25, 25)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (26, 30)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (26, 32)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (28, 29)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (28, 31)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (29, 29)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (29, 31)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (30, 28)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (32, 28)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (33, 27)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (35, 26)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (36, 34)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (36, 35)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (36, 36)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (36, 37)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (38, 14)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (39, 24)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (39, 25)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (41, 30)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (41, 32)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (45, 23)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (51, 20)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (51, 21)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (51, 22)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (54, 20)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (54, 21)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (54, 22)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (56, 17)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (56, 18)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (56, 19)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (58, 17)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (58, 18)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (58, 19)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (60, 39)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (60, 40)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (63, 16)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (67, 15)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (69, 39)
INSERT [dbo].[Gehegebetreuung] ([Mitarbeiter_Nr], [Gehege_Nr]) VALUES (69, 40)
GO
SET IDENTITY_INSERT [dbo].[Mitarbeiter] ON 

INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (4, N'Schwarz', N'Heinz', N'Anaberger Str. 22', N'01139', N'Dresden', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (5, N'Schädlich', N'Herbert', N'Plempengasse 25', N'01445', N'Radebeul', 4, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (6, N'Langer', N'Fritz', N'Gablenzer Str. 12', N'01796', N'Pirna', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (7, N'Pollack', N'Wilfried', N'Mühlenstr. 25 b', N'01809', N'Heidenau', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (8, N'Hebel', N'Fritz', N'Waldweg 1', N'01454', N'Radeberg', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (9, N'Kaiser', N'August', N'Südring 98', N'01189', N'Dresden', 9, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (10, N'Schneider', N'Gerda', N'Bergstr. 54', N'01796', N'Pirna', 13, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (11, N'Glöckner', N'Manfred', N'Schneeberger Str. 98', N'01705', N'Freital', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (12, N'Mielke', N'Erich', N'Trabantweg 3', N'01139', N'Dresden', 15, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (13, N'Meister', N'Udo', N'Berghotelweg 1', N'01825', N'Liebstadt', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (14, N'Schüttele', N'Detlef', N'Südhang 16', N'01217', N'Dresden', 12, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (15, N'Diener', N'Minna', N'Hauptstr. 2', N'01796', N'Graupa', 13, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (16, N'Schmidt', N'Tommi', N'Schustergasse 16', N'01640', N'Coswig', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (17, N'Seiten', N'Olivia', N'Bürgerplatz 12', N'09599', N'Freiberg', 13, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (18, N'Weiß', N'Rudolph', N'Stollberger Str. 168', N'01465', N'Dresden', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (19, N'Meier', N'Paul', N'Grüner Hang 3', N'01465', N'Dresden', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (20, N'Schimanski', N'Horst', N'Spitzelweg 3', N'01307', N'Dresden', 15, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (21, N'Pfennig', N'Emil', N'Rosentalstr. 18', N'01139', N'Dresden', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (22, N'Spar', N'Gustav', N'Damaschkestr. 34', N'01307', N'Dresden', 9, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (23, N'Gebemir', N'Gerd', N'Waldweg 123', N'01307', N'Dresden', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (24, N'Suppe', N'Paula', N'Wasserweg 41', N'01809', N'Heidenau', 13, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (25, N'Reich', N'Silvia', N'Dorfstr. 34', N'01809', N'Dohna', 5, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (26, N'Wächter', N'Torsten', N'Hauptstr. 4', N'01796', N'Pirna', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (27, N'Schliesser', N'Gabi', N'Rathausplatz 4', N'01728', N'Bannewitz', 13, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (28, N'Helm', N'Michael', N'Brückenweg 23', N'01328', N'Weißig', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (29, N'Bocuse', N'Paul', N'Annenstr. 45', N'01217', N'Dresden', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (30, N'Krug', N'Manfred', N'Hauptstr. 5', N'01662', N'Meißen', 12, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (31, N'Schnecke', N'Rita', N'Hauptstr.67', N'01445', N'Radebeul', 13, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (32, N'Müller', N'Peter', N'Bernsdorfer Str. 16', N'01640', N'Coswig', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (33, N'Hänker', N'Fritz', N'Am Stadion 1', N'09599', N'Freiberg', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (34, N'Müller', N'Anita', N'Pirnaer Str. 3', N'01809', N'Heidenau', 11, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (35, N'König', N'Friedrich', N'Kohlegasse 5', N'01328', N'Weißig', 13, N'm', 0)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (36, N'Kabel', N'Michael', N'Wiesenweg 8 f', N'01468', N'Moritzburg', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (37, N'Franke', N'Ulli', N'Malergasse 17', N'01445', N'Radebeul', 14, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (38, N'Müller', N'Jens', N'Ammernstr. 1', N'01662', N'Meißen', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (39, N'Meier', N'Olaf', N'Fischweg 12', N'01468', N'Moritzburg', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (40, N'Waalkes', N'Otto', N'Friesengasse 11', N'01189', N'Dresden', 4, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (41, N'Zange', N'Wolfgang', N'Stadtring 88', N'01809', N'Heidenau', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (42, N'Grube', N'Klaire', N'Großenhainer Str. 5', N'01097', N'Dresden', 13, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (43, N'Tisch', N'Lothar', N'Am Brühl 13 a', N'01217', N'Dresden', 7, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (44, N'Bringe', N'Konrad', N'Brauerweg 25 c', N'01796', N'Pirna', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (45, N'Schmidt', N'Thomas', N'Großenhainer Str. 37', N'01097', N'Dresden', 2, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (46, N'Koch', N'Jens', N'Bergstr. 6', N'01796', N'Graupa', 3, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (47, N'Dittrich', N'Andrea', N'Hauptstraße 25', N'01723', N'Mohorn', 10, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (48, N'Brinkmann', N'Diana', N'Am Flugplatz 9', N'01465', N'Dresden', 13, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (49, N'Schnelle', N'Linda', N'Am Marktplatz 4', N'01705', N'Freital', 5, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (50, N'Hauptmann', N'Rolf', N'Bachstraße 25 a', N'01796', N'Pirna', 4, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (51, N'Wünsche', N'Silvia', N'Am Gartenheim 5', N'01561', N'Großenhain', 1, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (52, N'Haueisen', N'Egon', N' Bärenweg 4', N'01689', N'Weinböhla', 7, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (53, N'Gottschalk', N'Thomas', N'Am Markt 1', N'01169', N'Cossebaude', 1, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (54, N'Angermann', N'Gerd', N'Kirchgasse 2', N'01454', N'Großerkmannsdorf', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (55, N'Klingel', N'Frieda', N'Postweg 16 c', N'01307', N'Dresden', 11, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (56, N'Baldauf', N'Anja', N'Querweg 123', N'01796', N'Pirna', 5, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (57, N'Diettrich', N'Ulf', N'Wartburgstraße 78', N'01454', N'Radeberg', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (58, N'Meier', N'Ramona', N'Schießgasse 4', N'01445', N'Radebeul', 10, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (59, N'Jäckel', N'Bernd', N'Hauptstrasse 3', N'01561', N'Großenhain', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (60, N'Riegel', N'Leopold', N'Textilweg 24', N'01169', N'Cossebaude', 6, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (61, N'Glaube', N'Rudolph', N'Wiesenweg 16', N'01809', N'Heidenau', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (62, N'Hausmann', N'Marga', N'Am Schloßberg 3', N'01825', N'Liebstadt', 4, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (63, N'Sauger', N'Steffen', N'Gärtnereiweg 8', N'01471', N'Radeburg', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (64, N'Weiss', N'Katja', N'Forstweg 16 a', N'01689', N'Weinböhla', 10, N'w', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (65, N'Streßmann', N'Emil', N'Schwarzastraße 16', N'01640', N'Coswig', 8, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (66, N'Wünschmann', N'Holger', N'Andreasstr. 15', N'01465', N'Dresden', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (67, N'Koechel', N'Siegfried', N'Dorfstr. 85', N'01728', N'Bannewitz', 10, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (68, N'Prüfer', N'Ullrich', N'Dorfweg 76', N'01454', N'Großerkmannsdorf', 9, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (69, N'Drummer', N'Kurt', N'Rosenhof 234', N'01217', N'Dresden', 3, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (70, N'Pils', N'Michael', N'Am Anger 10', N'01796', N'Graupa', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (71, N'Sauber', N'Manfred', N'Zolastr. 46', N'01796', N'Pirna', 4, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (72, N'Bertold', N'Jürgen', N'Hauptstr. 26 d', N'01454', N'Radeberg', 13, N'm', 1)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (73, N'asdfg', N'Test', N'Test', N'Test', N'Test', NULL, NULL, 0)
INSERT [dbo].[Mitarbeiter] ([Mitarbeiter_ID], [Name], [Vorname], [Strasse], [PLZ], [Ort], [Tätigkeit_Nr], [Geschlecht], [aktiv]) VALUES (104, N'Tester', N'Test', N'Teststraße', N'69420', N'Behausen', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Mitarbeiter] OFF
GO
INSERT [dbo].[Objektart] ([Objektart_ID], [Bezeichnung]) VALUES (1, N'Gebäude')
INSERT [dbo].[Objektart] ([Objektart_ID], [Bezeichnung]) VALUES (2, N'Freigelände')
GO
INSERT [dbo].[Objekte] ([Objekt_ID], [Bezeichnung], [Objektart_Nr]) VALUES (1, N'Verwaltungsgebäude', 1)
INSERT [dbo].[Objekte] ([Objekt_ID], [Bezeichnung], [Objektart_Nr]) VALUES (2, N'Eingangsgebäude', 1)
INSERT [dbo].[Objekte] ([Objekt_ID], [Bezeichnung], [Objektart_Nr]) VALUES (3, N'Lager', 1)
INSERT [dbo].[Objekte] ([Objekt_ID], [Bezeichnung], [Objektart_Nr]) VALUES (4, N'Futterküche', 1)
INSERT [dbo].[Objekte] ([Objekt_ID], [Bezeichnung], [Objektart_Nr]) VALUES (5, N'Werkstatt', 1)
INSERT [dbo].[Objekte] ([Objekt_ID], [Bezeichnung], [Objektart_Nr]) VALUES (6, N'Affenhaus', 1)
INSERT [dbo].[Objekte] ([Objekt_ID], [Bezeichnung], [Objektart_Nr]) VALUES (7, N'Raubtierhaus', 1)
INSERT [dbo].[Objekte] ([Objekt_ID], [Bezeichnung], [Objektart_Nr]) VALUES (8, N'Aquaterrium', 1)
INSERT [dbo].[Objekte] ([Objekt_ID], [Bezeichnung], [Objektart_Nr]) VALUES (9, N'Areal 1', 2)
INSERT [dbo].[Objekte] ([Objekt_ID], [Bezeichnung], [Objektart_Nr]) VALUES (10, N'Areal 2', 2)
INSERT [dbo].[Objekte] ([Objekt_ID], [Bezeichnung], [Objektart_Nr]) VALUES (11, N'Areal 3', 2)
GO
SET IDENTITY_INSERT [dbo].[Tätigkeit] ON 

INSERT [dbo].[Tätigkeit] ([Tätigkeit_ID], [Bezeichnung], [Abteilung_Nr]) VALUES (1, N'Animator', 2)
INSERT [dbo].[Tätigkeit] ([Tätigkeit_ID], [Bezeichnung], [Abteilung_Nr]) VALUES (2, N'Elektriker', 3)
INSERT [dbo].[Tätigkeit] ([Tätigkeit_ID], [Bezeichnung], [Abteilung_Nr]) VALUES (3, N'Futterkoch', 1)
INSERT [dbo].[Tätigkeit] ([Tätigkeit_ID], [Bezeichnung], [Abteilung_Nr]) VALUES (4, N'Gärtner', 3)
INSERT [dbo].[Tätigkeit] ([Tätigkeit_ID], [Bezeichnung], [Abteilung_Nr]) VALUES (5, N'kaufm. Angestellte', 2)
INSERT [dbo].[Tätigkeit] ([Tätigkeit_ID], [Bezeichnung], [Abteilung_Nr]) VALUES (6, N'Klemptner', 3)
INSERT [dbo].[Tätigkeit] ([Tätigkeit_ID], [Bezeichnung], [Abteilung_Nr]) VALUES (7, N'Lagerist', 3)
INSERT [dbo].[Tätigkeit] ([Tätigkeit_ID], [Bezeichnung], [Abteilung_Nr]) VALUES (8, N'Maurer', 3)
INSERT [dbo].[Tätigkeit] ([Tätigkeit_ID], [Bezeichnung], [Abteilung_Nr]) VALUES (9, N'Ökonom', 2)
INSERT [dbo].[Tätigkeit] ([Tätigkeit_ID], [Bezeichnung], [Abteilung_Nr]) VALUES (10, N'Reinigungskraft', 3)
INSERT [dbo].[Tätigkeit] ([Tätigkeit_ID], [Bezeichnung], [Abteilung_Nr]) VALUES (11, N'Sekretärin', 2)
INSERT [dbo].[Tätigkeit] ([Tätigkeit_ID], [Bezeichnung], [Abteilung_Nr]) VALUES (12, N'Tierarzt', 1)
INSERT [dbo].[Tätigkeit] ([Tätigkeit_ID], [Bezeichnung], [Abteilung_Nr]) VALUES (13, N'Tierpfleger', 1)
INSERT [dbo].[Tätigkeit] ([Tätigkeit_ID], [Bezeichnung], [Abteilung_Nr]) VALUES (14, N'Trockenbauer', 3)
INSERT [dbo].[Tätigkeit] ([Tätigkeit_ID], [Bezeichnung], [Abteilung_Nr]) VALUES (15, N'Wachmann', 2)
SET IDENTITY_INSERT [dbo].[Tätigkeit] OFF
GO
SET IDENTITY_INSERT [dbo].[Tierart] ON 

INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (2, N'Afrikanischer Löwe', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (3, N'Allfarbgebirgslori', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (4, N'Amurleopard', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (5, N'Amurtiger', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (6, N'Asiatischer Elefant', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (7, N'Azurblauer Pfeilgiftfrosch', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (8, N'Bartaffe', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (9, N'Blattschneideameise', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (10, N'Blauer Felsenleguan', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (11, N'Bonobo', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (12, N'Brauen-Glattstirnkaiman', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (13, N'Braune Landschildkröte', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (14, N'Braungebänderter Bambushai', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (15, N'Chileflamingo', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (16, N'Diademseeigel', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (17, N'Erdmännchen', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (18, N'Gänsegeier', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (19, N'Gelbe Anakonda', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (20, N'Gelbflossen-Zackenbarsch', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (21, N'Gewöhnlicher Totenkopfaffe', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (22, N'Glotzaugenbarsch', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (23, N'Grauer Kronenkranich', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (24, N'Großer Madagaskarleguan', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (25, N'Grüner Leguan', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (26, N'Hyazinthara', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (27, N'Jemenchamäleon', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (28, N'Kea', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (29, N'Kleiner Soldatenara', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (30, N'Komodowaran', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (31, N'Königsgeier', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (32, N'Kupferkopf', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (33, N'Mandschurenkranich', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (34, N'Mangroven-Nachtbaumnatter', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (35, N'Mangroven-Pfeilschwanzkrebs', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (36, N'Mantelpavian', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (37, N'Moosfrosch', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (38, N'Ostafrikanisches Spitzmaulnashorn', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (39, N'Präriekröte', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (40, N'Riesenhaiwels', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (41, N'Ringhalskobra', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (42, N'Roter Flamingo', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (43, N'Rotes Riesenkänguru', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (44, N'Rotflossen-Antennenwels', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (45, N'Rothschildgiraffe', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (46, N'Roti Schlangenhals-Schildkröte', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (47, N'Säbelantilope', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (48, N'Schabrackentapir', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (49, N'Schneeleopard', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (50, N'Schwarzkopfibis', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (51, N'Schwarzspitzen-Riffhai', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (52, N'Schwarzzügelibis', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (53, N'Sepikwaran', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (54, N'Silberäffchen', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (55, N'Spaltenschildkröte', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (56, N'Strahlenschildkröte', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (57, N'Stumpfkrokodil', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (58, N'Sumatra-Orang-Utan', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (59, N'Sunda-Gavial', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (60, N'Tempelschildkröte', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (61, N'Tigerspatelwels', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (62, N'Weißbauch-Zwergseidenäffchen', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (63, N'Weißnackenkranich', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (64, N'Westafrikanischer Schimpanse', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (65, N'Westlicher Flachlandgorilla', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (66, N'Zwergflamingo', NULL)
INSERT [dbo].[Tierart] ([Tierart_ID], [Bezeichnung], [Tiergattung_Nr]) VALUES (67, N'Zwergflusspferd', NULL)
SET IDENTITY_INSERT [dbo].[Tierart] OFF
GO
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (1, N'Jumbo', 6, 1, 1)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (2, N'Theo', 6, 1, 1)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (3, N'Elli', 6, 1, 1)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (4, N'Anna', 45, 1, 2)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (5, N'Bella', 45, 1, 2)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (6, N'Micha', 45, 1, 2)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (7, N'Hans', 64, 1, 3)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (8, N'Bea', 64, 1, 3)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (9, N'Adana', 58, 1, 4)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (10, N'Baba', 58, 1, 4)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (11, N'Gila', 11, 1, 4)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (12, N'Rago', 65, 1, 5)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (13, N'Ramona', 65, 1, 5)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (14, N'Lea', 2, 1, 7)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (15, N'Max', 2, 1, 7)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (16, N'Jörg', 2, 1, 7)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (17, N'Rambo', 4, 1, 8)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (18, N'Edona', 49, 1, 8)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (19, NULL, 47, 12, 2)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (20, NULL, 48, 5, 2)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (21, NULL, 43, 7, 2)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (22, NULL, 17, 23, 10)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (23, N'Tacko', 5, 1, 9)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (24, N'Ofra', 5, 1, 9)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (25, N'Venus', 5, 1, 9)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (26, NULL, 57, 2, 14)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (27, NULL, 12, 3, 15)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (28, NULL, 59, 2, 16)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (29, NULL, 56, 3, 12)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (30, NULL, 13, 2, 11)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (31, NULL, 46, 4, 13)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (32, NULL, 55, 5, 11)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (33, NULL, 60, 4, 12)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (34, NULL, 41, 2, 17)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (35, NULL, 32, 2, 18)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (36, NULL, 34, 4, 18)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (37, N'Vampy', 19, 1, 19)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (38, NULL, 25, 5, 20)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (39, NULL, 24, 2, 21)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (40, N'Farbenfroh', 27, 1, 22)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (41, N'Faruk', 10, 1, 20)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (42, NULL, 30, 2, 23)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (43, NULL, 53, 3, 23)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (44, NULL, 50, 8, 24)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (45, NULL, 52, 6, 24)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (46, NULL, 33, 15, 25)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (47, NULL, 28, 4, 26)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (48, NULL, 29, 3, 26)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (49, NULL, 42, 30, 28)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (50, NULL, 18, 6, 27)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (51, NULL, 63, 10, 25)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (52, NULL, 66, 15, 28)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (53, NULL, 3, 2, 26)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (54, NULL, 15, 10, 28)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (55, NULL, 23, 5, 25)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (56, N'Jack', 26, 1, 26)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (57, NULL, 31, 4, 27)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (58, NULL, 22, 5, 29)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (59, NULL, 14, 2, 30)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (60, NULL, 61, 6, 31)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (61, NULL, 44, 5, 31)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (62, NULL, 40, 1, 32)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (63, NULL, 51, 3, 30)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (64, NULL, 20, 5, 29)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (65, NULL, 7, 3, 34)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (66, NULL, 37, 4, 35)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (67, NULL, 39, 5, 36)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (68, NULL, 9, NULL, 37)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (69, NULL, 16, 10, 33)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (70, NULL, 35, 8, 38)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (71, NULL, 54, 6, 6)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (72, NULL, 21, 13, 6)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (73, NULL, 36, 5, 3)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (74, NULL, 62, 4, 6)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (75, NULL, 8, 5, 6)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (76, NULL, 67, 5, 39)
INSERT [dbo].[Tiere] ([Tier_ID], [Name], [Tierart_Nr], [Anzahl], [Gehege_Nr]) VALUES (77, NULL, 38, 4, 40)
GO
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (1, N'Elefant', 1)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (2, N'Giraffe', 1)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (3, N'Affe', 1)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (4, N'Löwe', 1)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (5, N'Leopard', 1)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (6, N'Antilope', 1)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (7, N'Tapir', 1)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (8, N'Känguru', 1)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (9, N'Erdmännchen', 1)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (10, N'Tiger', 1)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (11, N'Krokodil', 2)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (12, N'Schildkröte', 2)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (13, N'Schlange', 2)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (14, N'Leguan', 2)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (15, N'Chamäleon', 2)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (16, N'Waran', 2)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (17, N'Ibis', 3)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (18, N'Kranich', 3)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (19, N'Papagei', 3)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (20, N'Flamingo', 3)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (21, N'Geier', 3)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (22, N'Wels', 4)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (23, N'Hai', 4)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (24, N'Barsch', 4)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (25, N'Frosch', 5)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (26, N'Kröte', 5)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (27, N'Ameise', 6)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (28, N'Krebs', 6)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (29, N'Seeigel', 6)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (30, N'Flusspferd', 1)
INSERT [dbo].[Tiergattung] ([Tiergattung_ID], [Bezeichnung], [Tierklasse_Nr]) VALUES (31, N'Nashorn', 1)
GO
INSERT [dbo].[Tierklasse] ([Tierklasse_ID], [Bezeichnung]) VALUES (1, N'Säugetiere')
INSERT [dbo].[Tierklasse] ([Tierklasse_ID], [Bezeichnung]) VALUES (2, N'Reptilien')
INSERT [dbo].[Tierklasse] ([Tierklasse_ID], [Bezeichnung]) VALUES (3, N'Vögel')
INSERT [dbo].[Tierklasse] ([Tierklasse_ID], [Bezeichnung]) VALUES (4, N'Fische')
INSERT [dbo].[Tierklasse] ([Tierklasse_ID], [Bezeichnung]) VALUES (5, N'Amphibien')
INSERT [dbo].[Tierklasse] ([Tierklasse_ID], [Bezeichnung]) VALUES (6, N'Wirbellose')
GO
ALTER TABLE [dbo].[Mitarbeiter] ADD  CONSTRAINT [DF_Mitarbeiter_aktiv]  DEFAULT ((0)) FOR [aktiv]
GO
ALTER TABLE [dbo].[Futtermenge]  WITH CHECK ADD  CONSTRAINT [FK_Futtermenge_Futter] FOREIGN KEY([Futter_Nr])
REFERENCES [dbo].[Futter] ([Futter_ID])
GO
ALTER TABLE [dbo].[Futtermenge] CHECK CONSTRAINT [FK_Futtermenge_Futter]
GO
ALTER TABLE [dbo].[Futtermenge]  WITH CHECK ADD  CONSTRAINT [FK_Futtermenge_Futterration] FOREIGN KEY([Rations_Nr])
REFERENCES [dbo].[Futterration] ([Rations_ID])
GO
ALTER TABLE [dbo].[Futtermenge] CHECK CONSTRAINT [FK_Futtermenge_Futterration]
GO
ALTER TABLE [dbo].[Gehege]  WITH CHECK ADD  CONSTRAINT [FK_Gehege_Objekte] FOREIGN KEY([Objekt_Nr])
REFERENCES [dbo].[Objekte] ([Objekt_ID])
GO
ALTER TABLE [dbo].[Gehege] CHECK CONSTRAINT [FK_Gehege_Objekte]
GO
ALTER TABLE [dbo].[Lager]  WITH CHECK ADD  CONSTRAINT [FK_Lager_Lagerart] FOREIGN KEY([Lagerart_Nr])
REFERENCES [dbo].[Lagerart] ([Lagerart_ID])
GO
ALTER TABLE [dbo].[Lager] CHECK CONSTRAINT [FK_Lager_Lagerart]
GO
ALTER TABLE [dbo].[Lager]  WITH CHECK ADD  CONSTRAINT [FK_Lager_Objekte] FOREIGN KEY([Objekt_Nr])
REFERENCES [dbo].[Objekte] ([Objekt_ID])
GO
ALTER TABLE [dbo].[Lager] CHECK CONSTRAINT [FK_Lager_Objekte]
GO
ALTER TABLE [dbo].[MedizinischeUntersuchung]  WITH CHECK ADD  CONSTRAINT [FK_MedizinischeUntersuchung_Mitarbeiter] FOREIGN KEY([Mitarbeiter_Nr])
REFERENCES [dbo].[Mitarbeiter] ([Mitarbeiter_ID])
GO
ALTER TABLE [dbo].[MedizinischeUntersuchung] CHECK CONSTRAINT [FK_MedizinischeUntersuchung_Mitarbeiter]
GO
ALTER TABLE [dbo].[MedizinischeUntersuchung]  WITH CHECK ADD  CONSTRAINT [FK_MedizinischeUntersuchung_Tiere] FOREIGN KEY([Tier_Nr])
REFERENCES [dbo].[Tiere] ([Tier_ID])
GO
ALTER TABLE [dbo].[MedizinischeUntersuchung] CHECK CONSTRAINT [FK_MedizinischeUntersuchung_Tiere]
GO
ALTER TABLE [dbo].[Mitarbeiter]  WITH CHECK ADD  CONSTRAINT [FK_Mitarbeiter_Tätigkeit] FOREIGN KEY([Tätigkeit_Nr])
REFERENCES [dbo].[Tätigkeit] ([Tätigkeit_ID])
GO
ALTER TABLE [dbo].[Mitarbeiter] CHECK CONSTRAINT [FK_Mitarbeiter_Tätigkeit]
GO
ALTER TABLE [dbo].[Objekte]  WITH CHECK ADD  CONSTRAINT [FK_Objekte_Objektart] FOREIGN KEY([Objektart_Nr])
REFERENCES [dbo].[Objektart] ([Objektart_ID])
GO
ALTER TABLE [dbo].[Objekte] CHECK CONSTRAINT [FK_Objekte_Objektart]
GO
ALTER TABLE [dbo].[Tätigkeit]  WITH CHECK ADD  CONSTRAINT [FK_Tätigkeit_Abteilung] FOREIGN KEY([Abteilung_Nr])
REFERENCES [dbo].[Abteilung] ([Abt_ID])
GO
ALTER TABLE [dbo].[Tätigkeit] CHECK CONSTRAINT [FK_Tätigkeit_Abteilung]
GO
ALTER TABLE [dbo].[Tierart]  WITH CHECK ADD  CONSTRAINT [FK_Tierart_Tiergattung] FOREIGN KEY([Tiergattung_Nr])
REFERENCES [dbo].[Tiergattung] ([Tiergattung_ID])
GO
ALTER TABLE [dbo].[Tierart] CHECK CONSTRAINT [FK_Tierart_Tiergattung]
GO
ALTER TABLE [dbo].[Tiere]  WITH CHECK ADD  CONSTRAINT [FK_Tiere_Gehege] FOREIGN KEY([Gehege_Nr])
REFERENCES [dbo].[Gehege] ([Gehege_ID])
GO
ALTER TABLE [dbo].[Tiere] CHECK CONSTRAINT [FK_Tiere_Gehege]
GO
ALTER TABLE [dbo].[Tiere]  WITH CHECK ADD  CONSTRAINT [FK_Tiere_Tierart] FOREIGN KEY([Tierart_Nr])
REFERENCES [dbo].[Tierart] ([Tierart_ID])
GO
ALTER TABLE [dbo].[Tiere] CHECK CONSTRAINT [FK_Tiere_Tierart]
GO
ALTER TABLE [dbo].[Tiergattung]  WITH CHECK ADD  CONSTRAINT [FK_Tiergattung_Tierklasse] FOREIGN KEY([Tierklasse_Nr])
REFERENCES [dbo].[Tierklasse] ([Tierklasse_ID])
GO
ALTER TABLE [dbo].[Tiergattung] CHECK CONSTRAINT [FK_Tiergattung_Tierklasse]
GO
ALTER TABLE [verwaltung].[Einkauf]  WITH CHECK ADD  CONSTRAINT [FK_Einkauf_Futter] FOREIGN KEY([Futter_Nr])
REFERENCES [dbo].[Futter] ([Futter_ID])
GO
ALTER TABLE [verwaltung].[Einkauf] CHECK CONSTRAINT [FK_Einkauf_Futter]
GO
ALTER TABLE [verwaltung].[Einkauf]  WITH CHECK ADD  CONSTRAINT [FK_Einkauf_Mitarbeiter] FOREIGN KEY([Mitarbeiter_Nr])
REFERENCES [dbo].[Mitarbeiter] ([Mitarbeiter_ID])
GO
ALTER TABLE [verwaltung].[Einkauf] CHECK CONSTRAINT [FK_Einkauf_Mitarbeiter]
GO
USE [master]
GO
ALTER DATABASE [Zoo] SET  READ_WRITE 
GO
