USE [master]
GO
/****** Object:  Database [dbb1d5d26d1a7940d6ad83a6fd0189a61d]    Script Date: 16-Mar-17 3:56:58 PM ******/
CREATE DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] ON  PRIMARY 
( NAME = N'dbb1d5d26d1a7940d6ad83a6fd0189a61d', FILENAME = N'D:\mssqldata\dbb1d5d26d1a7940d6ad83a6fd0189a61d.mdf' , SIZE = 2304KB , MAXSIZE = 20480KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbb1d5d26d1a7940d6ad83a6fd0189a61d_log', FILENAME = N'E:\mssqllog\dbb1d5d26d1a7940d6ad83a6fd0189a61d_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbb1d5d26d1a7940d6ad83a6fd0189a61d].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET  MULTI_USER 
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET DB_CHAINING OFF 
GO
USE [dbb1d5d26d1a7940d6ad83a6fd0189a61d]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 16-Mar-17 3:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NULL,
	[InstitutionId] [int] NOT NULL,
	[SchoolYearId] [int] NOT NULL,
	[FirstTrimesterProfileId] [int] NULL,
	[SecondTrimesterProfileId] [int] NULL,
	[ThirdTrimesterProfileId] [int] NULL,
	[YearCreated] [int] NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exams]    Script Date: 16-Mar-17 3:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Percentage] [float] NOT NULL,
	[Score] [int] NOT NULL,
	[RegisterProfileId] [int] NOT NULL,
 CONSTRAINT [PK_Exams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExamScores]    Script Date: 16-Mar-17 3:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamScores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScoreRegisterId] [int] NOT NULL,
	[ExamId] [int] NOT NULL,
	[ExamScore] [float] NOT NULL,
	[ExamPoints] [float] NOT NULL,
	[ExamPercentage] [float] NOT NULL,
 CONSTRAINT [PK_ExamScores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExtraclassWorks]    Script Date: 16-Mar-17 3:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtraclassWorks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Percentage] [float] NOT NULL,
	[RegisterProfileId] [int] NOT NULL,
 CONSTRAINT [PK_ExtraclassWorks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExtraclassWorksScores]    Script Date: 16-Mar-17 3:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtraclassWorksScores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScoreRegisterId] [int] NOT NULL,
	[ExtraclassWorkId] [int] NOT NULL,
	[ExtraclassWorkPercentage] [float] NOT NULL,
 CONSTRAINT [PK_ExtraclassWorksScores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Institution]    Script Date: 16-Mar-17 3:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Institution](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Institution] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RegisterProfiles]    Script Date: 16-Mar-17 3:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterProfiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[UserId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[TrimesterId] [int] NOT NULL,
	[SchoolYearId] [int] NOT NULL,
	[DailyWorkPercentage] [float] NOT NULL,
	[ConceptPercentage] [float] NOT NULL,
	[AssistancePercentage] [float] NOT NULL,
	[NumberOfLessons] [int] NOT NULL,
	[YearCreated] [int] NULL,
 CONSTRAINT [PK_RegisterProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 16-Mar-17 3:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SchoolYears]    Script Date: 16-Mar-17 3:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolYears](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_SchoolYears] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Scores]    Script Date: 16-Mar-17 3:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegisterProfileId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
	[DailyWorkPercentage] [float] NOT NULL,
	[ConceptPercentage] [float] NOT NULL,
	[AssistancePercentage] [float] NOT NULL,
	[Belated] [int] NOT NULL,
	[Absences] [int] NOT NULL,
	[YearCreated] [int] NOT NULL,
 CONSTRAINT [PK_Scores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 16-Mar-17 3:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardId] [nvarchar](30) NULL,
	[FirstName] [nvarchar](40) NOT NULL,
	[LastName] [nvarchar](85) NOT NULL,
	[ClassId] [int] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 16-Mar-17 3:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectsByUsers]    Script Date: 16-Mar-17 3:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectsByUsers](
	[UserId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
 CONSTRAINT [PK_SubjectsByUsers] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trimesters]    Script Date: 16-Mar-17 3:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trimesters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NULL,
 CONSTRAINT [PK_Trimesters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 16-Mar-17 3:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](25) NOT NULL,
	[Password] [nvarchar](25) NOT NULL,
	[FirstName] [nvarchar](25) NULL,
	[LastName] [nvarchar](25) NULL,
	[InstitutionId] [int] NULL,
	[RolId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Users]    Script Date: 16-Mar-17 3:56:59 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExamScores] ADD  CONSTRAINT [DF_ExamScores_ExamScore]  DEFAULT ((0)) FOR [ExamScore]
GO
ALTER TABLE [dbo].[ExamScores] ADD  CONSTRAINT [DF_ExamScores_ExamPoints]  DEFAULT ((0)) FOR [ExamPoints]
GO
ALTER TABLE [dbo].[ExamScores] ADD  CONSTRAINT [DF_ExamScores_ExamPercentage]  DEFAULT ((0)) FOR [ExamPercentage]
GO
ALTER TABLE [dbo].[ExtraclassWorksScores] ADD  CONSTRAINT [DF_ExtraclassWorksScores_ExtraclassWorkPercentage]  DEFAULT ((0)) FOR [ExtraclassWorkPercentage]
GO
ALTER TABLE [dbo].[RegisterProfiles] ADD  CONSTRAINT [DF_RegisterProfiles_DailyWorkPercentage]  DEFAULT ((0)) FOR [DailyWorkPercentage]
GO
ALTER TABLE [dbo].[RegisterProfiles] ADD  CONSTRAINT [DF_RegisterProfiles_ConceptPercentage]  DEFAULT ((0)) FOR [ConceptPercentage]
GO
ALTER TABLE [dbo].[RegisterProfiles] ADD  CONSTRAINT [DF_RegisterProfiles_AssistancePercentage]  DEFAULT ((0)) FOR [AssistancePercentage]
GO
ALTER TABLE [dbo].[RegisterProfiles] ADD  CONSTRAINT [DF_RegisterProfiles_NumberOfLessons]  DEFAULT ((0)) FOR [NumberOfLessons]
GO
ALTER TABLE [dbo].[Scores] ADD  CONSTRAINT [DF_Scores_DailyWorkPercentage]  DEFAULT ((0)) FOR [DailyWorkPercentage]
GO
ALTER TABLE [dbo].[Scores] ADD  CONSTRAINT [DF_Scores_ConceptPercentage]  DEFAULT ((0)) FOR [ConceptPercentage]
GO
ALTER TABLE [dbo].[Scores] ADD  CONSTRAINT [DF_Scores_AssistancePercentage]  DEFAULT ((0)) FOR [AssistancePercentage]
GO
ALTER TABLE [dbo].[Scores] ADD  CONSTRAINT [DF_Scores_Belated]  DEFAULT ((0)) FOR [Belated]
GO
ALTER TABLE [dbo].[Scores] ADD  CONSTRAINT [DF_Scores_Absences]  DEFAULT ((0)) FOR [Absences]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_Classes_Institution] FOREIGN KEY([InstitutionId])
REFERENCES [dbo].[Institution] ([Id])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK_Classes_Institution]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_Classes_RegisterProfiles] FOREIGN KEY([FirstTrimesterProfileId])
REFERENCES [dbo].[RegisterProfiles] ([Id])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK_Classes_RegisterProfiles]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_Classes_RegisterProfiles1] FOREIGN KEY([SecondTrimesterProfileId])
REFERENCES [dbo].[RegisterProfiles] ([Id])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK_Classes_RegisterProfiles1]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_Classes_RegisterProfiles2] FOREIGN KEY([ThirdTrimesterProfileId])
REFERENCES [dbo].[RegisterProfiles] ([Id])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK_Classes_RegisterProfiles2]
GO
ALTER TABLE [dbo].[Classes]  WITH CHECK ADD  CONSTRAINT [FK_Classes_SchoolYears] FOREIGN KEY([SchoolYearId])
REFERENCES [dbo].[SchoolYears] ([Id])
GO
ALTER TABLE [dbo].[Classes] CHECK CONSTRAINT [FK_Classes_SchoolYears]
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [FK_Exams_RegisterProfiles] FOREIGN KEY([RegisterProfileId])
REFERENCES [dbo].[RegisterProfiles] ([Id])
GO
ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [FK_Exams_RegisterProfiles]
GO
ALTER TABLE [dbo].[ExamScores]  WITH CHECK ADD  CONSTRAINT [FK_ExamScores_Exams] FOREIGN KEY([ExamId])
REFERENCES [dbo].[Exams] ([Id])
GO
ALTER TABLE [dbo].[ExamScores] CHECK CONSTRAINT [FK_ExamScores_Exams]
GO
ALTER TABLE [dbo].[ExamScores]  WITH CHECK ADD  CONSTRAINT [FK_ExamScores_Scores] FOREIGN KEY([ScoreRegisterId])
REFERENCES [dbo].[Scores] ([Id])
GO
ALTER TABLE [dbo].[ExamScores] CHECK CONSTRAINT [FK_ExamScores_Scores]
GO
ALTER TABLE [dbo].[ExtraclassWorks]  WITH CHECK ADD  CONSTRAINT [FK_ExtraclassWorks_RegisterProfiles] FOREIGN KEY([RegisterProfileId])
REFERENCES [dbo].[RegisterProfiles] ([Id])
GO
ALTER TABLE [dbo].[ExtraclassWorks] CHECK CONSTRAINT [FK_ExtraclassWorks_RegisterProfiles]
GO
ALTER TABLE [dbo].[ExtraclassWorksScores]  WITH CHECK ADD  CONSTRAINT [FK_ExtraclassWorksScores_ExtraclassWorks] FOREIGN KEY([ExtraclassWorkId])
REFERENCES [dbo].[ExtraclassWorks] ([Id])
GO
ALTER TABLE [dbo].[ExtraclassWorksScores] CHECK CONSTRAINT [FK_ExtraclassWorksScores_ExtraclassWorks]
GO
ALTER TABLE [dbo].[ExtraclassWorksScores]  WITH CHECK ADD  CONSTRAINT [FK_ExtraclassWorksScores_Scores] FOREIGN KEY([ScoreRegisterId])
REFERENCES [dbo].[Scores] ([Id])
GO
ALTER TABLE [dbo].[ExtraclassWorksScores] CHECK CONSTRAINT [FK_ExtraclassWorksScores_Scores]
GO
ALTER TABLE [dbo].[RegisterProfiles]  WITH CHECK ADD  CONSTRAINT [FK_RegisterProfiles_SchoolYears] FOREIGN KEY([SchoolYearId])
REFERENCES [dbo].[SchoolYears] ([Id])
GO
ALTER TABLE [dbo].[RegisterProfiles] CHECK CONSTRAINT [FK_RegisterProfiles_SchoolYears]
GO
ALTER TABLE [dbo].[RegisterProfiles]  WITH CHECK ADD  CONSTRAINT [FK_RegisterProfiles_Subjects] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([Id])
GO
ALTER TABLE [dbo].[RegisterProfiles] CHECK CONSTRAINT [FK_RegisterProfiles_Subjects]
GO
ALTER TABLE [dbo].[RegisterProfiles]  WITH CHECK ADD  CONSTRAINT [FK_RegisterProfiles_Trimesters] FOREIGN KEY([TrimesterId])
REFERENCES [dbo].[Trimesters] ([Id])
GO
ALTER TABLE [dbo].[RegisterProfiles] CHECK CONSTRAINT [FK_RegisterProfiles_Trimesters]
GO
ALTER TABLE [dbo].[RegisterProfiles]  WITH CHECK ADD  CONSTRAINT [FK_RegisterProfiles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[RegisterProfiles] CHECK CONSTRAINT [FK_RegisterProfiles_Users]
GO
ALTER TABLE [dbo].[Scores]  WITH CHECK ADD  CONSTRAINT [FK_Scores_Classes] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Classes] ([Id])
GO
ALTER TABLE [dbo].[Scores] CHECK CONSTRAINT [FK_Scores_Classes]
GO
ALTER TABLE [dbo].[Scores]  WITH CHECK ADD  CONSTRAINT [FK_Scores_RegisterProfiles] FOREIGN KEY([RegisterProfileId])
REFERENCES [dbo].[RegisterProfiles] ([Id])
GO
ALTER TABLE [dbo].[Scores] CHECK CONSTRAINT [FK_Scores_RegisterProfiles]
GO
ALTER TABLE [dbo].[Scores]  WITH CHECK ADD  CONSTRAINT [FK_Scores_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[Scores] CHECK CONSTRAINT [FK_Scores_Students]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Classes] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Classes] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Classes]
GO
ALTER TABLE [dbo].[SubjectsByUsers]  WITH CHECK ADD  CONSTRAINT [FK_SubjectsByUsers_SubjectsByUsers] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([Id])
GO
ALTER TABLE [dbo].[SubjectsByUsers] CHECK CONSTRAINT [FK_SubjectsByUsers_SubjectsByUsers]
GO
ALTER TABLE [dbo].[SubjectsByUsers]  WITH CHECK ADD  CONSTRAINT [FK_SubjectsByUsers_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[SubjectsByUsers] CHECK CONSTRAINT [FK_SubjectsByUsers_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Institution] FOREIGN KEY([InstitutionId])
REFERENCES [dbo].[Institution] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Institution]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RolId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [dbb1d5d26d1a7940d6ad83a6fd0189a61d] SET  READ_WRITE 
GO
