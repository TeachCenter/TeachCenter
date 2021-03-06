USE [master]
GO
/****** Object:  Database [TeachingCenter]    Script Date: 2018/6/2 19:29:24 ******/
CREATE DATABASE [TeachingCenter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TeachingCenter', FILENAME = N'C:\Users\LIANG\TeachingCenter.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TeachingCenter_log', FILENAME = N'C:\Users\LIANG\TeachingCenter_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
USE [TeachingCenter]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 2018/6/2 19:29:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[Activity_id] [int] IDENTITY(1,1) NOT NULL,
	[Activity_title] [nvarchar](50) NOT NULL,
	[Activity_time] [datetime] NOT NULL,
	[Activity_content] [nvarchar](max) NOT NULL,
	[Activity_place] [nvarchar](30) NOT NULL,
	[Activity_nowcount] [int] NOT NULL,
	[Activity_limitcount] [int] NOT NULL,
	[Activity_categoryid] [int] NOT NULL,
	[Activity_isdeleted] [bigint] NOT NULL,
	[Activity_author] [nvarchar](50) NOT NULL,
	[Activity_hit] [int] NOT NULL,
	[Activity_deletedtime] [datetime] NULL,
	[Activity_summary] [nvarchar](200) NOT NULL,
	[Activity_hold_time] [datetime] NOT NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[Activity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActivityCategory]    Script Date: 2018/6/2 19:29:25 ******/
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
/****** Object:  Table [dbo].[ActivitySummary]    Script Date: 2018/6/2 19:29:25 ******/
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
	[ActivitySummary_deletedtime] [datetime] NULL,
	[ActivitySummary_summary] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ActivitySummary] PRIMARY KEY CLUSTERED 
(
	[ActivitySummary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActivityTeacher]    Script Date: 2018/6/2 19:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityTeacher](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[activity_id] [int] NOT NULL,
	[teacher_id] [int] NOT NULL,
 CONSTRAINT [PK_ActivityTeacher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2018/6/2 19:29:25 ******/
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
/****** Object:  Table [dbo].[Develop]    Script Date: 2018/6/2 19:29:25 ******/
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
	[Develop_deteledtime] [datetime] NULL,
	[Develop_summary] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Develop] PRIMARY KEY CLUSTERED 
(
	[Develop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DevelopCategory]    Script Date: 2018/6/2 19:29:25 ******/
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
/****** Object:  Table [dbo].[EducateSource]    Script Date: 2018/6/2 19:29:25 ******/
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
	[is_deleted] [int] NOT NULL,
	[deletedtime] [datetime] NULL,
	[summary] [nvarchar](200) NOT NULL,
	[category] [int] NOT NULL,
 CONSTRAINT [PK_EducateSource] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FriendsLink]    Script Date: 2018/6/2 19:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FriendsLink](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](10) NOT NULL,
	[link] [nvarchar](100) NOT NULL,
	[orders] [int] NOT NULL,
 CONSTRAINT [PK_FriendsLink] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Introduction]    Script Date: 2018/6/2 19:29:25 ******/
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
/****** Object:  Table [dbo].[JudgeApplication]    Script Date: 2018/6/2 19:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JudgeApplication](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[teacher_id] [int] NOT NULL,
	[submit_time] [nchar](10) NOT NULL,
 CONSTRAINT [PK_JudgeApplication] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PasswordCode]    Script Date: 2018/6/2 19:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PasswordCode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[teacher_number] [nvarchar](20) NOT NULL,
	[code] [nvarchar](10) NOT NULL,
	[send_time] [datetime] NOT NULL,
 CONSTRAINT [PK_PasswordCode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Picture]    Script Date: 2018/6/2 19:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture](
	[Picture_id] [int] IDENTITY(1,1) NOT NULL,
	[Picture_path] [nvarchar](max) NOT NULL,
	[is_top] [int] NOT NULL,
	[Picture_title] [nvarchar](100) NOT NULL,
	[Picture_link] [nvarchar](200) NOT NULL,
	[Picture_summary] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Picture] PRIMARY KEY CLUSTERED 
(
	[Picture_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProCatCategory]    Script Date: 2018/6/2 19:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProCatCategory](
	[ProCatCategory_id] [int] IDENTITY(1,1) NOT NULL,
	[ProCatCategory_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProCatCategory] PRIMARY KEY CLUSTERED 
(
	[ProCatCategory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 2018/6/2 19:29:25 ******/
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
	[fund] [nchar](10) NOT NULL,
	[is_deleted] [int] NOT NULL,
	[deletedtime] [datetime] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectCategory]    Script Date: 2018/6/2 19:29:25 ******/
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
	[publish_time] [nvarchar](50) NOT NULL,
	[deletedtime] [datetime] NULL,
	[summary] [nvarchar](200) NOT NULL,
	[category] [int] NOT NULL,
 CONSTRAINT [PK_ProjectCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectJudge]    Script Date: 2018/6/2 19:29:25 ******/
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
	[stage] [int] NOT NULL,
	[comment] [nvarchar](50) NOT NULL,
	[is_pass] [int] NOT NULL,
 CONSTRAINT [PK_ProjectJudge] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectStage]    Script Date: 2018/6/2 19:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectStage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NOT NULL,
	[project_file] [nvarchar](max) NOT NULL,
	[project_content] [nvarchar](max) NOT NULL,
	[stage] [int] NOT NULL,
	[time] [nvarchar](50) NOT NULL,
	[is_pass] [int] NOT NULL,
 CONSTRAINT [PK_ProjectStage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service]    Script Date: 2018/6/2 19:29:25 ******/
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
	[Service_deletedtime] [datetime] NULL,
	[Service_reply] [nvarchar](50) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceCategory]    Script Date: 2018/6/2 19:29:25 ******/
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
/****** Object:  Table [dbo].[SourceCategory]    Script Date: 2018/6/2 19:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SourceCategory](
	[SourceCategory_id] [int] IDENTITY(1,1) NOT NULL,
	[SourceCategory_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SourceCategory] PRIMARY KEY CLUSTERED 
(
	[SourceCategory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 2018/6/2 19:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[gender] [int] NOT NULL,
	[email] [nvarchar](30) NOT NULL,
	[number] [nvarchar](20) NOT NULL,
	[phone_number] [nvarchar](15) NOT NULL,
	[department] [nvarchar](50) NOT NULL,
	[rank] [nvarchar](10) NOT NULL,
	[is_judge] [int] NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ApplicationInfo]    Script Date: 2018/6/2 19:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ApplicationInfo]
AS
SELECT      dbo.Teacher.id, dbo.Teacher.name, dbo.Teacher.gender, dbo.Teacher.department, dbo.Teacher.rank, dbo.JudgeApplication.submit_time
FROM         dbo.JudgeApplication INNER JOIN
                   dbo.Teacher ON dbo.JudgeApplication.teacher_id = dbo.Teacher.id



GO
/****** Object:  View [dbo].[ProjectInfo]    Script Date: 2018/6/2 19:29:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProjectInfo]
AS
SELECT  dbo.Project.project_id, dbo.Project.name, dbo.ProjectCategory.name AS category_name, 
                   dbo.Teacher.name AS teacher_name, dbo.Project.submit_time, dbo.Project.category, dbo.Project.is_deleted, 
                   dbo.Project.deletedtime
FROM      dbo.Project INNER JOIN
                   dbo.ProjectCategory ON dbo.Project.category = dbo.ProjectCategory.id INNER JOIN
                   dbo.Teacher ON dbo.Project.teacher_id = dbo.Teacher.id


GO
SET IDENTITY_INSERT [dbo].[Activity] ON 

INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (1, N'活动1       ', CAST(0x0000A80E0093A47C AS DateTime), N'&lt;p&gt;666&lt;/p&gt;', N'4410', 1, 10, 1, 1, N'管理员', 7, CAST(0x0000A82A00EFAC69 AS DateTime), N'123', CAST(0x0000A82A00EFAC69 AS DateTime))
INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (2, N'活动2       ', CAST(0x0000A80E0095FB50 AS DateTime), N'&lt;p&gt;123&lt;/p&gt;', N'阿发', 1, 123, 1, 0, N'管理员', 17, CAST(0x0000A82A00EFAC69 AS DateTime), N'123', CAST(0x0000A82A00EFAC69 AS DateTime))
INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (4, N'活动        ', CAST(0x0000A81500000000 AS DateTime), N'&lt;p&gt;222&lt;/p&gt;', N'12354646', 0, 666, 1, 0, N'管理员', 6, CAST(0x0000A82A00EFAC69 AS DateTime), N'123', CAST(0x0000A82A00EFAC69 AS DateTime))
INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (5, N'活动23      ', CAST(0x0000A80F00000000 AS DateTime), N'&lt;p&gt;123&lt;/p&gt;', N'12354646', 0, 12, 1, 0, N'管理员', 1, CAST(0x0000A82A00EFAC69 AS DateTime), N'123', CAST(0x0000A82A00EFAC69 AS DateTime))
INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (6, N'12312     ', CAST(0x0000A80E015F2B38 AS DateTime), N'&lt;p&gt;1&lt;/p&gt;', N'12354646', 0, 11, 1, 0, N'管理员', 0, CAST(0x0000A82A00EFAC69 AS DateTime), N'123', CAST(0x0000A82A00EFAC69 AS DateTime))
INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (7, N'12312     ', CAST(0x0000A80E015F3CCC AS DateTime), N'&lt;p&gt;1&lt;/p&gt;', N'12354646', 0, 1, 1, 1, N'管理员', 1, CAST(0x0000A8AB010DA242 AS DateTime), N'123', CAST(0x0000A82A00EFAC69 AS DateTime))
INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (8, N'2424      ', CAST(0x0000A80E015F7AE8 AS DateTime), N'&lt;p&gt;1&lt;/p&gt;', N'12354646', 0, 1, 1, 0, N'管理员', 10, NULL, N'312', CAST(0x0000A82A00EFAC69 AS DateTime))
INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (9, N'“教育技术”系列工作坊——微信公众号运营那些事', CAST(0x0000A81700000000 AS DateTime), N'&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;各省、自治区、直辖市教育厅（教委），新疆生产建设兵团教育局，有关部门（单位）教育司（局）,部属各高等学校：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　近年来，大规模在线开放课程（“慕课”）等新型在线开放课程和学习平台在世界范围迅速兴起，拓展了教学时空，增强了教学吸引力，激发了学习者的学习积极性和自主性，扩大了优质教育资源受益面，正在促进教学内容、方法、模式和教学管理体制机制发生变革，给高等教育教育教学改革发展带来新的机遇和挑战。为加快推进适合我国国情的在线开放课程和平台建设，促进课程应用，加强组织管理，现提出以下意见。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;一、总体要求&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　（一）指导思想&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　以邓小平理论、“三个代表”重要思想、科学发展观为指导，深入贯彻习近平总书记系列重要讲话精神，坚持培育和践行社会主义核心价值观，落实教育规划纲要和《教育信息化十年发展规划（2011-2020年）》战略部署，紧紧围绕立德树人的根本任务，遵循教育教学规律，深化高等教育教育教学改革，主动适应学习者个性化发展和多样化终身学习需求，立足国情建设在线开放课程和公共服务平台，加强课程建设与公共服务平台运行监管，推动信息技术与教育教学深度融合，促进优质教育资源应用与共享，全面提高教育教学质量。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　（二）基本原则&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　立足自主建设。发挥我国高等教育教学传统优势，借鉴国际先进经验，采取“高校主体、政府支持、社会参与”的方式，集聚优势力量和优质资源，构建具有中国特色在线开放课程体系和公共服务平台。坚持公益性服务为基础，引入竞争机制，建立在线开放课程和平台可持续发展的长效机制。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　注重应用共享。坚持应用驱动、建以致用，着力推动在线开放课程的广泛应用。整合优质教育资源和技术资源，实现课程和平台的多种形式应用与共享，促进教育教学改革和教育制度创新，提高教育教学质量。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　加强规范管理。坚持依法管理，明确学校和平台运行机构的主体责任，强化建设主体的自我管理机制，规范在线开放课程建设、应用、引进和对外推广的工作程序。完善课程内容审查制度，加强教学过程和平台运行监管，防范和制止有害信息传播，保障平台运行稳定和用户、资源等信息安全。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;二、重点任务&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　（一）建设一批以大规模在线开放课程为代表、课程应用与教学服务相融通的优质在线开放课程。支持具有学科专业优势和现代教育技术优势的高校，以大学生文化素质教育课、受众面广量大的公共课和专业核心课程为重点，建设适合网络传播和教学活动的内容质量高、教学效果好的在线开放课程。鼓励高校间通过协同创新和集成创新的方式建设满足不同教学需要、不同学习需求的在线开放课程或课程群。有组织地建设一批高校思想政治理论课等在线开放课程。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　（二）认定一批国家精品在线开放课程。综合考察课程的教学内容与资源、教学设计与方法、教学活动与评价、教学效果与影响、团队支持与服务等要素，采取先建设应用、后评价认定的方式，2017年前认定1000余门国家精品在线开放课程。到2020年，认定3000余门国家精品在线开放课程。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　（三）建设在线开放课程公共服务平台。在具有良好公益性、开放性的国内已运行平台中，通过申报、专家遴选的方式，选择基础良好、技术先进、符合国情、安全稳定、优质课程资源集聚、服务高效的平台，认定为在线开放课程公共服务平台。鼓励公共服务平台之间实现课程资源和应用数据共享，营造开放合作的网络教学与学习空间。鼓励高校使用在线开放课程公共服务平台。高校也可选用适合本校需求的其他国内平台以及小规模专有在线课程平台，开展在线开放课程建设和应用。鼓励公共服务平台与国家开放大学教学平台开展合作，为终身教育提供优质课程。鼓励平台建设方、高校协同建设和运用在线课程大数据，为高校师生和社会学习者提供优质高效的全方位或个性化服务。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　（四）促进在线开放课程广泛应用。鼓励高校结合本校人才培养目标和需求，通过在线学习、在线学习与课堂教学相结合等多种方式应用在线开放课程，不断创新校内、校际课程共享与应用模式。鼓励承担对口支援任务的高校探索通过在线开放课程支援西部受援高校教学，受援高校应积极应用在线开放课程。鼓励在线开放课程公共服务平台在保障公益性的同时，积极探索课程拓展资源与个性化学习服务的市场化运营方式。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　（五）规范在线开放课程的对外推广与引进。对外推广或引进课程应遵守我国教育、中外合作办学、互联网等相关法律法规，履行我国加入世界贸易组织有关教育服务的具体承诺，并择优推荐选择。学校或平台承担课程对外推广或引进课程的直接责任。鼓励通过在线开放课程公共服务平台和境外平台积极对外推广我国优质课程。鼓励优先引进反映学科发展前沿且具有先进的教育理念和教育经验的自然科学、工程与技术科学等学科优质课程。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　（六）加强在线开放课程建设应用的师资和技术人员培训。依托高校、相关机构、专家组织和在线开放课程公共服务平台，根据教师、学习者的需求变化和技术发展，开展课程建设、课程应用以及大数据分析应用等培训。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　（七）推进在线开放课程学分认定和学分管理制度创新。鼓励高校制订在线开放课程教学质量认定标准，将通过本校认定的在线课程纳入培养方案和教学计划，并制订在线课程的教学效果评价办法和学生修读在线课程的学分认定办法。在保证教学质量的前提下，鼓励高校开展在线学习、在线学习与课堂教学相结合等多种方式的学分认定、学分转换和学习过程认定。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　三、组织管理&lt;/span&gt;&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　（一）教育部为在线开放课程和公共服务平台的建设提供政策研究、宏观指导和一定的条件支持，协同国家有关部门依据国家网络与信息安全的政策法规履行相应的管理职能。推动有关专家组织和机构开展在线开放课程理论、教学模式与学习方式、课程共享模式、核心技术等研究。组织公共服务平台遴选。组织“国家精品在线开放课程”认定，并对课程建设予以支持。通过使用评价、定期检查等方式，对国家精品在线开放课程的在线运行、实际应用、教学效果等进行跟踪监测和综合评价。对在线开放课程公共服务平台的网络安全、内容安全、数据安全、运行及服务进行规范管理。省级教育行政部门要鼓励在线开放课程在本区域的建设和应用，给予相应的政策支持，加强对课程建设和平台的监管。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　（二）高校应切实承担在线开放课程建设应用与管理的主体责任。高校领导要深刻认识信息技术高速发展对教育教学的影响，将建设和使用在线开放课程作为推进教育教学改革的重要举措，着力提升广大教师将信息技术与高等教育深度融合的意识、水平和能力，把在线开放课程作为课堂教学的重要补充，根据本校实际建立在线开放课程教学与学习的管理、激励和评价机制，培育一批导向正确、影响力大的网络教学名师。探索建立高校内部或高校之间具备考核标准的在线学习认证和学分认定机制，积极探索并推进在线开放课程的应用，加强课程选用管理及学分管理，确保教学应用质量。课程建设高校作为课程内容和教学活动的责任主体，要将社会主义核心价值观融入课程建设，建立和实施课程建设、质量审查、课程运行保障和效果测评等制度，不断提高课程质量。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　（三）在线开放课程公共服务平台建设方要切实承担课程服务和数据安全保障的主体责任。要严格遵守国家网络与信息安全管理规范，依法依规开展活动，为高校师生和社会学习者提供优质高效的全方位、个性化服务，建立全方位安全保障体系，实施对课程内容、讨论内容、学习过程内容的有效监管，防范和及时制止网络有害信息的传播。要高度重视知识产权保障，与高校、课程建设团队签订平等互利的知识产权保障协议，明确各方权利和义务，切实保障各方权益。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; white-space: normal; line-height: 2em; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;　　（四）省级教育行政部门、高校根据本意见，结合本区域、本校实际，对在线开放课程的建设、应用与管理制订实施办法。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', N'信息科学与工程学院', 1, 10, 1, 0, N'管理员', 39, NULL, N'121233', CAST(0x0000A82A00EFAC69 AS DateTime))
INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (10, N'关于组织教师观摩优质课程的说明', CAST(0x0000A80F00000000 AS DateTime), N'&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 32px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;优质课程是指我校在历年教学评估中获得优秀的课程。我校自1986年开始课程教学评估以来，已有近200位教师所授的课程获得优秀等级。这些教师及其教授的课程是向青年教师示范优秀教学的重要载体。2008年开始，我校教学观摩活动将原来的自主观摩与集体教学观摩和研讨活动结合起来并形成制度，现将有关要求说明如下：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 32px;background-color: rgb(255, 255, 255)&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 32px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;1.&lt;/span&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;我校教师观摩优质课程分两种类型：自主观摩和集体观摩与研讨。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 32px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;2.&lt;/span&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;自主观摩由参加教学评估的教师根据学校教学评估常设专家委员办公室每个学期提供的优质课程表自行选择进行听课并填写观摩表。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 32px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;3.&lt;/span&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;集体观摩由学校教学评估常设专家委员办公室负责，根据每学期申报评估的课程性质，从文科和理科优质课程中各选取一门组织教师观摩。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 32px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;4.&lt;/span&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;集体观摩尽力选择时间（两个学时）和空间（有空座位）合适的课程，尽力不影响教师的正常教学秩序并安排听课后两个学时的研讨活动。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 32px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;5.&lt;/span&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;集体观摩的主持人由高教研究与评估中心、教学支持中心的主任、副主任，或学校教学促进专家担任，同时聘请2-3位点评专家，从学科内容以及教学方法等不同视角进行评价，说明教学中的优点以及存在的不足。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 32px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;6.&lt;/span&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;集体观摩后的研讨要鼓励青年教师参与，进一步提高对优秀教学的认识和鉴赏、评价能力，并不断反思自身的教学。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 32px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;7.&lt;/span&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;集体观摩和研讨结束后，由高教研究与评估中心、教学支持中心的有关人员尽快形成行动研究成果，以方便更多的教师学习。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 32px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;8.&lt;/span&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;集体观摩的主持人和所聘请的点评专家，按照学校课程教学评估中所聘请的同行专家听课标准给予报酬。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 32px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;9.&lt;/span&gt;&lt;span style=&quot;color: black;font-size: 19px&quot;&gt;未尽事宜由学校教学评估常设专家委员负责解释。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', N'信息科学与工程学院', 0, 12, 1, 0, N'管理员', 8, NULL, N'1231', CAST(0x0000A82A00EFAC69 AS DateTime))
INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (11, N'2011年秋季学期“教师教学发展”系列工作坊举行', CAST(0x0000A80F00000000 AS DateTime), N'&lt;table width=&quot;95%&quot;&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td valign=&quot;top&quot; style=&quot;margin: 0px; padding: 0px;&quot;&gt;&lt;span style=&quot;font-size: 14px;&quot;&gt;&lt;p style=&quot;text-indent: 37px;&quot;&gt;&lt;span style=&quot;font-family: 仿宋_gb2312; font-size: 19px;&quot;&gt;2011&lt;/span&gt;&lt;span style=&quot;font-family: 仿宋_gb2312; font-size: 19px;&quot;&gt;年9月26-27日，“教师教学发展”系列工作坊在崂山校区举行。本次系列工作坊邀请了来自香港理工大学教学发展中心主任何淑冰博士、美国杨百翰大学教学中心顾问Lynn Sorenson博士和牛津布鲁克斯大学职员与学习发展中心主任Chris Rust教授主讲。高教研究与评估中心、教学支持中心主任宋文红教授主持了工作坊。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 37px;&quot;&gt;&lt;span style=&quot;font-family: 仿宋_gb2312; font-size: 19px;&quot;&gt;本次系列工作坊围绕课堂教学、课程设计以及教学评价与反馈分四场展开：如何运用“构建性配合”达成高层次的学习成果，以活动教学让学生从被动听课变为主动学习，如何设计课程以促进学习，以及如何吸引学生参与教学评价与反馈。三位经验丰富的教师发展专家以各自丰富的学识和阅历以及独到的见解启发着各位参会教师，不仅让参与者感受到先进的教学、学习和课程设计理念，还在讲述过程中不断以分组形式进行讨论，分享各自的理解和看法，示范和展现了如何注重参与者的参与和互动来进行教学的研讨模式。工作坊现场气氛热烈，各位参会教师积极提问、踊跃发言。但同时也暴露出不少新进教师的教育学和心理学基本知识欠缺、急需补课的现状。&lt;/span&gt;&lt;/p&gt;&lt;span style=&quot;font-family: 仿宋_gb2312; font-size: 19px;&quot;&gt;&amp;nbsp; &amp;nbsp;我校2011年新进教师、参加课程教学评估的教师以及感兴趣的教师180人次参加了工作坊。另外，还有东北师范大学、烟台大学和青岛大学的7位教师专程赶来参加。据了解，不少参会教师希望希望学校多组织有关教师教学发展方面的研讨活动，能够提供更多交流的平台，帮助教师不断提高教育教学能力和水平；督导在最近几个学期的信息反馈会上也多次建议学校加强对教师教学发展方面的支持力度。&lt;/span&gt;&lt;center&gt;&lt;/center&gt;&lt;/span&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/tbody&gt;&lt;/table&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', N'信息科学与工程学院', 0, 12, 1, 0, N'管理员', 2, NULL, N'132', CAST(0x0000A82A00EFAC69 AS DateTime))
INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (12, N'“基于质量提升的教师专业发展实践”报告会举行', CAST(0x0000A80900000000 AS DateTime), N'&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; text-indent: 37px; margin-top: 0px; margin-bottom: 0px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 仿宋_gb2312; font-size: 19px;&quot;&gt;6&lt;/span&gt;&lt;span style=&quot;font-family: 仿宋_gb2312; font-size: 19px;&quot;&gt;月13日下午，中国海洋大学“基于质量提升的教师专业发展实践”专题报告会在中国海洋大学行远楼第五会议室举行。李巍然副校长主持报告会并讲话。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; text-indent: 37px; margin-top: 0px; margin-bottom: 0px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 仿宋_gb2312; font-size: 19px;&quot;&gt;美国德克萨斯A&amp;amp;M大学教学卓越中心主任武昕原教授介绍了该中心开展的教师专业发展项目。该中心以支持教学改进、提高教学与学习质量为目标，为教师提供教学方法与技术、课程设计、教学观摩、教学咨询、教学奖励等各种服务，发挥着不可替代的重要作用。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; text-indent: 37px; margin-top: 0px; margin-bottom: 0px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 仿宋_gb2312; font-size: 19px;&quot;&gt;报告会上，高教研究与评估中心、教学支持中心主任宋文红汇报了参加教育部在美国密歇根大学举办的“教师专业发展培训”项目的情况，从“是什么、为什么、怎么做”三个方面解读了教师专业发展在美国和中国的进展。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; text-indent: 37px; margin-top: 0px; margin-bottom: 0px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 仿宋_gb2312; font-size: 19px;&quot;&gt;李巍然副校长在总结讲话中指出，教育部在2011年工作要点中提到“教师发展中心建设”，这次又专门在美国举办研讨班，说明国家开始重视教师发展问题，并计划投入建设相关机构。我们学校在国内率先建立了教学支持中心这样一个机构，要抓住机遇继续积极推进该项工作。教师专业发展工作是一项前景光明、对教师也非常有帮助的工作，需要我们富有激情与信心，通过帮助教师发展，实现学生的健康发展，最终实现教师、学生与学校同成长、共发展。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 14px; line-height: 21px; white-space: normal; text-indent: 37px; margin-top: 0px; margin-bottom: 0px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 仿宋_gb2312; font-size: 19px;&quot;&gt;与会人员就如何更新课程内容、如何提高教师教学积极性、如何对实践教学进行评价、如何培养学生创新思维等问题与报告人进行了交流。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); line-height: 21px; font-family: 仿宋_gb2312; font-size: 19px; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp; &amp;nbsp;教学督导，人事处、教务处、国际合作与交流处、高教研究与评估中心、教学支持中心负责人，各院（部、系）分管教学副院长（副主任）以及感兴趣的教师参加了报告会。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', N'信息科学与工程学院', 0, 90, 1, 0, N'管理员', 2, NULL, N'123', CAST(0x0000A82A00EFAC69 AS DateTime))
INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (13, N'21312', CAST(0x0000A88E00000000 AS DateTime), N'&lt;p&gt;123&lt;/p&gt;', N'12312', 0, 123, 1, 0, N'管理员', 2, NULL, N'123', CAST(0x0000A82A00EFAC69 AS DateTime))
INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (14, N'qwe', CAST(0x0000A88D00000000 AS DateTime), N'&lt;p&gt;321&lt;br/&gt;&lt;/p&gt;', N'qwe', 0, 12, 1, 0, N'管理员', 2, NULL, N'qwe', CAST(0x0000A82A00EFAC69 AS DateTime))
INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (15, N'123', CAST(0x0000A89F00DDE6BA AS DateTime), N'&lt;p&gt;fhgkh&lt;/p&gt;&lt;p&gt;dfghjhkk&lt;/p&gt;&lt;p&gt;hj&lt;/p&gt;&lt;p&gt;qwertyuio&lt;/p&gt;&lt;p&gt;在&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', N'123', 0, 123, 1, 0, N'管理员', 4, NULL, N'123123', CAST(0x0000A8A300000000 AS DateTime))
INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (16, N'12313', CAST(0x0000A8E80137C0D3 AS DateTime), N'&lt;p&gt;&lt;img src=&quot;/ueditor/net/upload/image/20180522/6366261209987998727128445.jpg&quot; title=&quot;TIM截图20180409163913.jpg&quot; alt=&quot;TIM截图20180409163913.jpg&quot;/&gt;&lt;/p&gt;', N'123', 0, 12, 1, 0, N'管理员', 8, NULL, N'123', CAST(0x0000A8D300000000 AS DateTime))
INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (17, N'12313', CAST(0x0000A8E801432DAD AS DateTime), N'&lt;p&gt;123&lt;/p&gt;&lt;p style=&quot;line-height: 16px;&quot;&gt;&lt;img style=&quot;vertical-align: middle; margin-right: 2px;&quot; src=&quot;http://localhost:54723/ueditor/dialogs/attachment/fileTypeImages/icon_pdf.gif&quot;/&gt;&lt;a style=&quot;font-size:12px; color:#0066cc;&quot; href=&quot;/ueditor/net/upload/file/20180522/6366261459728634823858143.pdf&quot; title=&quot;16020031021-官欣仪-实验1.pdf&quot;&gt;16020031021-官欣仪-实验1.pdf&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', N'123', 0, 123, 1, 0, N'管理员', 13, NULL, N'123', CAST(0x0000A8F200000000 AS DateTime))
INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (18, N'213', CAST(0x0000A8EF0102858F AS DateTime), N'&lt;p&gt;123&lt;br/&gt;&lt;/p&gt;', N'123', 0, 123, 1, 0, N'管理员', 3, NULL, N'123', CAST(0x0000A8EF01027B18 AS DateTime))
INSERT [dbo].[Activity] ([Activity_id], [Activity_title], [Activity_time], [Activity_content], [Activity_place], [Activity_nowcount], [Activity_limitcount], [Activity_categoryid], [Activity_isdeleted], [Activity_author], [Activity_hit], [Activity_deletedtime], [Activity_summary], [Activity_hold_time]) VALUES (19, N'123131111111111111', CAST(0x0000A8EF0102A192 AS DateTime), N'&lt;p&gt;123&lt;/p&gt;', N'13123', 0, 123, 1, 0, N'管理员', 8, NULL, N'132', CAST(0x0000A8D700000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Activity] OFF
SET IDENTITY_INSERT [dbo].[ActivityCategory] ON 

INSERT [dbo].[ActivityCategory] ([ActivityCategory_id], [ActivityCategory_name]) VALUES (1, N'讲座与报告')
INSERT [dbo].[ActivityCategory] ([ActivityCategory_id], [ActivityCategory_name]) VALUES (2, N'工作坊')
INSERT [dbo].[ActivityCategory] ([ActivityCategory_id], [ActivityCategory_name]) VALUES (3, N'2333')
INSERT [dbo].[ActivityCategory] ([ActivityCategory_id], [ActivityCategory_name]) VALUES (4, N'4555')
INSERT [dbo].[ActivityCategory] ([ActivityCategory_id], [ActivityCategory_name]) VALUES (7, N'222')
SET IDENTITY_INSERT [dbo].[ActivityCategory] OFF
SET IDENTITY_INSERT [dbo].[ActivitySummary] ON 

INSERT [dbo].[ActivitySummary] ([ActivitySummary_id], [ActivitySummary_title], [ActivitySummary_time], [ActivitySummary_content], [ActivitySummary_isdeleted], [ActivitySummary_author], [ActivitySummary_cover], [ActivitySummary_hit], [ActivitySummary_deletedtime], [ActivitySummary_summary]) VALUES (1, N'教学支持中心举办深度学习问题研究午餐会', CAST(0x0000A80E0083D3AD AS DateTime), N'&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 1.75em;text-indent: 37px&quot;&gt;&lt;span style=&quot;line-height: 1.75em;font-family: 等线;font-size: 20px&quot;&gt;2017&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;9&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;28&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;日，教学支持中心举办深度学习问题研究午餐会，邀请法政学院副教授赵宗金主讲，题目为“大学生深度学习问题研究——以中国海洋大学为例”。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171016/6364373759015556471159407.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 37px&quot;&gt;&lt;span style=&quot;font-family: 等线;font-size: 19px&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 1.75em;text-indent: 37px&quot;&gt;&lt;span style=&quot;line-height: 1.75em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;讲座中，赵宗金首先介绍了深度学习的定义，深度学习在学生收获、学习过程、院校诊断等方面的意义，研究所用量表包括高阶认知、整合性学习、反思性学习等三个维度，以及在概念操作层面的基本测量指标，抽样程序，量表质量，研究结果分析与讨论等等。作为补充，赵宗金还介绍了独立样本&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;t&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;检验，以及调查研究四部曲，即问题意识、工具方法、实施过程和调研报告。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);text-indent: 37px&quot;&gt;&lt;span style=&quot;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;font-size: 24px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171016/6364373759016956324388652.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 1.75em;text-indent: 37px&quot;&gt;&lt;span style=&quot;line-height: 1.75em;font-family: 等线;font-size: 19px&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 1.75em;text-indent: 37px&quot;&gt;&lt;span style=&quot;line-height: 1.75em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;来自外国语学院、管理学院、信息科学与工程学院等&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;20&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;余位老师参与活动。教学支持中心副主任姜永玲主持午餐会。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height: 1.75em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, N'管理员', N'77c7715f-f20f-4e90-9419-4cb3f0af0835.jpg', 11, NULL, N'123')
INSERT [dbo].[ActivitySummary] ([ActivitySummary_id], [ActivitySummary_title], [ActivitySummary_time], [ActivitySummary_content], [ActivitySummary_isdeleted], [ActivitySummary_author], [ActivitySummary_cover], [ActivitySummary_hit], [ActivitySummary_deletedtime], [ActivitySummary_summary]) VALUES (2, N'教学支持中心举办教学实时交互工具工作坊', CAST(0x0000A80E0083FF33 AS DateTime), N'&lt;p&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171016/6364373762917679709673932.jpg&quot;/&gt;&lt;/p&gt;', 0, N'管理员', N'picture/092145684916.jpg', 4, NULL, N'123')
INSERT [dbo].[ActivitySummary] ([ActivitySummary_id], [ActivitySummary_title], [ActivitySummary_time], [ActivitySummary_content], [ActivitySummary_isdeleted], [ActivitySummary_author], [ActivitySummary_cover], [ActivitySummary_hit], [ActivitySummary_deletedtime], [ActivitySummary_summary]) VALUES (3, N'12312', CAST(0x0000A80E0151C79A AS DateTime), N'&lt;p&gt;123131&lt;/p&gt;', 0, N'管理员', N'QQ截图20171016212056.png', 0, NULL, N'132')
INSERT [dbo].[ActivitySummary] ([ActivitySummary_id], [ActivitySummary_title], [ActivitySummary_time], [ActivitySummary_content], [ActivitySummary_isdeleted], [ActivitySummary_author], [ActivitySummary_cover], [ActivitySummary_hit], [ActivitySummary_deletedtime], [ActivitySummary_summary]) VALUES (4, N'1231', CAST(0x0000A80E0151D30C AS DateTime), N'&lt;p&gt;123&lt;/p&gt;', 1, N'管理员', N'QQ截图20171016212056.png', 0, NULL, N'123')
INSERT [dbo].[ActivitySummary] ([ActivitySummary_id], [ActivitySummary_title], [ActivitySummary_time], [ActivitySummary_content], [ActivitySummary_isdeleted], [ActivitySummary_author], [ActivitySummary_cover], [ActivitySummary_hit], [ActivitySummary_deletedtime], [ActivitySummary_summary]) VALUES (6, N'1231', CAST(0x0000A80E0151EF1E AS DateTime), N'&lt;p&gt;1231&lt;/p&gt;', 1, N'管理员', N'picture/161216023982.png', 2, NULL, N'1231')
INSERT [dbo].[ActivitySummary] ([ActivitySummary_id], [ActivitySummary_title], [ActivitySummary_time], [ActivitySummary_content], [ActivitySummary_isdeleted], [ActivitySummary_author], [ActivitySummary_cover], [ActivitySummary_hit], [ActivitySummary_deletedtime], [ActivitySummary_summary]) VALUES (7, N'教学支持中心举办深度学习问题研究午餐会', CAST(0x0000A80F01702627 AS DateTime), N'&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 1.75em;white-space: normal;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 1.75em;font-family: 等线;font-size: 20px&quot;&gt;2017&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;9&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;28&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;日，教学支持中心举办深度学习问题研究午餐会，邀请法政学院副教授赵宗金主讲，题目为“大学生深度学习问题研究——以中国海洋大学为例”。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-align: center;background-color: rgb(255, 255, 255)&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171017/6364387561930874916190218.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;font-family: 等线;font-size: 19px&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 1.75em;white-space: normal;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 1.75em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;讲座中，赵宗金首先介绍了深度学习的定义，深度学习在学生收获、学习过程、院校诊断等方面的意义，研究所用量表包括高阶认知、整合性学习、反思性学习等三个维度，以及在概念操作层面的基本测量指标，抽样程序，量表质量，研究结果分析与讨论等等。作为补充，赵宗金还介绍了独立样本&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;t&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;检验，以及调查研究四部曲，即问题意识、工具方法、实施过程和调研报告。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;font-size: 24px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-align: center;background-color: rgb(255, 255, 255)&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171017/6364387561932274989419463.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 1.75em;white-space: normal;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 1.75em;font-family: 等线;font-size: 19px&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 1.75em;white-space: normal;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 1.75em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;来自外国语学院、管理学院、信息科学与工程学院等&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;20&lt;/span&gt;&lt;span style=&quot;line-height: 1.75em;font-size: 20px&quot;&gt;余位老师参与活动。教学支持中心副主任姜永玲主持午餐会。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, N'管理员', N'吴政铎指导本科生职业规划_2022387406638.jpg', 0, NULL, N'123')
INSERT [dbo].[ActivitySummary] ([ActivitySummary_id], [ActivitySummary_title], [ActivitySummary_time], [ActivitySummary_content], [ActivitySummary_isdeleted], [ActivitySummary_author], [ActivitySummary_cover], [ActivitySummary_hit], [ActivitySummary_deletedtime], [ActivitySummary_summary]) VALUES (8, N'教学支持中心举办教学实时交互工具工作坊', CAST(0x0000A80F01707F36 AS DateTime), N'&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;margin: 3px 0;line-height: 2em;text-indent: 28px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;2017&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;8&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;31&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;日下午，教学支持中心副主任姜永玲在&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;7514&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;教室举办教学实时交互工具工作坊，讲授&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;智慧教学工具——雨课堂的使用方法。&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-align: center;background-color: rgb(255, 255, 255)&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171017/6364387569585113317004945.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;margin: 3px 0;line-height: 2em;text-indent: 28px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 19px&quot;&gt;&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;margin: 3px 0;line-height: 2em;text-indent: 28px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;工作坊中，老师们现场体验如何在课前、课中、课后应用雨课堂实时交互工具。教师端主要功能包括创建、管理多个班级，编辑、发布课件（主观&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;/&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;客观题、投票、弹幕、&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;MOOC&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;视频、链接），发布试题，查看签到、随机点名、推送课前预习课件、查阅课堂互动数据（选择题、投票、弹幕及学生标注为“不懂”的内容）、试卷成绩等。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;margin: 3px 0;line-height: 2em;text-indent: 28px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-align: center;background-color: rgb(255, 255, 255)&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171017/6364387569586413425532363.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;margin: 3px 0;line-height: 2em;text-indent: 28px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;margin: 3px 0;line-height: 2em;text-indent: 28px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 24px&quot;&gt;学生端主要功能包括课前、课后查看教师推送的课件，上课扫码签到（需填写学号、姓名实名制），提交主观、客观题答案（选项、文本、图片、语音）、参与投票，发送弹幕，标注课件中不懂的幻灯片，在线测试等。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;margin: 3px 0;line-height: 2em;text-indent: 28px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 24px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-align: center;background-color: rgb(255, 255, 255)&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171017/6364387569587613605532363.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;margin: 3px 0;line-height: 2em;text-indent: 28px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 24px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-align: center;background-color: rgb(255, 255, 255)&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171017/6364387569588913288761608.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;margin: 3px 0;line-height: 2em;text-indent: 28px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;为鼓励老师们开展教学学术研究，工作坊中还进行了图书抽奖活动，把《高效能教学的七种方法》《聪明教学&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;7&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 24px&quot;&gt;原理：基于学习科学的教学策略》两种图书提供给老师们学习阅读。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-align: center;background-color: rgb(255, 255, 255)&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171017/6364387569590113682990853.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;margin: 3px 0;line-height: 2em;text-indent: 28px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-align: center;background-color: rgb(255, 255, 255)&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171017/6364387569591313421518270.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;margin: 3px 0;line-height: 2em;text-indent: 28px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 24px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-align: center;background-color: rgb(255, 255, 255)&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171017/6364387569592513911518270.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;margin: 3px 0;line-height: 2em;text-indent: 28px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 24px&quot;&gt;来自信息科学与工程学院、海洋与大气学院、化学化工学院、基础教学中心等学院三十余位教师参加了本次工作坊活动。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, N'管理员', N'77c7715f-f20f-4e90-9419-4cb3f0af0835.jpg', 0, NULL, N'123')
INSERT [dbo].[ActivitySummary] ([ActivitySummary_id], [ActivitySummary_title], [ActivitySummary_time], [ActivitySummary_content], [ActivitySummary_isdeleted], [ActivitySummary_author], [ActivitySummary_cover], [ActivitySummary_hit], [ActivitySummary_deletedtime], [ActivitySummary_summary]) VALUES (9, N'教学评价学术报告会举行', CAST(0x0000A80F0170B67E AS DateTime), N'&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;2017&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;7&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;6&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;日上午，教学支持中心举办教学评价学术报告会，邀请澳门大学教与学优化中心主任&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;Spencer Benson&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;教授主讲，题目为“&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;Assessment: What it is and what it can be&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;”。&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;报告会上，&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;Benson&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;教授先后讲述了教学评价的目的和意义、教学评价的类型、教学评价各方面的关联、学习成果、教学评价程序、什么是好的教学评价等内容。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-align: center;background-color: rgb(255, 255, 255)&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171017/6364387573225521811748840.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;Benson&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;教授把教学评价比作驱动学习前进的发动机，我国铁路机车实现了由内燃机车到标准动车组的跨越，而高校的教学评价亟待向以学生为中心的教学评价模式转型。他认为，没有促进学生学习的教学评价是在浪费教师和学生的时间，记忆不等于学习。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-align: center;background-color: rgb(255, 255, 255)&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171017/6364387573226921991748840.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;教学评价的类型主要有形成性评价、终结性评价、诊断性评价、真实性评价等，&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;Benson&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;教授详细讲解了不同类型教学评价的特点和使用方法。好的教学评价主要有以下特点&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;:&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;对学生和教师同行有意义，嵌入课程活动中，与课程目标或学习成果一致，以课程和学科为基础。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-align: center;background-color: rgb(255, 255, 255)&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171017/6364387573228121724978086.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;报告会设置多个互动环节，让参会教师思考教学评价的目的和意义、利用布鲁姆学习目标分类法设计学习成果。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-align: center;background-color: rgb(255, 255, 255)&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171017/6364387573235222112720656.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;background-color: rgb(255, 255, 255)&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171017/6364387573236422381248074.jpg&quot;/&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;Benson&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;教授还以自己讲授的“微生物与社会”通识课程为例，介绍教学评价设计的理念、学习目标分类以及教学评价和学习成果的关联。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;第三期教学研习营教师、部分职能部处和院系教师参加报告会。会议由外国语学院副院长王慧敏主持。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, N'管理员', N'ca8cc3ff-3eb0-4233-9123-5d0337c40dca.jpg', 0, NULL, N'1')
INSERT [dbo].[ActivitySummary] ([ActivitySummary_id], [ActivitySummary_title], [ActivitySummary_time], [ActivitySummary_content], [ActivitySummary_isdeleted], [ActivitySummary_author], [ActivitySummary_cover], [ActivitySummary_hit], [ActivitySummary_deletedtime], [ActivitySummary_summary]) VALUES (10, N'教学支持中心举办调查研究方法午餐会', CAST(0x0000A80F01710011 AS DateTime), N'&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;2017&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;6&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;22&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;日，教学支持中心举办调查研究方法午餐会，邀请法政学院副教授赵宗金以“调查研究方法在教学学术研究中的应用”为题开设讲座。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;讲座中，赵宗金围绕着“以学习者为中心”教学范式，介绍他开展相关研究的情况。他详细介绍了教师和学生关于“以学习者为中心”教学范式的认知程度、教师和学生面对“以学习者为中心”教学范式的转变表现、影响“以学习者为中心”教学范式实施的主要因素是什么等三个问题的设计和研究思路。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-align: center;background-color: rgb(255, 255, 255)&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171017/6364387579991509393612352.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;学习者中心教学法，相对于教师为中心的教学法而言，是由学生自我学习的活动主导教学，而非由教师主导教学。学习的成功依赖学生积极的介入学习，亦即充分的与学习环境中的刺激物互动。一些特殊教学模式已被证实为有效的学习者中心教学法，诸如小组学习、个别化学习单元&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;(modules)&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;设计、实验、问题解决教学设计、读书报告或计划&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;(projects)&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;和编序教学等。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-align: center;background-color: rgb(255, 255, 255)&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171017/6364387579995309161070842.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;调查研究方法主要采用问卷调查、访谈和观察法。教学范式信念问卷共计&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;27&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;道题，分为教师用卷和学生用卷，采用李克特&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;5&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;级量表；访谈时间&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;30&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;分钟，采用半结构式访谈问卷并进行质化内容分析；观察法用&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;4&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;课时，观察教学活动特征、学生参与及反应。对照不同研究方法，赵宗金分析了研究结论、所采用的统计分析方法以及调查研究四部曲，即问题意识、工具方法、实施过程和调研报告。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;line-height: 21px;white-space: normal;text-align: center;background-color: rgb(255, 255, 255)&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171017/6364387579996609528598259.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;text-indent: 37px;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: Simsun;font-size: 12px;white-space: normal;line-height: 2em;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; 来自外国语学院、管理学院、数学科学学院等&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;20&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;余位老师参与活动。教学支持中心副主任姜永玲主持午餐会。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, N'管理员', N'353de0cc-bf84-4bd9-936f-6b586580a7c7.jpg', 5, NULL, N'132')
INSERT [dbo].[ActivitySummary] ([ActivitySummary_id], [ActivitySummary_title], [ActivitySummary_time], [ActivitySummary_content], [ActivitySummary_isdeleted], [ActivitySummary_author], [ActivitySummary_cover], [ActivitySummary_hit], [ActivitySummary_deletedtime], [ActivitySummary_summary]) VALUES (11, N'qwe', CAST(0x0000A81900F057DB AS DateTime), N'&lt;p&gt;qwe&lt;/p&gt;', 0, N'管理员', N'yoru.jpg', 3, NULL, N'213')
INSERT [dbo].[ActivitySummary] ([ActivitySummary_id], [ActivitySummary_title], [ActivitySummary_time], [ActivitySummary_content], [ActivitySummary_isdeleted], [ActivitySummary_author], [ActivitySummary_cover], [ActivitySummary_hit], [ActivitySummary_deletedtime], [ActivitySummary_summary]) VALUES (12, N'教学支持中心举办教学学术研究操作规程午餐会', CAST(0x0000A81900F9A0AC AS DateTime), N'&lt;p style=&quot;text-indent:37px&quot;&gt;&lt;span style=&quot;font-size:19px;font-family:等线&quot;&gt;2017&lt;/span&gt;&lt;span style=&quot;font-size:19px;font-family:等线&quot;&gt;年10月19日，教学支持中心在崂山校区举办午餐会，邀请基础教学中心教育系副教授陈凯泉主讲，主题为大学教学学术研究的操作规程。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align:center&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171027/6364471363256688576794130.JPG&quot; title=&quot;IMG_3612.JPG&quot; alt=&quot;IMG_3612.JPG&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;text-indent:37px&quot;&gt;&lt;span style=&quot;font-size:19px;font-family:等线&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;text-indent:37px&quot;&gt;&lt;span style=&quot;font-size:19px;font-family:等线&quot;&gt;会上，陈凯泉首先介绍了教学学术研究的基本步骤，以及教学研究从选择问题到研究实施的全流程，操作模型包括教育教学目标、学习者、输入输出部分以及各部分之间的相关关系。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent: 37px; text-align: left;&quot;&gt;&lt;span style=&quot;font-size:19px;font-family:等线&quot;&gt;关于教育叙事研究，陈凯泉谈到，教育叙事能提升教师自我教育的主体性，尊重教师对自我教育生活的自主权，充分发掘教师对自我教育生活的潜在的知识经验，提升个体在自我教育生活中的自主性。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent:37px&quot;&gt;&lt;span style=&quot;font-size:19px;font-family:等线&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171027/6364471370790820256539226.JPG&quot; title=&quot;IMG_3632.JPG&quot; alt=&quot;IMG_3632.JPG&quot;/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent:37px&quot;&gt;&lt;span style=&quot;font-size:19px;font-family:等线&quot;&gt;陈凯泉还介绍了研究假设与研究变量，研究操作范式比较等内容。讲解辅以详实的案例进行剖析，让参会教师对如何在具体操作实施层面开展教学学术研究有了更加深切的体会。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent:37px&quot;&gt;&lt;span style=&quot;font-size:19px;font-family:等线&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20171027/6364471371925285165372276.JPG&quot; title=&quot;IMG_3587.JPG&quot; alt=&quot;IMG_3587.JPG&quot;/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-indent:37px&quot;&gt;&lt;span style=&quot;font-size:19px;font-family:等线&quot;&gt;参会教师与陈凯泉就相关研究问题进行了交流互动。来自外国语学院、管理学院、信息科学与工程学院等近30位老师参与活动。教学支持中心副主任姜永玲主持午餐会。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, N'管理员', N'IMG_3612.JPG', 26, NULL, N'123')
INSERT [dbo].[ActivitySummary] ([ActivitySummary_id], [ActivitySummary_title], [ActivitySummary_time], [ActivitySummary_content], [ActivitySummary_isdeleted], [ActivitySummary_author], [ActivitySummary_cover], [ActivitySummary_hit], [ActivitySummary_deletedtime], [ActivitySummary_summary]) VALUES (13, N'qwe', CAST(0x0000A88201364C9F AS DateTime), N'&lt;p&gt;qwe&lt;/p&gt;', 0, N'管理员', N'20171226202405_5Lh8c.jpg', 2, NULL, N'qwe')
SET IDENTITY_INSERT [dbo].[ActivitySummary] OFF
SET IDENTITY_INSERT [dbo].[ActivityTeacher] ON 

INSERT [dbo].[ActivityTeacher] ([id], [activity_id], [teacher_id]) VALUES (1, 2, 1)
INSERT [dbo].[ActivityTeacher] ([id], [activity_id], [teacher_id]) VALUES (2, 1, 1)
INSERT [dbo].[ActivityTeacher] ([id], [activity_id], [teacher_id]) VALUES (3, 9, 1)
INSERT [dbo].[ActivityTeacher] ([id], [activity_id], [teacher_id]) VALUES (4, 4, 1)
INSERT [dbo].[ActivityTeacher] ([id], [activity_id], [teacher_id]) VALUES (5, 5, 1)
INSERT [dbo].[ActivityTeacher] ([id], [activity_id], [teacher_id]) VALUES (6, 6, 1)
INSERT [dbo].[ActivityTeacher] ([id], [activity_id], [teacher_id]) VALUES (7, 7, 1)
INSERT [dbo].[ActivityTeacher] ([id], [activity_id], [teacher_id]) VALUES (8, 11, 1)
INSERT [dbo].[ActivityTeacher] ([id], [activity_id], [teacher_id]) VALUES (9, 12, 1)
SET IDENTITY_INSERT [dbo].[ActivityTeacher] OFF
INSERT [dbo].[Admin] ([Admin_id], [Admin_pwd], [Admin_name], [Admin_emai], [Admin_phone], [Admin_birthday], [Admin_emai_check]) VALUES (N'adminis', N'C04E27F18046895650E1BB6BEB9FD0BFA03811C4', N'管理员', N'337118043@qq.com', N'12345678901', NULL, 0)
SET IDENTITY_INSERT [dbo].[Develop] ON 

INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (1, N'集全校之力 办中国最好的本科教育', N'管理员', CAST(0x0000A80E0081E118 AS DateTime), N'', N'http://old.moe.gov.cn/publicfiles/business/htmlfiles/moe/s6345/201203/132906.html', 0, 0, 1, N'195440562280.jpg', NULL, N'qwe')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (2, N'教育部“精品视频公开课”通知链接', N'管理员', CAST(0x0000A80E00824C5C AS DateTime), N'&lt;p style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-size: 16px;&quot;&gt;教育部办公厅关于公布第八批“精品视频公开课”名单的通知&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;a href=&quot;http://www.moe.edu.cn/srcsite/A08/s5664/s7209/s6871/201602/t20160223_230198.html&quot; style=&quot;font-size: 16px; color: rgb(51, 51, 51); line-height: 1.7em;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;http://www.moe.edu.cn/srcsite/A08/s5664/s7209/s6871/201602/t20160223_230198.html&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;教育部办公厅关于公布第七批“精品视频公开课”名单的通知&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;a href=&quot;http://www.moe.edu.cn/srcsite/A08/s5664/s7209/s6871/201504/t20150415_189451.html&quot; style=&quot;font-size: 16px; color: rgb(51, 51, 51); line-height: 1.7em;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;http://www.moe.edu.cn/srcsite/A08/s5664/s7209/s6871/201504/t20150415_189451.html&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;教育部办公厅关于公布第六批“精品视频公开课”名单的通知&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;a href=&quot;http://www.moe.edu.cn/srcsite/A08/s5664/s7209/s6871/201410/t20141027_177363.html&quot; style=&quot;font-size: 16px; color: rgb(51, 51, 51); line-height: 1.7em;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;http://www.moe.edu.cn/srcsite/A08/s5664/s7209/s6871/201410/t20141027_177363.html&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;教育部办公厅关于公布第五批“精品视频公开课”名单的通知&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;a href=&quot;http://www.moe.edu.cn/srcsite/A08/s5664/s7209/s6871/201404/t20140409_167525.html&quot; style=&quot;font-size: 16px; color: rgb(51, 51, 51); line-height: 1.7em;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;http://www.moe.edu.cn/srcsite/A08/s5664/s7209/s6871/201404/t20140409_167525.html&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;&lt;p style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;教育部关于公布第四批“精品视频公开课”名单的通知&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;a href=&quot;http://www.moe.edu.cn/srcsite/A08/s5664/s7209/s6871/201311/t20131111_159561.html&quot; style=&quot;font-size: 16px; color: rgb(51, 51, 51); line-height: 1.7em;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;http://www.moe.edu.cn/srcsite/A08/s5664/s7209/s6871/201311/t20131111_159561.html&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;教育部关于公布第三批“精品视频公开课”名单的通知&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;a href=&quot;http://www.moe.edu.cn/srcsite/A08/s5664/s7209/s6871/201306/t20130604_153010.html&quot; style=&quot;font-size: 16px; color: rgb(51, 51, 51); line-height: 1.7em;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;http://www.moe.edu.cn/srcsite/A08/s5664/s7209/s6871/201306/t20130604_153010.html&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;教育部关于公布第二批“精品视频公开课”名单的通知&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;a href=&quot;http://www.moe.edu.cn/srcsite/A08/s5664/s7209/s6871/201212/t20121219_146264.html&quot; style=&quot;font-size: 16px; color: rgb(51, 51, 51); line-height: 1.7em;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;http://www.moe.edu.cn/srcsite/A08/s5664/s7209/s6871/201212/t20121219_146264.html&lt;/span&gt;&lt;/a&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;font-family: &amp;quot;Microsoft YaHei&amp;quot;; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;教育部关于公布首批“精品视频公开课”名单的通知&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51); font-family: &amp;quot;Microsoft YaHei&amp;quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;a href=&quot;http://www.moe.edu.cn/publicfiles/business/htmlfiles/moe/s5666/201205/xxgk_135404.html&quot; style=&quot;font-size: 16px; color: rgb(51, 51, 51); line-height: 1.7em;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;http://www.moe.edu.cn/publicfiles/business/htmlfiles/moe/s5666/201205/xxgk_135404.html&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', N'', 0, 0, 1, N'170505858301.jpg', NULL, N'qwe')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (3, N'他山之石，可以攻玉', N'管理员', CAST(0x0000A80E00827050 AS DateTime), N'', N'http://ouceducnxiaobao.cuepa.cn/show_more.php?tkey=&bkey=&doc_id=1338982', 0, 0, 1, N'170505858301.jpg', NULL, N'qwe')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (4, N'12312', N'管理员', CAST(0x0000A80E0150F65F AS DateTime), N'&lt;p&gt;1231231&lt;br/&gt;&lt;/p&gt;', N'', 0, 0, 1, N'QQ截图20171016212056.png', NULL, N'qew')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (5, N'12312', N'管理员', CAST(0x0000A80E0151075E AS DateTime), N'&lt;p&gt;123&lt;/p&gt;', N'', 2, 0, 1, N'QQ截图20171016212056.png', NULL, N'qwe')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (6, N'12312', N'管理员', CAST(0x0000A80E015114B3 AS DateTime), N'&lt;p&gt;1231&lt;/p&gt;', N'', 4, 0, 1, N'QQ截图20171016212056.png', NULL, N'qwe')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (7, N'123123', N'管理员', CAST(0x0000A80F013DE4C3 AS DateTime), N'&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 12px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;padding: 0px; margin: 0px; border: 0px; line-height: 1.5em; font-size: 16px;&quot;&gt;中国海洋大学教学支持中心成立于2007年7月，是学校直属业务单位之一。中心按照“高起点建设、国际化视野、专业化服务”的原则，依托高等教育研究与评估中心、教务处和人事处共同建设，优化课程评估、教学咨询、教学研究、教学培训等方面的教学资源，同时注重校外智力资源的引进与吸收，为教师职业发展提供专业化、人性化服务与指导，协助广大教师更新教学理念、改进教学方法、提高教学能力，提升教学水平，引导广大教师不断追求教学卓越，共同营造教师职业与学校事业“同成长、共发展”的氛围，服务于学校教育教学事业，努力为创新性人才培养做出自己应有的贡献。&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;目前，学校聘请国际著名比较高等教育学家、美国波士顿学院终身教授菲利普&#183;阿特巴赫，国际著名高等教育专家、加拿大多伦多大学教授许美德为中心学术顾问。高等教育研究与评估中心主任同时担任教学支持中心主任。高等教育研究与评估中心1名负责课程评估与教学督导的副主任、教务处1名负责数字课程资源建设的副处长、人事处1名负责人力资源管理的副处长等3名同志共同兼任教学支持中心副主任。中心办公室设有专职秘书1人，负责日常事务管理。与此同时，中心依托教学评估常设专家委员会、教学督导团、教学促进专家组等三支专家队伍，积极开展课程评估、教学咨询、教学示范、教学培训、教学研究以及教学资源建设等专业服务工作。经过一段时间的集中建设，常态化、经常性开展的业务工作主要有：课程教学评估、个性化教学咨询与指导、新进教师培训、集体教学观摩、高等学校教学策略培训、高等学校骨干教师网络培训、教学工作坊、教育教学报告会、教学卓越奖励计划以及教育教学研究等。在此基础上，我们紧紧围绕学校历史传统与办学特色，依托学校海洋类优势学科，借助国际涉海大学联盟、海峡两岸海洋海事大学联盟、全国涉海大学教务联盟等交流平台，争取在海洋教育方面有一个新的突破，努力将中心建设成为海洋教育特色鲜明、涉海高校引领示范、国内高校影响深远的国家级教师教学示范中心。&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;一、管理人员&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;主&amp;nbsp;&amp;nbsp;任：宋文红（高等教育研究与评估中心主任兼任）&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;副主任：季岸先（高等教育研究与评估中心副主任兼任）&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;于德华（教务处副处长兼任）&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;姜永玲&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;秘&amp;nbsp;&amp;nbsp;书：常&amp;nbsp;&amp;nbsp;顺&lt;/p&gt;&lt;p style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 12px; line-height: 30px; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;二、教学评估专家委员会&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;主&amp;nbsp;&amp;nbsp;任：刘新国&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;副主任：宋文红（常务）&amp;nbsp;&amp;nbsp;曾名湧&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;委&amp;nbsp;&amp;nbsp;员：（按姓氏笔画排序）&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;马&amp;nbsp;&amp;nbsp;君&amp;nbsp;&amp;nbsp;&amp;nbsp;王林山&amp;nbsp;&amp;nbsp;&amp;nbsp;王&amp;nbsp;&amp;nbsp;昕&amp;nbsp;&amp;nbsp;&amp;nbsp;方奇志&amp;nbsp;&amp;nbsp;&amp;nbsp;史宏达&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;朱新瑞&amp;nbsp;&amp;nbsp;&amp;nbsp;刘惠荣&amp;nbsp;&amp;nbsp;&amp;nbsp;江文胜&amp;nbsp;&amp;nbsp;&amp;nbsp;许国辉&amp;nbsp;&amp;nbsp;&amp;nbsp;毕彩丰&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;李延团&amp;nbsp;&amp;nbsp;&amp;nbsp;李&amp;nbsp;&amp;nbsp;欣&amp;nbsp;&amp;nbsp;&amp;nbsp;李春荣&amp;nbsp;&amp;nbsp;&amp;nbsp;杨永春&amp;nbsp;&amp;nbsp;&amp;nbsp;汪东风&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;冷卫国&amp;nbsp;&amp;nbsp;&amp;nbsp;张广海&amp;nbsp;&amp;nbsp;&amp;nbsp;茅云翔&amp;nbsp;&amp;nbsp;&amp;nbsp;赵广涛&amp;nbsp;&amp;nbsp;&amp;nbsp;赵&amp;nbsp;&amp;nbsp;昕&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;赵德玉&amp;nbsp;&amp;nbsp;&amp;nbsp;郭海燕&amp;nbsp;&amp;nbsp;&amp;nbsp;崔&amp;nbsp;&amp;nbsp;凤&amp;nbsp;&amp;nbsp;&amp;nbsp;韩宗珠&amp;nbsp;&amp;nbsp;&amp;nbsp;傅&amp;nbsp;&amp;nbsp;刚&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;傅根清&amp;nbsp;&amp;nbsp;&amp;nbsp;温海深&amp;nbsp;&amp;nbsp;&amp;nbsp;樊廷俊&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;办公室设在高等教育研究与评估中心&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', N'', 1, 0, 1, N'嘿嘿嘿.png', NULL, N'123')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (8, N'123', N'管理员', CAST(0x0000A80F013E2645 AS DateTime), N'&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 12px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;padding: 0px; margin: 0px; border: 0px; line-height: 1.5em; font-size: 16px;&quot;&gt;中国海洋大学教学支持中心成立于2007年7月，是学校直属业务单位之一。中心按照“高起点建设、国际化视野、专业化服务”的原则，依托高等教育研究与评估中心、教务处和人事处共同建设，优化课程评估、教学咨询、教学研究、教学培训等方面的教学资源，同时注重校外智力资源的引进与吸收，为教师职业发展提供专业化、人性化服务与指导，协助广大教师更新教学理念、改进教学方法、提高教学能力，提升教学水平，引导广大教师不断追求教学卓越，共同营造教师职业与学校事业“同成长、共发展”的氛围，服务于学校教育教学事业，努力为创新性人才培养做出自己应有的贡献。&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;目前，学校聘请国际著名比较高等教育学家、美国波士顿学院终身教授菲利普&#183;阿特巴赫，国际著名高等教育专家、加拿大多伦多大学教授许美德为中心学术顾问。高等教育研究与评估中心主任同时担任教学支持中心主任。高等教育研究与评估中心1名负责课程评估与教学督导的副主任、教务处1名负责数字课程资源建设的副处长、人事处1名负责人力资源管理的副处长等3名同志共同兼任教学支持中心副主任。中心办公室设有专职秘书1人，负责日常事务管理。与此同时，中心依托教学评估常设专家委员会、教学督导团、教学促进专家组等三支专家队伍，积极开展课程评估、教学咨询、教学示范、教学培训、教学研究以及教学资源建设等专业服务工作。经过一段时间的集中建设，常态化、经常性开展的业务工作主要有：课程教学评估、个性化教学咨询与指导、新进教师培训、集体教学观摩、高等学校教学策略培训、高等学校骨干教师网络培训、教学工作坊、教育教学报告会、教学卓越奖励计划以及教育教学研究等。在此基础上，我们紧紧围绕学校历史传统与办学特色，依托学校海洋类优势学科，借助国际涉海大学联盟、海峡两岸海洋海事大学联盟、全国涉海大学教务联盟等交流平台，争取在海洋教育方面有一个新的突破，努力将中心建设成为海洋教育特色鲜明、涉海高校引领示范、国内高校影响深远的国家级教师教学示范中心。&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;一、管理人员&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;主&amp;nbsp;&amp;nbsp;任：宋文红（高等教育研究与评估中心主任兼任）&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;副主任：季岸先（高等教育研究与评估中心副主任兼任）&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;于德华（教务处副处长兼任）&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;姜永玲&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;秘&amp;nbsp;&amp;nbsp;书：常&amp;nbsp;&amp;nbsp;顺&lt;/p&gt;&lt;p style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 12px; line-height: 30px; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;二、教学评估专家委员会&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;主&amp;nbsp;&amp;nbsp;任：刘新国&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;副主任：宋文红（常务）&amp;nbsp;&amp;nbsp;曾名湧&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;委&amp;nbsp;&amp;nbsp;员：（按姓氏笔画排序）&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;马&amp;nbsp;&amp;nbsp;君&amp;nbsp;&amp;nbsp;&amp;nbsp;王林山&amp;nbsp;&amp;nbsp;&amp;nbsp;王&amp;nbsp;&amp;nbsp;昕&amp;nbsp;&amp;nbsp;&amp;nbsp;方奇志&amp;nbsp;&amp;nbsp;&amp;nbsp;史宏达&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;朱新瑞&amp;nbsp;&amp;nbsp;&amp;nbsp;刘惠荣&amp;nbsp;&amp;nbsp;&amp;nbsp;江文胜&amp;nbsp;&amp;nbsp;&amp;nbsp;许国辉&amp;nbsp;&amp;nbsp;&amp;nbsp;毕彩丰&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;李延团&amp;nbsp;&amp;nbsp;&amp;nbsp;李&amp;nbsp;&amp;nbsp;欣&amp;nbsp;&amp;nbsp;&amp;nbsp;李春荣&amp;nbsp;&amp;nbsp;&amp;nbsp;杨永春&amp;nbsp;&amp;nbsp;&amp;nbsp;汪东风&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;冷卫国&amp;nbsp;&amp;nbsp;&amp;nbsp;张广海&amp;nbsp;&amp;nbsp;&amp;nbsp;茅云翔&amp;nbsp;&amp;nbsp;&amp;nbsp;赵广涛&amp;nbsp;&amp;nbsp;&amp;nbsp;赵&amp;nbsp;&amp;nbsp;昕&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;赵德玉&amp;nbsp;&amp;nbsp;&amp;nbsp;郭海燕&amp;nbsp;&amp;nbsp;&amp;nbsp;崔&amp;nbsp;&amp;nbsp;凤&amp;nbsp;&amp;nbsp;&amp;nbsp;韩宗珠&amp;nbsp;&amp;nbsp;&amp;nbsp;傅&amp;nbsp;&amp;nbsp;刚&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;傅根清&amp;nbsp;&amp;nbsp;&amp;nbsp;温海深&amp;nbsp;&amp;nbsp;&amp;nbsp;樊廷俊&lt;/p&gt;&lt;p class=&quot;p_text_indent_2&quot; style=&quot;padding: 0px 0px 26px; margin-top: 0px; margin-bottom: 0px; border: 0px; font-size: 20px; line-height: 1.5em; color: rgb(51, 51, 51); text-align: justify; white-space: normal; font-family: &amp;quot;Microsoft YaHei&amp;quot;; background-color: rgb(255, 255, 255);&quot;&gt;办公室设在高等教育研究与评估中心&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', N'', 17, 0, 1, N'77c7715f-f20f-4e90-9419-4cb3f0af0835.jpg', NULL, N'231')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (9, N'集全校之力 办中国最好的本科教育', N'管理员', CAST(0x0000A80F016EEC8A AS DateTime), N'&lt;p&gt;　在胡锦涛总书记清华大学百年校庆重要讲话精神的指导下，南京大学坚持育人为本，以人才培养模式改革为突破口，努力为国家培养具有人文精神、科学素质和社会责任感的创新人才，不断提升教育教学质量，努力办最好的本科教育。&lt;/p&gt;&lt;p&gt;　　&lt;strong&gt;一、凝全校之智，构建个性化人才培养模式，促进人人成才&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;　　近年来，我校秉承人才培养的传统优势和特色，凝练出“学科建设与本科教学融通、通识教学与个性化培养融通、拓宽基础与强化实践融通、学会学习与学会做人融通”的人才培养理念，于2009年起全面实施“三三制”个性化培养模式改革。&lt;/p&gt;&lt;p&gt;　　我校“三三制”培养模式改革的核心是给予学生充分的自主选择权，为学生自主构建知识体系搭建平台，实行因材施教，促进学生个性发展。我校实行三个“百分百”政策，即百分百课程开放，百分百专业开放，学生百分百自由选择课程、专业和发展方向。同时，我校每个专业都建立了“准入准出”标准，任何学生只要满足专业准入标准，都可以选择心仪的专业学习；只要毕业时能够满足专业准出标准，都可以从该专业毕业。“准入准出”标准的建立不仅满足了学生自主学习的强烈愿望，同时也为专业交叉复合型人才的培养创造了良好的条件。据统计，2011年度我校本科课程开放量达14404人次；2009、2010两个年级已有1379人修读第二专业课程。&lt;/p&gt;&lt;p&gt;　　&lt;strong&gt;二、聚全校之师，建设多元化新型课程，不断优化教学资源&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;　　为了提高学生的批判性思维能力、激发创造力潜质，我校动员高水平教师，着力打造新生研讨课、通识教育课和学科前沿课等新型课程，形成三层次批判性思维训练课程体系。新生研讨课程针对本科一年级新生开设，由知名教授主讲，旨在帮助新生树立学术旨趣，学会质疑、学会发现，完成学习性转换和适应性转换。通识教育课程旨在开阔学生学术视野，培养文化通感和科学精神，促进形成独立的人格和价值观。学科前沿课程旨在帮助学生认识学术新领域、新发现、新方法，能够自主提出问题、分析问题和解决问题。&lt;/p&gt;&lt;p&gt;　　这些课程普遍采用研究性教学方法和研讨式教学形式。通识教育课和新生研讨课中95%的课程主讲人为院士、长江学者、国家级教学名师和学科带头人。调查显示，这类课程相较传统课程而言，对于激发学生的学习兴趣，提升学生的学习能力有明显的帮助。&lt;/p&gt;&lt;p&gt;　　&lt;strong&gt;三、集全校之力，着力建设保障机制，将办学事业高度聚焦到人才培养&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;　　2009年我校提出，集全校之力，努力办中国最好的本科教育。党政一把手亲自牵头教学改革，在条件保障、队伍建设等各项事业上全方位服务于本科教学改革。&lt;/p&gt;&lt;p&gt;　　增加教学投入是人才培养的根本保障和基本前提。我校在“985工程”中设立“本科创新人才培养”项目，包括培养模式创新计划、高水平课程建设计划、教师教学发展计划、改进育人环境计划和教学资源建设计划等5大类计划453项，对创新人才培养经费实施“上不封顶”的政策。&lt;/p&gt;&lt;p&gt;　　教学师资队伍是深化教学改革、保障教育质量的关键。我校设置了教学岗教授和副教授，激励积极投身教学一线的教师；增设各项教学奖励，每年由学生评选“我最喜爱的教师”；将教学工作作为职称评聘的重要依据，对教学工作不达要求者实行一票否决制。在评价教师时，实行四个“一视同仁”，即教学工作与科研工作一视同仁，教学研究项目与科研项目一视同仁，教学成果与科研成果一视同仁，教学带头人与科研带头人一视同仁。&lt;/p&gt;&lt;p&gt;　　健全教学组织机构是教学改革可持续的重要支撑。我校先后成立了“教学发展中心”、“教学研究与评估中心”、“考试中心”，逐步实现教学的“管、办、评”分离，从而对教师教学提供切实的指导，对教学改革提供理论的支持，对教学质量进行有效的监控，对考试考核给予有力的规范，确保了高质量教育教学可持续发展。&lt;/p&gt;&lt;p&gt;　　提升教学质量是一项需要不懈关注与静心投入的工作，也是牵一发而动全身的全局性、系统性工程。我们将根据这次会议的精神，按照延东国务委员要求和教育部部署，为创办“中国最好的本科教育”目标而奋斗！&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', N'', 1, 0, 1, N'133849660869.jpg', NULL, N'1231')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (10, N'为何世界名校课堂上禁用手机拍摄', N'管理员', CAST(0x0000A80F016F27A0 AS DateTime), N'&lt;p style=&quot;white-space: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑; letter-spacing: 1px; font-stretch: normal; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;自从有了电脑以后，人们用手写的机会就越来越少了。现在不少学生课堂上用手机拍摄教学内容，不想用笔记。很多世界知名的大学有明确规定，课堂上禁止用手机拍摄教学内容。&lt;/p&gt;&lt;p style=&quot;white-space: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑; letter-spacing: 1px; font-stretch: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　斯坦福大学的计算机系雄冠全球，学校位于世界IT行业的心脏——硅谷，苹果公司的总部就设立在这里。学校教室的现代化教学设备应有尽有，然而大学很多学科的教学完全不用电脑，仍然坚持传统的教授方式，就是老师在黑板上用粉笔板书，学生记笔记。在一些课上，老师明确规定，只能以手写方式记笔记，不能用笔记本电脑记录，更不允许用手机拍摄。斯坦福的老师为什么要坚守传统？这是由学科的性质决定的。像数学这种课程，要使用大量的抽象符号，而且内容大都是定理公式证明推导，如果老师只展示事先准备好的PPT，学生就没有机会领悟推导过程，再加上自己不动手抄写，上课内容成了过眼云烟，脑子里留下的印象会很浅，结果根本无法掌握好这些学科。&lt;/p&gt;&lt;p style=&quot;white-space: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑; letter-spacing: 1px; font-stretch: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　老师过度依赖PPT也会影响教学效果。黑板板书也强迫老师不能偷懒，每次上课都要认真备课，如此才能温故而知新。试想一下，假如老师用PPT，只用准备一次，然后年复一年地用，老师自己是轻松省事了，结果可能不是熟能生巧，而是与教学内容越来越隔膜、越来越陌生。&lt;/p&gt;&lt;p style=&quot;white-space: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑; letter-spacing: 1px; font-stretch: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　手写是美国当今仍然非常流行的一种重要教学模式。沃尔特&#183;莱文是麻省理工学院知名的物理学教授，他的课非常受学生的欢迎。在网络上，我系统看了他三门课的教学实况录像，包括物理学入门、电磁学、振动原理等，全部都是手写。&lt;/p&gt;&lt;p style=&quot;white-space: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑; letter-spacing: 1px; font-stretch: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　学生要体验“学而时习之”的快乐，必须放弃手机拍摄而手写。老师要做到“温故而知新”，也要少用PPT而多板书。&lt;/p&gt;&lt;p style=&quot;white-space: normal; font-size: 14px; line-height: 25px; font-family: 微软雅黑; letter-spacing: 1px; font-stretch: normal; background-color: rgb(255, 255, 255);&quot;&gt;　　现代科技的发达为学习提供了巨大便利，同时也威胁着行之有效的学习方法，不可不慎。（石毓智）&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', N'', 11, 0, 1, N'205659659410.jpg', NULL, N'23')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (11, N'魏振钢：海大园里的慕课先行者', N'管理员', CAST(0x0000A80F016F60C7 AS DateTime), N'&lt;p&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;&amp;nbsp; &amp;nbsp; 在大学校园，如果你不知道什么是慕课，那就out了。在海大园，第一个吃“慕课”螃蟹的老师是信息科学与工程学院魏振钢教授。当一场正在到来的教育变革———慕课来袭，他携已是教育部、山东省精品课程的《数据结构》勇立潮头，率先“试水”这场“学习的革命”，与名校、名师、名课同台竞技。&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　选修《数据结构》慕课的中国海洋大学、东华理工大学、山东财经大学等学校的学生，在他们的QQ群里感叹：选好课不需要“拼人品”，“秒杀”了！有学生留言：魏老师的课，内容接地气，实际工作用得着。希望学了魏老师的《数据结构》，我们能变成万能的计算机达人。&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　风靡全球的MOOC(MassiveOpenOn鄄lineCourse)，是大规模在线开放课程的英文简称，中文译为慕课。有人称是“自印刷术发明以来教育最大的革新”，有人概括为“三名一免”，即名校、名师和名课，而且免费。魏振钢给慕课的定位是：一个IT技术引发的教育技术革命叩响了高校的大门。&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　对话魏振钢教授，发现他对慕课有自己深刻且独到的理解和感悟。&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　记者：作为海大开设慕课的先行者，当技术推动教育进步的慕课潮风起云涌时，是什么力量或信念让您成为海大第一个吃“慕课”螃蟹的老师？&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　魏振钢：高校从教30年，一直在教学一线担任本科生的专业课教学任务，积累了较多的教学经验和体会，对于传统教学存在的问题有所思考，渴望在教学方法和形式上有所突破。这一点在我以往的习题课的上课方式上已有改变。例如，习题的讲解由学生主讲、课堂讨论、教师总结点评的方式，可以认为这是一种初期的“翻转课堂”形式。这样做，一方面可以调动学生的学习积极性，扩大学生的思维范围和视野，另一方面也可以加深学生对知识的掌握程度。慕课学习形式的出现，特别是它所倡导的“翻转课堂”、“线上线下学习”等理念，和自己的某些想法比较吻合，坚定了自己在理论授课方面改变的信念。&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　多年讲授的《数据结构》课程，先后被评为教育部英特尔精品课、山东省省级精品课。通过几年精品课程建设，积累了很多课程和学习资源，希望有更多的学生能够共享这些资源。当然了，教育部、山东省精品课程的建设，对于《数据结构》慕课的建设和上线开课起到了很重要的作用，至少在信心上是一个鼓励吧。再就是学校一直鼓励进行慕课课程建设，同时在各方面予以大力支持。&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　记者：“教你成为编程高手———中国海洋大学《数据结构》”。这是在智慧树网站及东西部高校课程联盟平台上的推荐语。有同学评价，您的《数据结构》能治好学习编程迷茫症。请谈谈《数据结构》的课程精髓是什么？&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　魏振钢：“教你成为编程高手”这句话是智慧树网站在帮我做 &amp;nbsp;《数据结构》课程片花时，里面所讲的一句话，我可不敢这么讲。但是，这门课学习的好坏，确实对学生编程能力高低有着很重要的影响。《数据结构》是一门研究非数值计算的程序设计问题中计算机操作对象以及它们之间的关系和操作等的课程，解决实际问题的模型建立和算法设计是其精髓。在整个授课过程中，除了基础知识外，我始终注重学生问题分析建模和算法设计与分析能力的培养。如果学生在这些方面的能力得到提高了，那成为编程高手就是水到渠成的事情了。我多次对学生强调，编程能力是计算机专业学生的基本功，也是未来在IT职场竞争的利器之一。以往毕业学生的职业经历，证明了这一点。&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　记者：开设慕课对自己是一个新的挑战，压力一定也在所难免。最大的挑战是什么？&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　魏振钢：慕课的教学方式对老师和学生都是一种全新的学习形式。对老师来讲，挑战和压力是客观存在的。针对全新的教学模式，教学内容的安排，教学环节设计和组织，都需要认真思考，精心准备；还有学生的接受心理准备程度、适应能力如何，能否按课程设计的要求去完成学习任务。毕竟这种学习方式是以学生的自主学习为主。如何把学生学习的积极性调动起来，真正做到“把学习的主动权交给学生”，这是所面临的最大挑战。如何保证教学质量，这是自己感觉到压力最大的一个方面。说实话，采用慕课方式上课，自己所付出的劳动，比传统上课方式要远远的多。&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　记者：传统课堂难免存在“老师在台上爱讲什么讲什么，学生在下面爱做什么做什么”的现象，慕课的“翻转课堂”是否能颠覆以往以“授”为主的教学方式？&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　魏振钢：传统课堂“老师在台上爱讲什么讲什么，学生在下面爱做什么做什么”的现象是存在的，特别是智能手机、无线网络等的出现，使这种现象愈发严重。在慕课的“翻转课堂”环节，这些现象可以改变一下，因为每个学生都要做好“讲”的准备，而且讨论是大家都要参与的。但目前由于学生人数过多，“翻转课堂”的课时数有限等因素的限制，不可能让所有学生每堂课都参与到翻转课堂中去。因此，上述这种现象很难杜绝。而且学生有出现“两极分化”的趋势，这也是我所担心的问题之一，也是今后在教学中应该注意改进的一个方面。&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　我个人认为，“翻转课堂”目前看还不能颠覆传统的以“授”为主的教学方式，但是一个有力的“竞争者”和“催化剂”。它促使我们传统以“授”为主的教学方式的改进和提高，特别是教师在授课过程中，如何调动学生的学习积极性，由“被动”学习向“主动”学习转变，需要投入很大的精力去研究和探索。但也不排除个别授课较差老师的课程，被慕课所替代的情况出现。“狼来了”的警惕性还是要有的。&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　记者：您的慕课已在线开放近两个学期，是否可以将《数据结构》慕课共享课程的一些体会与大家分享？&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　魏振钢：慕课相比传统授课的优势有：课堂时、空拓宽，学生的学习自主、自由，优质教育资源共享，在线讨论互动便捷。但是其缺陷也是明显的：情景、情感缺失，教师授课灵活性的限制，学生两极分化的趋势，对支撑技术要求高。总的来看，慕课是传统课程的竞争者、互助者、传播者和催化剂，但二者不能相互替代。&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　对教师而言，开展慕课教学，有以下几方面的挑战和机遇：尝试新事物的乐趣；对自己的教学有信心，乐意广泛传播；更多学生的参与及认可；学生更多的质疑，更多的思考；通过论坛解惑答疑、了解学生、加深情感。&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　记者：有了网络，世界是平的；有了慕课，学校也将是平的。或者说，慕课能拆除大学的围墙。您认同这一观点吗？&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　魏振钢：慕课确实使大学的优质资源得到更广泛的传播和分享，从这个意义上理解，它突破了学校与学校、学校与社会的围墙和界限。但是，由于历史、文化、地域等原因所形成的大学校园文化，是慕课所无法传播的。而影响一个学生在大学的学习成长因素，除了专业知识的学习之外，校园文化及环境的熏陶以及师生之间、同学之间的交流也是非常重要的。因此，慕课不能（至少目前不能）拆除大学的围墙，但它可以在学校和学校、学校和社会之间架起一座知识传播的桥梁。&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(51, 51, 51); font-family: Simsun; font-size: 12px; line-height: 21px; background-color: rgb(255, 255, 255);&quot;&gt;　　既然慕课已经是“一个IT技术引发的教育技术革命叩响了高校的大门”。每一位高校教师、教育管理者和学生都将面对，回避甚至是拒绝都是不可取的。在这场教学变革浪潮的冲击下，教师如何教、管理者如何管、学生如何学等一系列问题，都需要我们去探索、研究、实践、总结。自己虽然在这方面先别人走了一步，但也是一个探究者，还有很多问题有待研究，结果如何也有待验证。但是，既然选择了慕课，就要认真去做。不管成功与失败，都可以将经验和教训总结，供他人参考。 &amp;nbsp;&lt;/span&gt;&lt;/p&gt;', N'', 8, 0, 1, N'yoru.jpg', NULL, N'123')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (12, N'123', N'管理员', CAST(0x0000A81900F7B1E9 AS DateTime), N'&lt;p&gt;123&lt;/p&gt;', N'', 2, 0, 1, N'yoru.JPG', NULL, N'123')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (13, N'123', N'管理员', CAST(0x0000A88201318AB0 AS DateTime), N'&lt;p&gt;12312&lt;/p&gt;', N'', 2, 0, 1, N'20170809144440_TVsYx.thumb.700_0.jpg', NULL, N'1231')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (14, N'213', N'123', CAST(0x0000A8B001187FBD AS DateTime), N'', N'123', 0, 0, 1, N'11649144813ebd161eo.jpg', NULL, N'123')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (15, N'且', N'全文', CAST(0x0000A8E80111BF28 AS DateTime), N'&lt;p style=&quot;margin: 10px auto; padding: 0px; font-family: &quot;&gt;嗯= =有毒。&lt;/p&gt;&lt;p style=&quot;margin: 10px auto; padding: 0px; font-family: &quot;&gt;关键字 &amp;#39;User&amp;#39; 附近有语法错误。←就是这个玩意。。嗯。最后。好吧建的表User和sql关键字重复了。。。。嗯。。解决方法是改成sql语句中改成[User] 嗯我显然选择了另一种 我把表的名字改了。。&lt;img src=&quot;/ueditor/net/upload/image/20180327/6365777016830071763218568.png&quot; alt=&quot;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', N'', 0, 0, 1, N'11649144813ebd161eo.jpg', NULL, N'阿大声道爸爸')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (16, N'12313', N'213', CAST(0x0000A8E8011719A7 AS DateTime), N'<p>123</p>', N'', 0, 0, 2, N'20180224141250_mvrih.png', NULL, N'123')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (17, N'123', N'123', CAST(0x0000A8E801176037 AS DateTime), N'&lt;p&gt;123&lt;/p&gt;', N'', 0, 0, 1, N'20180510224039_smfcs.jpg', NULL, N'123')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (18, N'12313', N'123', CAST(0x0000A8E8011771D6 AS DateTime), N'&lt;p&gt;123&lt;/p&gt;', N'', 0, 0, 1, N'TIM截图20180409163913.jpg', NULL, N'123')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (19, N'12313', N'123', CAST(0x0000A8E80117BA61 AS DateTime), N'&lt;p&gt;123&lt;/p&gt;', N'', 0, 0, 1, N'654c0734e5dde7111d33b759adefce1b9c166168.jpg', NULL, N'123')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (20, N'213', N'w', CAST(0x0000A8E80118056C AS DateTime), N'&lt;p&gt;123&lt;/p&gt;', N'123', 0, 0, 1, N'20180510224039_smfcs.jpg', NULL, N'123')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (21, N'213', N'w', CAST(0x0000A8E801182C35 AS DateTime), N'&lt;p&gt;123&lt;/p&gt;', N'123', 0, 0, 1, N'20180510224039_smfcs.jpg', NULL, N'123')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (22, N'12313', N'123', CAST(0x0000A8E801183C12 AS DateTime), N'', N'123', 0, 0, 3, N'20180224141250_mvrih.png', NULL, N'123')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (23, N'阿凡达', N'阿发', CAST(0x0000A8E80132BA06 AS DateTime), N'&lt;p&gt;&lt;img src=&quot;/ueditor/net/upload/image/20180522/6366261093739055456507986.jpg&quot; title=&quot;TIM截图20180409163913.jpg&quot; alt=&quot;TIM截图20180409163913.jpg&quot;/&gt;&lt;/p&gt;', N'', 5, 0, 1, N'20180510224039_smfcs.jpg', NULL, N'水电费')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (24, N'13', N'123', CAST(0x0000A8E80144E3EE AS DateTime), N'&lt;p style=&quot;line-height: 16px;&quot;&gt;&lt;img style=&quot;vertical-align: middle; margin-right: 2px;&quot; src=&quot;http://localhost:54723/ueditor/dialogs/attachment/fileTypeImages/icon_doc.gif&quot;/&gt;&lt;a style=&quot;font-size:12px; color:#0066cc;&quot; href=&quot;/ueditor/net/upload/file/20180522/6366261496096264246515317.docx&quot; title=&quot;专家解答.docx&quot;&gt;专家解答.docx&lt;/a&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', N'', 1, 0, 1, N'20180224141250_mvrih.png', NULL, N'123')
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category], [Develop_path], [Develop_deteledtime], [Develop_summary]) VALUES (25, N'111', N'111', CAST(0x0000A8F300FBAC53 AS DateTime), N'&lt;p&gt;222&lt;br/&gt;&lt;/p&gt;', N'', 0, 1, 2, N'TIM图片20180602115034.png', CAST(0x0000A8F300FBB65E AS DateTime), N'111')
SET IDENTITY_INSERT [dbo].[Develop] OFF
SET IDENTITY_INSERT [dbo].[DevelopCategory] ON 

INSERT [dbo].[DevelopCategory] ([DevelopCategory_id], [DevelopCategory_name]) VALUES (1, N'海洋教育')
INSERT [dbo].[DevelopCategory] ([DevelopCategory_id], [DevelopCategory_name]) VALUES (2, N'中期评价与反馈')
INSERT [dbo].[DevelopCategory] ([DevelopCategory_id], [DevelopCategory_name]) VALUES (3, N'教学试点')
INSERT [dbo].[DevelopCategory] ([DevelopCategory_id], [DevelopCategory_name]) VALUES (4, N'报告与讲座')
SET IDENTITY_INSERT [dbo].[DevelopCategory] OFF
SET IDENTITY_INSERT [dbo].[EducateSource] ON 

INSERT [dbo].[EducateSource] ([id], [title], [body], [publisher], [publish_time], [view_times], [is_deleted], [deletedtime], [summary], [category]) VALUES (1, N'首届中日海洋跨学科教育研讨会召开', N'<p style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 18px; text-align: center;"><span style="font-size: 16px; font-family: 宋体;"><span style="font-family: 黑体;"><img src="/ueditor/net/upload/image/20171016/6364373835906259455488922.jpg"/></span></span></p><p style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 18px;"><span style="font-size: 16px; font-family: 宋体;"><span style="font-family: 黑体;"><br/></span></span></p><p style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 18px;"><span style="font-size: 16px; font-family: 宋体;"><span style="font-family: 黑体;"><br/></span></span></p><p style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 18px;"><span style="font-size: 16px; font-family: 宋体;"><span style="font-family: 黑体;">本站讯</span>&nbsp;8月25日，首届中日海洋跨学科教育研讨会在中国海洋大学学术交流中心召开。本次研讨会的主题是“海洋跨学科教育的改革与发展”，内容涉及海洋与经济、政治、文化、社会、法律、教育等学科发展与人才培养。</span></p><p style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 18px;"><span style="font-size: 16px; font-family: 宋体;">&nbsp;&nbsp;&nbsp;&nbsp;校长助理李巍然主持研讨会并讲话。他指出，跨学科教育在近些年受到极大关注，但以“跨学科”为专题进行研究的并不多见。海洋学本身就是跨不同学科的综合性学科，与会人员在交流的基础上相互借鉴、加深理解，并在一定程度上达成共识，这将有助于海洋学科的发展，有助于海洋跨学科教育的发展。</span></p><p style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 18px;"><span style="font-size: 16px; font-family: 宋体;">&nbsp;&nbsp;&nbsp;&nbsp;研讨会上，日本东京大学海洋研究所木暮一啓教授介绍了东京大学的海洋学综合教育的探索，特别是以“培养为世界海洋作贡献的日本人”为宗旨而成立了海洋教育联盟（Ocean&nbsp;Alliance）机构，推进海洋科学研究与人才跨学科培养密切结合的做法。日本东京大学教育综合研究中心的刘文君研究员以“日本的大学教学课程改革”为题，介绍了日本的大学政策变迁与课程改革的历程、东京大学的教学研究组织的三重结构、东京大学以知识的系统构造为核心的跨学科课程教学与研究的现状，并分析了跨学科教育的重要性和中日加强跨学科教学与研究经验交流的必要性。</span></p><p><span style="font-size: 16px; font-family: 宋体;"><br/></span></p><p><br/></p>', N'系统管理员', N'2017-10-16', 16, 0, NULL, N'234', 1)
INSERT [dbo].[EducateSource] ([id], [title], [body], [publisher], [publish_time], [view_times], [is_deleted], [deletedtime], [summary], [category]) VALUES (2, N'我中心主任宋文红在美国出席POD年会', N'<p style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 21px; text-indent: 32px; margin-top: 0px; margin-bottom: 0px;"><span style="line-height: 24px; font-family: 楷体_gb2312; font-size: 16px;"><img src="/ueditor/net/upload/image/20171016/6364373840055996672343771.jpg"/></span></p><p style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 21px; text-indent: 32px; margin-top: 0px; margin-bottom: 0px;"><span style="line-height: 24px; font-family: 楷体_gb2312; font-size: 16px;">（本报通讯员）</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">高等教育专业与组织发展网络协会</span><span style="line-height: 24px; font-size: 16px;">(Professional&nbsp;and&nbsp;Organizational&nbsp;Development&nbsp;Network&nbsp;in&nbsp;Higher&nbsp;Education</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">，简称</span><span style="line-height: 24px; font-size: 16px;">POD)</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">的第</span><span style="line-height: 24px; font-size: 16px;">35</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">届年会于</span><span style="line-height: 24px; font-size: 16px;">2010</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">年</span><span style="line-height: 24px; font-size: 16px;">11</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">月</span><span style="line-height: 24px; font-size: 16px;">3-7</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">日在美国圣路易斯召开。学校高等教育研究与评估中心、教学支持中心宋文红主任借在美访学之机参加了此次会议。</span></p><p style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 21px; text-indent: 32px; margin-top: 0px; margin-bottom: 0px;"><span style="line-height: 24px; font-size: 16px;">POD</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">是北美乃至世界上规模最大，专门致力于大学教师</span><span style="line-height: 24px; font-size: 16px;">/</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">教学发展的国际院校联盟，自</span><span style="line-height: 24px; font-size: 16px;">20</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">世纪</span><span style="line-height: 24px; font-size: 16px;">70</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">年代中期创建以来，利用年会、网络和学术出版等形式，为大学教师、管理者及从事大学教师</span><span style="line-height: 24px; font-size: 16px;">/</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">教学专业开发的人士提供了一个国际交流的平台，在推动成员国的大学教师</span><span style="line-height: 24px; font-size: 16px;">/</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">教学发展活动中起着不可替代的作用。</span><span style="line-height: 24px; font-size: 16px;">POD</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">建立的初衷是通过促进大学教师的专业发展</span><span style="line-height: 24px; font-size: 16px;">(professional&nbsp;development)</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">与大学组织的发展</span><span style="line-height: 24px; font-size: 16px;">(organizational&nbsp;development)</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">进而最终促进人的发展。</span><span style="line-height: 24px; font-size: 16px;">POD</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">的会员包括大学教师</span><span style="line-height: 24px; font-size: 16px;">/</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">教学发展中心的专业人员、系主任、院长、学生服务人员、学术事务管理者、教育咨询人员等等，他们分属于不同的学科、不同的机构、不同的地域，代表着世界各国的高等教育机构，共同分享高等教育的成功经验。其专门会刊《改进学术》（</span><span style="line-height: 24px; font-size: 16px;">To&nbsp;Improve&nbsp;the&nbsp;Academy</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">）的研讨主题始终围绕大学教师专业发展、教学与组织发展等。</span></p><p style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 21px; text-indent: 32px; margin-top: 0px; margin-bottom: 0px;"><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">本届年会有来自世界各国高校</span><span style="line-height: 24px; font-size: 16px;">700</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">多位参会者，堪称是一届盛会。会议组织了各类主题的小型专题研讨和大会报告，内容丰富多彩，活动形式多种多样，特别注重参会者的交流与反馈。</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">发言者的诸多观点，如“教学不仅需要规则，更需要激情和爱心”，“教的发展目的是促进学的发展，即学生的发展”等及其院校的相关探索引起与会者共鸣。</span><span style="line-height: 24px; font-size: 16px;">POD</span><span style="line-height: 24px; font-family: 宋体; font-size: 16px;">为激励大家积极从事教师教学发展工作，设立了基金与奖励项目，并在本届年会上进行了奖励。</span></p><p><br/></p>', N'系统管理员', N'2017-10-16', 11, 0, NULL, N'234', 1)
INSERT [dbo].[EducateSource] ([id], [title], [body], [publisher], [publish_time], [view_times], [is_deleted], [deletedtime], [summary], [category]) VALUES (3, N'123213123', N'<p>123123123</p>', N'系统管理员', N'2017-10-16', 0, 1, NULL, N'234', 2)
INSERT [dbo].[EducateSource] ([id], [title], [body], [publisher], [publish_time], [view_times], [is_deleted], [deletedtime], [summary], [category]) VALUES (4, N'123123', N'<p>123131</p>', N'系统管理员', N'2017-10-16', 0, 1, NULL, N'234', 2)
INSERT [dbo].[EducateSource] ([id], [title], [body], [publisher], [publish_time], [view_times], [is_deleted], [deletedtime], [summary], [category]) VALUES (5, N'131231', N'<p>31231</p>', N'系统管理员', N'2017-10-16', 1, 1, NULL, N'234', 3)
INSERT [dbo].[EducateSource] ([id], [title], [body], [publisher], [publish_time], [view_times], [is_deleted], [deletedtime], [summary], [category]) VALUES (6, N'1123123', N'<p>1231231231</p>', N'系统管理员', N'2017-10-16', 0, 1, NULL, N'342', 3)
INSERT [dbo].[EducateSource] ([id], [title], [body], [publisher], [publish_time], [view_times], [is_deleted], [deletedtime], [summary], [category]) VALUES (9, N'111', N'<p>1111<br/></p>', N'系统管理员', N'2018-06-02', 0, 1, CAST(0x0000A8F300FDEEF0 AS DateTime), N'111', 1)
INSERT [dbo].[EducateSource] ([id], [title], [body], [publisher], [publish_time], [view_times], [is_deleted], [deletedtime], [summary], [category]) VALUES (10, N'222', N'<p>222<br/></p>', N'系统管理员', N'2018-06-02', 0, 1, CAST(0x0000A8F300FDEEEF AS DateTime), N'222', 1)
INSERT [dbo].[EducateSource] ([id], [title], [body], [publisher], [publish_time], [view_times], [is_deleted], [deletedtime], [summary], [category]) VALUES (11, N'ggg', N'<p>ggg<br/></p>', N'系统管理员', N'2018-06-02', 0, 1, CAST(0x0000A8F300FDEEEE AS DateTime), N'ggg', 1)
INSERT [dbo].[EducateSource] ([id], [title], [body], [publisher], [publish_time], [view_times], [is_deleted], [deletedtime], [summary], [category]) VALUES (12, N'222', N'<p>222<br/></p>', N'系统管理员', N'2018-06-02', 0, 1, CAST(0x0000A8F300FDEEEC AS DateTime), N'222', 1)
INSERT [dbo].[EducateSource] ([id], [title], [body], [publisher], [publish_time], [view_times], [is_deleted], [deletedtime], [summary], [category]) VALUES (13, N'999', N'<p>999<br/></p>', N'系统管理员', N'2018-06-02', 1, 0, NULL, N'999', 1)
SET IDENTITY_INSERT [dbo].[EducateSource] OFF
SET IDENTITY_INSERT [dbo].[FriendsLink] ON 

INSERT [dbo].[FriendsLink] ([id], [title], [link], [orders]) VALUES (1, N'百度', N'https://www.baidu.com/', 3)
INSERT [dbo].[FriendsLink] ([id], [title], [link], [orders]) VALUES (3, N'234', N'https://www.baidu.com/', 4)
INSERT [dbo].[FriendsLink] ([id], [title], [link], [orders]) VALUES (5, N'123', N'https://www.baidu.com/', 2)
INSERT [dbo].[FriendsLink] ([id], [title], [link], [orders]) VALUES (6, N'哈哈哈哈', N'https://www.baidu.com/', 1)
INSERT [dbo].[FriendsLink] ([id], [title], [link], [orders]) VALUES (7, N'感受到', N'https://www.baidu.com/', 2)
INSERT [dbo].[FriendsLink] ([id], [title], [link], [orders]) VALUES (8, N'百度', N'https://www.baidu.com/', 3)
INSERT [dbo].[FriendsLink] ([id], [title], [link], [orders]) VALUES (9, N'百度', N'https://www.baidu.com/', 3)
INSERT [dbo].[FriendsLink] ([id], [title], [link], [orders]) VALUES (10, N'234', N'https://www.baidu.com/', 4)
INSERT [dbo].[FriendsLink] ([id], [title], [link], [orders]) VALUES (11, N'123', N'https://www.baidu.com/', 2)
INSERT [dbo].[FriendsLink] ([id], [title], [link], [orders]) VALUES (12, N'121233', N'https://www.baidu.com/', 1)
INSERT [dbo].[FriendsLink] ([id], [title], [link], [orders]) VALUES (13, N'百度', N'https://www.baidu.com/', 3)
INSERT [dbo].[FriendsLink] ([id], [title], [link], [orders]) VALUES (14, N'百度12', N'https://www.baidu.com/', 2)
INSERT [dbo].[FriendsLink] ([id], [title], [link], [orders]) VALUES (15, N'百12度', N'https://www.baidu.com/', 2)
INSERT [dbo].[FriendsLink] ([id], [title], [link], [orders]) VALUES (16, N'123百度', N'https://www.baidu.com/', 1)
SET IDENTITY_INSERT [dbo].[FriendsLink] OFF
INSERT [dbo].[Introduction] ([Introduction_id], [Introduction_content]) VALUES (1, N'<p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;"><span style="line-height: 1.5em; font-size: 16px;">中国海洋大学教学支持中心成立于2007年7月，是学校直属业务单位之一。中心按照“高起点建设、国际化视野、专业化服务”的原则，依托高等教育研究与评估中心、教务处和人事处共同建设，优化课程评估、教学咨询、教学研究、教学培训等方面的教学资源，同时注重校外智力资源的引进与吸收，为教师职业发展提供专业化、人性化服务与指导，协助广大教师更新教学理念、改进教学方法、提高教学能力，提升教学水平，引导广大教师不断追求教学卓越，共同营造教师职业与学校事业“同成长、共发展”的氛围，服务于学校教育教学事业，努力为创新性人才培养做出自己应有的贡献。</span></p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">目前，学校聘请国际著名比较高等教育学家、美国波士顿学院终身教授菲利普·阿特巴赫，国际著名高等教育专家、加拿大多伦多大学教授许美德为中心学术顾问。高等教育研究与评估中心主任同时担任教学支持中心主任。高等教育研究与评估中心1名负责课程评估与教学督导的副主任、教务处1名负责数字课程资源建设的副处长、人事处1名负责人力资源管理的副处长等3名同志共同兼任教学支持中心副主任。中心办公室设有专职秘书1人，负责日常事务管理。与此同时，中心依托教学评估常设专家委员会、教学督导团、教学促进专家组等三支专家队伍，积极开展课程评估、教学咨询、教学示范、教学培训、教学研究以及教学资源建设等专业服务工作。经过一段时间的集中建设，常态化、经常性开展的业务工作主要有：课程教学评估、个性化教学咨询与指导、新进教师培训、集体教学观摩、高等学校教学策略培训、高等学校骨干教师网络培训、教学工作坊、教育教学报告会、教学卓越奖励计划以及教育教学研究等。在此基础上，我们紧紧围绕学校历史传统与办学特色，依托学校海洋类优势学科，借助国际涉海大学联盟、海峡两岸海洋海事大学联盟、全国涉海大学教务联盟等交流平台，争取在海洋教育方面有一个新的突破，努力将中心建设成为海洋教育特色鲜明、涉海高校引领示范、国内高校影响深远的国家级教师教学示范中心。</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">一、管理人员</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">主&nbsp;&nbsp;任：宋文红（高等教育研究与评估中心主任兼任）</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">副主任：季岸先（高等教育研究与评估中心副主任兼任）</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;于德华（教务处副处长兼任）</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姜永玲</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">秘&nbsp;&nbsp;书：常&nbsp;&nbsp;顺</p><p style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><br/></p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">二、教学评估专家委员会</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">主&nbsp;&nbsp;任：刘新国</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">副主任：宋文红（常务）&nbsp;&nbsp;曾名湧</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">委&nbsp;&nbsp;员：（按姓氏笔画排序）</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">马&nbsp;&nbsp;君&nbsp;&nbsp;&nbsp;王林山&nbsp;&nbsp;&nbsp;王&nbsp;&nbsp;昕&nbsp;&nbsp;&nbsp;方奇志&nbsp;&nbsp;&nbsp;史宏达</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">朱新瑞&nbsp;&nbsp;&nbsp;刘惠荣&nbsp;&nbsp;&nbsp;江文胜&nbsp;&nbsp;&nbsp;许国辉&nbsp;&nbsp;&nbsp;毕彩丰</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">李延团&nbsp;&nbsp;&nbsp;李&nbsp;&nbsp;欣&nbsp;&nbsp;&nbsp;李春荣&nbsp;&nbsp;&nbsp;杨永春&nbsp;&nbsp;&nbsp;汪东风</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">冷卫国&nbsp;&nbsp;&nbsp;张广海&nbsp;&nbsp;&nbsp;茅云翔&nbsp;&nbsp;&nbsp;赵广涛&nbsp;&nbsp;&nbsp;赵&nbsp;&nbsp;昕</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">赵德玉&nbsp;&nbsp;&nbsp;郭海燕&nbsp;&nbsp;&nbsp;崔&nbsp;&nbsp;凤&nbsp;&nbsp;&nbsp;韩宗珠&nbsp;&nbsp;&nbsp;傅&nbsp;&nbsp;刚</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">傅根清&nbsp;&nbsp;&nbsp;温海深&nbsp;&nbsp;&nbsp;樊廷俊</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">办公室设在高等教育研究与评估中心</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">办公室主任：季岸先（兼）</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">秘书：王淑芳</p><p style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><br/></p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">三、第七届教学督导团成员名单：</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">团&nbsp; 长：张永玲</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">副团长：肖鹏</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">成&nbsp; 员：马&nbsp; 甡&nbsp; 王&nbsp; 启&nbsp; 邓红风&nbsp; 冯丽娟</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">孙即霖&nbsp; 李&nbsp; 欣&nbsp; 李学伦&nbsp; 陈&nbsp; 峥&nbsp; 罗福凯</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">周继圣&nbsp; 郑敬高&nbsp; 侯永海&nbsp; 黄亚平&nbsp; 董树刚</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">魏振钢</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">&nbsp;&nbsp;</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">四、教学促进专家组</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">李凤岐&nbsp;&nbsp;周发琇&nbsp;&nbsp;周继圣&nbsp;&nbsp;刘新国&nbsp;&nbsp;宋文红&nbsp;&nbsp;马&nbsp;&nbsp;勇</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">马&nbsp;&nbsp;君&nbsp;&nbsp;罗贻荣&nbsp;&nbsp;冯丽娟&nbsp;&nbsp;任景玲&nbsp;&nbsp;姜永玲&nbsp;&nbsp;赵宗金</p><p style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><br/></p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">五、联系方式</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">邮政编码：266100</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">联系电话：0532-66782193</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">电子信箱：jxdd@ouc.edu.cn</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">地&nbsp;&nbsp;&nbsp;&nbsp;址：山东省青岛市崂山区松岭路238号中国海洋大学行远楼349房间</p><p><br/></p>')
SET IDENTITY_INSERT [dbo].[JudgeApplication] ON 

INSERT [dbo].[JudgeApplication] ([id], [teacher_id], [submit_time]) VALUES (2, 9, N'2017-10-18')
SET IDENTITY_INSERT [dbo].[JudgeApplication] OFF
SET IDENTITY_INSERT [dbo].[PasswordCode] ON 

INSERT [dbo].[PasswordCode] ([id], [teacher_number], [code], [send_time]) VALUES (3, N'1234567', N'2299', CAST(0x0000A8BB011022E3 AS DateTime))
SET IDENTITY_INSERT [dbo].[PasswordCode] OFF
SET IDENTITY_INSERT [dbo].[Picture] ON 

INSERT [dbo].[Picture] ([Picture_id], [Picture_path], [is_top], [Picture_title], [Picture_link], [Picture_summary]) VALUES (3, N'picture/11649144813ebd161eo.jpg', 2, N'234', N'', N'234')
INSERT [dbo].[Picture] ([Picture_id], [Picture_path], [is_top], [Picture_title], [Picture_link], [Picture_summary]) VALUES (4, N'picture/P5282613.JPG', 3, N'999', N'', N'999')
SET IDENTITY_INSERT [dbo].[Picture] OFF
SET IDENTITY_INSERT [dbo].[ProCatCategory] ON 

INSERT [dbo].[ProCatCategory] ([ProCatCategory_id], [ProCatCategory_name]) VALUES (1, N'教学发展基金项目')
SET IDENTITY_INSERT [dbo].[ProCatCategory] OFF
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (1, N'关于新兴的计算机技术支持项目', 1, 1, N'2017-10-16', N'300000    ', 1, NULL)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (3, N'一个项目', 1, 1, N'2017-10-18', N'1         ', 1, NULL)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (4, N'啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', 1, 1, N'2017-10-18', N'1         ', 1, CAST(0x0000A8AB010D7D7C AS DateTime))
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (5, N'啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', 3, 1, N'2017-10-18', N'1         ', 1, CAST(0x0000A8AB010D7DAD AS DateTime))
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (6, N'反反复复', 1, 8, N'2017-10-18', N'1         ', 0, NULL)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (7, N'发现', 1, 8, N'2017-10-18', N'41111     ', 1, CAST(0x0000A8AB010DAA41 AS DateTime))
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (8, N'对对对', 1, 8, N'2017-10-18', N'1000      ', 0, NULL)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (9, N'项目项目', 8, 1, N'2017-10-18', N'10000     ', 1, CAST(0x0000A8AB010DB230 AS DateTime))
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (10, N'虎哈哈哈哈哈哈', 1, 1, N'2017-10-19', N'123       ', 0, NULL)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (11, N'我的额项目测试', 10, 1, N'2017-10-22', N'1000      ', 0, NULL)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (12, N'再来一个项目', 10, 1, N'2017-10-22', N'1000      ', 0, NULL)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (13, N'我的项目', 10, 1, N'2017-10-22', N'1         ', 0, NULL)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (14, N'新项目', 11, 1, N'2017-10-22', N'99        ', 0, NULL)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (15, N'哈哈哈哈哈哈', 12, 1, N'2017-11-19', N'9000      ', 0, NULL)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (16, N'嘿嘿嘿嘿嘿', 12, 1, N'2017-11-19', N'123       ', 0, NULL)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (17, N'项目测试', 13, 12, N'2018-03-10', N'889jjj    ', 0, NULL)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (18, N'666', 13, 13, N'2018-06-02', N'666       ', 0, NULL)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (19, N'777', 13, 13, N'2018-06-02', N'777       ', 0, NULL)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (20, N'766', 13, 13, N'2018-06-02', N'667       ', 0, NULL)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [fund], [is_deleted], [deletedtime]) VALUES (21, N'111', 13, 13, N'2018-06-02', N'111       ', 0, NULL)
SET IDENTITY_INSERT [dbo].[Project] OFF
SET IDENTITY_INSERT [dbo].[ProjectCategory] ON 

INSERT [dbo].[ProjectCategory] ([id], [name], [project_file], [project_content], [stage], [end_time], [judge_end_time], [is_deleted], [publish_time], [deletedtime], [summary], [category]) VALUES (1, N'2017年教学发展基金立项项目公示', N'file/计算机电磁信息泄露分层防护策略的研究_余元辉.pdf', N'', 1, N'2017-10-26', N'2017-11-09', 0, N'2017-10-16', NULL, N'123', 1)
INSERT [dbo].[ProjectCategory] ([id], [name], [project_file], [project_content], [stage], [end_time], [judge_end_time], [is_deleted], [publish_time], [deletedtime], [summary], [category]) VALUES (2, N'关于组织开展集体教学观摩及研讨活动的通知', N'file/实验11 文件操作和异常.pdf', N'', 0, N'2017-10-27', N'2017-10-30', 0, N'2017-10-16', NULL, N'123', 1)
INSERT [dbo].[ProjectCategory] ([id], [name], [project_file], [project_content], [stage], [end_time], [judge_end_time], [is_deleted], [publish_time], [deletedtime], [summary], [category]) VALUES (3, N'213123', N'file/bug.docx', N'<p>123</p>', 0, N'2017-10-26', N'2017-10-25', 1, N'2017-10-16', NULL, N'31', 1)
INSERT [dbo].[ProjectCategory] ([id], [name], [project_file], [project_content], [stage], [end_time], [judge_end_time], [is_deleted], [publish_time], [deletedtime], [summary], [category]) VALUES (4, N'1231', N'file/bug.docx', N'<p>123</p>', 0, N'2017-10-16', N'2017-10-16', 1, N'2017-10-16', NULL, N'32123132', 1)
INSERT [dbo].[ProjectCategory] ([id], [name], [project_file], [project_content], [stage], [end_time], [judge_end_time], [is_deleted], [publish_time], [deletedtime], [summary], [category]) VALUES (5, N'123', N'file/bug.docx', N'<p>123</p>', 0, N'2017-10-26', N'2017-10-28', 1, N'2017-10-16', NULL, N'12331', 1)
INSERT [dbo].[ProjectCategory] ([id], [name], [project_file], [project_content], [stage], [end_time], [judge_end_time], [is_deleted], [publish_time], [deletedtime], [summary], [category]) VALUES (6, N'213123', N'file/bug.docx', N'<p>驱蚊器翁<br/></p>', 0, N'2017-10-26', N'2017-10-27', 1, N'2017-10-16', NULL, N'123', 1)
INSERT [dbo].[ProjectCategory] ([id], [name], [project_file], [project_content], [stage], [end_time], [judge_end_time], [is_deleted], [publish_time], [deletedtime], [summary], [category]) VALUES (7, N'123123', N'file/bug.docx', N'<p>123123</p>', 0, N'2017-10-11', N'2017-10-20', 1, N'2017-10-16', NULL, N'132', 1)
INSERT [dbo].[ProjectCategory] ([id], [name], [project_file], [project_content], [stage], [end_time], [judge_end_time], [is_deleted], [publish_time], [deletedtime], [summary], [category]) VALUES (8, N'教学支持中心举办“慕课背景下的混合式教学设计和实践”工作坊', N'file/实验1 熟悉Visual Studio集成开发环境.pdf', N'', 0, N'2017-10-17', N'2017-10-20', 1, N'2017-10-17', CAST(0x0000A8AB01173008 AS DateTime), N'321', 1)
INSERT [dbo].[ProjectCategory] ([id], [name], [project_file], [project_content], [stage], [end_time], [judge_end_time], [is_deleted], [publish_time], [deletedtime], [summary], [category]) VALUES (9, N'教学支持中心举办成果导向的教学及评价工作坊', N'file/实验2 控制结构和函数.pdf', N'', 0, N'2017-10-11', N'2017-11-10', 1, N'2017-10-17', CAST(0x0000A8AB0117294F AS DateTime), N'1123', 1)
INSERT [dbo].[ProjectCategory] ([id], [name], [project_file], [project_content], [stage], [end_time], [judge_end_time], [is_deleted], [publish_time], [deletedtime], [summary], [category]) VALUES (10, N'这里是一个测试项目', N'file/关于项目部分的操作介绍和注意事项.docx', N'<p>测试项目</p>', 2, N'2017-10-23', N'2017-10-23', 1, N'2017-10-22', CAST(0x0000A8AB01173B5F AS DateTime), N'23', 1)
INSERT [dbo].[ProjectCategory] ([id], [name], [project_file], [project_content], [stage], [end_time], [judge_end_time], [is_deleted], [publish_time], [deletedtime], [summary], [category]) VALUES (11, N'再发布一个项目', N'file/关于项目部分的操作介绍和注意事项.docx', N'<p>1</p>', 1, N'2017-10-20', N'2017-10-20', 1, N'2017-10-22', CAST(0x0000A8AB01173B62 AS DateTime), N'123', 1)
INSERT [dbo].[ProjectCategory] ([id], [name], [project_file], [project_content], [stage], [end_time], [judge_end_time], [is_deleted], [publish_time], [deletedtime], [summary], [category]) VALUES (12, N' 测试项目分类', N'file/一些要改的.docx', N'', 2, N'2018-06-13', N'2018-06-27', 0, N'2017-11-19', NULL, N'324', 1)
INSERT [dbo].[ProjectCategory] ([id], [name], [project_file], [project_content], [stage], [end_time], [judge_end_time], [is_deleted], [publish_time], [deletedtime], [summary], [category]) VALUES (13, N'项目1231231231', N'file/后台.docx', N'<p>的飞洒大<br/></p>', 2, N'2018-06-14', N'2018-06-26', 0, N'2018-03-10', NULL, N'项目摘要', 1)
SET IDENTITY_INSERT [dbo].[ProjectCategory] OFF
SET IDENTITY_INSERT [dbo].[ProjectJudge] ON 

INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (3, 4, 1, 1, 1, 0, N'', 1)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (4, 9, 8, 1, 1, 0, N'', -1)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (5, 11, 10, 1, 1, 0, N'已经通过', 1)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (6, 12, 10, 1, 1, 0, N'2342342342', 1)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (7, 12, 10, 1, 1, 1, N'', -100)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (8, 14, 11, 1, 1, 0, N'了', 1)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (9, 14, 11, 1, 1, 1, N'213123', 1)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (10, 15, 12, 1, 1, 0, N'', 1)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (11, 16, 12, 1, 1, 0, N'', 0)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (12, 16, 12, 1, 1, 1, N'', -100)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (13, 17, 13, 12, 1, 0, N'卡的发发的', 1)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (14, 18, 13, 13, 1, 0, N'', -100)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (15, 19, 13, 13, 1, 0, N'', -100)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (16, 20, 13, 13, 3, 0, N'', -100)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (17, 21, 13, 13, 3, 0, N'', -100)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (18, 12, 10, 1, 1, 2, N'', -1)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (19, 12, 10, 1, 3, 2, N'', -1)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (20, 13, 10, 1, 1, 0, N'', -1)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (21, 13, 10, 1, 3, 0, N'', -1)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (22, 13, 10, 1, 4, 0, N'', -1)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (23, 21, 13, 13, 1, 0, N'', -100)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (24, 18, 13, 13, 3, 1, N'', -100)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (25, 18, 13, 13, 4, 1, N'', -100)
INSERT [dbo].[ProjectJudge] ([id], [project_id], [category], [teacher_id], [judge_id], [stage], [comment], [is_pass]) VALUES (26, 18, 13, 13, 3, 2, N'', -1)
SET IDENTITY_INSERT [dbo].[ProjectJudge] OFF
SET IDENTITY_INSERT [dbo].[ProjectStage] ON 

INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (1, 1, N'file/新建 Microsoft Word 文档.docx', N'<p>众所周知，新兴的计算机技术正以日新月异的速度进行着，探讨和研究新的研究方向是每个研究人员义不容辞的义务</p>', 0, N'2017-10-16', -2)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (3, 3, N'file/C++课程设计报告.doc', N'', 0, N'2017-10-18', -2)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (4, 4, N'file/handbook-for-java-application-and-development-20170925.pdf', N'', 0, N'2017-10-18', -100)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (5, 5, N'file/bug.doc', N'', 0, N'2017-10-18', -2)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (6, 6, N'file/新建文本文档.pdf', N'<p>55555</p>', 0, N'2017-10-18', -100)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (7, 7, N'file/新建文本文档.pdf', N'<p>1111</p>', 0, N'2017-10-18', -100)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (8, 8, N'file/新建文本文档.pdf', N'<p>1000</p>', 0, N'2017-10-18', -100)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (9, 9, N'file/d39e8954-4270-4982-914b-d4e7317b530a.pdf', N'', 0, N'2017-10-18', -1)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (10, 10, N'file/bug.doc', N'<p>123</p><p style="line-height: 16px;"><img src="http://222.195.145.152:8077/ueditor/dialogs/attachment/fileTypeImages/icon_doc.gif"/>bug2.0.docx</p><p><br/></p>', 0, N'2017-10-19', -100)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (11, 11, N'file/关于项目部分的操作介绍和注意事项.docx', N'<p style="line-height: 16px;"><img src="http://localhost:53945/ueditor/dialogs/attachment/fileTypeImages/icon_doc.gif"/><a style="font-size:12px; color:#0066cc;" href="/ueditor/net/upload/file/20171022/6364428302648819337411870.docx" title="关于项目部分的操作介绍和注意事项.docx">关于项目部分的操作介绍和注意事项.docx</a></p><p style="line-height: 16px;"><img src="http://localhost:53945/ueditor/dialogs/attachment/fileTypeImages/icon_doc.gif"/><a style="font-size:12px; color:#0066cc;" href="/ueditor/net/upload/file/20171022/6364428302648819337411870.docx" title="关于项目部分的操作介绍和注意事项.docx">关于项目部分的操作介绍和注意事项.docx</a></p><p><br/></p>', 0, N'2017-10-22', -100)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (12, 12, N'file/关于项目部分的操作介绍和注意事项.docx', N'', 0, N'2017-10-22', 1)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (13, 12, N'file/关于项目部分的操作介绍和注意事项.docx', N'<p>1231231</p>', 1, N'2017-10-22', 0)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (14, 12, N'file/关于项目部分的操作介绍和注意事项.docx', N'<p>123123</p>', 2, N'2017-10-22', -1)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (15, 13, N'file/关于项目部分的操作介绍和注意事项.docx', N'<p>1</p>', 0, N'2017-10-22', 1)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (16, 14, N'file/关于项目部分的操作介绍和注意事项.docx', N'<p>132131</p>', 0, N'2017-10-22', 1)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (17, 14, N'file/关于项目部分的操作介绍和注意事项.docx', N'<p>123</p>', 1, N'2017-10-22', -1)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (18, 15, N'file/U.docx', N'<p style="line-height: 16px;"><img src="http://localhost:54723/ueditor/dialogs/attachment/fileTypeImages/icon_txt.gif"/><a style="font-size:12px; color:#0066cc;" href="/ueditor/net/upload/file/20171119/6364670525362073638278752.txt" title="新建文本文档.txt">新建文本文档.txt</a></p><p style="line-height: 16px;"><img src="http://localhost:54723/ueditor/dialogs/attachment/fileTypeImages/icon_doc.gif"/><a style="font-size:12px; color:#0066cc;" href="/ueditor/net/upload/file/20171119/6364670525361271468278752.docx" title="U.docx">U.docx</a></p><p style="line-height: 16px;"><img src="http://localhost:54723/ueditor/dialogs/attachment/fileTypeImages/icon_doc.gif"/><a style="font-size:12px; color:#0066cc;" href="/ueditor/net/upload/file/20171119/6364670525368991906021323.docx" title="一些要改的.docx">一些要改的.docx</a></p><p style="line-height: 16px;"><br/></p>', 0, N'2017-11-19', 1)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (19, 16, N'file/U.docx', N'<p>1132</p>', 0, N'2017-11-19', 1)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (20, 15, N'file/U.docx', N'', 1, N'2017-11-19', -100)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (21, 16, N'file/U.docx', N'', 1, N'2017-11-19', -100)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (22, 17, N'file/项目提交流程.docx', N'<p>撒的发生</p>', 0, N'2018-03-10', -100)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (23, 18, N'file/20180529 网站发现的问题.docx', N'', 0, N'2018-06-02', 1)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (24, 19, N'file/20180529 网站发现的问题.docx', N'', 0, N'2018-06-02', 1)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (25, 20, N'file/20180529 网站发现的问题.docx', N'<p>666<br/></p>', 0, N'2018-06-02', -100)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (26, 21, N'file/20180529 网站发现的问题.docx', N'', 0, N'2018-06-02', -100)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (27, 18, N'file/20180529 网站发现的问题.docx', N'', 1, N'2018-06-02', 1)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (28, 19, N'file/20180529 网站发现的问题.docx', N'', 1, N'2018-06-02', -100)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (29, 18, N'file/20180529 网站发现的问题.docx', N'', 2, N'2018-06-02', 1)
SET IDENTITY_INSERT [dbo].[ProjectStage] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Service_id], [Service_teacher], [Service_time], [Service_phone], [Service_remarks], [Service_category], [Service_isdeal], [Service_isdeleted], [Service_hit], [Service_author], [Service_deletedtime], [Service_reply]) VALUES (1, 1, CAST(0x0000A80E0088372A AS DateTime), N'12345678910', N'申请服务的备注备注备注', 1, 0, 0, 0, NULL, NULL, NULL)
INSERT [dbo].[Service] ([Service_id], [Service_teacher], [Service_time], [Service_phone], [Service_remarks], [Service_category], [Service_isdeal], [Service_isdeleted], [Service_hit], [Service_author], [Service_deletedtime], [Service_reply]) VALUES (2, 1, CAST(0x0000A80E01563BDD AS DateTime), N'12345678901', N'234234', 1, 1, 0, 0, NULL, NULL, N'1231')
INSERT [dbo].[Service] ([Service_id], [Service_teacher], [Service_time], [Service_phone], [Service_remarks], [Service_category], [Service_isdeal], [Service_isdeleted], [Service_hit], [Service_author], [Service_deletedtime], [Service_reply]) VALUES (4, 8, CAST(0x0000A810013D128D AS DateTime), N'17805555555', N'555', 1, 0, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Service] ([Service_id], [Service_teacher], [Service_time], [Service_phone], [Service_remarks], [Service_category], [Service_isdeal], [Service_isdeleted], [Service_hit], [Service_author], [Service_deletedtime], [Service_reply]) VALUES (5, 1, CAST(0x0000A8820131DD7A AS DateTime), N'123123', N'123123', 1, 1, 1, 0, NULL, CAST(0x0000A8EF0104036C AS DateTime), N'hhhhh')
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[ServiceCategory] ON 

INSERT [dbo].[ServiceCategory] ([ServiceCategory_id], [ServiceCategory_name]) VALUES (1, N'教学评估')
INSERT [dbo].[ServiceCategory] ([ServiceCategory_id], [ServiceCategory_name]) VALUES (2, N'教学服务')
SET IDENTITY_INSERT [dbo].[ServiceCategory] OFF
SET IDENTITY_INSERT [dbo].[SourceCategory] ON 

INSERT [dbo].[SourceCategory] ([SourceCategory_id], [SourceCategory_name]) VALUES (1, N'主动学习')
INSERT [dbo].[SourceCategory] ([SourceCategory_id], [SourceCategory_name]) VALUES (2, N'同伴教学')
INSERT [dbo].[SourceCategory] ([SourceCategory_id], [SourceCategory_name]) VALUES (3, N'学习评价')
INSERT [dbo].[SourceCategory] ([SourceCategory_id], [SourceCategory_name]) VALUES (5, N'教育技术')
SET IDENTITY_INSERT [dbo].[SourceCategory] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([id], [name], [password], [gender], [email], [number], [phone_number], [department], [rank], [is_judge]) VALUES (1, N'喵喵喵', N'CAD433D0576A78C9089575C61BF77447B62A4D7D', 0, N'337118043@qq.com', N'1234567', N'13345678901', N'医药学院', N'教授', 1)
INSERT [dbo].[Teacher] ([id], [name], [password], [gender], [email], [number], [phone_number], [department], [rank], [is_judge]) VALUES (3, N'哈哈哈', N'DB1AFEFF32B63F0334C79CC465F066E57B987A8B', 0, N'924483784@qq.com', N'7654321', N'13061451196', N'', N'', 1)
INSERT [dbo].[Teacher] ([id], [name], [password], [gender], [email], [number], [phone_number], [department], [rank], [is_judge]) VALUES (4, N'某某某', N'C04E27F18046895650E1BB6BEB9FD0BFA03811C4', 0, N'1111@qq.com', N'1234569', N'13345678901', N'信息科学与工程学院', N'讲师', 1)
INSERT [dbo].[Teacher] ([id], [name], [password], [gender], [email], [number], [phone_number], [department], [rank], [is_judge]) VALUES (5, N'一个教师', N'DB1AFEFF32B63F0334C79CC465F066E57B987A8B', 0, N'924483784@qq.com', N'8888888', N'13061451196', N'', N'', 0)
INSERT [dbo].[Teacher] ([id], [name], [password], [gender], [email], [number], [phone_number], [department], [rank], [is_judge]) VALUES (6, N'哈哈哈', N'DB1AFEFF32B63F0334C79CC465F066E57B987A8B', 0, N'1111@qq.com', N'1239999', N'13345678901', N'海洋与大气学院', N'副教授', 0)
INSERT [dbo].[Teacher] ([id], [name], [password], [gender], [email], [number], [phone_number], [department], [rank], [is_judge]) VALUES (7, N'喵喵喵', N'DB1AFEFF32B63F0334C79CC465F066E57B987A8B', 0, N'123456@qq.com', N'3456789', N'18345678910', N'', N'', 0)
INSERT [dbo].[Teacher] ([id], [name], [password], [gender], [email], [number], [phone_number], [department], [rank], [is_judge]) VALUES (8, N'123', N'6496F3E05E6B20C417DD560DE54FD648B8631AE0', 0, N'121212@qq.com', N'1111111', N'17806666666', N'哈哈哈哈或或', N'教授', 0)
INSERT [dbo].[Teacher] ([id], [name], [password], [gender], [email], [number], [phone_number], [department], [rank], [is_judge]) VALUES (9, N'123', N'C04E27F18046895650E1BB6BEB9FD0BFA03811C4', 0, N'924483784@qq.com', N'0000000', N'13061451196', N'', N'', 0)
INSERT [dbo].[Teacher] ([id], [name], [password], [gender], [email], [number], [phone_number], [department], [rank], [is_judge]) VALUES (10, N'李航傻逼', N'3BF8455E819B77264B9F162B62ED12CC07224FBD', 0, N'390752251@qq.com', N'1666666', N'17854265504', N'', N'', 0)
INSERT [dbo].[Teacher] ([id], [name], [password], [gender], [email], [number], [phone_number], [department], [rank], [is_judge]) VALUES (11, N'萨达', N'3BF8455E819B77264B9F162B62ED12CC07224FBD', 0, N'390752251@qq.com', N'5555555', N'17548555065', N'', N'', 0)
INSERT [dbo].[Teacher] ([id], [name], [password], [gender], [email], [number], [phone_number], [department], [rank], [is_judge]) VALUES (12, N'嘿嘿嘿', N'C04E27F18046895650E1BB6BEB9FD0BFA03811C4', 0, N'ashdf@qq.com', N'123456m', N'13799131063', N'海洋与大气学院', N'助教', 0)
INSERT [dbo].[Teacher] ([id], [name], [password], [gender], [email], [number], [phone_number], [department], [rank], [is_judge]) VALUES (13, N'呵呵呵', N'C04E27F18046895650E1BB6BEB9FD0BFA03811C4', 1, N'987643@qq.com', N'1234557', N'13098765543', N'教学科学学院', N'其他', 0)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
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
ALTER TABLE [dbo].[EducateSource]  WITH CHECK ADD  CONSTRAINT [FK_EducateSource_SourceCategory] FOREIGN KEY([category])
REFERENCES [dbo].[SourceCategory] ([SourceCategory_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EducateSource] CHECK CONSTRAINT [FK_EducateSource_SourceCategory]
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
ALTER TABLE [dbo].[ProjectCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProjectCategory_ProCatCategory] FOREIGN KEY([category])
REFERENCES [dbo].[ProCatCategory] ([ProCatCategory_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProjectCategory] CHECK CONSTRAINT [FK_ProjectCategory_ProCatCategory]
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
            TopColumn = 0
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
         Begin Table = "ProjectCategory"
            Begin Extent = 
               Top = 7
               Left = 281
               Bottom = 170
               Right = 493
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
         Column = 4068
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
