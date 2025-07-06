USE [master]
GO
/****** Object:  Database [Nba]    Script Date: 6.07.2025 23:13:24 ******/
CREATE DATABASE [Nba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nba', SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Nba_log', SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Nba] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nba] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nba] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nba] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nba] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nba] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nba] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nba] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nba] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nba] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nba] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nba] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nba] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nba] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Nba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nba] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nba] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nba] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nba] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nba] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Nba] SET  MULTI_USER 
GO
ALTER DATABASE [Nba] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nba] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nba] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Nba] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Nba] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Nba] SET QUERY_STORE = ON
GO
ALTER DATABASE [Nba] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Nba]
GO
/****** Object:  Table [dbo].[Oyuncular]    Script Date: 6.07.2025 23:13:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oyuncular](
	[OyuncuID] [int] NOT NULL,
	[TakimID] [int] NOT NULL,
	[OyuncuAd] [varchar](50) NOT NULL,
	[OyuncuSoyad] [varchar](50) NOT NULL,
	[OrtalamaSayi] [int] NOT NULL,
	[Maas] [int] NOT NULL,
 CONSTRAINT [PK_Oyuncular] PRIMARY KEY CLUSTERED 
(
	[OyuncuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[NbaViewLamelo]    Script Date: 6.07.2025 23:13:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[NbaViewLamelo]
as select * from Oyuncular Where OyuncuAd = 'Lamelo'
GO
/****** Object:  Table [dbo].[koclar]    Script Date: 6.07.2025 23:13:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[koclar](
	[KocID] [int] NOT NULL,
	[TakimID] [int] NOT NULL,
	[KocAdi] [varchar](50) NOT NULL,
	[KocSoyadi] [varchar](50) NOT NULL,
	[Maas] [int] NOT NULL,
 CONSTRAINT [PK_koclar] PRIMARY KEY CLUSTERED 
(
	[KocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[maclar]    Script Date: 6.07.2025 23:13:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[maclar](
	[mac_id] [int] IDENTITY(1,1) NOT NULL,
	[ev_sahibi_takim_id] [int] NULL,
	[deplasman_takim_id] [int] NULL,
	[tarih] [date] NULL,
	[ev_sahibi_skor] [int] NULL,
	[deplasman_skor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[mac_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Takimlar]    Script Date: 6.07.2025 23:13:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Takimlar](
	[TakimID] [int] NOT NULL,
	[TakımAdı] [varchar](50) NOT NULL,
	[Sehir] [varchar](50) NOT NULL,
	[Bölge] [varchar](50) NULL,
 CONSTRAINT [PK_Takimlar] PRIMARY KEY CLUSTERED 
(
	[TakimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[koclar] ([KocID], [TakimID], [KocAdi], [KocSoyadi], [Maas]) VALUES (1, 1, N'Charles ', N'Lee', 15000)
INSERT [dbo].[koclar] ([KocID], [TakimID], [KocAdi], [KocSoyadi], [Maas]) VALUES (2, 2, N'Joe', N'Mazzulla', 17000)
INSERT [dbo].[koclar] ([KocID], [TakimID], [KocAdi], [KocSoyadi], [Maas]) VALUES (3, 3, N'Jason', N'Kidd', 19000)
INSERT [dbo].[koclar] ([KocID], [TakimID], [KocAdi], [KocSoyadi], [Maas]) VALUES (4, 4, N'Ime', N'Udoka', 18000)
INSERT [dbo].[koclar] ([KocID], [TakimID], [KocAdi], [KocSoyadi], [Maas]) VALUES (5, 5, N'JJ', N'Redick', 16000)
INSERT [dbo].[koclar] ([KocID], [TakimID], [KocAdi], [KocSoyadi], [Maas]) VALUES (6, 6, N'John', N'Bickerstaff', 16000)
INSERT [dbo].[koclar] ([KocID], [TakimID], [KocAdi], [KocSoyadi], [Maas]) VALUES (7, 7, N'David', N'Adelman', 17000)
INSERT [dbo].[koclar] ([KocID], [TakimID], [KocAdi], [KocSoyadi], [Maas]) VALUES (8, 8, N'Erik', N'Spoelstra', 18000)
INSERT [dbo].[koclar] ([KocID], [TakimID], [KocAdi], [KocSoyadi], [Maas]) VALUES (9, 9, N'Thomas', N'Thibodeau', 16000)
INSERT [dbo].[koclar] ([KocID], [TakimID], [KocAdi], [KocSoyadi], [Maas]) VALUES (10, 10, N'Kenny', N'Atkinson', 15000)
INSERT [dbo].[koclar] ([KocID], [TakimID], [KocAdi], [KocSoyadi], [Maas]) VALUES (11, 11, N'Mark', N'Daigneault', 15000)
GO
SET IDENTITY_INSERT [dbo].[maclar] ON 

INSERT [dbo].[maclar] ([mac_id], [ev_sahibi_takim_id], [deplasman_takim_id], [tarih], [ev_sahibi_skor], [deplasman_skor]) VALUES (1, 1, 2, CAST(N'2025-07-01' AS Date), 102, 98)
INSERT [dbo].[maclar] ([mac_id], [ev_sahibi_takim_id], [deplasman_takim_id], [tarih], [ev_sahibi_skor], [deplasman_skor]) VALUES (2, 3, 4, CAST(N'2025-07-02' AS Date), 110, 105)
INSERT [dbo].[maclar] ([mac_id], [ev_sahibi_takim_id], [deplasman_takim_id], [tarih], [ev_sahibi_skor], [deplasman_skor]) VALUES (3, 5, 6, CAST(N'2025-07-03' AS Date), 95, 100)
INSERT [dbo].[maclar] ([mac_id], [ev_sahibi_takim_id], [deplasman_takim_id], [tarih], [ev_sahibi_skor], [deplasman_skor]) VALUES (4, 7, 8, CAST(N'2025-07-04' AS Date), 88, 90)
INSERT [dbo].[maclar] ([mac_id], [ev_sahibi_takim_id], [deplasman_takim_id], [tarih], [ev_sahibi_skor], [deplasman_skor]) VALUES (5, 9, 10, CAST(N'2025-07-05' AS Date), 120, 115)
INSERT [dbo].[maclar] ([mac_id], [ev_sahibi_takim_id], [deplasman_takim_id], [tarih], [ev_sahibi_skor], [deplasman_skor]) VALUES (6, 11, 1, CAST(N'2025-07-06' AS Date), 99, 101)
INSERT [dbo].[maclar] ([mac_id], [ev_sahibi_takim_id], [deplasman_takim_id], [tarih], [ev_sahibi_skor], [deplasman_skor]) VALUES (7, 2, 3, CAST(N'2025-07-07' AS Date), 105, 102)
INSERT [dbo].[maclar] ([mac_id], [ev_sahibi_takim_id], [deplasman_takim_id], [tarih], [ev_sahibi_skor], [deplasman_skor]) VALUES (8, 4, 5, CAST(N'2025-07-08' AS Date), 98, 97)
INSERT [dbo].[maclar] ([mac_id], [ev_sahibi_takim_id], [deplasman_takim_id], [tarih], [ev_sahibi_skor], [deplasman_skor]) VALUES (9, 6, 7, CAST(N'2025-07-09' AS Date), 115, 110)
INSERT [dbo].[maclar] ([mac_id], [ev_sahibi_takim_id], [deplasman_takim_id], [tarih], [ev_sahibi_skor], [deplasman_skor]) VALUES (10, 8, 9, CAST(N'2025-07-10' AS Date), 104, 108)
SET IDENTITY_INSERT [dbo].[maclar] OFF
GO
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (1, 1, N'Lamelo', N'Ball', 25, 25000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (2, 1, N'Brandon', N'Miller', 21, 20000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (3, 1, N'Miles', N'Bridges', 20, 21000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (4, 1, N'Seth', N'Curry', 7, 22000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (5, 1, N'Nick Smith', N'JR.', 10, 19000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (6, 2, N'Jayson', N'Tatum', 27, 30000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (7, 2, N'Jaylen', N'Brown', 22, 23000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (8, 2, N'Kristaps', N'Porzingis', 20, 15000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (9, 2, N'Derrick', N'White', 16, 16000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (10, 2, N'Payton', N'Pritchard', 14, 17000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (11, 3, N'Kyrie', N'Irving', 25, 25000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (12, 3, N'Anthony ', N'Davis', 20, 26000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (13, 3, N'Daniel', N'Gafford', 12, 19000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (14, 4, N'Alperen ', N'Sengun', 19, 27000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (15, 4, N'Amen', N'Thompson', 14, 26000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (16, 4, N'Dillon', N'Brooks', 14, 25000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (17, 4, N'Jalen', N'Green', 21, 23000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (18, 5, N'Lebron', N'James', 24, 30000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (19, 5, N'Gabe', N'Vincent', 6, 27000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (20, 5, N'Luka', N'Doncic', 28, 29000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (21, 5, N'Austin', N'Reaves', 13, 23000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (22, 5, N'Dorian', N'Finney-Smith', 10, 19000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (23, 6, N'Cade', N'Cunningham', 26, 18000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (24, 6, N'Jaden', N'Ivey', 17, 17000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (25, 6, N'Malik', N'Beasley', 16, 17000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (26, 6, N'Tobias', N'Harris', 14, 18000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (27, 6, N'Jalen', N'Duren', 11, 15000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (28, 7, N'Nikola', N'Jokic', 30, 35000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (29, 7, N'Jamal', N'Murray', 21, 19000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (30, 7, N'Michael', N'Porter Jr.', 18, 20000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (31, 7, N'Christian', N'Braun', 15, 21000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (32, 7, N'Russell', N'Westbrook', 13, 22000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (33, 8, N'Bam', N'Adebayo', 22, 19000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (34, 8, N'Tyler', N'Herro', 24, 18000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (35, 8, N'Jimmy', N'Butler', 20, 19000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (36, 8, N'Duncan', N'Robinson', 11, 20000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (37, 8, N'Andrew', N'Wiggins', 19, 19000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (38, 9, N'Jalen', N'Brunson', 26, 17000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (39, 9, N'Karl-Anthony', N'Towns', 24, 16000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (40, 9, N'Mikal', N'Bridges', 18, 17000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (41, 9, N'OG', N'Anunoby', 16, 17000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (42, 9, N'Josh', N'Hart', 14, 20000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (43, 10, N'Donovan', N'Mitchell', 24, 21000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (44, 10, N'Darius', N'Garland', 20, 22000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (45, 10, N'Evan', N'Mobley', 18, 23000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (46, 10, N'Jarrett', N'Allen', 14, 22000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (47, 10, N'DeAndre', N'Hunter', 14, 18000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (48, 11, N'Shai', N'Gilgeous-Alexander', 33, 30000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (49, 11, N'Jalen', N'Williams', 22, 25000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (50, 11, N'Chet', N'Holmgren', 15, 29000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (51, 11, N'Luguentz', N'Dort', 10, 23000)
INSERT [dbo].[Oyuncular] ([OyuncuID], [TakimID], [OyuncuAd], [OyuncuSoyad], [OrtalamaSayi], [Maas]) VALUES (52, 11, N'Isaiah', N'Hartenstein', 11, 25000)
GO
INSERT [dbo].[Takimlar] ([TakimID], [TakımAdı], [Sehir], [Bölge]) VALUES (1, N'Charlotte Hornets', N'Charlotte', N'Dogu')
INSERT [dbo].[Takimlar] ([TakimID], [TakımAdı], [Sehir], [Bölge]) VALUES (2, N'Boston Celtics', N'Boston', N'Dogu')
INSERT [dbo].[Takimlar] ([TakimID], [TakımAdı], [Sehir], [Bölge]) VALUES (3, N'Dallas Mavericks', N'Dallas', N'Batı')
INSERT [dbo].[Takimlar] ([TakimID], [TakımAdı], [Sehir], [Bölge]) VALUES (4, N'Houston Rockets', N'Houston', N'Batı')
INSERT [dbo].[Takimlar] ([TakimID], [TakımAdı], [Sehir], [Bölge]) VALUES (5, N'Los Angeles Lakers', N'Los Angeles', N'Batı')
INSERT [dbo].[Takimlar] ([TakimID], [TakımAdı], [Sehir], [Bölge]) VALUES (6, N'Detroit Pistons', N'Detroit', N'Dogu')
INSERT [dbo].[Takimlar] ([TakimID], [TakımAdı], [Sehir], [Bölge]) VALUES (7, N'Denver Nuggets', N'Denver', N'Batı')
INSERT [dbo].[Takimlar] ([TakimID], [TakımAdı], [Sehir], [Bölge]) VALUES (8, N'Miami Heat', N'Miami', N'Dogu')
INSERT [dbo].[Takimlar] ([TakimID], [TakımAdı], [Sehir], [Bölge]) VALUES (9, N'New York Knicks', N'New York', N'Dogu')
INSERT [dbo].[Takimlar] ([TakimID], [TakımAdı], [Sehir], [Bölge]) VALUES (10, N'Cavs', N'Cleveland', N'Dogu')
INSERT [dbo].[Takimlar] ([TakimID], [TakımAdı], [Sehir], [Bölge]) VALUES (11, N'Oklahoma City Thunder', N'Oklahoma', N'Batı')
GO
ALTER TABLE [dbo].[koclar]  WITH CHECK ADD  CONSTRAINT [FK_koclar_Takimlar] FOREIGN KEY([TakimID])
REFERENCES [dbo].[Takimlar] ([TakimID])
GO
ALTER TABLE [dbo].[koclar] CHECK CONSTRAINT [FK_koclar_Takimlar]
GO
ALTER TABLE [dbo].[maclar]  WITH CHECK ADD FOREIGN KEY([deplasman_takim_id])
REFERENCES [dbo].[Takimlar] ([TakimID])
GO
ALTER TABLE [dbo].[maclar]  WITH CHECK ADD FOREIGN KEY([ev_sahibi_takim_id])
REFERENCES [dbo].[Takimlar] ([TakimID])
GO
ALTER TABLE [dbo].[Oyuncular]  WITH CHECK ADD  CONSTRAINT [FK_Oyuncular_Takimlar] FOREIGN KEY([TakimID])
REFERENCES [dbo].[Takimlar] ([TakimID])
GO
ALTER TABLE [dbo].[Oyuncular] CHECK CONSTRAINT [FK_Oyuncular_Takimlar]
GO
USE [master]
GO
ALTER DATABASE [Nba] SET  READ_WRITE 
GO
