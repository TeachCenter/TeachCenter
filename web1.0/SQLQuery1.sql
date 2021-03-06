USE [master]
GO
/****** Object:  Database [TeachingCenter]    Script Date: 2017/10/14 13:41:21 ******/
CREATE DATABASE [TeachingCenter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TeachingCenter', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TeachingCenter.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TeachingCenter_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TeachingCenter_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TeachingCenter] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TeachingCenter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TeachingCenter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TeachingCenter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TeachingCenter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TeachingCenter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TeachingCenter] SET ARITHABORT OFF 
GO
ALTER DATABASE [TeachingCenter] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TeachingCenter] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TeachingCenter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TeachingCenter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TeachingCenter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TeachingCenter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TeachingCenter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TeachingCenter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TeachingCenter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TeachingCenter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TeachingCenter] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TeachingCenter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TeachingCenter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TeachingCenter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TeachingCenter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TeachingCenter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TeachingCenter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TeachingCenter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TeachingCenter] SET RECOVERY FULL 
GO
ALTER DATABASE [TeachingCenter] SET  MULTI_USER 
GO
ALTER DATABASE [TeachingCenter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TeachingCenter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TeachingCenter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TeachingCenter] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TeachingCenter', N'ON'
GO
USE [TeachingCenter]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[Activity_id] [int] IDENTITY(1,1) NOT NULL,
	[Activity_title] [nchar](10) NOT NULL,
	[Activity_time] [datetime] NOT NULL,
	[Activity_content] [nvarchar](max) NOT NULL,
	[Activity_place] [nvarchar](10) NOT NULL,
	[Activity_nowcount] [int] NOT NULL,
	[Activity_limitcount] [int] NOT NULL,
	[Activity_categoryid] [int] NOT NULL,
	[Activity_isdeleted] [bigint] NOT NULL,
	[Activity_author] [nvarchar](50) NOT NULL,
	[Activity_hit] [int] NOT NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[Activity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActivityCategory]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityCategory](
	[ActivityCategory_id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityCategory_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ActivityCategory] PRIMARY KEY CLUSTERED 
(
	[ActivityCategory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActivitySummary]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivitySummary](
	[ActivitySummary_id] [int] IDENTITY(1,1) NOT NULL,
	[ActivitySummary_title] [nvarchar](50) NOT NULL,
	[ActivitySummary_time] [datetime] NOT NULL,
	[ActivitySummary_content] [nvarchar](max) NOT NULL,
	[ActivitySummary_isdeleted] [bigint] NOT NULL,
	[ActivitySummary_author] [nvarchar](50) NOT NULL,
	[ActivitySummary_cover] [nvarchar](max) NOT NULL,
	[ActivitySummary_hit] [int] NOT NULL,
 CONSTRAINT [PK_ActivitySummary] PRIMARY KEY CLUSTERED 
(
	[ActivitySummary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActivityTeacher]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityTeacher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[activity_id] [int] NOT NULL,
	[teacher_id] [int] NOT NULL,
 CONSTRAINT [PK_ActivityTeacher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin_id] [nvarchar](50) NOT NULL,
	[Admin_pwd] [nvarchar](50) NOT NULL,
	[Admin_name] [nvarchar](50) NOT NULL,
	[Admin_emai] [nvarchar](100) NOT NULL,
	[Admin_phone] [nvarchar](50) NULL,
	[Admin_birthday] [date] NULL,
	[Admin_emai_check] [bigint] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Develop]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Develop](
	[Develop_id] [int] IDENTITY(1,1) NOT NULL,
	[Develop_title] [nvarchar](50) NOT NULL,
	[Develop_author] [nvarchar](50) NOT NULL,
	[Develop_time] [datetime] NOT NULL,
	[Develop_content] [nvarchar](max) NULL,
	[Develop_link] [nvarchar](max) NULL,
	[Develop_hit] [int] NOT NULL,
	[Develop_deleted] [bigint] NOT NULL,
	[Develop_category] [int] NOT NULL,
	[Develop_path] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Develop] PRIMARY KEY CLUSTERED 
(
	[Develop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DevelopCategory]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DevelopCategory](
	[DevelopCategory_id] [int] IDENTITY(1,1) NOT NULL,
	[DevelopCategory_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DevelopCategory] PRIMARY KEY CLUSTERED 
(
	[DevelopCategory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EducateSource]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducateSource](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[body] [nvarchar](max) NOT NULL,
	[publisher] [nvarchar](20) NOT NULL,
	[publish_time] [nvarchar](20) NOT NULL,
	[view_times] [int] NOT NULL,
	[is_deleted] [int] NULL,
 CONSTRAINT [PK_EducateSource] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Introduction]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Introduction](
	[Introduction_id] [int] NOT NULL,
	[Introduction_content] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Introduction] PRIMARY KEY CLUSTERED 
(
	[Introduction_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JudgeApplication]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JudgeApplication](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[teacher_id] [int] NOT NULL,
	[message] [nvarchar](max) NOT NULL,
	[submit_time] [nchar](10) NOT NULL,
 CONSTRAINT [PK_JudgeApplication] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Picture]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture](
	[Picture_id] [int] IDENTITY(1,1) NOT NULL,
	[Picture_path] [nvarchar](max) NOT NULL,
	[is_top] [int] NOT NULL,
 CONSTRAINT [PK_Picture] PRIMARY KEY CLUSTERED 
(
	[Picture_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[project_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[category] [int] NOT NULL,
	[teacher_id] [int] NOT NULL,
	[submit_time] [nvarchar](50) NOT NULL,
	[fund] [nchar](10) NULL,
	[is_deleted] [int] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectCategory]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[project_file] [nvarchar](max) NOT NULL,
	[project_content] [nvarchar](max) NOT NULL,
	[stage] [int] NOT NULL,
	[end_time] [nvarchar](50) NOT NULL,
	[judge_end_time] [nvarchar](50) NOT NULL,
	[is_deleted] [int] NOT NULL,
	[publish_time] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProjectCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectJudge]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectJudge](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NOT NULL,
	[category] [int] NOT NULL,
	[teacher_id] [int] NOT NULL,
	[judge_id] [int] NOT NULL,
	[judge_name] [nvarchar](50) NOT NULL,
	[stage] [int] NOT NULL,
	[comment] [nvarchar](50) NOT NULL,
	[is_pass] [int] NOT NULL,
 CONSTRAINT [PK_ProjectJudge] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectStage]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectStage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NOT NULL,
	[project_file] [nvarchar](max) NULL,
	[project_content] [nvarchar](max) NULL,
	[stage] [int] NOT NULL,
	[time] [nvarchar](50) NOT NULL,
	[is_pass] [int] NOT NULL,
 CONSTRAINT [PK_ProjectStage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Service_id] [int] IDENTITY(1,1) NOT NULL,
	[Service_teacher] [int] NOT NULL,
	[Service_time] [datetime] NOT NULL,
	[Service_phone] [nvarchar](20) NOT NULL,
	[Service_remarks] [nvarchar](max) NULL,
	[Service_category] [int] NOT NULL,
	[Service_isdeal] [int] NOT NULL,
	[Service_isdeleted] [bigint] NOT NULL,
	[Service_hit] [int] NOT NULL,
	[Service_author] [nchar](20) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceCategory]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceCategory](
	[ServiceCategory_id] [int] IDENTITY(1,1) NOT NULL,
	[ServiceCategory_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ServiceCategory] PRIMARY KEY CLUSTERED 
(
	[ServiceCategory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[image] [nvarchar](50) NOT NULL,
	[gender] [int] NOT NULL,
	[email] [nvarchar](30) NOT NULL,
	[number] [nvarchar](20) NOT NULL,
	[phone_number] [nvarchar](15) NOT NULL,
	[department] [nvarchar](10) NOT NULL,
	[rank] [nvarchar](10) NOT NULL,
	[is_judge] [int] NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ApplicationInfo]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ApplicationInfo]
AS
SELECT  dbo.Teacher.id, dbo.Teacher.name, dbo.Teacher.gender, dbo.Teacher.department, dbo.Teacher.rank, 
                   dbo.JudgeApplication.message, dbo.JudgeApplication.submit_time
FROM      dbo.JudgeApplication INNER JOIN
                   dbo.Teacher ON dbo.JudgeApplication.teacher_id = dbo.Teacher.id



GO
/****** Object:  View [dbo].[ProjectInfo]    Script Date: 2017/10/14 13:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProjectInfo]
AS
SELECT  dbo.Project.project_id, dbo.Project.name, dbo.ProjectCategory.name AS category_name, 
                   dbo.Teacher.name AS teacher_name, dbo.Project.submit_time, dbo.Project.category, dbo.Project.is_deleted
FROM      dbo.Project INNER JOIN
                   dbo.ProjectCategory ON dbo.Project.category = dbo.ProjectCategory.id INNER JOIN
                   dbo.Teacher ON dbo.Project.teacher_id = dbo.Teacher.id


GO
ALTER TABLE [dbo].[Activity] ADD  CONSTRAINT [DF_Activity_Activity_nowcount]  DEFAULT ((0)) FOR [Activity_nowcount]
GO
ALTER TABLE [dbo].[Activity] ADD  CONSTRAINT [DF_Activity_Activity_isdeleted]  DEFAULT ((0)) FOR [Activity_isdeleted]
GO
ALTER TABLE [dbo].[Activity] ADD  CONSTRAINT [DF_Activity_Activity_hit]  DEFAULT ((0)) FOR [Activity_hit]
GO
ALTER TABLE [dbo].[ActivitySummary] ADD  CONSTRAINT [DF_ActivitySummary_ActivitySummary_isdeleted]  DEFAULT ((0)) FOR [ActivitySummary_isdeleted]
GO
ALTER TABLE [dbo].[ActivitySummary] ADD  CONSTRAINT [DF_ActivitySummary_ActivitySummary_hit]  DEFAULT ((0)) FOR [ActivitySummary_hit]
GO
ALTER TABLE [dbo].[Admin] ADD  CONSTRAINT [DF_Admin_Admin_emai_check]  DEFAULT ((0)) FOR [Admin_emai_check]
GO
ALTER TABLE [dbo].[Develop] ADD  CONSTRAINT [DF_Develop_Develop_deleted]  DEFAULT ((0)) FOR [Develop_deleted]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_Service_isdeal]  DEFAULT ((0)) FOR [Service_isdeal]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_Service_isdeleted]  DEFAULT ((0)) FOR [Service_isdeleted]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_Service_hit]  DEFAULT ((0)) FOR [Service_hit]
GO
ALTER TABLE [dbo].[Activity]  WITH CHECK ADD  CONSTRAINT [FK_Activity_ActivityCategory] FOREIGN KEY([Activity_categoryid])
REFERENCES [dbo].[ActivityCategory] ([ActivityCategory_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Activity] CHECK CONSTRAINT [FK_Activity_ActivityCategory]
GO
ALTER TABLE [dbo].[ActivityTeacher]  WITH CHECK ADD  CONSTRAINT [FK_ActivityTeacher_Activity] FOREIGN KEY([activity_id])
REFERENCES [dbo].[Activity] ([Activity_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActivityTeacher] CHECK CONSTRAINT [FK_ActivityTeacher_Activity]
GO
ALTER TABLE [dbo].[ActivityTeacher]  WITH CHECK ADD  CONSTRAINT [FK_ActivityTeacher_Teacher] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[Teacher] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActivityTeacher] CHECK CONSTRAINT [FK_ActivityTeacher_Teacher]
GO
ALTER TABLE [dbo].[Develop]  WITH CHECK ADD  CONSTRAINT [FK_Develop_DevelopCategory] FOREIGN KEY([Develop_category])
REFERENCES [dbo].[DevelopCategory] ([DevelopCategory_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Develop] CHECK CONSTRAINT [FK_Develop_DevelopCategory]
GO
ALTER TABLE [dbo].[JudgeApplication]  WITH CHECK ADD  CONSTRAINT [FK_JudgeApplication_Teacher] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[Teacher] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JudgeApplication] CHECK CONSTRAINT [FK_JudgeApplication_Teacher]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_ProjectCategory] FOREIGN KEY([category])
REFERENCES [dbo].[ProjectCategory] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_ProjectCategory]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Teacher] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[Teacher] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Teacher]
GO
ALTER TABLE [dbo].[ProjectJudge]  WITH CHECK ADD  CONSTRAINT [FK_ProjectJudge_Project] FOREIGN KEY([project_id])
REFERENCES [dbo].[Project] ([project_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProjectJudge] CHECK CONSTRAINT [FK_ProjectJudge_Project]
GO
ALTER TABLE [dbo].[ProjectStage]  WITH CHECK ADD  CONSTRAINT [FK_ProjectStage_Project] FOREIGN KEY([project_id])
REFERENCES [dbo].[Project] ([project_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProjectStage] CHECK CONSTRAINT [FK_ProjectStage_Project]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_ServiceCategory] FOREIGN KEY([Service_category])
REFERENCES [dbo].[ServiceCategory] ([ServiceCategory_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_ServiceCategory]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Teacher] FOREIGN KEY([Service_teacher])
REFERENCES [dbo].[Teacher] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Teacher]
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
         Begin Table = "JudgeApplication"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Teacher"
            Begin Extent = 
               Top = 7
               Left = 281
               Bottom = 170
               Right = 487
            End
            DisplayFlags = 280
            TopColumn = 7
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ApplicationInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ApplicationInfo'
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
         Begin Table = "Project"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 233
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "ProjectCategory"
            Begin Extent = 
               Top = 7
               Left = 281
               Bottom = 170
               Right = 493
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Teacher"
            Begin Extent = 
               Top = 7
               Left = 541
               Bottom = 170
               Right = 747
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProjectInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProjectInfo'
GO
USE [master]
GO
ALTER DATABASE [TeachingCenter] SET  READ_WRITE 
GO
