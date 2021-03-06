USE [master]
GO
/****** Object:  Database [Enterprise]    Script Date: 2017/3/28 9:57:52 ******/
CREATE DATABASE [Enterprise]
GO
ALTER DATABASE [Enterprise] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Enterprise].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Enterprise] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Enterprise] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Enterprise] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Enterprise] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Enterprise] SET ARITHABORT OFF 
GO
ALTER DATABASE [Enterprise] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Enterprise] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Enterprise] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Enterprise] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Enterprise] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Enterprise] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Enterprise] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Enterprise] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Enterprise] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Enterprise] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Enterprise] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Enterprise] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Enterprise] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Enterprise] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Enterprise] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Enterprise] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Enterprise] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Enterprise] SET RECOVERY FULL 
GO
ALTER DATABASE [Enterprise] SET  MULTI_USER 
GO
ALTER DATABASE [Enterprise] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Enterprise] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Enterprise', N'ON'
GO
USE [Enterprise]
GO
/****** Object:  Table [dbo].[CheckPoint]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckPoint](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CheckPoint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CheckPointItem]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckPointItem](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[CheckPoint] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Score] [int] NOT NULL,
 CONSTRAINT [PK_CheckPointItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CheckRelation]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckRelation](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Checker] [uniqueidentifier] NOT NULL,
	[Staff] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CheckRelation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Domain]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Domain](
	[Id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Domain] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[User] [uniqueidentifier] NOT NULL,
	[IP] [varchar](50) NOT NULL,
	[Time] [smalldatetime] NOT NULL,
	[Name] [varchar](50) NULL,
	[Contact] [varchar](100) NULL,
	[Content] [varchar](2000) NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobLevel]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobLevel](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_JobLevel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JobTitle]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitle](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_JobTitle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OfficeLocation]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficeLocation](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_OfficeLocation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Organization]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Parent] [uniqueidentifier] NULL,
	[Name] [varchar](100) NOT NULL,
	[Telphone] [varchar](100) NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleAuthorization]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleAuthorization](
	[Domain] [uniqueidentifier] NOT NULL,
	[Role] [uniqueidentifier] NOT NULL,
	[AuthorizationKey] [varchar](100) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleUser]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleUser](
	[Domain] [uniqueidentifier] NOT NULL,
	[Role] [uniqueidentifier] NOT NULL,
	[User] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Organization] [uniqueidentifier] NOT NULL,
	[Account] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Number] [varchar](50) NULL,
	[JobTitle] [uniqueidentifier] NULL,
	[JobLevel] [uniqueidentifier] NULL,
	[OfficeLocation] [uniqueidentifier] NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](200) NULL,
	[ExtTelphone] [varchar](100) NULL,
	[Telphone] [varchar](100) NULL,
	[Cellphone] [varchar](100) NULL,
	[Notify] [bit] NOT NULL,
	[Removed] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserWorkType]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserWorkType](
	[Domain] [uniqueidentifier] NOT NULL,
	[User] [uniqueidentifier] NOT NULL,
	[WorkType] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WeeklyReport]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeeklyReport](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[User] [uniqueidentifier] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[WeekOfYear] [int] NOT NULL,
	[Monday] [smalldatetime] NOT NULL,
	[Sunday] [smalldatetime] NOT NULL,
	[Checked] [bit] NOT NULL,
	[Checker] [uniqueidentifier] NULL,
	[CheckRemark] [varchar](max) NULL,
 CONSTRAINT [PK_WeekLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WeeklyReportCheckList]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeeklyReportCheckList](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[User] [uniqueidentifier] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[WeekOfYear] [int] NOT NULL,
	[Monday] [smalldatetime] NOT NULL,
	[Sunday] [smalldatetime] NOT NULL,
	[WeeklyReport] [uniqueidentifier] NOT NULL,
	[CheckPoint] [uniqueidentifier] NOT NULL,
	[Value] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_WeekLogCheckList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WeeklyReportItem]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeeklyReportItem](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Organization] [uniqueidentifier] NULL,
	[User] [uniqueidentifier] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[WeekOfYear] [int] NOT NULL,
	[Monday] [smalldatetime] NOT NULL,
	[Sunday] [smalldatetime] NOT NULL,
	[WeeklyReport] [uniqueidentifier] NOT NULL,
	[WorkType] [uniqueidentifier] NOT NULL,
	[WorkTask] [uniqueidentifier] NOT NULL,
	[Content] [varchar](max) NULL,
	[Status] [uniqueidentifier] NOT NULL,
	[Time] [float] NOT NULL,
	[Date] [smalldatetime] NULL,
	[Remark] [varchar](max) NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_WeekLogItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkStatus]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkStatus](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Sort] [int] NOT NULL,
 CONSTRAINT [PK_WorkStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkTask]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkTask](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[WorkType] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_WorkTask] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkType]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkType](
	[Id] [uniqueidentifier] NOT NULL,
	[Domain] [uniqueidentifier] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_WorkType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[CheckPoint] ADD  CONSTRAINT [DF_CheckPoint_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[CheckPointItem] ADD  CONSTRAINT [DF_CheckPointItem_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[CheckPointItem] ADD  CONSTRAINT [DF_CheckPointItem_Score]  DEFAULT ((0)) FOR [Score]
GO
ALTER TABLE [dbo].[CheckRelation] ADD  CONSTRAINT [DF_CheckRelation_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Domain] ADD  CONSTRAINT [DF_Domain_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[JobTitle] ADD  CONSTRAINT [DF_JobTitle_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Organization] ADD  CONSTRAINT [DF_Organization_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Organization] ADD  CONSTRAINT [DF_Organization_Sort]  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Notify]  DEFAULT ((0)) FOR [Notify]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Removed]  DEFAULT ((0)) FOR [Removed]
GO
ALTER TABLE [dbo].[WeeklyReport] ADD  CONSTRAINT [DF_WeekLog_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[WeeklyReport] ADD  CONSTRAINT [DF_WeekLog_Checked]  DEFAULT ((0)) FOR [Checked]
GO
ALTER TABLE [dbo].[WeeklyReportCheckList] ADD  CONSTRAINT [DF_WeekLogCheckList_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[WeeklyReportItem] ADD  CONSTRAINT [DF_WeeklyReportItem_Sort]  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[WorkStatus] ADD  CONSTRAINT [DF_WorkStatus_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[WorkStatus] ADD  CONSTRAINT [DF_WorkStatus_Sort]  DEFAULT ((0)) FOR [Sort]
GO
ALTER TABLE [dbo].[WorkTask] ADD  CONSTRAINT [DF_WorkTask_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[WorkType] ADD  CONSTRAINT [DF_WorkType_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorizationListByUser]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAuthorizationListByUser]
	-- Add the parameters for the stored procedure here
	@userId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [RoleAuthorization].[AuthorizationKey] FROM 
	(
		SELECT * FROM [RoleUser] WHERE [User]= @userId
	) t
	LEFT JOIN [RoleAuthorization]
	ON t.[Role] = [RoleAuthorization].[Role]

END


GO
/****** Object:  StoredProcedure [dbo].[GetCheckRelationList]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCheckRelationList]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		
	SELECT t.*,checkerUser.[Name] AS [CheckerName],
	staffUser.[Name] AS [StaffName] FROM  (
	SELECT * FROM [CheckRelation] 
	WHERE [Domain] = @domainId
	) t
	LEFT JOIN [User] as checkerUser
	ON t.[Checker] = checkerUser.[Id]
	LEFT JOIN [User] as staffUser
	ON t.[Staff] = staffUser.[Id]
END

GO
/****** Object:  StoredProcedure [dbo].[GetCheckStaffList]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCheckStaffList]
	-- Add the parameters for the stored procedure here
	@checkerId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	SELECT t.[Staff] AS [Id],
	staffUser.[Name] AS [Name] FROM  (
	SELECT * FROM [CheckRelation] 
	WHERE [Checker] = @checkerId
	) t
	LEFT JOIN [User] as staffUser
	ON t.[Staff] = staffUser.[Id]
END

GO
/****** Object:  StoredProcedure [dbo].[GetRoleListByUser]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRoleListByUser]
	-- Add the parameters for the stored procedure here
	@userId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Role].* FROM 
	(
		SELECT * FROM [RoleUser] WHERE [USER] = @userId
	) t
	LEFT JOIN [Role]
	ON t.[Role] = [Role].[Id]
END


GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUser]
	-- Add the parameters for the stored procedure here
	@id uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT tUser.*,[Organization].[Name] AS [OrganizationName] FROM (
	SELECT * FROM [User] WHERE [Id]= @id
	) tUser
	LEFT JOIN [Organization]
	ON tUser.Organization = [Organization].[Id]
	LEFT JOIN [Domain]
	ON tUser.Domain = [Domain].[Id]


END

GO
/****** Object:  StoredProcedure [dbo].[GetUserList]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserList]
	-- Add the parameters for the stored procedure here
	@domain UNIQUEIDENTIFIER,
	@page INT,
	@pageSize INT,
	@name VARCHAR(50),
	@organizationId UNIQUEIDENTIFIER,
	@searchOrganization TINYINT
	
AS
BEGIN
	
	declare @rowStart int
	declare @rowEnd int
	
	SET @rowStart = (@page - 1) * @pageSize + 1
	SET @rowEnd = @rowStart + @pageSize - 1
	 
	--指定组织机构及下级组织机构
	IF @searchOrganization = 0
	BEGIN
	
	;with cte_Organization(Id,Name,parent,level)
	as
	(
		--起始条件
		select Id,Name,parent,0 as level
		from dbo.Organization
		where id = @organizationId
		union all
		--递归条件
		select a.Id,a.Name,a.parent,level+1
		from Organization a
		inner join 
		cte_Organization b
		on ( a.parent=b.id)  
	)
	--SELECT * FROM cte_Organization

	
	SELECT * FROM (
		SELECT ROW_NUMBER() OVER(ORDER BY [Account] ASC) AS rownum,* FROM (
			SELECT tUser.*,cte_Organization.[Name] AS [OrganizationName],
			[JobLevel].[Name] as [JobLevelName],[JobTitle].[Name] AS [JobTitleName],
			[OfficeLocation].[Name] as [OfficeLocationName] FROM (
				SELECT * FROM [User] 
				WHERE [Domain]=@domain 
				AND [Name] LIKE @name AND [Removed] = 0
			) tUser
			INNER JOIN
			cte_Organization
			ON tUser.Organization = cte_Organization.[Id]
			LEFT JOIN [JobLevel]
			ON tUser.[JobLevel] = [JobLevel].[Id]
			LEFT JOIN [JobTitle]
			ON tUser.[JobTitle] = [JobTitle].[Id]
			LEFT JOIN [OfficeLocation]
			ON tUser.[OfficeLocation] = [OfficeLocation].[Id]
		) AllData
	)as ResultTable WHERE rownum between @rowStart and @rowEnd


	;with cte_Organization(Id,Name,parent,level)
		as
		(
			--起始条件
			select Id,Name,parent,0 as level
			from dbo.Organization
			where id = @organizationId
			union all
			--递归条件
			select a.Id,a.Name,a.parent,level+1
			from Organization a
			inner join 
			cte_Organization b
			on ( a.parent=b.id)  
		)
	
		SELECT COUNT(1) AS TotalCount  FROM (
			SELECT * FROM [User] 
			WHERE [Domain]= @domain
			AND [Name] LIKE @name AND [Removed] = 0
		) tUser
		INNER JOIN
		cte_Organization
		ON tUser.Organization = cte_Organization.[Id]
		
	END
	ELSE IF @searchOrganization = 1
	BEGIN
	
		--指定组织机构
		SELECT * FROM (
			SELECT ROW_NUMBER() OVER(ORDER BY [Account] ASC) AS rownum,* FROM (
				SELECT tUser.*,[Organization].[Name] AS [OrganizationName],
				[JobLevel].[Name] as [JobLevelName],[JobTitle].[Name] AS [JobTitleName],
				[OfficeLocation].[Name] as [OfficeLocationName]  FROM(
					SELECT * FROM [User] 
					WHERE [Domain]=@domain
					AND [Organization] = @organizationId
					AND [Name] LIKE @name  AND [Removed] = 0
				) tUser
				LEFT JOIN [Organization]
				ON tUser.[Organization] = [Organization].[Id]
				LEFT JOIN [JobLevel]
				ON tUser.[JobLevel] = [JobLevel].[Id]
				LEFT JOIN [JobTitle]
				ON tUser.[JobTitle] = [JobTitle].[Id]
				LEFT JOIN [OfficeLocation]
				ON tUser.[OfficeLocation] = [OfficeLocation].[Id]
				--WHERE [Member].[Name] LIKE '%%'
			) AllData
		) as ResultTable WHERE rownum between @rowStart and @rowEnd

		--指定组织机构人数
		SELECT COUNT(1) AS TotalCount FROM [User] 
		WHERE [Domain]=@domain
		AND [Organization] = @organizationId
		AND [Name] LIKE @name AND [Removed] = 0
	
	END
	
	
END




GO
/****** Object:  StoredProcedure [dbo].[GetUserListByRoleId]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserListByRoleId] 
	-- Add the parameters for the stored procedure here
	@role uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT t.[User] AS [Id],[User].[Name] FROM (
		SELECT * FROM [RoleUser] WHERE [Role] = @role
	) t
	LEFT JOIN [User]
	ON t.[User] = [User].[Id]
END


GO
/****** Object:  StoredProcedure [dbo].[GetUserWrapperList]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserWrapperList]
	-- Add the parameters for the stored procedure here
	@organizationId uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT tUser.*,[JobLevel].[Name] as [JobLevelName],[JobTitle].[Name] AS [JobTitleName],
	[OfficeLocation].[Name] as [OfficeLocationName],[Organization].[Name] as [OrganizationName]
	 FROM (
	SELECT * FROM [User] WHERE [Organization] = @organizationId AND [Removed] = 0
	) tUser
	LEFT JOIN [JobLevel]
	ON tUser.[JobLevel] = [JobLevel].[Id]
	LEFT JOIN [JobTitle]
	ON tUser.[JobTitle] = [JobTitle].[Id]
	LEFT JOIN [OfficeLocation]
	ON tUser.[OfficeLocation] = [OfficeLocation].[Id]
	LEFT JOIN [Organization]
	ON tUser.[Organization] = [Organization].[Id]
	LEFT JOIN [Domain]
	ON tUser.[Domain] = [Domain].[Id]
END

GO
/****** Object:  StoredProcedure [dbo].[GetWeeklyReport]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetWeeklyReport]
	-- Add the parameters for the stored procedure here
	@user uniqueidentifier,
	@year int,
	@weekOfYear int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM [WeeklyReport] 
	WHERE [User] = @user
	AND [Year] = @year AND [WeekOfYear] = @weekOfYear


	SELECT * FROM [WeeklyReportItem] 
	WHERE [User] = @user
	AND [Year] = @year AND [WeekOfYear] = @weekOfYear
	ORDER BY [Date] ASC ,[Sort] ASC


	SELECT t.*,[CheckPoint].[Name] AS [CheckPointName],
	[CheckPointItem].[Name] AS [CheckPointItemName],[CheckPointItem].[Score] AS [Score] FROM (
	SELECT [WeeklyReportCheckList].[CheckPoint],[WeeklyReportCheckList].[Value] FROM [WeeklyReportCheckList]
	WHERE [User] = @user
	AND [Year] = @year AND [WeekOfYear] = @weekOfYear
	) t
	LEFT JOIN [CheckPoint] 
	ON t.[CheckPoint] = [CheckPoint].[Id]
	LEFT JOIN [CheckPointItem] 
	ON t.[Value] = [CheckPointItem].[Id]
END


GO
/****** Object:  StoredProcedure [dbo].[GetWeeklyReportForCheck]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetWeeklyReportForCheck]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@checkerId uniqueidentifier,
	@year int,
	@weekOfYear int,
	@checked bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	  if(@checked IS NOT NULL)
	  begin 
		set @whereSql = @whereSql + ' AND [Checked] = ' + convert(char(1),@checked)
	  end

    set @sql = '
	 SELECT tWeeklyReport.*,[User].[Name] AS [UserName],[User].[Organization] FROM (
	SELECT * FROM [WeeklyReport]
	WHERE [Year] = ' + convert(varchar(4),@year) + ' AND [WeekOfYear] = ' + convert(varchar(4),@weekOfYear) + ' 
	AND [Domain] = ''' +  convert(char(36),@domainId) + '''' + @whereSql + '
	AND [User] in (
		SELECT [Staff] FROM CheckRelation
		WHERE [Checker] = ''' +  convert(char(36),@checkerId) + '''
	)
		) tWeeklyReport
	LEFT JOIN [User]
	ON tWeeklyReport.[User] = [User].[Id]'
	
	exec (@sql)
	
	----------
	
	set @sql = '
SELECT tWeeklyReportItem.*,[WorkType].[Name] AS [WorkTypeName],[WorkTask].[Name] AS [WorkTaskName],
	[WorkStatus].[Name] AS [StatusName],[Organization].[Name] AS [OrganizationName] FROM (
		SELECT t1.* FROM (
			SELECT * FROM [WeeklyReportItem]
			WHERE [Year] = ' + convert(varchar(4),@year) + ' AND [WeekOfYear] = ' + convert(varchar(4),@weekOfYear) + ' 
			AND [Domain] = ''' +  convert(char(36),@domainId) + '''
			AND [User] in (
			SELECT [Staff] FROM CheckRelation
			WHERE [Checker] = ''' +  convert(char(36),@checkerId) + '''
		)
		) t1 
		LEFT JOIN [WeeklyReport]
		ON t1.[WeeklyReport] = [WeeklyReport].[Id]
		--WHERE [WeeklyReport].[Checked] = 0'
		
	if(@checked IS NOT NULL)
	  begin 
		set @sql = @sql + ' WHERE [WeeklyReport].[Checked] = ' + convert(char(1),@checked)
	  end
		
	set @sql = @sql + ' 
		) tWeeklyReportItem
	LEFT JOIN [WorkType]
	ON tWeeklyReportItem.[WorkType] = [WorkType].[Id]
	LEFT JOIN [WorkTask]
	ON tWeeklyReportItem.[WorkTask] = [WorkTask].[Id]
	LEFT JOIN [WorkStatus]
	ON tWeeklyReportItem.[Status] = [WorkStatus].[Id]
	LEFT JOIN [User]
	ON tWeeklyReportItem.[User] = [User].[Id]
	LEFT JOIN [Organization]
	ON tWeeklyReportItem.[Organization] = [Organization].[Id]
	ORDER BY tWeeklyReportItem.[Date] ASC,[Sort] ASC'
	
	exec (@sql)



--------------

set @sql = '
SELECT * FROM [WeeklyReportCheckList]
WHERE [Year] = ' + convert(varchar(4),@year) + ' AND [WeekOfYear] = ' + convert(varchar(4),@weekOfYear) + ' 
	AND [Domain] = ''' +  convert(char(36),@domainId) + '''
	AND [User] in (
		SELECT [Staff] FROM CheckRelation
		WHERE [Checker] = ''' +  convert(char(36),@checkerId) + '''
	)
'
exec (@sql)

END


GO
/****** Object:  StoredProcedure [dbo].[GetWeeklyReportListByOrganization]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetWeeklyReportListByOrganization]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@organizationId uniqueidentifier,
	@year int,
	@weekOfYear int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	;with cte_Organization(Id,Name,parent,Sort,level)
	as
	(
		--起始条件
		select Id,Name,parent,Sort,0 as level
		from dbo.Organization
		where id = @organizationId
		union all
		--递归条件
		select a.Id,a.Name,a.parent,a.Sort,level+1
		from Organization a
		inner join 
		cte_Organization b
		on ( a.parent=b.id)  
	)
	
	SELECT tWeeklyReport.*,[User].[Name] AS [UserName],[User].[Organization],
	cte_Organization.[Name] AS [OrganizationName]  FROM (
	SELECT * FROM [WeeklyReport]
	WHERE [Domain] = @domainId AND [Year] = @year AND [WeekOfYear] = @weekOfYear
		) tWeeklyReport
	LEFT JOIN [User]
	ON tWeeklyReport.[User] = [User].[Id]
	--WHERE [Organization] = @organizationId
		INNER JOIN cte_Organization
	ON [User].[Organization]= cte_Organization.[Id]
	ORDER BY cte_Organization.Sort ASC
		-------------
		
		;with cte_Organization(Id,Name,parent,Sort,level)
	as
	(
		--起始条件
		select Id,Name,parent,Sort,0 as level
		from dbo.Organization
		where id = @organizationId
		union all
		--递归条件
		select a.Id,a.Name,a.parent,a.Sort,level+1
		from Organization a
		inner join 
		cte_Organization b
		on ( a.parent=b.id)  
	)
		
		SELECT tWeeklyReportItem.*,[WorkType].[Name] AS [WorkTypeName],[WorkTask].[Name] AS [WorkTaskName],
	[WorkStatus].[Name] AS [StatusName],[Organization].[Name] AS [OrganizationName] FROM (
		SELECT * FROM [WeeklyReportItem]
		WHERE [Domain] = @domainId AND [Year] = @year AND [WeekOfYear] = @weekOfYear
		) tWeeklyReportItem
	LEFT JOIN [WorkType]
	ON tWeeklyReportItem.[WorkType] = [WorkType].[Id]
	LEFT JOIN [WorkTask]
	ON tWeeklyReportItem.[WorkTask] = [WorkTask].[Id]
	LEFT JOIN [WorkStatus]
	ON tWeeklyReportItem.[Status] = [WorkStatus].[Id]
	LEFT JOIN [User]
	ON tWeeklyReportItem.[User] = [User].[Id]
	LEFT JOIN [Organization]
	ON tWeeklyReportItem.[Organization] = [Organization].[Id]
	--WHERE [User].[Organization] = @organizationId
	INNER JOIN cte_Organization
	ON [User].[Organization]= cte_Organization.[Id]
	ORDER BY tWeeklyReportItem.[Date] ASC,[Sort] ASC
	-----
	
	;with cte_Organization(Id,Name,parent,Sort,level)
	as
	(
		--起始条件
		select Id,Name,parent,Sort,0 as level
		from dbo.Organization
		where id = @organizationId
		union all
		--递归条件
		select a.Id,a.Name,a.parent,a.Sort,level+1
		from Organization a
		inner join 
		cte_Organization b
		on ( a.parent=b.id)  
	)
	
	SELECT t.*,[CheckPoint].[Name] AS [CheckPointName],
	[CheckPointItem].[Name] AS [CheckPointItemName],[CheckPointItem].[Score] AS [Score] 
	FROM (
		SELECT * FROM [WeeklyReportCheckList]
		WHERE [Domain] = @domainId AND [Year] = @year AND [WeekOfYear] = @weekOfYear
	) t
	LEFT JOIN [CheckPoint] 
	ON t.[CheckPoint] = [CheckPoint].[Id]
	LEFT JOIN [CheckPointItem] 
	ON t.[Value] = [CheckPointItem].[Id]
	LEFT JOIN [User]
	ON t.[User] = [User].[Id]
	--WHERE [Organization] = @organizationId
	INNER JOIN cte_Organization
	ON [Organization]= cte_Organization.[Id]
		
END



GO
/****** Object:  StoredProcedure [dbo].[GetWeeklyReportListByPerson]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetWeeklyReportListByPerson]
	-- Add the parameters for the stored procedure here
	@userId uniqueidentifier,
	@startYear int,
	@startMonth int,
	@endYear int,
	@endMonth int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT t.*,[User].[Name] AS [UserName] FROM(
		SELECT * FROM [WeeklyReport]
		WHERE [User] = @userId 
		AND CONVERT(DATETIME,CONVERT(CHAR,[Year],4) + '-' + CONVERT(VARCHAR,[Month],2) + '-1') >= CONVERT(DATETIME,CONVERT(CHAR,@startYear,4) + '-' + CONVERT(VARCHAR,@startMonth,2) + '-1')
		AND CONVERT(DATETIME,CONVERT(CHAR,[Year],4) + '-' + CONVERT(VARCHAR,[Month],2) + '-1') <= CONVERT(DATETIME,CONVERT(CHAR,@endYear,4) + '-' + CONVERT(VARCHAR,@endMonth,2) + '-1')
	) t
	LEFT JOIN [User]
	ON t.[User] = [User].[Id]
	ORDER BY [Monday] ASC
	
	----------
	
	SELECT tWeeklyReportItem.*,[WorkType].[Name] AS [WorkTypeName],[WorkTask].[Name] AS [WorkTaskName],
	[WorkStatus].[Name] AS [StatusName],[Organization].[Name] AS [OrganizationName] FROM (
		SELECT * FROM [WeeklyReportItem]
		WHERE [User] = @userId 
		AND CONVERT(DATETIME,CONVERT(CHAR,[Year],4) + '-' + CONVERT(VARCHAR,[Month],2) + '-1') >= CONVERT(DATETIME,CONVERT(CHAR,@startYear,4) + '-' + CONVERT(VARCHAR,@startMonth,2) + '-1')
		AND CONVERT(DATETIME,CONVERT(CHAR,[Year],4) + '-' + CONVERT(VARCHAR,[Month],2) + '-1') <= CONVERT(DATETIME,CONVERT(CHAR,@endYear,4) + '-' + CONVERT(VARCHAR,@endMonth,2) + '-1')
		) tWeeklyReportItem
	LEFT JOIN [WorkType]
	ON tWeeklyReportItem.[WorkType] = [WorkType].[Id]
	LEFT JOIN [WorkTask]
	ON tWeeklyReportItem.[WorkTask] = [WorkTask].[Id]
	LEFT JOIN [WorkStatus]
	ON tWeeklyReportItem.[Status] = [WorkStatus].[Id]
	LEFT JOIN [User]
	ON tWeeklyReportItem.[User] = [User].[Id]
	LEFT JOIN [Organization]
	ON tWeeklyReportItem.[Organization] = [Organization].[Id]
	ORDER BY tWeeklyReportItem.[Date] ASC,[Sort] ASC
	----------------
	
	SELECT t.*,[CheckPoint].[Name] AS [CheckPointName],
	[CheckPointItem].[Name] AS [CheckPointItemName],[CheckPointItem].[Score] AS [Score] 
	FROM (
		SELECT * FROM [WeeklyReportCheckList]
		WHERE [User] = @userId 
		AND CONVERT(DATETIME,CONVERT(CHAR,[Year],4) + '-' + CONVERT(VARCHAR,[Month],2) + '-1') >= CONVERT(DATETIME,CONVERT(CHAR,@startYear,4) + '-' + CONVERT(VARCHAR,@startMonth,2) + '-1')
		AND CONVERT(DATETIME,CONVERT(CHAR,[Year],4) + '-' + CONVERT(VARCHAR,[Month],2) + '-1') <= CONVERT(DATETIME,CONVERT(CHAR,@endYear,4) + '-' + CONVERT(VARCHAR,@endMonth,2) + '-1')
	) t
	LEFT JOIN [CheckPoint] 
	ON t.[CheckPoint] = [CheckPoint].[Id]
	LEFT JOIN [CheckPointItem] 
	ON t.[Value] = [CheckPointItem].[Id]
	
END


GO
/****** Object:  StoredProcedure [dbo].[GetWeeklyReportListByWorkType]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetWeeklyReportListByWorkType]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@workType uniqueidentifier,
	@workTask uniqueidentifier,
	@year int,
	@weekOfYear int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   declare @sql varchar(2000)
	declare @whereSql varchar(500)
	
	set @whereSql = ''
	
	if(@workType IS NOT NULL AND LEN(@workType) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [WeeklyReportItem].[WorkType] = ''' + CONVERT(char(36),@workType) + ''''
	  end
	  
	  if(@workTask IS NOT NULL AND LEN(@workTask) > 0)
	  begin 
		set @whereSql = @whereSql + ' AND [WeeklyReportItem].[WorkTask] = ''' + CONVERT(char(36),@workTask) + ''''
	  end
	  
	set @sql = '
	SELECT distinct tWeeklyReport.*,[User].[Name] AS [UserName],[User].[Organization],
	[Organization].[Name] AS [OrganizationName],[Organization].[Sort] FROM (
	SELECT * FROM [WeeklyReport]
	WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [Year] = ' 
	+ CONVERT(char(36),@year) + ' AND [WeekOfYear] = ' + CONVERT(char(36),@weekOfYear) + '
		) tWeeklyReport
	LEFT JOIN [User]
	ON tWeeklyReport.[User] = [User].[Id]
	LEFT JOIN [WeeklyReportItem]
	ON tWeeklyReport.[Id] = [WeeklyReportItem].[WeeklyReport]
	LEFT JOIN [Organization]
	ON [User].[Organization] = [Organization].[Id]
	WHERE 1=1 ' + @whereSql + ' ORDER BY [Organization].[Sort] ASC'
	
		exec (@sql)
		
		
	set @sql ='
	SELECT tWeeklyReportItem.*,[WorkType].[Name] AS [WorkTypeName],[WorkTask].[Name] AS [WorkTaskName],
	[WorkStatus].[Name] AS [StatusName],[Organization].[Name] AS [OrganizationName] FROM (
		SELECT * FROM [WeeklyReportItem]
		WHERE [Domain] = ''' + CONVERT(char(36),@domainId) + ''' AND [Year] = ' 
	+ CONVERT(char(36),@year) + ' AND [WeekOfYear] = ' + CONVERT(char(36),@weekOfYear) + @whereSql + '
	
		) tWeeklyReportItem
	LEFT JOIN [WorkType]
	ON tWeeklyReportItem.[WorkType] = [WorkType].[Id]
	LEFT JOIN [WorkTask]
	ON tWeeklyReportItem.[WorkTask] = [WorkTask].[Id]
	LEFT JOIN [WorkStatus]
	ON tWeeklyReportItem.[Status] = [WorkStatus].[Id]
	LEFT JOIN [Organization]
	ON tWeeklyReportItem.[Organization] = [Organization].[Id]
	ORDER BY tWeeklyReportItem.[Date] ASC,[Sort] ASC
	'
    
    exec (@sql)
    
END


GO
/****** Object:  StoredProcedure [dbo].[RemoveOrganization]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RemoveOrganization] 
	-- Add the parameters for the stored procedure here
	@id uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	WITH 
	[TREE] AS( 
		SELECT * FROM [Organization] 
		WHERE [Parent] = @id  -- 要查询的父 id 
		UNION ALL 
		SELECT [Organization].* FROM [Organization], [TREE] 
		WHERE [Organization].[Parent] = [TREE].[Id]
	) 
	DELETE FROM [Organization] WHERE [Id] IN(SELECT Id FROM TREE)

	DELETE FROM [Organization] WHERE [Id] = @id
	
	--http://www.cnblogs.com/cracker/archive/2012/07/07/2580781.html
END

GO
/****** Object:  StoredProcedure [dbo].[ReportByOrganization]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ReportByOrganization]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@organizationId uniqueidentifier,
	@startYear int,
	@startMonth int,
	@endYear int,
	@endMonth int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @PivotColHeader VARCHAR(MAX)     
	SELECT @PivotColHeader =  
		COALESCE(@PivotColHeader + ',[' + cast(Name as varchar) + ']', '[' + cast(Name as varchar) + ']')
		   --示例中Name转换为varchar或char类型，注意：在CAST 和CONVERT 中使用varchar 时，显示n的默认值为30  
	FROM [CheckPoint]
	WHERE [Domain] = @domainId
	GROUP BY Name 
	
	
	DECLARE @TotalColHeader VARCHAR(MAX)     
	SELECT @TotalColHeader =  
		COALESCE(@TotalColHeader + ' + ISNULL([' + cast(Name as varchar) + '], 0)', 'ISNULL([' + cast(Name as varchar) + '], 0)')
		   --示例中Name转换为varchar或char类型，注意：在CAST 和CONVERT 中使用varchar 时，显示n的默认值为30  
	FROM [CheckPoint]
	WHERE [Domain] = @domainId
	GROUP BY Name 

	declare @sql varchar(MAX)

    -- Insert statements for procedure here
    set @sql = '
	SELECT * ,' + @TotalColHeader + ' AS Total
	FROM 
	(
		SELECT [User].[Name],[CheckPoint].[Name] AS [CheckPointName],[CheckPointItem].[Score]
		 FROM
		(
			SELECT tWeeklyReportCheckList.*,[User].[Organization] FROM
			(
				SELECT [User],[CheckPoint],[Value] FROM WeeklyReportCheckList
				WHERE [Domain] = ''' +  convert(char(36),@domainId) + '''
				AND [Year] >= ' + convert(char(4),@startYear) + ' AND [Month] >= ' + convert(varchar(2),@startMonth) + ' AND [Year] <= ' + convert(char(4),@endYear) + ' AND [Month] <= ' + convert(varchar(2),@endMonth) + '
			) tWeeklyReportCheckList
			LEFT JOIN [User]
			ON tWeeklyReportCheckList.[User] = [User].[Id]
			WHERE [User].[Organization] = ''' +  convert(char(36),@organizationId) + '''
		) t
		LEFT JOIN [User]
		ON t.[User] = [User].[Id]
		LEFT JOIN [CheckPoint]
		ON t.[CheckPoint] = [CheckPoint].[Id]
		LEFT JOIN [CheckPointItem]
		ON t.[Value] = [CheckPointItem].[Id]
	) tResult
	pivot(sum(Score) for [CheckPointName] in(' + @PivotColHeader + '))as t
	ORDER BY Total DESC
	'
	
	exec (@sql)
END

GO
/****** Object:  StoredProcedure [dbo].[ReportBySumbit]    Script Date: 2017/3/28 9:57:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ReportBySumbit]
	-- Add the parameters for the stored procedure here
	@domainId uniqueidentifier,
	@organizationId uniqueidentifier,
	@year int,
	@weekOfYear int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	;with cte_Organization(Id,Name,parent,Sort,level)
	as
	(
		--起始条件
		select Id,Name,parent,Sort,0 as level
		from dbo.Organization
		where id = @organizationId
		union all
		--递归条件
		select a.Id,a.Name,a.parent,a.Sort,level+1
		from Organization a
		inner join 
		cte_Organization b
		on ( a.parent=b.id)  
	)

   SELECT [User].[Id],[User].[Name],
	cte_Organization.[Name] AS [OrganizationName],cte_Organization.[Id] AS [OrganizationId],
	tWeeklyReport.[Id] AS [WeeklyReportId]  FROM(
		SELECT * FROM [WeeklyReport]
		WHERE [Domain]=@domainId
		AND [YEAR] = @year AND [WeekOfYear] = @weekOfYear
	) tWeeklyReport
	RIGHT JOIN [User]
	ON [User].[Id] = tWeeklyReport.[User]
	INNER JOIN cte_Organization
	ON [User].[Organization]= cte_Organization.[Id]
	WHERE [User].[Domain]=@domainId
ORDER BY cte_Organization.Sort ASC

END

GO
USE [master]
GO
ALTER DATABASE [Enterprise] SET  READ_WRITE 
GO
