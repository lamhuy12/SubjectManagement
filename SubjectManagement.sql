USE [master]
GO
/****** Object:  Database [SubjectManagement]    Script Date: 4/16/2021 10:15:21 PM ******/
CREATE DATABASE [SubjectManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SubjectManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SubjectManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SubjectManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SubjectManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SubjectManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SubjectManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SubjectManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SubjectManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SubjectManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SubjectManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SubjectManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [SubjectManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SubjectManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SubjectManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SubjectManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SubjectManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SubjectManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SubjectManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SubjectManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SubjectManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SubjectManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SubjectManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SubjectManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SubjectManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SubjectManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SubjectManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SubjectManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SubjectManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SubjectManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SubjectManagement] SET  MULTI_USER 
GO
ALTER DATABASE [SubjectManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SubjectManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SubjectManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SubjectManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SubjectManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SubjectManagement] SET QUERY_STORE = OFF
GO
USE [SubjectManagement]
GO
/****** Object:  Table [dbo].[History]    Script Date: 4/16/2021 10:15:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[Notification] [nvarchar](50) NULL,
	[DateOfChange] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonDetail]    Script Date: 4/16/2021 10:15:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonDetail](
	[lessonID] [nvarchar](50) NOT NULL,
	[subID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LessonDetail] PRIMARY KEY CLUSTERED 
(
	[lessonID] ASC,
	[subID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lessonn]    Script Date: 4/16/2021 10:15:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessonn](
	[lessonID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Theory] [nvarchar](50) NULL,
	[Exam] [nvarchar](50) NULL,
	[Test] [nvarchar](50) NULL,
 CONSTRAINT [PK_Lessonn] PRIMARY KEY CLUSTERED 
(
	[lessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 4/16/2021 10:15:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionID] [nvarchar](50) NOT NULL,
	[Question] [nvarchar](50) NULL,
	[lessonID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC,
	[lessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registrationn]    Script Date: 4/16/2021 10:15:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registrationn](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[Fullname] [varchar](50) NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_Registrationn] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 4/16/2021 10:15:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'CreateNewAccount', CAST(N'2020-12-22T20:42:45.907' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T21:22:13.370' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T21:22:15.170' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:22:55.717' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:22:57.180' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:22:58.007' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:22:59.040' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:22:59.553' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:22:59.800' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T21:27:05.520' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T21:27:07.233' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T21:47:06.877' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:47:09.393' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:47:10.530' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T21:57:03.237' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T21:57:05.273' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:57:08.297' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:57:08.980' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:57:09.637' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:57:10.390' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T22:05:52.300' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T22:05:54.010' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T22:07:57.330' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T22:11:50.433' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T22:12:05.367' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T22:12:11.780' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T22:25:16.427' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T22:26:07.490' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T22:28:34.000' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T23:32:44.593' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T23:34:38.637' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T23:44:37.453' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T23:47:35.137' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T23:49:35.860' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T23:51:37.827' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T23:58:47.927' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T23:59:51.817' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T23:59:53.440' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:00:58.477' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:01:55.627' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:03:39.370' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T00:04:28.607' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T00:15:53.053' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:17:46.273' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:36:38.657' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LogOut', CAST(N'2020-12-23T00:40:17.417' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T00:40:19.557' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:40:21.053' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T00:41:59.070' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:44:47.583' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T00:46:47.110' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T00:48:28.003' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:48:30.883' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:59:51.720' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T01:03:50.193' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T01:03:52.150' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T01:03:59.747' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T01:05:20.987' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T01:05:22.757' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T01:08:35.700' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T01:12:34.740' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T01:13:02.220' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T01:17:26.083' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T01:17:27.827' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T01:20:54.203' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T01:22:12.853' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T01:24:32.090' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T01:25:27.163' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T01:35:42.543' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T02:00:37.163' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T02:01:17.323' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T02:02:04.680' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T02:03:55.463' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T02:04:24.550' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T02:04:25.907' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T02:05:58.910' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T02:39:14.497' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T02:39:16.603' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T02:39:16.753' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T02:39:17.210' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T02:40:33.633' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T02:54:51.083' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T02:57:19.073' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T02:57:20.530' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'RemoveFromCart', CAST(N'2020-12-23T02:57:43.757' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddLessonToSubject', CAST(N'2020-12-23T02:57:49.117' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T12:04:46.333' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T12:04:57.667' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:04:59.510' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:05:45.967' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T12:08:13.923' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:08:19.867' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T12:08:45.860' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:08:57.640' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:10:10.567' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T12:36:43.253' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T12:38:55.933' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T12:39:44.260' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T12:41:46.867' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:45:16.260' AS DateTime))
GO
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T12:46:58.827' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T12:47:19.487' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddLessonToSubject', CAST(N'2020-12-23T12:47:26.023' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:48:37.940' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:49:30.273' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:51:22.683' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddAvailableLesson', CAST(N'2020-12-23T12:51:32.147' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsAdmin', CAST(N'2020-12-23T13:53:52.650' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchAllUser', CAST(N'2020-12-23T13:53:59.237' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LogOut', CAST(N'2020-12-23T13:54:04.147' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T13:59:07.923' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T14:01:55.663' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T14:02:21.217' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T14:02:30.150' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T14:03:26.227' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T14:05:04.877' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddQuestionToCartServlet', CAST(N'2020-12-23T14:05:24.967' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddQuestionToCartServlet', CAST(N'2020-12-23T14:05:25.427' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddQuestionToCartServlet', CAST(N'2020-12-23T14:05:25.817' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddQuestionToCartServlet', CAST(N'2020-12-23T14:05:26.520' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddQuestionToCartServlet', CAST(N'2020-12-23T14:05:26.957' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T14:07:48.893' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddAvailableLesson', CAST(N'2020-12-23T14:08:26.267' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddAvailableLessonToCart', CAST(N'2020-12-23T14:08:30.150' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddAvailableLesson', CAST(N'2020-12-23T14:08:30.197' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T14:09:54.373' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T14:13:39.693' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T14:31:26.007' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddLessonToSubject', CAST(N'2020-12-23T14:31:53.603' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T14:36:08.957' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsAdmin', CAST(N'2021-01-11T13:54:33.127' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsAdmin', CAST(N'2021-01-13T13:16:44.983' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchAllUser', CAST(N'2021-01-13T13:16:49.053' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'CreateNewAccount', CAST(N'2021-02-01T22:04:55.970' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2021-02-01T22:05:03.770' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2021-02-01T22:05:10.633' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsAdmin', CAST(N'2021-03-04T09:18:59.217' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LogOut', CAST(N'2021-03-04T09:19:02.750' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2021-03-04T09:19:10.080' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T21:30:51.640' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T22:07:54.190' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T22:28:35.723' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T23:34:36.633' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T23:37:44.703' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T23:44:35.480' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T23:49:37.727' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LogOut', CAST(N'2020-12-22T23:50:31.763' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T23:50:34.023' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T23:56:50.403' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T23:56:51.933' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T23:58:46.047' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:00:42.020' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:04:30.933' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:15:54.880' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T00:17:44.867' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T00:35:41.067' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T00:44:45.417' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:46:49.057' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:57:34.297' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T01:19:14.613' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T01:25:25.460' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T01:25:52.877' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T01:25:56.657' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T02:00:38.687' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T02:01:15.817' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T02:05:57.390' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T02:39:16.100' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T02:40:36.047' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T02:57:26.517' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:04:49.360' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:08:15.667' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T12:10:07.987' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:36:45.287' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:38:57.707' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T12:40:04.777' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:47:28.423' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T13:57:42.223' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T13:58:54.880' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T14:02:07.987' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T14:02:26.683' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T14:07:36.607' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddAvailableLesson', CAST(N'2020-12-23T14:08:07.120' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddAvailableLessonToCart', CAST(N'2020-12-23T14:08:23.197' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T14:09:56.577' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T14:13:22.757' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T14:30:44.123' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T14:32:27.483' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T21:30:52.930' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:30:55.047' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:30:57.107' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:30:57.417' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:30:57.740' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:30:58.050' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:30:58.200' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:30:58.500' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:30:58.633' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:30:58.797' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:30:58.950' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:30:59.083' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:30:59.233' AS DateTime))
GO
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:30:59.380' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:30:59.523' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:30:59.673' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T21:30:59.957' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T00:03:32.687' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:04:51.780' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T01:08:34.367' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T01:13:00.490' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T02:03:57.053' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T02:39:08.357' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'RemoveFromCart', CAST(N'2020-12-23T12:08:54.320' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:39:45.673' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2021-01-11T13:54:52.863' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T21:47:04.853' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T23:32:43.207' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T23:51:39.543' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T01:19:03.633' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T01:22:11.053' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T02:39:12.117' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T02:40:31.790' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:41:48.783' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:47:01.337' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddAvailableLesson', CAST(N'2020-12-23T12:51:23.480' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddAvailableLessonToCart', CAST(N'2020-12-23T12:51:32.110' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T14:02:41.093' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T14:04:08.463' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddQuestionToCartServlet', CAST(N'2020-12-23T14:04:36.860' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddQuestionToCartServlet', CAST(N'2020-12-23T14:04:37.497' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddQuestionToCartServlet', CAST(N'2020-12-23T14:04:37.970' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddQuestionToCartServlet', CAST(N'2020-12-23T14:04:38.593' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddQuestionToLessonServlet', CAST(N'2020-12-23T14:04:53.817' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T14:31:40.183' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T22:21:11.697' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T22:21:13.497' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'UpdateLesson', CAST(N'2020-12-22T22:21:21.497' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-22T22:25:12.783' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T23:47:37.527' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T23:50:35.873' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-22T23:54:07.257' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:02:00.477' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:35:43.173' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T00:36:35.883' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T00:42:01.187' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T01:20:52.367' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T01:24:30.173' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T01:35:40.967' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T02:02:03.233' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T02:39:17.050' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T02:54:35.893' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T02:57:38.967' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T12:05:44.060' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:10:16.767' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T12:32:30.797' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T12:32:33.907' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T12:45:13.173' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'LoginAsUser', CAST(N'2020-12-23T12:48:36.487' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddNewLessonToCart', CAST(N'2020-12-23T14:02:29.017' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddAvailableLesson', CAST(N'2020-12-23T14:08:23.257' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'AddAvailableLessonToCart', CAST(N'2020-12-23T14:08:26.217' AS DateTime))
INSERT [dbo].[History] ([Notification], [DateOfChange]) VALUES (N'SearchSubject', CAST(N'2020-12-23T14:30:46.583' AS DateTime))
GO
INSERT [dbo].[LessonDetail] ([lessonID], [subID]) VALUES (N'aaa', N'M01')
INSERT [dbo].[LessonDetail] ([lessonID], [subID]) VALUES (N'L01', N'M01')
INSERT [dbo].[LessonDetail] ([lessonID], [subID]) VALUES (N'L01', N'S03')
INSERT [dbo].[LessonDetail] ([lessonID], [subID]) VALUES (N'L01', N'S04')
INSERT [dbo].[LessonDetail] ([lessonID], [subID]) VALUES (N'L02', N'M01')
INSERT [dbo].[LessonDetail] ([lessonID], [subID]) VALUES (N'L11', N'M01')
INSERT [dbo].[LessonDetail] ([lessonID], [subID]) VALUES (N'L123', N'S02')
INSERT [dbo].[LessonDetail] ([lessonID], [subID]) VALUES (N'L456', N'S03')
INSERT [dbo].[LessonDetail] ([lessonID], [subID]) VALUES (N'L789', N'S03')
GO
INSERT [dbo].[Lessonn] ([lessonID], [Name], [Theory], [Exam], [Test]) VALUES (N'', N'', N'', N'', N'')
INSERT [dbo].[Lessonn] ([lessonID], [Name], [Theory], [Exam], [Test]) VALUES (N'aaa', N'a', N'a', N'a', N'a')
INSERT [dbo].[Lessonn] ([lessonID], [Name], [Theory], [Exam], [Test]) VALUES (N'L01', N'ab', N'a', N'a', N'a')
INSERT [dbo].[Lessonn] ([lessonID], [Name], [Theory], [Exam], [Test]) VALUES (N'L02', N'b', N'b', N'b', N'b')
INSERT [dbo].[Lessonn] ([lessonID], [Name], [Theory], [Exam], [Test]) VALUES (N'L03', N'c', N'c', N'c', N'c')
INSERT [dbo].[Lessonn] ([lessonID], [Name], [Theory], [Exam], [Test]) VALUES (N'L11', N'b', N'b', N'b', N'b')
INSERT [dbo].[Lessonn] ([lessonID], [Name], [Theory], [Exam], [Test]) VALUES (N'L123', N'amb', N'amb', N'amb', N'amb')
INSERT [dbo].[Lessonn] ([lessonID], [Name], [Theory], [Exam], [Test]) VALUES (N'L456', N'css', N'css', N'css', N'css')
INSERT [dbo].[Lessonn] ([lessonID], [Name], [Theory], [Exam], [Test]) VALUES (N'L789', N'prj', N'prj', N'prj', N'prj')
GO
INSERT [dbo].[Question] ([QuestionID], [Question], [lessonID]) VALUES (N'Q01', N'what', N'L01')
INSERT [dbo].[Question] ([QuestionID], [Question], [lessonID]) VALUES (N'Q02', N'Where', N'L01')
INSERT [dbo].[Question] ([QuestionID], [Question], [lessonID]) VALUES (N'Q02', N'Where', N'L11')
INSERT [dbo].[Question] ([QuestionID], [Question], [lessonID]) VALUES (N'Q03', N'How', N'L02')
INSERT [dbo].[Question] ([QuestionID], [Question], [lessonID]) VALUES (N'Q03', N'How', N'L11')
INSERT [dbo].[Question] ([QuestionID], [Question], [lessonID]) VALUES (N'Q03', N'How', N'L123')
GO
INSERT [dbo].[Registrationn] ([Username], [Password], [Fullname], [Role]) VALUES (N'haha', N'123456', N'haha', N'user')
INSERT [dbo].[Registrationn] ([Username], [Password], [Fullname], [Role]) VALUES (N'hahahaha', N'1234567', N'lalalalalaaaa', N'user')
INSERT [dbo].[Registrationn] ([Username], [Password], [Fullname], [Role]) VALUES (N'stu', N'1', N'STUDENT1a', N'user')
INSERT [dbo].[Registrationn] ([Username], [Password], [Fullname], [Role]) VALUES (N'tea', N'1', N'TEACHER', N'admin')
GO
INSERT [dbo].[Subject] ([subID], [Name]) VALUES (N'M01', N'Math')
INSERT [dbo].[Subject] ([subID], [Name]) VALUES (N'S02', N'Literature')
INSERT [dbo].[Subject] ([subID], [Name]) VALUES (N'S03', N'English')
INSERT [dbo].[Subject] ([subID], [Name]) VALUES (N'S04', N'Mac')
GO
ALTER TABLE [dbo].[LessonDetail]  WITH CHECK ADD  CONSTRAINT [FK_LessonDetail_Lessonn] FOREIGN KEY([lessonID])
REFERENCES [dbo].[Lessonn] ([lessonID])
GO
ALTER TABLE [dbo].[LessonDetail] CHECK CONSTRAINT [FK_LessonDetail_Lessonn]
GO
ALTER TABLE [dbo].[LessonDetail]  WITH CHECK ADD  CONSTRAINT [FK_LessonDetail_Subject] FOREIGN KEY([subID])
REFERENCES [dbo].[Subject] ([subID])
GO
ALTER TABLE [dbo].[LessonDetail] CHECK CONSTRAINT [FK_LessonDetail_Subject]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Lessonn] FOREIGN KEY([lessonID])
REFERENCES [dbo].[Lessonn] ([lessonID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Lessonn]
GO
USE [master]
GO
ALTER DATABASE [SubjectManagement] SET  READ_WRITE 
GO
