USE [master]
GO
/****** Object:  Database [Zoo]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  Schema [hr]    Script Date: 09.04.2024 09:18:53 ******/
CREATE SCHEMA [hr]
GO
/****** Object:  Table [dbo].[Gehege]    Script Date: 09.04.2024 09:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gehege](
	[Gehege_ID] [smallint] NOT NULL,
	[Bezeichnung] [nvarchar](255) NULL,
	[Objekt_Nr] [smallint] NULL,
 CONSTRAINT [PK_Gehege] PRIMARY KEY CLUSTERED 
(
	[Gehege_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tiere]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  View [dbo].[Gehege_Tieranzahl]    Script Date: 09.04.2024 09:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Gehege_Tieranzahl] AS
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
/****** Object:  Table [dbo].[Tierart]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  View [dbo].[Tierart_Tieranzahl]    Script Date: 09.04.2024 09:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CREATE VIEW Gehege_Tieranzahl AS
--SELECT g.Bezeichnung, COUNT(t.Tier_ID) AS Anzahl
--FROM Gehege g, Tiere t
--WHERE g.Gehege_ID=t.Gehege_Nr
--GROUP BY g.Bezeichnung;

CREATE VIEW [dbo].[Tierart_Tieranzahl] AS
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
/****** Object:  Table [dbo].[Tiergattung]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  Table [dbo].[Tierklasse]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  View [dbo].[Tierklasse_Tieranzahl]    Script Date: 09.04.2024 09:18:53 ******/
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

CREATE VIEW [dbo].[Tierklasse_Tieranzahl] AS
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
/****** Object:  Table [dbo].[Abteilung]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  Table [dbo].[Mitarbeiter]    Script Date: 09.04.2024 09:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mitarbeiter](
	[Mitarbeiter_ID] [smallint] NOT NULL,
	[Name] [nvarchar](10) NULL,
	[Vorname] [nvarchar](10) NULL,
	[Strasse] [nvarchar](30) NULL,
	[PLZ] [nvarchar](255) NULL,
	[Ort] [nvarchar](255) NULL,
	[Tätigkeit_Nr] [smallint] NOT NULL,
	[Geschlecht] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_Mitarbeiter] PRIMARY KEY CLUSTERED 
(
	[Mitarbeiter_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tätigkeit]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  View [hr].[Abteilung_Mitarbeiteranzahl]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  View [dbo].[Tätigkeit_Mitarbeiteranzahl]    Script Date: 09.04.2024 09:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Tätigkeit_Mitarbeiteranzahl] AS
SELECT t.Bezeichnung, COUNT(*) AS Anzahl
FROM Mitarbeiter m
JOIN Tätigkeit t ON t.Tätigkeit_ID = m.Tätigkeit_Nr
GROUP BY t.Bezeichnung;
GO
/****** Object:  Table [dbo].[Gehegebetreuung]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  View [dbo].[Gehegebetreuung_Mitarbeiteranzahl]    Script Date: 09.04.2024 09:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Gehegebetreuung_Mitarbeiteranzahl] AS
SELECT g.Bezeichnung, COUNT(m.Mitarbeiter_ID) AS Anzahl
FROM Gehege g, Gehegebetreuung gb, Mitarbeiter m
WHERE g.Gehege_ID=gb.Gehege_Nr
AND m.Mitarbeiter_ID=gb.Mitarbeiter_Nr
GROUP BY g.Bezeichnung;
GO
/****** Object:  View [dbo].[Wohnort_Mitarbeiteranzahl]    Script Date: 09.04.2024 09:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Wohnort_Mitarbeiteranzahl] AS
SELECT m.Ort, COUNT (*) AS Anzahl
FROM Mitarbeiter m
GROUP BY m.Ort
GO
/****** Object:  Table [dbo].[Futter]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  Table [dbo].[Futtermenge]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  Table [dbo].[Futterration]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  View [dbo].[Futterpläne]    Script Date: 09.04.2024 09:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Futterpläne] AS
SELECT t.Tier_ID, t.Name, ta.Bezeichnung, f.Futter_Name, fm.Menge, fr.Häufigkeit
FROM Futter f, Futtermenge fm, Futterration fr, Tiere t, Tierart ta
WHERE f.Futter_ID=fm.Futter_Nr
AND fr.Rations_ID=fm.Rations_Nr
AND t.Tier_ID=fr.Tier_Nr
AND ta.Tierart_ID=t.Tier_ID;
GO
/****** Object:  Table [dbo].[Einkauf]    Script Date: 09.04.2024 09:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Einkauf](
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
/****** Object:  View [dbo].[Futtertyp_Einkauf]    Script Date: 09.04.2024 09:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Futtertyp_Einkauf] AS
SELECT f.Futter_Name, SUM(e.Menge) AS Menge
FROM Futter f, Einkauf e
WHERE f.Futter_ID=e.Futter_Nr
GROUP BY f.Futter_Name;
GO
/****** Object:  Table [dbo].[Objektart]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  Table [dbo].[Objekte]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  View [dbo].[Objektart_Anzahl]    Script Date: 09.04.2024 09:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Objektart_Anzahl] AS
SELECT oa.Bezeichnung, COUNT(o.Objekt_ID) AS Anzahl
FROM Objekte o, Objektart oa
WHERE o.Objektart_Nr = oa.Objektart_ID
GROUP BY oa.Bezeichnung;
GO
/****** Object:  View [dbo].[Gehege_Objekt_Anzahl]    Script Date: 09.04.2024 09:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Gehege_Objekt_Anzahl] AS
SELECT o.Bezeichnung, COUNT(g.Gehege_ID) AS Anzahl
FROM Objekte o, Gehege g
WHERE o.Objekt_ID = g.Objekt_Nr
GROUP BY o.Bezeichnung;
GO
/****** Object:  Table [dbo].[Futtertransport]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  Table [dbo].[Lager]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  Table [dbo].[Lagerart]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  Table [dbo].[MedizinischeUntersuchung]    Script Date: 09.04.2024 09:18:53 ******/
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
/****** Object:  Table [dbo].[Tiertransport]    Script Date: 09.04.2024 09:18:53 ******/
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
ALTER TABLE [dbo].[Einkauf]  WITH CHECK ADD  CONSTRAINT [FK_Einkauf_Futter] FOREIGN KEY([Futter_Nr])
REFERENCES [dbo].[Futter] ([Futter_ID])
GO
ALTER TABLE [dbo].[Einkauf] CHECK CONSTRAINT [FK_Einkauf_Futter]
GO
ALTER TABLE [dbo].[Einkauf]  WITH CHECK ADD  CONSTRAINT [FK_Einkauf_Mitarbeiter] FOREIGN KEY([Mitarbeiter_Nr])
REFERENCES [dbo].[Mitarbeiter] ([Mitarbeiter_ID])
GO
ALTER TABLE [dbo].[Einkauf] CHECK CONSTRAINT [FK_Einkauf_Mitarbeiter]
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
USE [master]
GO
ALTER DATABASE [Zoo] SET  READ_WRITE 
GO
