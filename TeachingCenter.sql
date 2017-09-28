USE [TeachCenter]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 2017/9/18 21:21:01 ******/
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
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectCategory]    Script Date: 2017/9/18 21:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](10) NOT NULL,
	[project_content] [nvarchar](max) NOT NULL,
	[stage] [int] NOT NULL,
	[end_time] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProjectCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProjectJudge]    Script Date: 2017/9/18 21:21:01 ******/
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
/****** Object:  Table [dbo].[ProjectStage]    Script Date: 2017/9/18 21:21:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectStage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Teacher]    Script Date: 2017/9/18 21:21:01 ******/
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
