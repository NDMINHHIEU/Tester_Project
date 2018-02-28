USE [master]
GO
/****** Object:  Database [Cinema]    Script Date: 02/24/2018 09:47:29 ******/
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
/****** Object:  Table [dbo].[Cinema_Showtime]    Script Date: 02/24/2018 09:47:30 ******/
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
SET IDENTITY_INSERT [dbo].[Cinema_Showtime] ON
INSERT [dbo].[Cinema_Showtime] ([id], [name], [start], [end]) VALUES (1, N'14h30', CAST(0x0700E49F89790000 AS Time), CAST(0x070080461C860000 AS Time))
INSERT [dbo].[Cinema_Showtime] ([id], [name], [start], [end]) VALUES (2, N'9h30', CAST(0x0700A8E76F4B0000 AS Time), CAST(0x07007870335C0000 AS Time))
SET IDENTITY_INSERT [dbo].[Cinema_Showtime] OFF
/****** Object:  Table [dbo].[Cinema_Room]    Script Date: 02/24/2018 09:47:30 ******/
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
SET IDENTITY_INSERT [dbo].[Cinema_Room] ON
INSERT [dbo].[Cinema_Room] ([id], [name], [numberseat], [status]) VALUES (1, N'Phong 1', 120, N'active')
INSERT [dbo].[Cinema_Room] ([id], [name], [numberseat], [status]) VALUES (2, N'Phong 2', 114, N'active')
INSERT [dbo].[Cinema_Room] ([id], [name], [numberseat], [status]) VALUES (3, N'Phong 3', 120, N'reparing')
SET IDENTITY_INSERT [dbo].[Cinema_Room] OFF
/****** Object:  Table [dbo].[Cinema_Popcorn]    Script Date: 02/24/2018 09:47:30 ******/
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
/****** Object:  Table [dbo].[Cinema_Film]    Script Date: 02/24/2018 09:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinema_Film](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[id_type_film] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cinema_Film] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cinema_Film] ON
INSERT [dbo].[Cinema_Film] ([id], [name], [description], [id_type_film]) VALUES (1, N'Ac quy luc nua dem', N'Ác quỷ lúc nửa đêm', N'1,3,')
SET IDENTITY_INSERT [dbo].[Cinema_Film] OFF
/****** Object:  Table [dbo].[Cinema_TypeTick]    Script Date: 02/24/2018 09:47:30 ******/
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
SET IDENTITY_INSERT [dbo].[Cinema_TypeTick] ON
INSERT [dbo].[Cinema_TypeTick] ([id], [name], [discount], [prize]) VALUES (1, N'nor', 0, 90000)
INSERT [dbo].[Cinema_TypeTick] ([id], [name], [discount], [prize]) VALUES (2, N'vip1', 0.1, 120000)
SET IDENTITY_INSERT [dbo].[Cinema_TypeTick] OFF
/****** Object:  Table [dbo].[Cinema_TypeFilm]    Script Date: 02/24/2018 09:47:30 ******/
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
SET IDENTITY_INSERT [dbo].[Cinema_TypeFilm] ON
INSERT [dbo].[Cinema_TypeFilm] ([id], [name], [description]) VALUES (1, N'Action', N'Hanh dong')
INSERT [dbo].[Cinema_TypeFilm] ([id], [name], [description]) VALUES (2, N'Drama', N'Doi Thuong')
INSERT [dbo].[Cinema_TypeFilm] ([id], [name], [description]) VALUES (3, N'Horror', N'Kinh Di')
SET IDENTITY_INSERT [dbo].[Cinema_TypeFilm] OFF
/****** Object:  Table [dbo].[Cinema_Type_Staff]    Script Date: 02/24/2018 09:47:30 ******/
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
SET IDENTITY_INSERT [dbo].[Cinema_Type_Staff] ON
INSERT [dbo].[Cinema_Type_Staff] ([id_type_staff], [name]) VALUES (1, N'manager')
INSERT [dbo].[Cinema_Type_Staff] ([id_type_staff], [name]) VALUES (2, N'sale_tick')
INSERT [dbo].[Cinema_Type_Staff] ([id_type_staff], [name]) VALUES (3, N'sale_pop')
SET IDENTITY_INSERT [dbo].[Cinema_Type_Staff] OFF
/****** Object:  Table [dbo].[Cinema_TrackingLogin]    Script Date: 02/24/2018 09:47:30 ******/
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
SET IDENTITY_INSERT [dbo].[Cinema_TrackingLogin] ON
INSERT [dbo].[Cinema_TrackingLogin] ([id], [name], [time_created], [duration_expired], [username]) VALUES (1, N'admin_1519066178', CAST(0x0000A88C013645FA AS DateTime), CAST(0x0000A88C013A64AA AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[Cinema_TrackingLogin] OFF
/****** Object:  Table [dbo].[Cinema_Usertype]    Script Date: 02/24/2018 09:47:30 ******/
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
/****** Object:  Table [dbo].[Cinema_User]    Script Date: 02/24/2018 09:47:30 ******/
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
/****** Object:  Table [dbo].[Cinema_Staff]    Script Date: 02/24/2018 09:47:30 ******/
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
SET IDENTITY_INSERT [dbo].[Cinema_Staff] ON
INSERT [dbo].[Cinema_Staff] ([id], [type_staff], [name], [phone], [address]) VALUES (1, 1, N'Nguyễn A', 123, N'123')
INSERT [dbo].[Cinema_Staff] ([id], [type_staff], [name], [phone], [address]) VALUES (2, 2, N'Trần B', 134, N'134')
INSERT [dbo].[Cinema_Staff] ([id], [type_staff], [name], [phone], [address]) VALUES (3, 3, N'Lê C', 144, N'144')
SET IDENTITY_INSERT [dbo].[Cinema_Staff] OFF
/****** Object:  Table [dbo].[Cinema_Ticket]    Script Date: 02/24/2018 09:47:30 ******/
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
	[id_film] [int] NOT NULL,
	[id_nv] [int] NOT NULL,
	[created_date] [datetime] NULL,
 CONSTRAINT [PK_Cinema_Ticket] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id_pc] ASC,
	[id_sc] ASC,
	[id_user] ASC,
	[id_type_tick] ASC,
	[id_film] ASC,
	[id_nv] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cinema_Ticket] ON
INSERT [dbo].[Cinema_Ticket] ([id], [id_pc], [id_sc], [id_user], [id_type_tick], [id_film], [id_nv], [created_date]) VALUES (2, 1, 1, 1, 1, 1, 1, CAST(0x0000A89100A4CB80 AS DateTime))
SET IDENTITY_INSERT [dbo].[Cinema_Ticket] OFF
/****** Object:  Table [dbo].[Cinema_WorkingPlan]    Script Date: 02/24/2018 09:47:30 ******/
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
/****** Object:  View [dbo].[get_ticket]    Script Date: 02/24/2018 09:47:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[get_ticket]
AS
SELECT     dbo.Cinema_Ticket.id, dbo.Cinema_Ticket.id_pc, dbo.Cinema_Ticket.id_sc, dbo.Cinema_Ticket.id_user, dbo.Cinema_Ticket.id_type_tick, dbo.Cinema_Ticket.id_film, 
                      dbo.Cinema_Room.name AS PC_Name, dbo.Cinema_Showtime.name AS SC_Name, dbo.Cinema_User.username, dbo.Cinema_TypeTick.name AS TT_Name, dbo.Cinema_Film.name AS FI_Name, 
                      dbo.Cinema_Ticket.created_date, dbo.Cinema_Ticket.id_nv, dbo.Cinema_Staff.name AS ST_Name
FROM         dbo.Cinema_Film INNER JOIN
                      dbo.Cinema_Ticket ON dbo.Cinema_Film.id = dbo.Cinema_Ticket.id_film INNER JOIN
                      dbo.Cinema_Showtime ON dbo.Cinema_Ticket.id_sc = dbo.Cinema_Showtime.id INNER JOIN
                      dbo.Cinema_Room ON dbo.Cinema_Ticket.id_pc = dbo.Cinema_Room.id INNER JOIN
                      dbo.Cinema_TypeTick ON dbo.Cinema_Ticket.id_type_tick = dbo.Cinema_TypeTick.id INNER JOIN
                      dbo.Cinema_User ON dbo.Cinema_Ticket.id_user = dbo.Cinema_User.id INNER JOIN
                      dbo.Cinema_Staff ON dbo.Cinema_Ticket.id_nv = dbo.Cinema_Staff.id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Cinema_Film"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 111
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cinema_Ticket"
            Begin Extent = 
               Top = 6
               Left = 632
               Bottom = 126
               Right = 792
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Cinema_Showtime"
            Begin Extent = 
               Top = 168
               Left = 532
               Bottom = 288
               Right = 692
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cinema_Room"
            Begin Extent = 
               Top = 135
               Left = 65
               Bottom = 255
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cinema_TypeTick"
            Begin Extent = 
               Top = 6
               Left = 830
               Bottom = 126
               Right = 990
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cinema_User"
            Begin Extent = 
               Top = 123
               Left = 333
               Bottom = 243
               Right = 493
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cinema_Staff"
            Begin Extent = 
               Top = 144
               Left = 829
               Bottom = 264
               Right = 989
          ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_ticket'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_ticket'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_ticket'
GO
/****** Object:  ForeignKey [FK_Cinema_User_Cinema_Usertype]    Script Date: 02/24/2018 09:47:30 ******/
ALTER TABLE [dbo].[Cinema_User]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_User_Cinema_Usertype] FOREIGN KEY([type])
REFERENCES [dbo].[Cinema_Usertype] ([id])
GO
ALTER TABLE [dbo].[Cinema_User] CHECK CONSTRAINT [FK_Cinema_User_Cinema_Usertype]
GO
/****** Object:  ForeignKey [FK_Cinema_Staff_Cinema_Type_Staff]    Script Date: 02/24/2018 09:47:30 ******/
ALTER TABLE [dbo].[Cinema_Staff]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_Staff_Cinema_Type_Staff] FOREIGN KEY([type_staff])
REFERENCES [dbo].[Cinema_Type_Staff] ([id_type_staff])
GO
ALTER TABLE [dbo].[Cinema_Staff] CHECK CONSTRAINT [FK_Cinema_Staff_Cinema_Type_Staff]
GO
/****** Object:  ForeignKey [FK_Cinema_Ticket_Cinema_Film]    Script Date: 02/24/2018 09:47:30 ******/
ALTER TABLE [dbo].[Cinema_Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_Ticket_Cinema_Film] FOREIGN KEY([id_film])
REFERENCES [dbo].[Cinema_Film] ([id])
GO
ALTER TABLE [dbo].[Cinema_Ticket] CHECK CONSTRAINT [FK_Cinema_Ticket_Cinema_Film]
GO
/****** Object:  ForeignKey [FK_Cinema_Ticket_Cinema_Room]    Script Date: 02/24/2018 09:47:30 ******/
ALTER TABLE [dbo].[Cinema_Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_Ticket_Cinema_Room] FOREIGN KEY([id_pc])
REFERENCES [dbo].[Cinema_Room] ([id])
GO
ALTER TABLE [dbo].[Cinema_Ticket] CHECK CONSTRAINT [FK_Cinema_Ticket_Cinema_Room]
GO
/****** Object:  ForeignKey [FK_Cinema_Ticket_Cinema_Showtime]    Script Date: 02/24/2018 09:47:30 ******/
ALTER TABLE [dbo].[Cinema_Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_Ticket_Cinema_Showtime] FOREIGN KEY([id_sc])
REFERENCES [dbo].[Cinema_Showtime] ([id])
GO
ALTER TABLE [dbo].[Cinema_Ticket] CHECK CONSTRAINT [FK_Cinema_Ticket_Cinema_Showtime]
GO
/****** Object:  ForeignKey [FK_Cinema_Ticket_Cinema_Staff]    Script Date: 02/24/2018 09:47:30 ******/
ALTER TABLE [dbo].[Cinema_Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_Ticket_Cinema_Staff] FOREIGN KEY([id_nv])
REFERENCES [dbo].[Cinema_Staff] ([id])
GO
ALTER TABLE [dbo].[Cinema_Ticket] CHECK CONSTRAINT [FK_Cinema_Ticket_Cinema_Staff]
GO
/****** Object:  ForeignKey [FK_Cinema_Ticket_Cinema_TypeTick]    Script Date: 02/24/2018 09:47:30 ******/
ALTER TABLE [dbo].[Cinema_Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_Ticket_Cinema_TypeTick] FOREIGN KEY([id_type_tick])
REFERENCES [dbo].[Cinema_TypeTick] ([id])
GO
ALTER TABLE [dbo].[Cinema_Ticket] CHECK CONSTRAINT [FK_Cinema_Ticket_Cinema_TypeTick]
GO
/****** Object:  ForeignKey [FK_Cinema_Ticket_Cinema_User]    Script Date: 02/24/2018 09:47:30 ******/
ALTER TABLE [dbo].[Cinema_Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_Ticket_Cinema_User] FOREIGN KEY([id_user])
REFERENCES [dbo].[Cinema_User] ([id])
GO
ALTER TABLE [dbo].[Cinema_Ticket] CHECK CONSTRAINT [FK_Cinema_Ticket_Cinema_User]
GO
/****** Object:  ForeignKey [FK_Cinema_WorkingPlan_Cinema_Staff]    Script Date: 02/24/2018 09:47:30 ******/
ALTER TABLE [dbo].[Cinema_WorkingPlan]  WITH CHECK ADD  CONSTRAINT [FK_Cinema_WorkingPlan_Cinema_Staff] FOREIGN KEY([id_nv])
REFERENCES [dbo].[Cinema_Staff] ([id])
GO
ALTER TABLE [dbo].[Cinema_WorkingPlan] CHECK CONSTRAINT [FK_Cinema_WorkingPlan_Cinema_Staff]
GO
