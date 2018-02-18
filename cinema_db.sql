USE [master]
GO
/****** Object:  Database [Cinema]    Script Date: 02/18/2018 16:50:08 ******/
CREATE DATABASE [Cinema] ON  PRIMARY 
( NAME = N'Cinema', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\Cinema.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Cinema_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\Cinema_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Cinema] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cinema].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cinema] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Cinema] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Cinema] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Cinema] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Cinema] SET ARITHABORT OFF
GO
ALTER DATABASE [Cinema] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Cinema] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Cinema] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Cinema] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Cinema] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Cinema] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Cinema] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Cinema] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Cinema] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Cinema] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Cinema] SET  DISABLE_BROKER
GO
ALTER DATABASE [Cinema] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Cinema] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Cinema] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Cinema] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Cinema] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Cinema] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Cinema] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Cinema] SET  READ_WRITE
GO
ALTER DATABASE [Cinema] SET RECOVERY FULL
GO
ALTER DATABASE [Cinema] SET  MULTI_USER
GO
ALTER DATABASE [Cinema] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Cinema] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Cinema', N'ON'
GO
USE [Cinema]
GO
/****** Object:  Table [dbo].[Cinema_Usertype]    Script Date: 02/18/2018 16:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema_Usertype](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cinema_Usertype] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cinema_Usertype] ON
INSERT [dbo].[Cinema_Usertype] ([id], [name]) VALUES (1, N'Admin')
INSERT [dbo].[Cinema_Usertype] ([id], [name]) VALUES (2, N'Staff')
SET IDENTITY_INSERT [dbo].[Cinema_Usertype] OFF
/****** Object:  Table [dbo].[Cinema_TypeTick]    Script Date: 02/18/2018 16:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema_TypeTick](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[discount] [float] NOT NULL,
	[prize] [int] NOT NULL,
 CONSTRAINT [PK_Cinema_TypeTick] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinema_TypeFilm]    Script Date: 02/18/2018 16:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema_TypeFilm](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cinema_TypeFilm] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinema_Type_Staff]    Script Date: 02/18/2018 16:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema_Type_Staff](
	[id_type_staff] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cinema_Type_Staff] PRIMARY KEY CLUSTERED 
(
	[id_type_staff] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinema_TrackingLogin]    Script Date: 02/18/2018 16:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema_TrackingLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[time_created] [datetime] NOT NULL,
	[duration_expired] [datetime] NOT NULL,
	[username] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cinema_TrackingLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinema_Showtime]    Script Date: 02/18/2018 16:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema_Showtime](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[start] [time](7) NOT NULL,
	[end] [time](7) NOT NULL,
 CONSTRAINT [PK_Cinema_Showtime] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinema_Room]    Script Date: 02/18/2018 16:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema_Room](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[numberseat] [int] NOT NULL,
	[status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cinema_Room] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinema_Popcorn]    Script Date: 02/18/2018 16:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema_Popcorn](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[ammount] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cinema_Popcorn] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinema_Film]    Script Date: 02/18/2018 16:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema_Film](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cinema_Film] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinema_Staff]    Script Date: 02/18/2018 16:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema_Staff](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type_staff] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[phone] [int] NOT NULL,
	[address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cinema_Staff] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinema_FilmTypeFilm]    Script Date: 02/18/2018 16:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema_FilmTypeFilm](
	[id_film] [int] NOT NULL,
	[id_typefilm] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinema_User]    Script Date: 02/18/2018 16:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema_User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NOT NULL,
	[pass] [nvarchar](max) NOT NULL,
	[type] [int] NOT NULL,
 CONSTRAINT [PK_Cinema_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cinema_User] ON
INSERT [dbo].[Cinema_User] ([id], [username], [pass], [type]) VALUES (1, N'admin', N'202cb962ac59075b964b07152d234b70', 1)
INSERT [dbo].[Cinema_User] ([id], [username], [pass], [type]) VALUES (2, N'staff_01', N'202cb962ac59075b964b07152d234b70', 2)
SET IDENTITY_INSERT [dbo].[Cinema_User] OFF
/****** Object:  Table [dbo].[Cinema_WorkingPlan]    Script Date: 02/18/2018 16:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema_WorkingPlan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_nv] [int] NOT NULL,
	[check_in] [int] NOT NULL,
	[check_out] [int] NOT NULL,
	[actual_wkd] [int] NOT NULL,
	[standard_salary] [int] NOT NULL,
 CONSTRAINT [PK_Cinema_WorkingPlan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinema_Ticket]    Script Date: 02/18/2018 16:50:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema_Ticket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_pc] [int] NOT NULL,
	[id_sc] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[id_type_tick] [int] NOT NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_Cinema_Ticket] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id_pc] ASC,
	[id_sc] ASC,
	[id_user] ASC,
	[id_type_tick] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Cinema_Staff_Cinema_Type_Staff]    Script Date: 02/18/2018 16:50:09 ******/
ALTER TABLE [dbo].[Cinema_Staff]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_Staff_Cinema_Type_Staff] FOREIGN KEY([type_staff])
REFERENCES [dbo].[Cinema_Type_Staff] ([id_type_staff])
GO
ALTER TABLE [dbo].[Cinema_Staff] CHECK CONSTRAINT [FK_Cinema_Staff_Cinema_Type_Staff]
GO
/****** Object:  ForeignKey [FK_Cinema_FilmTypeFilm_Cinema_Film]    Script Date: 02/18/2018 16:50:09 ******/
ALTER TABLE [dbo].[Cinema_FilmTypeFilm]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_FilmTypeFilm_Cinema_Film] FOREIGN KEY([id_film])
REFERENCES [dbo].[Cinema_Film] ([id])
GO
ALTER TABLE [dbo].[Cinema_FilmTypeFilm] CHECK CONSTRAINT [FK_Cinema_FilmTypeFilm_Cinema_Film]
GO
/****** Object:  ForeignKey [FK_Cinema_FilmTypeFilm_Cinema_TypeFilm]    Script Date: 02/18/2018 16:50:09 ******/
ALTER TABLE [dbo].[Cinema_FilmTypeFilm]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_FilmTypeFilm_Cinema_TypeFilm] FOREIGN KEY([id_typefilm])
REFERENCES [dbo].[Cinema_TypeFilm] ([id])
GO
ALTER TABLE [dbo].[Cinema_FilmTypeFilm] CHECK CONSTRAINT [FK_Cinema_FilmTypeFilm_Cinema_TypeFilm]
GO
/****** Object:  ForeignKey [FK_Cinema_User_Cinema_Usertype]    Script Date: 02/18/2018 16:50:09 ******/
ALTER TABLE [dbo].[Cinema_User]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_User_Cinema_Usertype] FOREIGN KEY([type])
REFERENCES [dbo].[Cinema_Usertype] ([id])
GO
ALTER TABLE [dbo].[Cinema_User] CHECK CONSTRAINT [FK_Cinema_User_Cinema_Usertype]
GO
/****** Object:  ForeignKey [FK_Cinema_WorkingPlan_Cinema_Staff]    Script Date: 02/18/2018 16:50:09 ******/
ALTER TABLE [dbo].[Cinema_WorkingPlan]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_WorkingPlan_Cinema_Staff] FOREIGN KEY([id_nv])
REFERENCES [dbo].[Cinema_Staff] ([id])
GO
ALTER TABLE [dbo].[Cinema_WorkingPlan] CHECK CONSTRAINT [FK_Cinema_WorkingPlan_Cinema_Staff]
GO
/****** Object:  ForeignKey [FK_Cinema_Ticket_Cinema_Room]    Script Date: 02/18/2018 16:50:09 ******/
ALTER TABLE [dbo].[Cinema_Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_Ticket_Cinema_Room] FOREIGN KEY([id_pc])
REFERENCES [dbo].[Cinema_Room] ([id])
GO
ALTER TABLE [dbo].[Cinema_Ticket] CHECK CONSTRAINT [FK_Cinema_Ticket_Cinema_Room]
GO
/****** Object:  ForeignKey [FK_Cinema_Ticket_Cinema_Showtime]    Script Date: 02/18/2018 16:50:09 ******/
ALTER TABLE [dbo].[Cinema_Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_Ticket_Cinema_Showtime] FOREIGN KEY([id_sc])
REFERENCES [dbo].[Cinema_Showtime] ([id])
GO
ALTER TABLE [dbo].[Cinema_Ticket] CHECK CONSTRAINT [FK_Cinema_Ticket_Cinema_Showtime]
GO
/****** Object:  ForeignKey [FK_Cinema_Ticket_Cinema_TypeTick]    Script Date: 02/18/2018 16:50:09 ******/
ALTER TABLE [dbo].[Cinema_Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_Ticket_Cinema_TypeTick] FOREIGN KEY([id_type_tick])
REFERENCES [dbo].[Cinema_TypeTick] ([id])
GO
ALTER TABLE [dbo].[Cinema_Ticket] CHECK CONSTRAINT [FK_Cinema_Ticket_Cinema_TypeTick]
GO
/****** Object:  ForeignKey [FK_Cinema_Ticket_Cinema_User]    Script Date: 02/18/2018 16:50:09 ******/
ALTER TABLE [dbo].[Cinema_Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_Ticket_Cinema_User] FOREIGN KEY([id_user])
REFERENCES [dbo].[Cinema_User] ([id])
GO
ALTER TABLE [dbo].[Cinema_Ticket] CHECK CONSTRAINT [FK_Cinema_Ticket_Cinema_User]
GO
