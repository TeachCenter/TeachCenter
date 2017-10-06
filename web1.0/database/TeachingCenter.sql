USE [TeachingCenter]
GO
/****** Object:  Database [TeachingCenter]    Script Date: 2017/10/1 15:39:16 ******/
CREATE DATABASE [TeachingCenter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TeachingCenter', FILENAME = N'C:\Users\LIANG\TeachingCenter.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[Activity]    Script Date: 2017/10/1 15:39:16 ******/
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
/****** Object:  Table [dbo].[ActivityCategory]    Script Date: 2017/10/1 15:39:16 ******/
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
/****** Object:  Table [dbo].[ActivitySummary]    Script Date: 2017/10/1 15:39:16 ******/
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
/****** Object:  Table [dbo].[ActivityTeacher]    Script Date: 2017/10/1 15:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityTeacher](
	[id] [int] NOT NULL,
	[activity_id] [int] NOT NULL,
	[teacher_id] [int] NOT NULL,
 CONSTRAINT [PK_ActivityTeacher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2017/10/1 15:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin_id] [nvarchar](50) NOT NULL,
	[Admin_pwd] [nvarchar](50) NOT NULL,
	[Admin_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Develop]    Script Date: 2017/10/1 15:39:16 ******/
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
 CONSTRAINT [PK_Develop] PRIMARY KEY CLUSTERED 
(
	[Develop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DevelopCategory]    Script Date: 2017/10/1 15:39:16 ******/
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
/****** Object:  Table [dbo].[EducateSource]    Script Date: 2017/10/1 15:39:16 ******/
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
/****** Object:  Table [dbo].[Introduction]    Script Date: 2017/10/1 15:39:16 ******/
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
/****** Object:  Table [dbo].[JudgeApplication]    Script Date: 2017/10/1 15:39:16 ******/
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
/****** Object:  Table [dbo].[Picture]    Script Date: 2017/10/1 15:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture](
	[Picture_id] [int] IDENTITY(1,1) NOT NULL,
	[Picture_path] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Picture] PRIMARY KEY CLUSTERED 
(
	[Picture_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Project]    Script Date: 2017/10/1 15:39:16 ******/
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
	[is_deleted] [int] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectCategory]    Script Date: 2017/10/1 15:39:16 ******/
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
 CONSTRAINT [PK_ProjectCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectJudge]    Script Date: 2017/10/1 15:39:16 ******/
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
/****** Object:  Table [dbo].[ProjectStage]    Script Date: 2017/10/1 15:39:16 ******/
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
/****** Object:  Table [dbo].[Service]    Script Date: 2017/10/1 15:39:16 ******/
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
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceCategory]    Script Date: 2017/10/1 15:39:16 ******/
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
/****** Object:  Table [dbo].[Teacher]    Script Date: 2017/10/1 15:39:16 ******/
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
/****** Object:  View [dbo].[ApplicationInfo]    Script Date: 2017/10/1 15:39:16 ******/
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
/****** Object:  View [dbo].[ProjectInfo]    Script Date: 2017/10/1 15:39:16 ******/
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
SET IDENTITY_INSERT [dbo].[ActivityCategory] ON 

INSERT [dbo].[ActivityCategory] ([ActivityCategory_id], [ActivityCategory_name]) VALUES (2, N'讲座')
INSERT [dbo].[ActivityCategory] ([ActivityCategory_id], [ActivityCategory_name]) VALUES (3, N'活动1')
INSERT [dbo].[ActivityCategory] ([ActivityCategory_id], [ActivityCategory_name]) VALUES (4, N'活动22')
INSERT [dbo].[ActivityCategory] ([ActivityCategory_id], [ActivityCategory_name]) VALUES (5, N'871924')
INSERT [dbo].[ActivityCategory] ([ActivityCategory_id], [ActivityCategory_name]) VALUES (8, N'3123123')
INSERT [dbo].[ActivityCategory] ([ActivityCategory_id], [ActivityCategory_name]) VALUES (9, N'123123')
INSERT [dbo].[ActivityCategory] ([ActivityCategory_id], [ActivityCategory_name]) VALUES (10, N'123')
INSERT [dbo].[ActivityCategory] ([ActivityCategory_id], [ActivityCategory_name]) VALUES (11, N'123')
INSERT [dbo].[ActivityCategory] ([ActivityCategory_id], [ActivityCategory_name]) VALUES (12, N'123')
INSERT [dbo].[ActivityCategory] ([ActivityCategory_id], [ActivityCategory_name]) VALUES (13, N'123')
SET IDENTITY_INSERT [dbo].[ActivityCategory] OFF
SET IDENTITY_INSERT [dbo].[ActivitySummary] ON 

INSERT [dbo].[ActivitySummary] ([ActivitySummary_id], [ActivitySummary_title], [ActivitySummary_time], [ActivitySummary_content], [ActivitySummary_isdeleted], [ActivitySummary_author], [ActivitySummary_cover], [ActivitySummary_hit]) VALUES (1, N'活动总结121231', CAST(0x0000A7F800B505B8 AS DateTime), N'&lt;p&gt;123123123&lt;/p&gt;', 0, N'admin', N'picture/c70bbd99a9014c087776d456007b02087af4f4a7.jpg', 0)
INSERT [dbo].[ActivitySummary] ([ActivitySummary_id], [ActivitySummary_title], [ActivitySummary_time], [ActivitySummary_content], [ActivitySummary_isdeleted], [ActivitySummary_author], [ActivitySummary_cover], [ActivitySummary_hit]) VALUES (2, N'123123', CAST(0x0000A7F800B5229E AS DateTime), N'&lt;p&gt;啊打发打发&lt;/p&gt;', 0, N'admin', N'picture/QQ截图20170327120256.png', 0)
INSERT [dbo].[ActivitySummary] ([ActivitySummary_id], [ActivitySummary_title], [ActivitySummary_time], [ActivitySummary_content], [ActivitySummary_isdeleted], [ActivitySummary_author], [ActivitySummary_cover], [ActivitySummary_hit]) VALUES (3, N'教学评价学术报告会举行', CAST(0x0000A7F800D75B64 AS DateTime), N'&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 2em;text-indent: 37px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;2017&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;7&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;6&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;日上午，教学支持中心举办教学评价学术报告会，邀请澳门大学教与学优化中心主任&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;Spencer Benson&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;教授主讲，题目为“&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;Assessment: What it is and what it can be&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;”。&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;报告会上，&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;Benson&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;教授先后讲述了教学评价的目的和意义、教学评价的类型、教学评价各方面的关联、学习成果、教学评价程序、什么是好的教学评价等内容。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 2em;text-indent: 37px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20170924/6364185503111209276358404.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 2em;text-indent: 37px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 2em;text-indent: 37px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;Benson&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;教授把教学评价比作驱动学习前进的发动机，我国铁路机车实现了由内燃机车到标准动车组的跨越，而高校的教学评价亟待向以学生为中心的教学评价模式转型。他认为，没有促进学生学习的教学评价是在浪费教师和学生的时间，记忆不等于学习。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20170924/6364185503181392158743367.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 2em;text-indent: 37px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;教学评价的类型主要有形成性评价、终结性评价、诊断性评价、真实性评价等，&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;Benson&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;教授详细讲解了不同类型教学评价的特点和使用方法。好的教学评价主要有以下特点&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;:&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;对学生和教师同行有意义，嵌入课程活动中，与课程目标或学习成果一致，以课程和学科为基础。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 2em;text-indent: 37px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-size: 20px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20170924/6364185503198799447457753.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 2em;text-indent: 37px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 19px&quot;&gt;&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 2em;text-indent: 37px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;报告会设置多个互动环节，让参会教师思考教学评价的目的和意义、利用布鲁姆学习目标分类法设计学习成果。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 2em;text-indent: 37px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20170924/6364185503216687544699557.jpg&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255)&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255)&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 2em;text-indent: 37px&quot;&gt;&lt;img src=&quot;/ueditor/net/upload/image/20170924/6364185503234493893413943.jpg&quot;/&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 2em;text-indent: 37px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;Benson&lt;/span&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;教授还以自己讲授的“微生物与社会”通识课程为例，介绍教学评价设计的理念、学习目标分类以及教学评价和学习成果的关联。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 2em;text-indent: 37px&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;color: rgb(51, 51, 51);font-family: &amp;#39;Microsoft YaHei&amp;#39;;font-size: 12px;white-space: normal;background-color: rgb(255, 255, 255);line-height: 2em;text-indent: 37px&quot;&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;第三期教学研习营教师、部分职能部处和院系教师参加报告会。会议由外国语学院副院长王慧敏主持。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;line-height: 2em;font-family: 等线;font-size: 20px&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', 0, N'666', N'picture/TIM图片20170910171217.png', 2)
INSERT [dbo].[ActivitySummary] ([ActivitySummary_id], [ActivitySummary_title], [ActivitySummary_time], [ActivitySummary_content], [ActivitySummary_isdeleted], [ActivitySummary_author], [ActivitySummary_cover], [ActivitySummary_hit]) VALUES (4, N'输入不能为空微微', CAST(0x0000A7F801027FA1 AS DateTime), N'&lt;p&gt;微微企鹅我去问&lt;br/&gt;&lt;/p&gt;', 0, N'666', N'picture/174926603561.jpg', 3)
SET IDENTITY_INSERT [dbo].[ActivitySummary] OFF
INSERT [dbo].[Admin] ([Admin_id], [Admin_pwd], [Admin_name]) VALUES (N'admin', N'DE5CAC556F600BEC8E4425383CA7D8E8E86352E7', N'666')
SET IDENTITY_INSERT [dbo].[Develop] ON 

INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category]) VALUES (1, N'1234', N'666', CAST(0x0000A7F90153424C AS DateTime), N'&lt;p&gt;13213&lt;/p&gt;', N'', 0, 1, 1)
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category]) VALUES (2, N'234234', N'666', CAST(0x0000A7F9015D0397 AS DateTime), N'&lt;p&gt;24124&lt;/p&gt;', N'', 0, 0, 1)
INSERT [dbo].[Develop] ([Develop_id], [Develop_title], [Develop_author], [Develop_time], [Develop_content], [Develop_link], [Develop_hit], [Develop_deleted], [Develop_category]) VALUES (3, N'123132131', N'666', CAST(0x0000A7F90160B947 AS DateTime), N'&lt;p&gt;12313&lt;/p&gt;', N'', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Develop] OFF
SET IDENTITY_INSERT [dbo].[DevelopCategory] ON 

INSERT [dbo].[DevelopCategory] ([DevelopCategory_id], [DevelopCategory_name]) VALUES (1, N'学习与促进')
INSERT [dbo].[DevelopCategory] ([DevelopCategory_id], [DevelopCategory_name]) VALUES (2, N'报告与评估')
INSERT [dbo].[DevelopCategory] ([DevelopCategory_id], [DevelopCategory_name]) VALUES (3, N'报告讲座')
SET IDENTITY_INSERT [dbo].[DevelopCategory] OFF
SET IDENTITY_INSERT [dbo].[EducateSource] ON 

INSERT [dbo].[EducateSource] ([id], [title], [body], [publisher], [publish_time], [view_times], [is_deleted]) VALUES (1, N'hahahahahha', N'啦啦啦啦啦啦', N'管理员', N'2017-09-08', 0, 0)
INSERT [dbo].[EducateSource] ([id], [title], [body], [publisher], [publish_time], [view_times], [is_deleted]) VALUES (3, N'5566', N'111111111', N'管理员', N'2018-09-08', 0, 1)
INSERT [dbo].[EducateSource] ([id], [title], [body], [publisher], [publish_time], [view_times], [is_deleted]) VALUES (4, N'23333', N'23333', N'管理员', N'2018-09-08', 0, 1)
INSERT [dbo].[EducateSource] ([id], [title], [body], [publisher], [publish_time], [view_times], [is_deleted]) VALUES (5, N'一个教学资源', N'&lt;p&gt;2333333333&lt;/p&gt;', N'系统管理员', N'2017-09-30', 0, 0)
INSERT [dbo].[EducateSource] ([id], [title], [body], [publisher], [publish_time], [view_times], [is_deleted]) VALUES (6, N'111111111', N'<p>111111111111111111</p>', N'系统管理员', N'2017-09-30', 0, 0)
SET IDENTITY_INSERT [dbo].[EducateSource] OFF
INSERT [dbo].[Introduction] ([Introduction_id], [Introduction_content]) VALUES (1, N'<p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;"><span style="line-height: 1.5em; font-size: 16px;">中国海洋大学教学支持中心成立于2007年7月，是学校直属业务单位之一。中心按照“高起点建设、国际化视野、专业化服务”的原则，依托高等教育研究与评估中心、教务处和人事处共同建设，优化课程评估、教学咨询、教学研究、教学培训等方面的教学资源，同时注重校外智力资源的引进与吸收，为教师职业发展提供专业化、人性化服务与指导，协助广大教师更新教学理念、改进教学方法、提高教学能力，提升教学水平，引导广大教师不断追求教学卓越，共同营造教师职业与学校事业“同成长、共发展”的氛围，服务于学校教育教学事业，努力为创新性人才培养做出自己应有的贡献。</span></p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">目前，学校聘请国际著名比较高等教育学家、美国波士顿学院终身教授菲利普·阿特巴赫，国际著名高等教育专家、加拿大多伦多大学教授许美德为中心学术顾问。高等教育研究与评估中心主任同时担任教学支持中心主任。高等教育研究与评估中心1名负责课程评估与教学督导的副主任、教务处1名负责数字课程资源建设的副处长、人事处1名负责人力资源管理的副处长等3名同志共同兼任教学支持中心副主任。中心办公室设有专职秘书1人，负责日常事务管理。与此同时，中心依托教学评估常设专家委员会、教学督导团、教学促进专家组等三支专家队伍，积极开展课程评估、教学咨询、教学示范、教学培训、教学研究以及教学资源建设等专业服务工作。经过一段时间的集中建设，常态化、经常性开展的业务工作主要有：课程教学评估、个性化教学咨询与指导、新进教师培训、集体教学观摩、高等学校教学策略培训、高等学校骨干教师网络培训、教学工作坊、教育教学报告会、教学卓越奖励计划以及教育教学研究等。在此基础上，我们紧紧围绕学校历史传统与办学特色，依托学校海洋类优势学科，借助国际涉海大学联盟、海峡两岸海洋海事大学联盟、全国涉海大学教务联盟等交流平台，争取在海洋教育方面有一个新的突破，努力将中心建设成为海洋教育特色鲜明、涉海高校引领示范、国内高校影响深远的国家级教师教学示范中心。</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">一、管理人员</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">主&nbsp;&nbsp;任：宋文红（高等教育研究与评估中心主任兼任）</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">副主任：季岸先（高等教育研究与评估中心副主任兼任）</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;于德华（教务处副处长兼任）</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姜永玲</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">秘&nbsp;&nbsp;书：常&nbsp;&nbsp;顺</p><p style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><br/></p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">二、教学评估专家委员会</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">主&nbsp;&nbsp;任：刘新国</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">副主任：宋文红（常务）&nbsp;&nbsp;曾名湧</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">委&nbsp;&nbsp;员：（按姓氏笔画排序）</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">马&nbsp;&nbsp;君&nbsp;&nbsp;&nbsp;王林山&nbsp;&nbsp;&nbsp;王&nbsp;&nbsp;昕&nbsp;&nbsp;&nbsp;方奇志&nbsp;&nbsp;&nbsp;史宏达</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">朱新瑞&nbsp;&nbsp;&nbsp;刘惠荣&nbsp;&nbsp;&nbsp;江文胜&nbsp;&nbsp;&nbsp;许国辉&nbsp;&nbsp;&nbsp;毕彩丰</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">李延团&nbsp;&nbsp;&nbsp;李&nbsp;&nbsp;欣&nbsp;&nbsp;&nbsp;李春荣&nbsp;&nbsp;&nbsp;杨永春&nbsp;&nbsp;&nbsp;汪东风</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">冷卫国&nbsp;&nbsp;&nbsp;张广海&nbsp;&nbsp;&nbsp;茅云翔&nbsp;&nbsp;&nbsp;赵广涛&nbsp;&nbsp;&nbsp;赵&nbsp;&nbsp;昕</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">赵德玉&nbsp;&nbsp;&nbsp;郭海燕&nbsp;&nbsp;&nbsp;崔&nbsp;&nbsp;凤&nbsp;&nbsp;&nbsp;韩宗珠&nbsp;&nbsp;&nbsp;傅&nbsp;&nbsp;刚</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">傅根清&nbsp;&nbsp;&nbsp;温海深&nbsp;&nbsp;&nbsp;樊廷俊</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">办公室设在高等教育研究与评估中心</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">办公室主任：季岸先（兼）</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">秘书：王淑芳</p><p style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><br/></p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">三、第七届教学督导团成员名单：</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">团&nbsp; 长：张永玲</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">副团长：肖鹏</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">成&nbsp; 员：马&nbsp; 甡&nbsp; 王&nbsp; 启&nbsp; 邓红风&nbsp; 冯丽娟</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">孙即霖&nbsp; 李&nbsp; 欣&nbsp; 李学伦&nbsp; 陈&nbsp; 峥&nbsp; 罗福凯</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">周继圣&nbsp; 郑敬高&nbsp; 侯永海&nbsp; 黄亚平&nbsp; 董树刚</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">魏振钢</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">&nbsp;&nbsp;</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">四、教学促进专家组</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">李凤岐&nbsp;&nbsp;周发琇&nbsp;&nbsp;周继圣&nbsp;&nbsp;刘新国&nbsp;&nbsp;宋文红&nbsp;&nbsp;马&nbsp;&nbsp;勇</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">马&nbsp;&nbsp;君&nbsp;&nbsp;罗贻荣&nbsp;&nbsp;冯丽娟&nbsp;&nbsp;任景玲&nbsp;&nbsp;姜永玲&nbsp;&nbsp;赵宗金</p><p style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);"><br/></p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">五、联系方式</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">邮政编码：266100</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">联系电话：0532-66782193</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">电子信箱：jxdd@ouc.edu.cn</p><p class="p_text_indent_2" style="color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;; white-space: normal; background-color: rgb(255, 255, 255); line-height: 1.5em;">地&nbsp;&nbsp;&nbsp;&nbsp;址：山东省青岛市崂山区松岭路238号中国海洋大学行远楼349房间</p><p><br/></p>')
SET IDENTITY_INSERT [dbo].[Picture] ON 

INSERT [dbo].[Picture] ([Picture_id], [Picture_path]) VALUES (1, N'132')
SET IDENTITY_INSERT [dbo].[Picture] OFF
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [is_deleted]) VALUES (2, N'项目1', 2, 1, N'2017-09-30', 1)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [is_deleted]) VALUES (3, N'项目2', 2, 2, N'2017-09-30', 1)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [is_deleted]) VALUES (4, N'项目3', 2, 1, N'2017-09-30', 1)
INSERT [dbo].[Project] ([project_id], [name], [category], [teacher_id], [submit_time], [is_deleted]) VALUES (5, N'1111111111', 3, 2, N'2017-09-30', 0)
SET IDENTITY_INSERT [dbo].[Project] OFF
SET IDENTITY_INSERT [dbo].[ProjectCategory] ON 

INSERT [dbo].[ProjectCategory] ([id], [name], [project_file], [project_content], [stage], [end_time], [judge_end_time], [is_deleted]) VALUES (2, N'略略路', N'file/计算机电磁信息泄露分层防护策略的研究_余元辉.pdf', N'&lt;p&gt;123&lt;/p&gt;', 0, N'2017-09-04', N'2017-09-13', 1)
INSERT [dbo].[ProjectCategory] ([id], [name], [project_file], [project_content], [stage], [end_time], [judge_end_time], [is_deleted]) VALUES (3, N'123', N'file/利用计算机屏蔽技术预防信息泄露_宋双庆.pdf', N'&lt;p&gt;11111111111111&lt;br/&gt;&lt;/p&gt;', 0, N'2017-09-04', N'2017-09-20', 0)
INSERT [dbo].[ProjectCategory] ([id], [name], [project_file], [project_content], [stage], [end_time], [judge_end_time], [is_deleted]) VALUES (4, N'456', N'file/探究计算机屏蔽技术预防信息泄露_杨晓红.pdf', N'&lt;p&gt;3333333333&lt;/p&gt;', 0, N'2017-09-14', N'2017-09-27', 1)
INSERT [dbo].[ProjectCategory] ([id], [name], [project_file], [project_content], [stage], [end_time], [judge_end_time], [is_deleted]) VALUES (5, N'222222222222', N'file/探究计算机屏蔽技术预防信息泄露_杨晓红.pdf', N'<p><img src="http://img.baidu.com/hi/jx2/j_0025.gif"/>22222222222</p>', 0, N'2017-09-13', N'2017-10-04', 0)
SET IDENTITY_INSERT [dbo].[ProjectCategory] OFF
SET IDENTITY_INSERT [dbo].[ProjectStage] ON 

INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (2, 2, N'file/探究计算机屏蔽技术预防信息泄露_孙雪梅.pdf', N'&lt;p&gt;1234&lt;/p&gt;', 0, N'2017-09-30', -2)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (3, 3, N'file/探究计算机屏蔽技术预防信息泄露_孙雪梅.pdf', N'&lt;p&gt;1111111111111111&lt;/p&gt;', 0, N'2017-09-30', -2)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (5, 4, N'file/探究计算机屏蔽技术预防信息泄露_孙雪梅.pdf', N'&lt;p&gt;233333333333333&lt;/p&gt;', 0, N'2017-09-30', -2)
INSERT [dbo].[ProjectStage] ([id], [project_id], [project_file], [project_content], [stage], [time], [is_pass]) VALUES (6, 5, N'file/探究计算机屏蔽技术预防信息泄露_杨晓红.pdf', N'&lt;p&gt;222222222222&lt;/p&gt;', 0, N'2017-09-30', -2)
SET IDENTITY_INSERT [dbo].[ProjectStage] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Service_id], [Service_teacher], [Service_time], [Service_phone], [Service_remarks], [Service_category], [Service_isdeal], [Service_isdeleted], [Service_hit]) VALUES (1, 2, CAST(0x0000A7EF011A7F57 AS DateTime), N'12345678910', N'111', 1, 0, 0, 0)
INSERT [dbo].[Service] ([Service_id], [Service_teacher], [Service_time], [Service_phone], [Service_remarks], [Service_category], [Service_isdeal], [Service_isdeleted], [Service_hit]) VALUES (2, 2, CAST(0x0000A7F0011AC6A4 AS DateTime), N'12345678910', N'最后', 1, 1, 0, 0)
INSERT [dbo].[Service] ([Service_id], [Service_teacher], [Service_time], [Service_phone], [Service_remarks], [Service_category], [Service_isdeal], [Service_isdeleted], [Service_hit]) VALUES (3, 2, CAST(0x0000A7F1011AD5C7 AS DateTime), N'12345678910', N'', 2, 1, 1, 0)
INSERT [dbo].[Service] ([Service_id], [Service_teacher], [Service_time], [Service_phone], [Service_remarks], [Service_category], [Service_isdeal], [Service_isdeleted], [Service_hit]) VALUES (4, 2, CAST(0x0000A7F200FE5FEC AS DateTime), N'213123', N'13', 1, 0, 0, 0)
INSERT [dbo].[Service] ([Service_id], [Service_teacher], [Service_time], [Service_phone], [Service_remarks], [Service_category], [Service_isdeal], [Service_isdeleted], [Service_hit]) VALUES (5, 2, CAST(0x0000A7F300FE6891 AS DateTime), N'213123123', N'13123123123', 1, 0, 0, 0)
INSERT [dbo].[Service] ([Service_id], [Service_teacher], [Service_time], [Service_phone], [Service_remarks], [Service_category], [Service_isdeal], [Service_isdeleted], [Service_hit]) VALUES (6, 2, CAST(0x0000A7F400FE6CB0 AS DateTime), N'213123123', N'13123123123123123', 1, 0, 0, 0)
INSERT [dbo].[Service] ([Service_id], [Service_teacher], [Service_time], [Service_phone], [Service_remarks], [Service_category], [Service_isdeal], [Service_isdeleted], [Service_hit]) VALUES (7, 2, CAST(0x0000A7F500FE707E AS DateTime), N'213123123', N'131231231231231123123', 1, 0, 0, 0)
INSERT [dbo].[Service] ([Service_id], [Service_teacher], [Service_time], [Service_phone], [Service_remarks], [Service_category], [Service_isdeal], [Service_isdeleted], [Service_hit]) VALUES (8, 2, CAST(0x0000A7F600FE7696 AS DateTime), N'213123123123', N'1312312312312311231231231231', 1, 0, 0, 0)
INSERT [dbo].[Service] ([Service_id], [Service_teacher], [Service_time], [Service_phone], [Service_remarks], [Service_category], [Service_isdeal], [Service_isdeleted], [Service_hit]) VALUES (9, 2, CAST(0x0000A7F700FE7E81 AS DateTime), N'21312312', N'123', 1, 1, 0, 0)
INSERT [dbo].[Service] ([Service_id], [Service_teacher], [Service_time], [Service_phone], [Service_remarks], [Service_category], [Service_isdeal], [Service_isdeleted], [Service_hit]) VALUES (10, 2, CAST(0x0000A7F700FE8378 AS DateTime), N'21312312', N'123123123', 1, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[ServiceCategory] ON 

INSERT [dbo].[ServiceCategory] ([ServiceCategory_id], [ServiceCategory_name]) VALUES (1, N'期中学生反馈')
INSERT [dbo].[ServiceCategory] ([ServiceCategory_id], [ServiceCategory_name]) VALUES (2, N'课件提升')
INSERT [dbo].[ServiceCategory] ([ServiceCategory_id], [ServiceCategory_name]) VALUES (3, N'教学咨询')
INSERT [dbo].[ServiceCategory] ([ServiceCategory_id], [ServiceCategory_name]) VALUES (9, N'1313')
INSERT [dbo].[ServiceCategory] ([ServiceCategory_id], [ServiceCategory_name]) VALUES (10, N'123')
INSERT [dbo].[ServiceCategory] ([ServiceCategory_id], [ServiceCategory_name]) VALUES (11, N'23423423')
INSERT [dbo].[ServiceCategory] ([ServiceCategory_id], [ServiceCategory_name]) VALUES (12, N'999')
SET IDENTITY_INSERT [dbo].[ServiceCategory] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([id], [name], [password], [image], [gender], [email], [number], [phone_number], [department], [rank], [is_judge]) VALUES (1, N'教室甲', N'DE5CAC556F600BEC8E4425383CA7D8E8E86352E7', N'1', 1, N'1', N'1', N'1', N'1', N'1', 1)
INSERT [dbo].[Teacher] ([id], [name], [password], [image], [gender], [email], [number], [phone_number], [department], [rank], [is_judge]) VALUES (2, N'教师', N'DE5CAC556F600BEC8E4425383CA7D8E8E86352E7', N'123', 123, N'123', N'123', N'123', N'123', N'1', 1)
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
