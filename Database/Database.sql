USE [master]
GO
/****** Object:  Database [RedArbor]    Script Date: 2/02/2023 10:40:12 a. m. ******/
CREATE DATABASE [RedArbor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'redarbor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\redarbor.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'redarbor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\redarbor_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RedArbor] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RedArbor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RedArbor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RedArbor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RedArbor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RedArbor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RedArbor] SET ARITHABORT OFF 
GO
ALTER DATABASE [RedArbor] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RedArbor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RedArbor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RedArbor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RedArbor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RedArbor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RedArbor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RedArbor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RedArbor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RedArbor] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RedArbor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RedArbor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RedArbor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RedArbor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RedArbor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RedArbor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RedArbor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RedArbor] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RedArbor] SET  MULTI_USER 
GO
ALTER DATABASE [RedArbor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RedArbor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RedArbor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RedArbor] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RedArbor] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RedArbor] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RedArbor] SET QUERY_STORE = OFF
GO
USE [RedArbor]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2/02/2023 10:40:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[CompanyId] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
	[Email] [varchar](50) NOT NULL,
	[Telephone] [varchar](15) NULL,
	[Fax] [varchar](15) NULL,
	[RoleId] [int] NOT NULL,
	[Username] [varchar](30) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[Lastlogin] [datetimeoffset](4) NULL,
	[PortalId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[CreatedOn] [datetimeoffset](4) NULL,
	[UpdatedOn] [datetimeoffset](4) NULL,
	[DeletedOn] [datetimeoffset](4) NULL,
 CONSTRAINT [PK_Employee_CompanyId_Id] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WatchDog_Logs]    Script Date: 2/02/2023 10:40:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchDog_Logs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[eventId] [varchar](100) NULL,
	[message] [varchar](max) NULL,
	[timestamp] [varchar](100) NOT NULL,
	[callingFrom] [varchar](max) NULL,
	[callingMethod] [varchar](max) NULL,
	[lineNumber] [int] NULL,
	[logLevel] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WatchDog_WatchExceptionLog]    Script Date: 2/02/2023 10:40:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchDog_WatchExceptionLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[message] [varchar](max) NULL,
	[stackTrace] [varchar](max) NULL,
	[typeOf] [varchar](max) NULL,
	[source] [varchar](max) NULL,
	[path] [varchar](max) NULL,
	[method] [varchar](300) NULL,
	[queryString] [varchar](max) NULL,
	[requestBody] [varchar](max) NULL,
	[encounteredAt] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WatchDog_WatchLog]    Script Date: 2/02/2023 10:40:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchDog_WatchLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[responseBody] [varchar](max) NULL,
	[responseStatus] [int] NOT NULL,
	[requestBody] [varchar](max) NULL,
	[queryString] [varchar](max) NULL,
	[path] [varchar](max) NULL,
	[requestHeaders] [varchar](max) NULL,
	[responseHeaders] [varchar](max) NULL,
	[method] [varchar](max) NULL,
	[host] [varchar](max) NULL,
	[ipAddress] [varchar](30) NULL,
	[timeSpent] [varchar](100) NULL,
	[startTime] [varchar](100) NOT NULL,
	[endTime] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (1, 5, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'Edinson.Aguirre', N'123456', CAST(N'2023-02-01T13:01:00.0000000+00:00' AS DateTimeOffset), 1, 1, CAST(N'2023-02-01T13:15:59.6465000-05:00' AS DateTimeOffset), CAST(N'2023-02-01T13:15:59.6465000-05:00' AS DateTimeOffset), CAST(N'2023-02-01T13:15:59.6465000-05:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (2, 8, N'Edinson Aguirre', N'edinson.aguirre@gmai', N'5555555555', N'545454-78', 1, N'edinson.aguirre', N'123456', CAST(N'2023-01-31T20:05:00.0000000+00:00' AS DateTimeOffset), 1, 2, CAST(N'2023-01-31T20:59:31.3330000+00:00' AS DateTimeOffset), CAST(N'2023-01-31T20:59:31.3330000+00:00' AS DateTimeOffset), CAST(N'2023-01-31T20:59:31.3330000+00:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (48, 3, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'user.name13', N'123456', CAST(N'2023-01-31T21:01:48.0164000-05:00' AS DateTimeOffset), 1, 1, CAST(N'2023-01-31T21:01:48.0163000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T21:01:48.0166000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T21:01:48.0163000-05:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (50, 13, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'user.name402', N'123456', CAST(N'2023-01-31T22:27:18.5622000-05:00' AS DateTimeOffset), 1, 1, CAST(N'2023-01-31T22:27:18.5621000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:27:18.5624000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:27:18.5621000-05:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (64, 10, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'user.name90', N'123456', CAST(N'2023-01-31T22:15:58.2725000-05:00' AS DateTimeOffset), 1, 1, CAST(N'2023-01-31T22:15:58.2725000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:15:58.2725000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:15:58.2725000-05:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (103, 19, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'user.name482', N'123456', CAST(N'2023-02-01T13:15:59.7099000-05:00' AS DateTimeOffset), 1, 1, CAST(N'2023-02-01T13:15:59.7098000-05:00' AS DateTimeOffset), CAST(N'2023-02-01T13:15:59.7099000-05:00' AS DateTimeOffset), CAST(N'2023-02-01T13:15:59.7098000-05:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (104, 11, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'user.name336', N'123456', CAST(N'2023-01-31T22:16:10.8292000-05:00' AS DateTimeOffset), 1, 1, CAST(N'2023-01-31T22:16:10.8291000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:16:10.8294000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:16:10.8291000-05:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (111, 2, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'user.name195', N'123456', CAST(N'2023-01-31T21:01:08.2655000-05:00' AS DateTimeOffset), 1, 1, CAST(N'2023-01-31T21:01:08.2655000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T21:01:08.2655000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T21:01:08.2655000-05:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (132, 1, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'user.name413', N'123456', CAST(N'2023-01-31T21:01:08.2123000-05:00' AS DateTimeOffset), 1, 1, CAST(N'2023-01-31T21:01:08.2122000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T21:01:08.2124000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T21:01:08.2122000-05:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (140, 17, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'user.name154', N'123456', CAST(N'2023-01-31T22:34:11.7402000-05:00' AS DateTimeOffset), 1, 1, CAST(N'2023-01-31T22:34:11.7401000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:34:11.7404000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:34:11.7402000-05:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (147, 4, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'user.name100', N'123456', CAST(N'2023-01-31T21:01:48.0685000-05:00' AS DateTimeOffset), 1, 1, CAST(N'2023-01-31T21:01:48.0685000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T21:01:48.0685000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T21:01:48.0685000-05:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (154, 6, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'user.name136', N'123456', CAST(N'2023-01-31T21:04:08.2421000-05:00' AS DateTimeOffset), 1, 1, CAST(N'2023-01-31T21:04:08.2419000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T21:04:08.2423000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T21:04:08.2420000-05:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (193, 12, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'user.name127', N'123456', CAST(N'2023-01-31T22:16:10.8574000-05:00' AS DateTimeOffset), 1, 1, CAST(N'2023-01-31T22:16:10.8574000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:16:10.8574000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:16:10.8574000-05:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (217, 20, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'user.name50', N'123456', CAST(N'2023-02-01T13:15:59.7519000-05:00' AS DateTimeOffset), 1, 1, CAST(N'2023-02-01T13:15:59.7519000-05:00' AS DateTimeOffset), CAST(N'2023-02-01T13:15:59.7519000-05:00' AS DateTimeOffset), CAST(N'2023-02-01T13:15:59.7519000-05:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (253, 9, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'user.name424', N'123456', CAST(N'2023-01-31T22:15:58.2247000-05:00' AS DateTimeOffset), 1, 1, CAST(N'2023-01-31T22:15:58.2245000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:15:58.2249000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:15:58.2246000-05:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (259, 15, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'user.name405', N'123456', CAST(N'2023-01-31T22:31:23.6520000-05:00' AS DateTimeOffset), 1, 1, CAST(N'2023-01-31T22:31:23.6518000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:31:23.6521000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:31:23.6519000-05:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (375, 16, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'user.name44', N'123456', CAST(N'2023-01-31T22:31:23.6848000-05:00' AS DateTimeOffset), 1, 1, CAST(N'2023-01-31T22:31:23.6848000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:31:23.6848000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:31:23.6848000-05:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (432, 7, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'user.name227', N'123456', CAST(N'2023-01-31T21:04:08.2899000-05:00' AS DateTimeOffset), 1, 1, CAST(N'2023-01-31T21:04:08.2898000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T21:04:08.2899000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T21:04:08.2899000-05:00' AS DateTimeOffset))
INSERT [dbo].[Employee] ([CompanyId], [Id], [Name], [Email], [Telephone], [Fax], [RoleId], [Username], [Password], [Lastlogin], [PortalId], [StatusId], [CreatedOn], [UpdatedOn], [DeletedOn]) VALUES (469, 14, N'New user', N'prueba@rearbor.com', N'555555555', N'101010', 1, N'user.name408', N'123456', CAST(N'2023-01-31T22:27:18.6048000-05:00' AS DateTimeOffset), 1, 1, CAST(N'2023-01-31T22:27:18.6048000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:27:18.6048000-05:00' AS DateTimeOffset), CAST(N'2023-01-31T22:27:18.6048000-05:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[WatchDog_WatchLog] ON 

INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (1, N'{"data":{"companyId":1,"id":3,"name":"Edisnon                       ","email":"edinson.aguirre@gmai","telephone":"2222222     ","fax":"12566       ","username":"Edinson.aguirre","password":null,"roleId":1,"portalId":1,"statusId":1,"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkVkaW5zb24uYWd1aXJyZSIsIm5iZiI6MTY3NTE5ODMzOSwiZXhwIjoxNjc1MTk4NjM5LCJpYXQiOjE2NzUxOTgzMzksImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.T4E1tF0IN1EziPDVADKK7Vz1lvH55iVnQLhy_HsW37k"},"isSucces":true,"message":"Usuario Autenticado con Exito","rulesErrors":null}', 200, N'{
  "companyId": 0,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "username": "edinson.aguirre",
  "password": "123456",
  "roleId": 0,
  "portalId": 0,
  "statusId": 0,
  "token": "string"
}', N'', N'/api/v1/AutenticationUser/AutenticationUser', N'[Accept, */*]: [Accept-Encoding, gzip, deflate]: [Accept-Language, es-ES,es;q=0.9]: [Connection, keep-alive]: [Content-Length, 243]: [Content-Type, application/json]: [Cookie, __utmz=111872281.1674006376.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.1.507579577.1674006386; __utma=111872281.1045731767.1674006376.1674868805.1675124861.24; _ga_LKQ6N568T4=GS1.1.1675124919.27.1.1675125377.0.0.0]: [Host, localhost:32313]: [Referer, http://localhost:32313/swagger/index.html]: [User-Agent, Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36]: [sec-ch-ua, "Not_A Brand";v="99", "Google Chrome";v="109", "Chromium";v="109"]: [sec-ch-ua-mobile, ?0]: [sec-ch-ua-platform, "Windows"]: [Origin, http://localhost:32313]: [Sec-Fetch-Site, same-origin]: [Sec-Fetch-Mode, cors]: [Sec-Fetch-Dest, empty]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 1 secs 101 ms', N'Jan 31 2023  3:52PM', N'Jan 31 2023  3:52PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (2, N'{"data":[{"companyId":1,"id":3,"name":"Edisnon                       ","email":"edinson.aguirre@gmai","telephone":"2222222     ","fax":"12566       ","roleId":1,"username":"Edinson.aguirre","password":"123456              ","lastlogin":"2023-01-29T05:17:23.854+00:00","portalId":1,"statusId":1,"createdOn":"2023-01-29T05:17:23.854+00:00","updatedOn":"2023-01-29T05:17:23.854+00:00","deletedOn":"2023-01-29T05:17:23.854+00:00"},{"companyId":1,"id":8,"name":"New user                      ","email":"prueba@rearbor.com  ","telephone":"555555555   ","fax":"101010      ","roleId":1,"username":"user.name      ","password":"123456              ","lastlogin":"2023-01-30T17:54:52.9263-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-30T17:54:52.9261-05:00","updatedOn":"2023-01-30T17:54:52.9264-05:00","deletedOn":"2023-01-30T17:54:52.9262-05:00"},{"companyId":1,"id":10,"name":"New user                      ","email":"prueba@rearbor.com  ","telephone":"555555555   ","fax":"101010      ","roleId":1,"username":"user.name      ","password":"123456              ","lastlogin":"2023-01-30T20:00:33.4372-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-30T20:00:33.4367-05:00","updatedOn":"2023-01-30T20:00:33.4376-05:00","deletedOn":"2023-01-30T20:00:33.4368-05:00"},{"companyId":1,"id":11,"name":"New user                      ","email":"prueba@rearbor.com  ","telephone":"555555555   ","fax":"101010      ","roleId":1,"username":"user.name      ","password":"123456              ","lastlogin":"2023-01-30T20:00:33.5149-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-30T20:00:33.5149-05:00","updatedOn":"2023-01-30T20:00:33.5149-05:00","deletedOn":"2023-01-30T20:00:33.5149-05:00"},{"companyId":1,"id":12,"name":"New user                      ","email":"prueba@rearbor.com  ","telephone":"555555555   ","fax":"101010      ","roleId":1,"username":"user.name      ","password":"123456              ","lastlogin":"2023-01-31T10:01:28.7258-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T10:01:28.7258-05:00","updatedOn":"2023-01-31T10:01:28.7258-05:00","deletedOn":"2023-01-31T10:01:28.7258-05:00"},{"companyId":1,"id":13,"name":"New user                      ","email":"prueba@rearbor.com  ","telephone":"555555555   ","fax":"101010      ","roleId":1,"username":"user.name      ","password":"123456              ","lastlogin":"2023-01-31T10:01:28.7456-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T10:01:28.7456-05:00","updatedOn":"2023-01-31T10:01:28.7456-05:00","deletedOn":"2023-01-31T10:01:28.7456-05:00"}],"isSucces":true,"message":"Consulta Exitosa","rulesErrors":null}', 200, N'', N'', N'/api/v1/Employee/GetAll', N'[Accept, */*]: [Accept-Encoding, gzip, deflate]: [Accept-Language, es-ES,es;q=0.9]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkVkaW5zb24uYWd1aXJyZSIsIm5iZiI6MTY3NTE5ODMzOSwiZXhwIjoxNjc1MTk4NjM5LCJpYXQiOjE2NzUxOTgzMzksImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.T4E1tF0IN1EziPDVADKK7Vz1lvH55iVnQLhy_HsW37k]: [Connection, keep-alive]: [Cookie, __utmz=111872281.1674006376.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.1.507579577.1674006386; __utma=111872281.1045731767.1674006376.1674868805.1675124861.24; _ga_LKQ6N568T4=GS1.1.1675124919.27.1.1675125377.0.0.0]: [Host, localhost:32313]: [Referer, http://localhost:32313/swagger/index.html]: [User-Agent, Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36]: [sec-ch-ua, "Not_A Brand";v="99", "Google Chrome";v="109", "Chromium";v="109"]: [sec-ch-ua-mobile, ?0]: [sec-ch-ua-platform, "Windows"]: [Sec-Fetch-Site, same-origin]: [Sec-Fetch-Mode, cors]: [Sec-Fetch-Dest, empty]', N'', N'GET', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 123 ms', N'Jan 31 2023  3:53PM', N'Jan 31 2023  3:53PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (3, N'', 404, N'{
  "companyId": 1,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkVkaW5zb24uYWd1aXJyZSIsIm5iZiI6MTY3NTExODIyNiwiZXhwIjoxNjc1MTE4NTI2LCJpYXQiOjE2NzUxMTgyMjYsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.a3tpxr5lQkOMiY5q7AzKlxjO4ghdOm9DexNf5AF_PKc]: [Connection, keep-alive]: [Content-Length, 447]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 4982776d-bee7-4490-a26e-5e9ce921f495]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 76 ms', N'Jan 31 2023  4:01PM', N'Jan 31 2023  4:01PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (4, N'', 401, N'{
  "companyId": 1,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/v1.0/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkVkaW5zb24uYWd1aXJyZSIsIm5iZiI6MTY3NTExODIyNiwiZXhwIjoxNjc1MTE4NTI2LCJpYXQiOjE2NzUxMTgyMjYsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.a3tpxr5lQkOMiY5q7AzKlxjO4ghdOm9DexNf5AF_PKc]: [Connection, keep-alive]: [Content-Length, 447]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 3c0c5fec-790c-46bf-9e39-8c60e92237f0]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 33 ms', N'Jan 31 2023  4:01PM', N'Jan 31 2023  4:01PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (5, N'{"data":null,"isSucces":true,"message":"Usuario no encontrado","rulesErrors":null}', 404, N'{
  "companyId": 0,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "username": "Edinson.Aguirre",
  "password": "123456",
  "roleId": 0,
  "portalId": 0,
  "statusId": 0,
  "token": "string"
}', N'', N'/api/v1.0/AutenticationUser/AutenticationUser', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Connection, keep-alive]: [Content-Length, 256]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, c10a8404-c49e-4c88-a27b-76bae6061f98]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 697 ms', N'Jan 31 2023  4:01PM', N'Jan 31 2023  4:01PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (6, N'{"data":null,"isSucces":true,"message":"Usuario no encontrado","rulesErrors":null}', 404, N'{
  "companyId": 0,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "username": "user.name",
  "password": "123456",
  "roleId": 0,
  "portalId": 0,
  "statusId": 0,
  "token": "string"
}', N'', N'/api/v1.0/AutenticationUser/AutenticationUser', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Connection, keep-alive]: [Content-Length, 250]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, e82e12a1-fa0e-4fc1-a012-f5199de9e533]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 191 ms', N'Jan 31 2023  4:02PM', N'Jan 31 2023  4:02PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (7, N'{"data":null,"isSucces":true,"message":"Usuario no encontrado","rulesErrors":null}', 404, N'{
  "companyId": 0,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "username": "user.name",
  "password": "123456",
  "roleId": 0,
  "portalId": 0,
  "statusId": 0,
  "token": "string"
}', N'', N'/api/v1.0/AutenticationUser/AutenticationUser', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Connection, keep-alive]: [Content-Length, 250]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, f090d322-1f7d-4b32-9619-601c4e57aa0c]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 108 ms', N'Jan 31 2023  4:02PM', N'Jan 31 2023  4:02PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (8, N'{"data":null,"isSucces":true,"message":"Usuario no encontrado","rulesErrors":null}', 404, N'{
  "companyId": 0,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "username": "user.name",
  "password": "123456",
  "roleId": 0,
  "portalId": 0,
  "statusId": 0,
  "token": "string"
}', N'', N'/api/v1.0/AutenticationUser/AutenticationUser', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Connection, keep-alive]: [Content-Length, 250]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, bf626d0a-4b07-4075-9ce9-9d397ca81807]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 60 ms', N'Jan 31 2023  4:04PM', N'Jan 31 2023  4:04PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (9, N'{"data":null,"isSucces":true,"message":"Usuario no encontrado","rulesErrors":null}', 404, N'{
  "companyId": 0,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "username": "user.name",
  "password": "123456",
  "roleId": 0,
  "portalId": 0,
  "statusId": 0,
  "token": "string"
}', N'', N'/api/v1.0/AutenticationUser/AutenticationUser', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Connection, keep-alive]: [Content-Length, 250]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, f5574258-622a-40da-8fbb-ad7127960786]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 50 secs 763 ms', N'Jan 31 2023  4:04PM', N'Jan 31 2023  4:05PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (10, N'{"data":{"companyId":1,"id":1,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","username":"user.name","password":null,"roleId":1,"portalId":1,"statusId":1,"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZSIsIm5iZiI6MTY3NTIwMzk4OSwiZXhwIjoxNjc1MjA0Mjg5LCJpYXQiOjE2NzUyMDM5ODksImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.PZ7NyC9EyycVrbv5AGhBtyeM1CWtwJjycMs94O4uRH4"},"isSucces":true,"message":"Usuario Autenticado con Exito","rulesErrors":null}', 200, N'{
  "companyId": 0,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "username": "user.name",
  "password": "123456",
  "roleId": 0,
  "portalId": 0,
  "statusId": 0,
  "token": "string"
}', N'', N'/api/v1/AutenticationUser/AutenticationUser', N'[Accept, */*]: [Accept-Encoding, gzip, deflate]: [Accept-Language, es-ES,es;q=0.9]: [Connection, keep-alive]: [Content-Length, 237]: [Content-Type, application/json]: [Cookie, __utmz=111872281.1674006376.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.1.507579577.1674006386; __utma=111872281.1045731767.1674006376.1674868805.1675124861.24; _ga_LKQ6N568T4=GS1.1.1675124919.27.1.1675125377.0.0.0]: [Host, localhost:32313]: [Referer, http://localhost:32313/swagger/index.html]: [User-Agent, Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36]: [sec-ch-ua, "Not_A Brand";v="99", "Google Chrome";v="109", "Chromium";v="109"]: [sec-ch-ua-mobile, ?0]: [sec-ch-ua-platform, "Windows"]: [Origin, http://localhost:32313]: [Sec-Fetch-Site, same-origin]: [Sec-Fetch-Mode, cors]: [Sec-Fetch-Dest, empty]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 569 ms', N'Jan 31 2023  5:26PM', N'Jan 31 2023  5:26PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (11, N'{"data":{"companyId":1,"id":1,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","username":"user.name","password":null,"roleId":1,"portalId":1,"statusId":1,"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZSIsIm5iZiI6MTY3NTIwNDAyMCwiZXhwIjoxNjc1MjA0MzIwLCJpYXQiOjE2NzUyMDQwMjAsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.7ibydoD4N7aXEWxmTYM-tubskOEV2anCNJSti4o6E2g"},"isSucces":true,"message":"Usuario Autenticado con Exito","rulesErrors":null}', 200, N'{
  "companyId": 0,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "username": "user.name",
  "password": "123456",
  "roleId": 0,
  "portalId": 0,
  "statusId": 0,
  "token": "string"
}', N'', N'/api/v1/AutenticationUser/AutenticationUser', N'[Accept, */*]: [Accept-Encoding, gzip, deflate]: [Accept-Language, es-ES,es;q=0.9]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZSIsIm5iZiI6MTY3NTIwMzk4OSwiZXhwIjoxNjc1MjA0Mjg5LCJpYXQiOjE2NzUyMDM5ODksImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.PZ7NyC9EyycVrbv5AGhBtyeM1CWtwJjycMs94O4uRH4]: [Connection, keep-alive]: [Content-Length, 237]: [Content-Type, application/json]: [Cookie, __utmz=111872281.1674006376.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.1.507579577.1674006386; __utma=111872281.1045731767.1674006376.1674868805.1675124861.24; _ga_LKQ6N568T4=GS1.1.1675124919.27.1.1675125377.0.0.0]: [Host, localhost:32313]: [Referer, http://localhost:32313/swagger/index.html]: [User-Agent, Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36]: [sec-ch-ua, "Not_A Brand";v="99", "Google Chrome";v="109", "Chromium";v="109"]: [sec-ch-ua-mobile, ?0]: [sec-ch-ua-platform, "Windows"]: [Origin, http://localhost:32313]: [Sec-Fetch-Site, same-origin]: [Sec-Fetch-Mode, cors]: [Sec-Fetch-Dest, empty]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 4 ms', N'Jan 31 2023  5:27PM', N'Jan 31 2023  5:27PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (12, N'{"data":true,"isSucces":true,"message":"Se ha Creado el Empleado Correctamente","rulesErrors":null}', 200, N'{
  "companyId": 1,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/v1/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate]: [Accept-Language, es-ES,es;q=0.9]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZSIsIm5iZiI6MTY3NTIwMzk4OSwiZXhwIjoxNjc1MjA0Mjg5LCJpYXQiOjE2NzUyMDM5ODksImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.PZ7NyC9EyycVrbv5AGhBtyeM1CWtwJjycMs94O4uRH4]: [Connection, keep-alive]: [Content-Length, 430]: [Content-Type, application/json]: [Cookie, __utmz=111872281.1674006376.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.1.507579577.1674006386; __utma=111872281.1045731767.1674006376.1674868805.1675124861.24; _ga_LKQ6N568T4=GS1.1.1675124919.27.1.1675125377.0.0.0]: [Host, localhost:32313]: [Referer, http://localhost:32313/swagger/index.html]: [User-Agent, Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36]: [sec-ch-ua, "Not_A Brand";v="99", "Google Chrome";v="109", "Chromium";v="109"]: [sec-ch-ua-mobile, ?0]: [sec-ch-ua-platform, "Windows"]: [Origin, http://localhost:32313]: [Sec-Fetch-Site, same-origin]: [Sec-Fetch-Mode, cors]: [Sec-Fetch-Dest, empty]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 64 ms', N'Jan 31 2023  5:27PM', N'Jan 31 2023  5:27PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (13, N'{"data":false,"isSucces":true,"message":null,"rulesErrors":null}', 200, N'{
  "companyId": 1,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/v1/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate]: [Accept-Language, es-ES,es;q=0.9]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZSIsIm5iZiI6MTY3NTIwMzk4OSwiZXhwIjoxNjc1MjA0Mjg5LCJpYXQiOjE2NzUyMDM5ODksImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.PZ7NyC9EyycVrbv5AGhBtyeM1CWtwJjycMs94O4uRH4]: [Connection, keep-alive]: [Content-Length, 430]: [Content-Type, application/json]: [Cookie, __utmz=111872281.1674006376.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.1.507579577.1674006386; __utma=111872281.1045731767.1674006376.1674868805.1675124861.24; _ga_LKQ6N568T4=GS1.1.1675124919.27.1.1675125377.0.0.0]: [Host, localhost:32313]: [Referer, http://localhost:32313/swagger/index.html]: [User-Agent, Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36]: [sec-ch-ua, "Not_A Brand";v="99", "Google Chrome";v="109", "Chromium";v="109"]: [sec-ch-ua-mobile, ?0]: [sec-ch-ua-platform, "Windows"]: [Origin, http://localhost:32313]: [Sec-Fetch-Site, same-origin]: [Sec-Fetch-Mode, cors]: [Sec-Fetch-Dest, empty]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 8 ms', N'Jan 31 2023  5:27PM', N'Jan 31 2023  5:27PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (14, N'{"data":false,"isSucces":true,"message":null,"rulesErrors":null}', 200, N'{
  "companyId": 2,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/v1/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate]: [Accept-Language, es-ES,es;q=0.9]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZSIsIm5iZiI6MTY3NTIwMzk4OSwiZXhwIjoxNjc1MjA0Mjg5LCJpYXQiOjE2NzUyMDM5ODksImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.PZ7NyC9EyycVrbv5AGhBtyeM1CWtwJjycMs94O4uRH4]: [Connection, keep-alive]: [Content-Length, 430]: [Content-Type, application/json]: [Cookie, __utmz=111872281.1674006376.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.1.507579577.1674006386; __utma=111872281.1045731767.1674006376.1674868805.1675124861.24; _ga_LKQ6N568T4=GS1.1.1675124919.27.1.1675125377.0.0.0]: [Host, localhost:32313]: [Referer, http://localhost:32313/swagger/index.html]: [User-Agent, Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36]: [sec-ch-ua, "Not_A Brand";v="99", "Google Chrome";v="109", "Chromium";v="109"]: [sec-ch-ua-mobile, ?0]: [sec-ch-ua-platform, "Windows"]: [Origin, http://localhost:32313]: [Sec-Fetch-Site, same-origin]: [Sec-Fetch-Mode, cors]: [Sec-Fetch-Dest, empty]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 5 ms', N'Jan 31 2023  5:29PM', N'Jan 31 2023  5:29PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (15, N'{"data":{"companyId":1,"id":1,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","username":"user.name","password":null,"roleId":1,"portalId":1,"statusId":1,"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZSIsIm5iZiI6MTY3NTIwNDQwNiwiZXhwIjoxNjc1MjA0NzA2LCJpYXQiOjE2NzUyMDQ0MDYsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9._OGTTQiX41wp1v-SxFG_-DAzl0KxiYzmWBBbaS7J39g"},"isSucces":true,"message":"Usuario Autenticado con Exito","rulesErrors":null}', 200, N'{
  "companyId": 0,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "username": "user.name",
  "password": "123456",
  "roleId": 0,
  "portalId": 0,
  "statusId": 0,
  "token": "string"
}', N'', N'/api/v1.0/AutenticationUser/AutenticationUser', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Connection, keep-alive]: [Content-Length, 250]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 8452fd37-ecf6-40a0-ba65-027c62ae6da9]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 522 ms', N'Jan 31 2023  5:33PM', N'Jan 31 2023  5:33PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (16, N'', 401, N'{
  "companyId": 1,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/v1.0/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZSIsIm5iZiI6MTY3NTIwNDQwNiwiZXhwIjoxNjc1MjA0NzA2LCJpYXQiOjE2NzUyMDQ0MDYsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9._OGTTQiX41wp1v-SxFG_-DAzl0KxiYzmWBBbaS7J39g"]: [Connection, keep-alive]: [Content-Length, 447]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, f98c7fb0-f2a2-4f94-b08d-7d995b5892f0]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 17 ms', N'Jan 31 2023  5:33PM', N'Jan 31 2023  5:33PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (17, N'{"data":false,"isSucces":true,"message":"Invalid column name ''ComapanyId''.","rulesErrors":null}', 200, N'{
  "companyId": 1,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/v1.0/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZSIsIm5iZiI6MTY3NTIwNDQwNiwiZXhwIjoxNjc1MjA0NzA2LCJpYXQiOjE2NzUyMDQ0MDYsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9._OGTTQiX41wp1v-SxFG_-DAzl0KxiYzmWBBbaS7J39g]: [Connection, keep-alive]: [Content-Length, 447]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 33490bec-4ce6-4b15-8b21-821548a4a66a]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 236 ms', N'Jan 31 2023  5:34PM', N'Jan 31 2023  5:34PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (18, N'', 401, N'{
  "companyId": 1,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/v1.0/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZSIsIm5iZiI6MTY3NTIwNDQwNiwiZXhwIjoxNjc1MjA0NzA2LCJpYXQiOjE2NzUyMDQ0MDYsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9._OGTTQiX41wp1v-SxFG_-DAzl0KxiYzmWBBbaS7J39g]: [Connection, keep-alive]: [Content-Length, 447]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, b57d6bc8-ecc8-4937-8cfe-7cde4d4c5df7]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 75 ms', N'Jan 31 2023  5:42PM', N'Jan 31 2023  5:42PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (19, N'{"data":{"companyId":1,"id":1,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","username":"user.name","password":null,"roleId":1,"portalId":1,"statusId":1,"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZSIsIm5iZiI6MTY3NTIwNDk5MSwiZXhwIjoxNjc1MjA1MjkxLCJpYXQiOjE2NzUyMDQ5OTEsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.qU0PU6UJOF-m0vmmuPG3U1-iaY3Zp1ey7LrH1XWnaD4"},"isSucces":true,"message":"Usuario Autenticado con Exito","rulesErrors":null}', 200, N'{
  "companyId": 0,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "username": "user.name",
  "password": "123456",
  "roleId": 0,
  "portalId": 0,
  "statusId": 0,
  "token": "string"
}', N'', N'/api/v1.0/AutenticationUser/AutenticationUser', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Connection, keep-alive]: [Content-Length, 250]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, b938d52a-e89b-4aa6-8322-486bab3e9b65]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 245 ms', N'Jan 31 2023  5:43PM', N'Jan 31 2023  5:43PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (20, N'{"data":false,"isSucces":true,"message":null,"rulesErrors":null}', 200, N'{
  "companyId": 1,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/v1.0/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZSIsIm5iZiI6MTY3NTIwNDk5MSwiZXhwIjoxNjc1MjA1MjkxLCJpYXQiOjE2NzUyMDQ5OTEsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.qU0PU6UJOF-m0vmmuPG3U1-iaY3Zp1ey7LrH1XWnaD4]: [Connection, keep-alive]: [Content-Length, 447]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 57abb8aa-ae88-4858-a2e6-f854ed38077f]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 32 secs 531 ms', N'Jan 31 2023  5:43PM', N'Jan 31 2023  5:44PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (21, N'{"data":{"companyId":1,"id":1,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","username":"user.name","password":null,"roleId":1,"portalId":1,"statusId":1,"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZSIsIm5iZiI6MTY3NTIwNTU5OSwiZXhwIjoxNjc1MjA1ODk5LCJpYXQiOjE2NzUyMDU1OTksImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.8Vm3kNO46WaGMdhxbSZB-KhYsh1kNJK-yBGHAJ2hxHc"},"isSucces":true,"message":"Usuario Autenticado con Exito","rulesErrors":null}', 200, N'{
  "companyId": 0,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "username": "user.name",
  "password": "123456",
  "roleId": 0,
  "portalId": 0,
  "statusId": 0,
  "token": "string"
}', N'', N'/api/v1.0/AutenticationUser/AutenticationUser', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Connection, keep-alive]: [Content-Length, 250]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, bf4d938e-f952-4134-9f96-bec6c5dba3bf]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 494 ms', N'Jan 31 2023  5:53PM', N'Jan 31 2023  5:53PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (22, N'{"data":false,"isSucces":true,"message":"Usuario Ya existe ","rulesErrors":null}', 200, N'{
  "companyId": 1,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/v1.0/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZSIsIm5iZiI6MTY3NTIwNTU5OSwiZXhwIjoxNjc1MjA1ODk5LCJpYXQiOjE2NzUyMDU1OTksImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.8Vm3kNO46WaGMdhxbSZB-KhYsh1kNJK-yBGHAJ2hxHc]: [Connection, keep-alive]: [Content-Length, 447]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 917aef23-a50b-45ed-85ea-8edd45bfb7ba]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 46 ms', N'Jan 31 2023  5:53PM', N'Jan 31 2023  5:53PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (23, N'{"data":true,"isSucces":true,"message":"Se ha Creado el Empleado Correctamente","rulesErrors":null}', 200, N'{
  "companyId": 2,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/v1.0/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZSIsIm5iZiI6MTY3NTIwNTU5OSwiZXhwIjoxNjc1MjA1ODk5LCJpYXQiOjE2NzUyMDU1OTksImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.8Vm3kNO46WaGMdhxbSZB-KhYsh1kNJK-yBGHAJ2hxHc]: [Connection, keep-alive]: [Content-Length, 447]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 2214509e-fb8c-4738-af45-e7a9e2f3d5c5]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 15 ms', N'Jan 31 2023  5:53PM', N'Jan 31 2023  5:53PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (24, N'{"data":false,"isSucces":true,"message":"Usuario Ya existe ","rulesErrors":null}', 200, N'{
  "companyId": 2,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/v1.0/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZSIsIm5iZiI6MTY3NTIwNTU5OSwiZXhwIjoxNjc1MjA1ODk5LCJpYXQiOjE2NzUyMDU1OTksImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.8Vm3kNO46WaGMdhxbSZB-KhYsh1kNJK-yBGHAJ2hxHc]: [Connection, keep-alive]: [Content-Length, 447]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 2283f612-e369-4fa1-86d5-0fe3ef46425f]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 4 ms', N'Jan 31 2023  5:54PM', N'Jan 31 2023  5:54PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (25, N'{"data":{"companyId":48,"id":3,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","username":"user.name13","password":null,"roleId":1,"portalId":1,"statusId":1,"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZTEzIiwibmJmIjoxNjc1MjE2OTk2LCJleHAiOjE2NzUyMTcyOTYsImlhdCI6MTY3NTIxNjk5NiwiaXNzIjoiUmVkQXJib3IuY29tIiwiYXVkIjoiUmVkQXJib3IuUHJ1ZWJhIn0.k0fNA6yrRd5Aeir8HD5Oy1s67v4KE0K73abGdQS1MhM"},"isSucces":true,"message":"Usuario Autenticado con Exito","rulesErrors":null}', 200, N'{
  "companyId": 0,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "username": "user.name13",
  "password": "123456",
  "roleId": 0,
  "portalId": 0,
  "statusId": 0,
  "token": "string"
}', N'', N'/api/v1.0/AutenticationUser/AutenticationUser', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Connection, keep-alive]: [Content-Length, 252]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 1b01aa04-1612-4598-acab-1ea797c223a5]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 677 ms', N'Jan 31 2023  9:03PM', N'Jan 31 2023  9:03PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (26, N'{"data":true,"isSucces":true,"message":"Se ha Creado el Empleado Correctamente","rulesErrors":null}', 200, N'{
  "companyId": 1,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/v1.0/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6InVzZXIubmFtZTEzIiwibmJmIjoxNjc1MjE2OTk2LCJleHAiOjE2NzUyMTcyOTYsImlhdCI6MTY3NTIxNjk5NiwiaXNzIjoiUmVkQXJib3IuY29tIiwiYXVkIjoiUmVkQXJib3IuUHJ1ZWJhIn0.k0fNA6yrRd5Aeir8HD5Oy1s67v4KE0K73abGdQS1MhM]: [Connection, keep-alive]: [Content-Length, 447]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 1bf28cad-0cd8-4358-b235-d4cca1af88c2]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 69 ms', N'Jan 31 2023  9:03PM', N'Jan 31 2023  9:03PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (27, N'{"data":{"companyId":1,"id":5,"name":"Edinson Aguirre","email":"edinson.aguirre@gmai","telephone":"5555555555","fax":"545454-78","username":"edinson.aguirre","password":null,"roleId":1,"portalId":1,"statusId":1,"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVkaW5zb24uYWd1aXJyZSIsIm5iZiI6MTY3NTIyMDE5NCwiZXhwIjoxNjc1MjIwNDk0LCJpYXQiOjE2NzUyMjAxOTQsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.kzUKRfKwItUatC21pecuIwXMS9NsqqVqhNR0EWvBO9A"},"isSucces":true,"message":"Usuario Autenticado con Exito","rulesErrors":null}', 200, N'{
  "companyId": 0,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "username": "Edinson.Aguirre",
  "password": "123456",
  "roleId": 0,
  "portalId": 0,
  "statusId": 0,
  "token": "string"
}', N'', N'/api/v1.0/AutenticationUser/AutenticationUser', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Connection, keep-alive]: [Content-Length, 256]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, a7fba000-80d4-4300-8584-1ddc5da8e52b]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 419 ms', N'Jan 31 2023  9:56PM', N'Jan 31 2023  9:56PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (28, N'{"data":false,"isSucces":true,"message":"Usuario Ya existe  para la compañia:1","rulesErrors":null}', 200, N'{
  "companyId": 1,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/v1.0/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVkaW5zb24uYWd1aXJyZSIsIm5iZiI6MTY3NTIyMDE5NCwiZXhwIjoxNjc1MjIwNDk0LCJpYXQiOjE2NzUyMjAxOTQsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.kzUKRfKwItUatC21pecuIwXMS9NsqqVqhNR0EWvBO9A]: [Connection, keep-alive]: [Content-Length, 447]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 8f590ded-f64b-4a87-ad59-656f733fa769]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 45 ms', N'Jan 31 2023  9:57PM', N'Jan 31 2023  9:57PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (29, N'{"data":null,"isSucces":false,"message":"Error validation","rulesErrors":[{"propertyName":"CompanyId","errorMessage":"''Company Id'' no debería estar vacío.","attemptedValue":0,"customState":null,"severity":0,"errorCode":"NotEmptyValidator","formattedMessagePlaceholderValues":{"PropertyName":"Company Id","PropertyValue":0}},{"propertyName":"CompanyId","errorMessage":"''Company Id'' debe ser mayor que ''0''.","attemptedValue":0,"customState":null,"severity":0,"errorCode":"GreaterThanValidator","formattedMessagePlaceholderValues":{"ComparisonValue":0,"ComparisonProperty":"","PropertyName":"Company Id","PropertyValue":0}}]}', 400, N'{
  "companyId": 0,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "username": "Edinson.Aguirre",
  "password": "123456",
  "roleId": 0,
  "portalId": 0,
  "statusId": 0,
  "token": "string"
}', N'', N'/api/v1.0/AutenticationUser/AutenticationUser', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Connection, keep-alive]: [Content-Length, 256]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 5600dcdf-779f-4406-a1e6-5511ec189fe8]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 197 ms', N'Jan 31 2023 10:14PM', N'Jan 31 2023 10:14PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (30, N'{"data":{"companyId":1,"id":5,"name":"Edinson Aguirre","email":"edinson.aguirre@gmai","telephone":"5555555555","fax":"545454-78","username":"edinson.aguirre","password":null,"roleId":1,"portalId":1,"statusId":1,"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVkaW5zb24uYWd1aXJyZSIsIm5iZiI6MTY3NTIyMTMwMCwiZXhwIjoxNjc1MjIxNjAwLCJpYXQiOjE2NzUyMjEzMDAsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.MpmiMaQCieZO-7kcJL9sNDihPZVtUiGBhvZBjdbwXr4"},"isSucces":true,"message":"Usuario Autenticado con Exito","rulesErrors":null}', 200, N'{
  "companyId": 1,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "username": "Edinson.Aguirre",
  "password": "123456",
  "roleId": 0,
  "portalId": 0,
  "statusId": 0,
  "token": "string"
}', N'', N'/api/v1.0/AutenticationUser/AutenticationUser', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Connection, keep-alive]: [Content-Length, 256]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 98e90241-b8a5-4faa-bf35-6d0ce7df1537]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 275 ms', N'Jan 31 2023 10:15PM', N'Jan 31 2023 10:15PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (31, N'{"data":false,"isSucces":true,"message":"Usuario Ya existe  para la compañia:1","rulesErrors":null}', 200, N'{
  "companyId": 1,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/v1.0/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVkaW5zb24uYWd1aXJyZSIsIm5iZiI6MTY3NTIyMTMwMCwiZXhwIjoxNjc1MjIxNjAwLCJpYXQiOjE2NzUyMjEzMDAsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.MpmiMaQCieZO-7kcJL9sNDihPZVtUiGBhvZBjdbwXr4]: [Connection, keep-alive]: [Content-Length, 447]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, fa764494-a20e-4ddc-b1bd-6e785b4f13b8]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 30 ms', N'Jan 31 2023 10:15PM', N'Jan 31 2023 10:15PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (32, N'{"data":true,"isSucces":true,"message":"Se ha Creado el Empleado Correctamente","rulesErrors":null}', 200, N'{
  "companyId": 2,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/v1.0/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVkaW5zb24uYWd1aXJyZSIsIm5iZiI6MTY3NTIyMTMwMCwiZXhwIjoxNjc1MjIxNjAwLCJpYXQiOjE2NzUyMjEzMDAsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.MpmiMaQCieZO-7kcJL9sNDihPZVtUiGBhvZBjdbwXr4]: [Connection, keep-alive]: [Content-Length, 447]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, febaf963-0da1-44ef-9639-545a6f9e3584]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 123 ms', N'Jan 31 2023 10:15PM', N'Jan 31 2023 10:15PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (33, N'{"data":false,"isSucces":true,"message":"Usuario Ya existe  para la compañia:2","rulesErrors":null}', 200, N'{
  "companyId": 2,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/v1.0/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVkaW5zb24uYWd1aXJyZSIsIm5iZiI6MTY3NTIyMTMwMCwiZXhwIjoxNjc1MjIxNjAwLCJpYXQiOjE2NzUyMjEzMDAsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.MpmiMaQCieZO-7kcJL9sNDihPZVtUiGBhvZBjdbwXr4]: [Connection, keep-alive]: [Content-Length, 447]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, d64ae62c-c69f-4df9-a134-240061fba09c]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 335 ms', N'Jan 31 2023 10:16PM', N'Jan 31 2023 10:16PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (34, N'', 401, N'{
  "companyId": 2,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 1,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}
', N'', N'/api/v1.0/Employee/Insert', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6ImVkaW5zb24uYWd1aXJyZSIsIm5iZiI6MTY3NTIyMTMwMCwiZXhwIjoxNjc1MjIxNjAwLCJpYXQiOjE2NzUyMjEzMDAsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.MpmiMaQCieZO-7kcJL9sNDihPZVtUiGBhvZBjdbwXr4]: [Connection, keep-alive]: [Content-Length, 447]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 9e8ac437-74a0-4cd7-9b8c-c309049a0db6]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 41 ms', N'Jan 31 2023 10:35PM', N'Jan 31 2023 10:35PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (35, N'', 401, N'{
  "companyId": 0,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "roleId": 0,
  "username": "string",
  "password": "string",
  "lastlogin": "2023-02-01T03:35:30.849Z",
  "portalId": 0,
  "statusId": 0,
  "createdOn": "2023-02-01T03:35:30.849Z",
  "updatedOn": "2023-02-01T03:35:30.849Z",
  "deletedOn": "2023-02-01T03:35:30.849Z"
}', N'', N'/api/v1/Employee/Update', N'[Accept, */*]: [Accept-Encoding, gzip, deflate]: [Accept-Language, es-ES,es;q=0.9]: [Connection, keep-alive]: [Content-Length, 385]: [Content-Type, application/json]: [Cookie, __utmz=111872281.1674006376.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.1.507579577.1674006386; __utma=111872281.1045731767.1674006376.1674868805.1675124861.24; _ga_LKQ6N568T4=GS1.1.1675124919.27.1.1675125377.0.0.0]: [Host, localhost:32313]: [Referer, http://localhost:32313/swagger/index.html]: [User-Agent, Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36]: [sec-ch-ua, "Not_A Brand";v="99", "Google Chrome";v="109", "Chromium";v="109"]: [sec-ch-ua-mobile, ?0]: [sec-ch-ua-platform, "Windows"]: [Origin, http://localhost:32313]: [Sec-Fetch-Site, same-origin]: [Sec-Fetch-Mode, cors]: [Sec-Fetch-Dest, empty]', N'', N'PUT', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 0 ms', N'Jan 31 2023 10:35PM', N'Jan 31 2023 10:35PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (36, N'{"data":{"companyId":1,"id":5,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","username":"Edinson.Aguirre","password":null,"roleId":1,"portalId":1,"statusId":1,"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkVkaW5zb24uQWd1aXJyZSIsIm5iZiI6MTY3NTIyMjU5NywiZXhwIjoxNjc1MjIyODk3LCJpYXQiOjE2NzUyMjI1OTcsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.BS9IjpVP1VDyWPgG1hAww6RocG9avQq0AQh0tk9CGA4"},"isSucces":true,"message":"Usuario Autenticado con Exito","rulesErrors":null}', 200, N'{
  "companyId": 1,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "username": "Edinson.Aguirre",
  "password": "123456",
  "roleId": 0,
  "portalId": 0,
  "statusId": 0,
  "token": "string"
}', N'', N'/api/v1.0/AutenticationUser/AutenticationUser', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Connection, keep-alive]: [Content-Length, 256]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 424ae993-166a-4a28-9e09-6c1cef8c28e3]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 228 ms', N'Jan 31 2023 10:36PM', N'Jan 31 2023 10:36PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (37, N'', 400, N'{
  "companyId": 2,
  "id": 1,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 2,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}', N'', N'/api/v1/Employee/Update', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkVkaW5zb24uQWd1aXJyZSIsIm5iZiI6MTY3NTIyMjU5NywiZXhwIjoxNjc1MjIyODk3LCJpYXQiOjE2NzUyMjI1OTcsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.BS9IjpVP1VDyWPgG1hAww6RocG9avQq0AQh0tk9CGA4]: [Connection, keep-alive]: [Content-Length, 445]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 3a587d96-c27b-4400-a914-b596f106956b]', N'', N'PUT', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 36 ms', N'Jan 31 2023 10:36PM', N'Jan 31 2023 10:36PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (38, N'{"data":true,"isSucces":true,"message":"Se ha Actualizado el Empleado Correctamente","rulesErrors":null}', 200, N'{
  "companyId": 2,
  "id": 8,
  "name": "Edinson Aguirre",
  "email": "edinson.aguirre@gmail.com",
  "telephone": "5555555555",
  "fax": "545454-78",
  "roleId": 1,
  "username": "edinson.aguirre",
  "password": "123456",
  "lastlogin": "2023-01-31T20:59:31.333Z",
  "portalId": 1,
  "statusId": 2,
  "createdOn": "2023-01-31T20:59:31.333Z",
  "updatedOn": "2023-01-31T20:59:31.333Z",
  "deletedOn": "2023-01-31T20:59:31.333Z"
}', N'', N'/api/v1/Employee/Update', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkVkaW5zb24uQWd1aXJyZSIsIm5iZiI6MTY3NTIyMjU5NywiZXhwIjoxNjc1MjIyODk3LCJpYXQiOjE2NzUyMjI1OTcsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.BS9IjpVP1VDyWPgG1hAww6RocG9avQq0AQh0tk9CGA4]: [Connection, keep-alive]: [Content-Length, 445]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 8f3397c8-f6a4-4ecf-8088-179f48e4aef9]', N'', N'PUT', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 9 ms', N'Jan 31 2023 10:37PM', N'Jan 31 2023 10:37PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (39, N'', 404, N'', N'', N'/api/Employee/GetAll', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkVkaW5zb24uQWd1aXJyZSIsIm5iZiI6MTY3NTIyMjU5NywiZXhwIjoxNjc1MjIyODk3LCJpYXQiOjE2NzUyMjI1OTcsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.BS9IjpVP1VDyWPgG1hAww6RocG9avQq0AQh0tk9CGA4]: [Connection, keep-alive]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, b86a6aed-ad43-4ebd-9331-7369a7667cee]', N'', N'GET', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 6 ms', N'Jan 31 2023 10:37PM', N'Jan 31 2023 10:37PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (40, N'{"data":[{"companyId":1,"id":5,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","roleId":1,"username":"Edinson.Aguirre","password":"123456","lastlogin":"2023-01-31T22:03:00+00:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T22:34:11.7819-05:00","updatedOn":"2023-01-31T22:34:11.7819-05:00","deletedOn":"2023-01-31T22:34:11.7819-05:00"},{"companyId":2,"id":8,"name":"Edinson Aguirre","email":"edinson.aguirre@gmai","telephone":"5555555555","fax":"545454-78","roleId":1,"username":"edinson.aguirre","password":"123456","lastlogin":"2023-01-31T20:05:00+00:00","portalId":1,"statusId":2,"createdOn":"2023-01-31T20:59:31.333+00:00","updatedOn":"2023-01-31T20:59:31.333+00:00","deletedOn":"2023-01-31T20:59:31.333+00:00"},{"companyId":48,"id":3,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","roleId":1,"username":"user.name13","password":"123456","lastlogin":"2023-01-31T21:01:48.0164-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T21:01:48.0163-05:00","updatedOn":"2023-01-31T21:01:48.0166-05:00","deletedOn":"2023-01-31T21:01:48.0163-05:00"},{"companyId":50,"id":13,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","roleId":1,"username":"user.name402","password":"123456","lastlogin":"2023-01-31T22:27:18.5622-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T22:27:18.5621-05:00","updatedOn":"2023-01-31T22:27:18.5624-05:00","deletedOn":"2023-01-31T22:27:18.5621-05:00"},{"companyId":64,"id":10,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","roleId":1,"username":"user.name90","password":"123456","lastlogin":"2023-01-31T22:15:58.2725-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T22:15:58.2725-05:00","updatedOn":"2023-01-31T22:15:58.2725-05:00","deletedOn":"2023-01-31T22:15:58.2725-05:00"},{"companyId":104,"id":11,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","roleId":1,"username":"user.name336","password":"123456","lastlogin":"2023-01-31T22:16:10.8292-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T22:16:10.8291-05:00","updatedOn":"2023-01-31T22:16:10.8294-05:00","deletedOn":"2023-01-31T22:16:10.8291-05:00"},{"companyId":111,"id":2,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","roleId":1,"username":"user.name195","password":"123456","lastlogin":"2023-01-31T21:01:08.2655-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T21:01:08.2655-05:00","updatedOn":"2023-01-31T21:01:08.2655-05:00","deletedOn":"2023-01-31T21:01:08.2655-05:00"},{"companyId":132,"id":1,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","roleId":1,"username":"user.name413","password":"123456","lastlogin":"2023-01-31T21:01:08.2123-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T21:01:08.2122-05:00","updatedOn":"2023-01-31T21:01:08.2124-05:00","deletedOn":"2023-01-31T21:01:08.2122-05:00"},{"companyId":140,"id":17,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","roleId":1,"username":"user.name154","password":"123456","lastlogin":"2023-01-31T22:34:11.7402-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T22:34:11.7401-05:00","updatedOn":"2023-01-31T22:34:11.7404-05:00","deletedOn":"2023-01-31T22:34:11.7402-05:00"},{"companyId":147,"id":4,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","roleId":1,"username":"user.name100","password":"123456","lastlogin":"2023-01-31T21:01:48.0685-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T21:01:48.0685-05:00","updatedOn":"2023-01-31T21:01:48.0685-05:00","deletedOn":"2023-01-31T21:01:48.0685-05:00"},{"companyId":154,"id":6,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","roleId":1,"username":"user.name136","password":"123456","lastlogin":"2023-01-31T21:04:08.2421-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T21:04:08.2419-05:00","updatedOn":"2023-01-31T21:04:08.2423-05:00","deletedOn":"2023-01-31T21:04:08.242-05:00"},{"companyId":193,"id":12,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","roleId":1,"username":"user.name127","password":"123456","lastlogin":"2023-01-31T22:16:10.8574-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T22:16:10.8574-05:00","updatedOn":"2023-01-31T22:16:10.8574-05:00","deletedOn":"2023-01-31T22:16:10.8574-05:00"},{"companyId":253,"id":9,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","roleId":1,"username":"user.name424","password":"123456","lastlogin":"2023-01-31T22:15:58.2247-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T22:15:58.2245-05:00","updatedOn":"2023-01-31T22:15:58.2249-05:00","deletedOn":"2023-01-31T22:15:58.2246-05:00"},{"companyId":259,"id":15,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","roleId":1,"username":"user.name405","password":"123456","lastlogin":"2023-01-31T22:31:23.652-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T22:31:23.6518-05:00","updatedOn":"2023-01-31T22:31:23.6521-05:00","deletedOn":"2023-01-31T22:31:23.6519-05:00"},{"companyId":375,"id":16,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","roleId":1,"username":"user.name44","password":"123456","lastlogin":"2023-01-31T22:31:23.6848-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T22:31:23.6848-05:00","updatedOn":"2023-01-31T22:31:23.6848-05:00","deletedOn":"2023-01-31T22:31:23.6848-05:00"},{"companyId":432,"id":7,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","roleId":1,"username":"user.name227","password":"123456","lastlogin":"2023-01-31T21:04:08.2899-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T21:04:08.2898-05:00","updatedOn":"2023-01-31T21:04:08.2899-05:00","deletedOn":"2023-01-31T21:04:08.2899-05:00"},{"companyId":449,"id":18,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","roleId":1,"username":"user.name403","password":"123456","lastlogin":"2023-01-31T22:34:11.7696-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T22:34:11.7696-05:00","updatedOn":"2023-01-31T22:34:11.7696-05:00","deletedOn":"2023-01-31T22:34:11.7696-05:00"},{"companyId":469,"id":14,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","roleId":1,"username":"user.name408","password":"123456","lastlogin":"2023-01-31T22:27:18.6048-05:00","portalId":1,"statusId":1,"createdOn":"2023-01-31T22:27:18.6048-05:00","updatedOn":"2023-01-31T22:27:18.6048-05:00","deletedOn":"2023-01-31T22:27:18.6048-05:00"}],"isSucces":true,"message":"Consulta Exitosa","rulesErrors":null}', 200, N'', N'', N'/api/v1.0/Employee/GetAll', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkVkaW5zb24uQWd1aXJyZSIsIm5iZiI6MTY3NTIyMjU5NywiZXhwIjoxNjc1MjIyODk3LCJpYXQiOjE2NzUyMjI1OTcsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.BS9IjpVP1VDyWPgG1hAww6RocG9avQq0AQh0tk9CGA4]: [Connection, keep-alive]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 01477944-abb9-492e-9944-bd2d2fee57f2]', N'', N'GET', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 67 ms', N'Jan 31 2023 10:38PM', N'Jan 31 2023 10:38PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (41, N'', 401, N'', N'', N'/api/v1/Employee/Delete/50/25', N'[Accept, */*]: [Accept-Encoding, gzip, deflate]: [Accept-Language, es-ES,es;q=0.9]: [Connection, keep-alive]: [Cookie, __utmz=111872281.1674006376.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.1.507579577.1674006386; __utma=111872281.1045731767.1674006376.1674868805.1675124861.24; _ga_LKQ6N568T4=GS1.1.1675124919.27.1.1675125377.0.0.0]: [Host, localhost:32313]: [Referer, http://localhost:32313/swagger/index.html]: [User-Agent, Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36]: [sec-ch-ua, "Not_A Brand";v="99", "Google Chrome";v="109", "Chromium";v="109"]: [sec-ch-ua-mobile, ?0]: [sec-ch-ua-platform, "Windows"]: [Origin, http://localhost:32313]: [Sec-Fetch-Site, same-origin]: [Sec-Fetch-Mode, cors]: [Sec-Fetch-Dest, empty]', N'', N'DELETE', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 0 ms', N'Jan 31 2023 10:39PM', N'Jan 31 2023 10:39PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (42, N'', 400, N'', N'', N'/api/v1/Employee/Delete/50/25', N'[Accept, */*]: [Accept-Encoding, gzip, deflate]: [Accept-Language, es-ES,es;q=0.9]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkVkaW5zb24uQWd1aXJyZSIsIm5iZiI6MTY3NTIyMjU5NywiZXhwIjoxNjc1MjIyODk3LCJpYXQiOjE2NzUyMjI1OTcsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.BS9IjpVP1VDyWPgG1hAww6RocG9avQq0AQh0tk9CGA4]: [Connection, keep-alive]: [Cookie, __utmz=111872281.1674006376.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.1.507579577.1674006386; __utma=111872281.1045731767.1674006376.1674868805.1675124861.24; _ga_LKQ6N568T4=GS1.1.1675124919.27.1.1675125377.0.0.0]: [Host, localhost:32313]: [Referer, http://localhost:32313/swagger/index.html]: [User-Agent, Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36]: [sec-ch-ua, "Not_A Brand";v="99", "Google Chrome";v="109", "Chromium";v="109"]: [sec-ch-ua-mobile, ?0]: [sec-ch-ua-platform, "Windows"]: [Origin, http://localhost:32313]: [Sec-Fetch-Site, same-origin]: [Sec-Fetch-Mode, cors]: [Sec-Fetch-Dest, empty]', N'', N'DELETE', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 6 ms', N'Jan 31 2023 10:40PM', N'Jan 31 2023 10:40PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (43, N'', 400, N'', N'', N'/api/v1/Employee/Delete/50/25', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkVkaW5zb24uQWd1aXJyZSIsIm5iZiI6MTY3NTIyMjU5NywiZXhwIjoxNjc1MjIyODk3LCJpYXQiOjE2NzUyMjI1OTcsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.BS9IjpVP1VDyWPgG1hAww6RocG9avQq0AQh0tk9CGA4]: [Connection, keep-alive]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 08a5e60e-7286-4eda-9819-fbdf017123c0]', N'', N'DELETE', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 1 ms', N'Jan 31 2023 10:41PM', N'Jan 31 2023 10:41PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (44, N'', 401, N'', N'', N'/api/v1/Employee/Delete/449/18', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkVkaW5zb24uQWd1aXJyZSIsIm5iZiI6MTY3NTIyMjU5NywiZXhwIjoxNjc1MjIyODk3LCJpYXQiOjE2NzUyMjI1OTcsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.BS9IjpVP1VDyWPgG1hAww6RocG9avQq0AQh0tk9CGA4]: [Connection, keep-alive]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, e2e11a01-f9e1-44ac-9e3b-22f08807c44e]', N'', N'DELETE', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 0 ms', N'Jan 31 2023 10:41PM', N'Jan 31 2023 10:41PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (45, N'{"data":{"companyId":1,"id":5,"name":"New user","email":"prueba@rearbor.com","telephone":"555555555","fax":"101010","username":"Edinson.Aguirre","password":null,"roleId":1,"portalId":1,"statusId":1,"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkVkaW5zb24uQWd1aXJyZSIsIm5iZiI6MTY3NTIyMjkyMCwiZXhwIjoxNjc1MjIzMjIwLCJpYXQiOjE2NzUyMjI5MjAsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.6UI3e097kb73mt9BokXFvRsZinJ-s0UKFY5FZVx4zlM"},"isSucces":true,"message":"Usuario Autenticado con Exito","rulesErrors":null}', 200, N'{
  "companyId": 1,
  "id": 0,
  "name": "string",
  "email": "string",
  "telephone": "string",
  "fax": "string",
  "username": "Edinson.Aguirre",
  "password": "123456",
  "roleId": 0,
  "portalId": 0,
  "statusId": 0,
  "token": "string"
}', N'', N'/api/v1.0/AutenticationUser/AutenticationUser', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Connection, keep-alive]: [Content-Length, 256]: [Content-Type, application/json]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 8eadcdbe-9887-499d-8912-e528c8240e17]', N'', N'POST', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 3 ms', N'Jan 31 2023 10:42PM', N'Jan 31 2023 10:42PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (46, N'', 401, N'', N'', N'/api/v1/Employee/Delete/449/18', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer http://localhost:32313/api/v1/Employee/Delete/50/25]: [Connection, keep-alive]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, b5b034d6-37d7-4f3e-ad86-660634475633]', N'', N'DELETE', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 0 ms', N'Jan 31 2023 10:42PM', N'Jan 31 2023 10:42PM')
INSERT [dbo].[WatchDog_WatchLog] ([id], [responseBody], [responseStatus], [requestBody], [queryString], [path], [requestHeaders], [responseHeaders], [method], [host], [ipAddress], [timeSpent], [startTime], [endTime]) VALUES (47, N'{"data":true,"isSucces":true,"message":"Se ha Eliminado el Empleado Correctamente","rulesErrors":null}', 200, N'', N'', N'/api/v1/Employee/Delete/449/18', N'[Accept, */*]: [Accept-Encoding, gzip, deflate, br]: [Authorization, Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IkVkaW5zb24uQWd1aXJyZSIsIm5iZiI6MTY3NTIyMjkyMCwiZXhwIjoxNjc1MjIzMjIwLCJpYXQiOjE2NzUyMjI5MjAsImlzcyI6IlJlZEFyYm9yLmNvbSIsImF1ZCI6IlJlZEFyYm9yLlBydWViYSJ9.6UI3e097kb73mt9BokXFvRsZinJ-s0UKFY5FZVx4zlM]: [Connection, keep-alive]: [Host, localhost:32313]: [User-Agent, PostmanRuntime/7.30.0]: [Postman-Token, 17993210-c722-4ec7-8910-61948bad4051]', N'', N'DELETE', N'localhost:32313', N'::1', N'0 hrs 0 mins 0 secs 3 ms', N'Jan 31 2023 10:42PM', N'Jan 31 2023 10:42PM')
SET IDENTITY_INSERT [dbo].[WatchDog_WatchLog] OFF
GO
/****** Object:  StoredProcedure [dbo].[EmployeeDelete]    Script Date: 2/02/2023 10:40:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmployeeDelete]
(
	@CompanyID         int ,
	@Id                int
)
AS
BEGIN

    DELETE Employee
     WHERE CompanyId=@CompanyID And  Id=@Id 

END
GO
/****** Object:  StoredProcedure [dbo].[EmployeeGetByCompanyID_ID]    Script Date: 2/02/2023 10:40:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmployeeGetByCompanyID_ID]
(
    @CompanyID         int ,
	@Id                int
)
AS
BEGIN

      SELECT 
	[CompanyId]
	,[Id]
	,[Name]		 
	,[Email]		 
	,[Telephone]	 
	,[Fax]		 
	,[RoleId]	 
	,[Username] 	 
	,[Password] 	 
	,[Lastlogin]	 
	,[PortalId] 	 
	,[StatusId] 	 
	,[CreatedOn]	 
	,[UpdatedOn]	 
	 ,[DeletedOn] 

    FROM Employee
    WHERE CompanyId=@CompanyID And Id=@Id   

END
GO
/****** Object:  StoredProcedure [dbo].[EmployeeGetByUserAndPassword]    Script Date: 2/02/2023 10:40:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EmployeeGetByUserAndPassword]
(
 @CompanyId  int ,
  @Username varchar(30),
  @Password varchar(30)
  
)
AS
BEGIN

    SELECT 
	[CompanyId]
	,[Id]
	,[Name]		 
	,[Email]		 
	,[Telephone]	 
	,[Fax]		 
	,[RoleId]	 
	,[Username] 	 
	,NULL As Password	 
	,[Lastlogin]	 
	,[PortalId] 	 
	,[StatusId] 	 
	,[CreatedOn]	 
	,[UpdatedOn]	 
	 ,[DeletedOn] 

    FROM Employee
	WHERE   CompanyId=@CompanyId And    Username=@Username And Password=@Password 
END
GO
/****** Object:  StoredProcedure [dbo].[EmployeeInsert]    Script Date: 2/02/2023 10:40:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmployeeInsert]
(
	@CompanyID         int ,
	@Name              nvarchar (30) ,
	@Email             nvarchar (20) NULL ,
	@Telephone         nvarchar (12) NULL ,
	@Fax               nvarchar (12) NULL ,
	@RoleId            int,
	@Username          nvarchar (15) ,
	@Password          nvarchar (20) NULL ,
	@Lastlogin         DatetimeOffSet ,
	@PortalId          int,
	@StatusId          int,
	@CreatedON         DatetimeOffSet,
	@UpdatedOn         DatetimeOffSet,
	@DeletedOn         DatetimeOffSet
)
AS
BEGIN

    INSERT INTO Employee(
	[CompanyId]
	,[Name]
	,[Email]
	,[Telephone]
	,[Fax]
	,[RoleId]
	,[Username] 
	,[Password] 
	,[Lastlogin]
	,[PortalId] 
	,[StatusId] 
	,[CreatedOn]
	,[UpdatedOn]
	 ,[DeletedOn]
	)
    VALUES(
	 @CompanyID
	 ,@Name     
	 ,@Email    
	 ,@Telephone
	 ,@Fax      
	 ,@RoleId   
	 ,@Username 
	 ,@Password 
	 ,@Lastlogin
	 ,@PortalId 
	 ,@StatusId 
	 ,@CreatedON
	 ,@UpdatedOn
	 ,@DeletedOn
	
	)

END
GO
/****** Object:  StoredProcedure [dbo].[EmployeeList]    Script Date: 2/02/2023 10:40:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EmployeeList]
AS
BEGIN

    SELECT 
	[CompanyId]
	,[Id]
	,[Name]		 
	,[Email]		 
	,[Telephone]	 
	,[Fax]		 
	,[RoleId]	 
	,[Username] 	 
	,[Password] 	 
	,[Lastlogin]	 
	,[PortalId] 	 
	,[StatusId] 	 
	,[CreatedOn]	 
	,[UpdatedOn]	 
	 ,[DeletedOn] 

    FROM Employee

END
GO
/****** Object:  StoredProcedure [dbo].[EmployeeUpdate]    Script Date: 2/02/2023 10:40:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EmployeeUpdate]
(
	@CompanyID         int ,
	@Id                int,
	@Name              nvarchar (30) ,
	@Email             nvarchar (20) NULL ,
	@Telephone         nvarchar (12) NULL ,
	@Fax               nvarchar (12) NULL ,
	@RoleId            int,
	@Username          nvarchar (15) ,
	@Password          nvarchar (20) NULL ,
	@Lastlogin         nvarchar (15) NULL ,
	@PortalId          int,
	@StatusId          int,
	@CreatedON         DatetimeOffSet,
	@UpdatedOn         DatetimeOffSet,
	@DeletedOn         DatetimeOffSet
)

AS
BEGIN

    UPDATE Employee
        SET
	   [Name]		  =	@Name      
	   ,[Email]		  =	@Email     
	   ,[Telephone]	  =	@Telephone 
	   ,[Fax]		  =	@Fax       
	   ,[RoleId]	  =	@RoleId    
	   ,[Username] 	  =	@Username  
	   ,[Password] 	  =	@Password  
	   ,[Lastlogin]	  =	@Lastlogin 
	   ,[PortalId] 	  =	@PortalId  
	   ,[StatusId] 	  =	@StatusId  
	   ,[CreatedOn]	  =	@CreatedON 
	   ,[UpdatedOn]	  =	@UpdatedOn 
	    ,[DeletedOn]  =	@DeletedOn
    WHERE CompanyId=@CompanyID And  Id=@Id 

END
GO
USE [master]
GO
ALTER DATABASE [RedArbor] SET  READ_WRITE 
GO
