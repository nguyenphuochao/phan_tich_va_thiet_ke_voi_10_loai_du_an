USE [master]
GO
/****** Object:  Database [News]    Script Date: 27/03/2025 9:17:01 PM ******/
CREATE DATABASE [News]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'News', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\News.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'News_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\News_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [News] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [News].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [News] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [News] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [News] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [News] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [News] SET ARITHABORT OFF 
GO
ALTER DATABASE [News] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [News] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [News] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [News] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [News] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [News] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [News] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [News] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [News] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [News] SET  DISABLE_BROKER 
GO
ALTER DATABASE [News] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [News] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [News] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [News] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [News] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [News] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [News] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [News] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [News] SET  MULTI_USER 
GO
ALTER DATABASE [News] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [News] SET DB_CHAINING OFF 
GO
ALTER DATABASE [News] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [News] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [News] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [News] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [News] SET QUERY_STORE = ON
GO
ALTER DATABASE [News] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [News]
GO
/****** Object:  Table [dbo].[AdvertisementPages]    Script Date: 27/03/2025 9:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertisementPages](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_AdvertisementPages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdvertisementPositions]    Script Date: 27/03/2025 9:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertisementPositions](
	[Id] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[PageId] [varchar](50) NULL,
 CONSTRAINT [PK_AdvertisementPositions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Advertisements]    Script Date: 27/03/2025 9:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[PositionId] [varchar](50) NULL,
	[PageId] [varchar](50) NULL,
	[Image] [nvarchar](250) NULL,
	[Video] [nvarchar](250) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[ClickCount] [int] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Advertisements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 27/03/2025 9:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[ParentId] [int] NULL,
	[SortOrder] [int] NULL,
	[ShowInMenu] [bit] NULL,
	[ShowInHome] [bit] NULL,
	[Thumbnail] [nvarchar](250) NULL,
	[Status] [nchar](10) NULL,
	[SeoAlias] [nvarchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[SeoMetaKeywords] [nvarchar](128) NULL,
	[SeoMetaDescription] [nvarchar](128) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 27/03/2025 9:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] NOT NULL,
	[Content] [nvarchar](500) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[Report] [int] NULL,
	[PostId] [int] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 27/03/2025 9:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [int] NOT NULL,
	[SeoAlias] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostInCategories]    Script Date: 27/03/2025 9:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostInCategories](
	[PostId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_PostInCategories] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostInTags]    Script Date: 27/03/2025 9:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostInTags](
	[PostId] [int] NOT NULL,
	[TagId] [varchar](250) NOT NULL,
 CONSTRAINT [PK_PostInTags] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 27/03/2025 9:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Content] [ntext] NULL,
	[Thumbnail] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[ImageCaption] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[PublishedDate] [datetime] NOT NULL,
	[Source] [nvarchar](250) NOT NULL,
	[Status] [int] NOT NULL,
	[SeoAlias] [nvarchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[SeoMetaKeywords] [nvarchar](128) NULL,
	[SeoMetaDescription] [nvarchar](128) NULL,
	[HotDate] [datetime] NULL,
	[NewDate] [datetime] NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 27/03/2025 9:18:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [varchar](250) NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdvertisementPositions]  WITH CHECK ADD  CONSTRAINT [FK_AdvertisementPositions_AdvertisementPages] FOREIGN KEY([PageId])
REFERENCES [dbo].[AdvertisementPages] ([Id])
GO
ALTER TABLE [dbo].[AdvertisementPositions] CHECK CONSTRAINT [FK_AdvertisementPositions_AdvertisementPages]
GO
ALTER TABLE [dbo].[Advertisements]  WITH CHECK ADD  CONSTRAINT [FK_Advertisements_AdvertisementPages] FOREIGN KEY([PageId])
REFERENCES [dbo].[AdvertisementPages] ([Id])
GO
ALTER TABLE [dbo].[Advertisements] CHECK CONSTRAINT [FK_Advertisements_AdvertisementPages]
GO
ALTER TABLE [dbo].[Advertisements]  WITH CHECK ADD  CONSTRAINT [FK_Advertisements_AdvertisementPositions] FOREIGN KEY([PositionId])
REFERENCES [dbo].[AdvertisementPositions] ([Id])
GO
ALTER TABLE [dbo].[Advertisements] CHECK CONSTRAINT [FK_Advertisements_AdvertisementPositions]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts]
GO
ALTER TABLE [dbo].[PostInCategories]  WITH CHECK ADD  CONSTRAINT [FK_PostInCategories_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[PostInCategories] CHECK CONSTRAINT [FK_PostInCategories_Categories]
GO
ALTER TABLE [dbo].[PostInCategories]  WITH CHECK ADD  CONSTRAINT [FK_PostInCategories_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[PostInCategories] CHECK CONSTRAINT [FK_PostInCategories_Posts]
GO
ALTER TABLE [dbo].[PostInTags]  WITH CHECK ADD  CONSTRAINT [FK_PostInTags_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[PostInTags] CHECK CONSTRAINT [FK_PostInTags_Posts]
GO
ALTER TABLE [dbo].[PostInTags]  WITH CHECK ADD  CONSTRAINT [FK_PostInTags_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
GO
ALTER TABLE [dbo].[PostInTags] CHECK CONSTRAINT [FK_PostInTags_Tags]
GO
USE [master]
GO
ALTER DATABASE [News] SET  READ_WRITE 
GO
