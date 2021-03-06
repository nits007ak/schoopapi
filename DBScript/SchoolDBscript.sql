USE [master]
GO
/****** Object:  Database [anaghaenterprises]    Script Date: 27-05-2018 18:14:24 ******/
CREATE DATABASE [anaghaenterprises]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'anaghaenterprises', FILENAME = N'E:\MSSQL.MSSQLSERVER\DATA\anaghaenterprises.mdf' , SIZE = 5120KB , MAXSIZE = 204800KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'anaghaenterprises_log', FILENAME = N'D:\MSSQL.MSSQLSERVER\DATA\anaghaenterprises_log.ldf' , SIZE = 1024KB , MAXSIZE = 102400KB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [anaghaenterprises] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [anaghaenterprises].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [anaghaenterprises] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [anaghaenterprises] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [anaghaenterprises] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [anaghaenterprises] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [anaghaenterprises] SET ARITHABORT OFF 
GO
ALTER DATABASE [anaghaenterprises] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [anaghaenterprises] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [anaghaenterprises] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [anaghaenterprises] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [anaghaenterprises] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [anaghaenterprises] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [anaghaenterprises] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [anaghaenterprises] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [anaghaenterprises] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [anaghaenterprises] SET  ENABLE_BROKER 
GO
ALTER DATABASE [anaghaenterprises] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [anaghaenterprises] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [anaghaenterprises] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [anaghaenterprises] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [anaghaenterprises] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [anaghaenterprises] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [anaghaenterprises] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [anaghaenterprises] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [anaghaenterprises] SET  MULTI_USER 
GO
ALTER DATABASE [anaghaenterprises] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [anaghaenterprises] SET DB_CHAINING OFF 
GO
ALTER DATABASE [anaghaenterprises] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [anaghaenterprises] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [anaghaenterprises] SET DELAYED_DURABILITY = DISABLED 
GO
USE [anaghaenterprises]
GO
/****** Object:  User [rahultanwar706]    Script Date: 27-05-2018 18:14:24 ******/
CREATE USER [rahultanwar706] FOR LOGIN [rahultanwar706] WITH DEFAULT_SCHEMA=[rahultanwar706]
GO
/****** Object:  DatabaseRole [gd_execprocs]    Script Date: 27-05-2018 18:14:25 ******/
CREATE ROLE [gd_execprocs]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [rahultanwar706]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [rahultanwar706]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [rahultanwar706]
GO
ALTER ROLE [db_datareader] ADD MEMBER [rahultanwar706]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [rahultanwar706]
GO
/****** Object:  Schema [rahultanwar706]    Script Date: 27-05-2018 18:14:25 ******/
CREATE SCHEMA [rahultanwar706]
GO
/****** Object:  Table [dbo].[ActivityDetails]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ActivityDetails](
	[ActivityDetailsId] [bigint] IDENTITY(1,1) NOT NULL,
	[ActivityTypeId] [int] NOT NULL,
	[ActivitySubTypeIds] [varchar](400) NULL,
	[ActivitySubTypeChildIds] [varchar](400) NULL,
	[StaffId] [bigint] NOT NULL,
	[ActivityDateTime] [datetime] NOT NULL,
	[Notes] [varchar](max) NULL,
	[ImageURL] [varchar](max) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[ActivityDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ActivitySubType]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivitySubType](
	[ActivitySubTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ActivityTypeId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivitySubTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActivitySubTypeChild]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivitySubTypeChild](
	[ActivitySubTypeChildId] [int] IDENTITY(1,1) NOT NULL,
	[ActivitySubTypeId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivitySubTypeChildId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ActivityType]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityType](
	[ActivityTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ActivityName] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[ActivityTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Admin]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](200) NOT NULL,
	[RoleId] [smallint] NOT NULL,
	[IsActive] [bit] NULL DEFAULT ((0)),
	[CreatedDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Class](
	[ClassId] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolInfoId] [bigint] NOT NULL,
	[ClassName] [varchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[UpdateDate] [datetime] NULL DEFAULT (getdate()),
	[UpdatedEmail] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [bigint] IDENTITY(1,1) NOT NULL,
	[InvoiceNumber] [nvarchar](100) NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[PO_No] [nvarchar](100) NULL,
	[TransportationMode] [nvarchar](100) NULL,
	[Veh_No] [nvarchar](100) NULL,
	[LR_No] [nvarchar](100) NULL,
	[LR_Date] [datetime] NULL,
	[DateTimeSupply] [datetime] NULL,
	[CustomerName] [nvarchar](100) NULL,
	[GST_No] [nvarchar](100) NULL,
	[PAN_No] [nvarchar](100) NULL,
	[CompanyAddress] [nvarchar](4000) NULL,
	[ShippingAddress] [nvarchar](4000) NULL,
	[Total_Nos_Bag] [decimal](13, 2) NULL,
	[Total_Nos_Kg] [decimal](13, 2) NULL,
	[TotalAmountBeforeTax] [decimal](13, 2) NULL,
	[Total_CGST] [decimal](13, 2) NULL,
	[Total_SGST] [decimal](13, 2) NULL,
	[Total_IGST] [decimal](13, 2) NULL,
	[Total_GST] [decimal](13, 2) NULL,
	[TotalAmountAfterTax] [decimal](13, 2) NULL,
	[TotalAfterRoundOff] [decimal](13, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceLine]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceLine](
	[InvoiceLineID] [bigint] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [bigint] NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Nos_Bag] [decimal](13, 2) NULL,
	[Uom] [nvarchar](50) NULL,
	[Rate] [decimal](13, 2) NULL,
	[Amount] [decimal](13, 2) NULL,
	[Discount] [decimal](13, 2) NULL,
	[TaxableValue] [decimal](13, 2) NULL,
	[CGST_Rate] [decimal](13, 2) NULL,
	[CGST_Amount] [decimal](13, 2) NULL,
	[SGST_Rate] [decimal](13, 2) NULL,
	[SGST_Amount] [decimal](13, 2) NULL,
	[IGST_Rate] [decimal](13, 2) NULL,
	[IGST_Amount] [decimal](13, 2) NULL,
	[Total] [decimal](13, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Thread] [varchar](255) NOT NULL,
	[Level] [varchar](50) NOT NULL,
	[Logger] [varchar](255) NOT NULL,
	[Message] [varchar](4000) NOT NULL,
	[Exception] [varchar](2000) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NotificationsDetails]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationsDetails](
	[NotificationsDetailsId] [bigint] IDENTITY(1,1) NOT NULL,
	[NotificationTypeId] [int] NOT NULL,
	[StaffInfoId] [bigint] NOT NULL,
	[NotificationDate] [datetime] NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[DocumentUrl] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[NotificationsDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NotificationType]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationType](
	[NotificationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[NotificationName] [nvarchar](255) NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[NotificationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[roles]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roles](
	[RoleId] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](200) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SchoolBasicInfo]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SchoolBasicInfo](
	[SchoolInfoId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[ContactNumber] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[KeyContactName] [varchar](255) NOT NULL,
	[KeyDesignation] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[SchoolUniqueId] [nvarchar](20) NOT NULL,
	[UpdateDate] [datetime] NULL DEFAULT (getdate()),
	[UpdatedEmail] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SchoolInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SchoolOtherInfo]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SchoolOtherInfo](
	[SchoolOtherInfoId] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolInfoId] [bigint] NOT NULL,
	[SchoolTypeIds] [nvarchar](20) NULL,
	[BoardTypeId] [int] NULL,
	[OtherContactName] [varchar](255) NULL,
	[OtherEmail] [nvarchar](255) NULL,
	[OtherContacNumber] [nvarchar](20) NULL,
	[Designation] [nvarchar](100) NULL,
	[Tagline] [varchar](200) NULL,
	[Notes] [varchar](max) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[Validity] [datetime] NOT NULL,
	[logo] [nvarchar](max) NULL,
	[AllowVideo] [bit] NULL DEFAULT ((0)),
	[AllowBranding] [bit] NULL DEFAULT ((0)),
	[AllowDocument] [bit] NULL DEFAULT ((0)),
	[UpdateDate] [datetime] NULL DEFAULT (getdate()),
	[UpdatedEmail] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SchoolOtherInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SchoolUserMapping]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolUserMapping](
	[MappingId] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolInfoId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StaffClasses]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffClasses](
	[StaffClassesId] [bigint] IDENTITY(1,1) NOT NULL,
	[StaffInfoId] [bigint] NOT NULL,
	[ClassId] [bigint] NOT NULL,
	[UpdateDate] [datetime] NULL,
	[UpdatedEmail] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffClassesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StaffDocument]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StaffDocument](
	[StaffDocumentId] [bigint] IDENTITY(1,1) NOT NULL,
	[StaffInfoId] [bigint] NOT NULL,
	[DocumentName] [nvarchar](100) NOT NULL,
	[DocumentCode] [nvarchar](100) NOT NULL,
	[ManualVerification] [bit] NOT NULL,
	[DocURL] [nvarchar](max) NOT NULL,
	[VerifiedBy] [varchar](100) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdatedEmail] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffDocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StaffExperience]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StaffExperience](
	[StaffExperienceId] [bigint] IDENTITY(1,1) NOT NULL,
	[StaffInfoId] [bigint] NOT NULL,
	[FromDate] [date] NOT NULL,
	[ToDate] [date] NOT NULL,
	[ExperienceTypeId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Details] [varchar](max) NOT NULL,
	[UpdateDate] [datetime] NULL,
	[UpdatedEmail] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffExperienceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StaffInfo]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StaffInfo](
	[StaffInfoId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[SchoolInfoId] [bigint] NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[MobileNumber] [nvarchar](20) NOT NULL,
	[StaffTypeId] [int] NOT NULL,
	[Address] [nvarchar](2000) NOT NULL,
	[StaffSubTypeId] [int] NULL,
	[OtherInfo] [nvarchar](2000) NULL,
	[MarriedStatus] [bit] NOT NULL,
	[Gender] [char](1) NOT NULL,
	[Dob] [date] NULL,
	[DateOfJoining] [date] NULL,
	[DateOfLeaving] [date] NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[IsAppSignUp] [bit] NOT NULL DEFAULT ((0)),
	[UpdateDate] [datetime] NULL DEFAULT (getdate()),
	[UpdatedEmail] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StaffOtherInfo]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StaffOtherInfo](
	[StaffOtherInfoId] [bigint] IDENTITY(1,1) NOT NULL,
	[StaffInfoId] [bigint] NOT NULL,
	[HighEducation] [varchar](100) NOT NULL,
	[DegreeIds] [nvarchar](255) NOT NULL,
	[DegreeSepecialization] [nvarchar](255) NOT NULL,
	[SubjectIds] [nvarchar](20) NOT NULL,
	[Skills] [varchar](2000) NULL,
	[Awards] [varchar](2000) NULL,
	[Hobbies] [nvarchar](2000) NULL,
	[UpdateDate] [datetime] NULL,
	[UpdatedEmail] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffOtherInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolInfoId] [bigint] NOT NULL,
	[StudentUniqueId] [nvarchar](20) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[DOB] [date] NOT NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[AadharNumber] [nvarchar](15) NULL,
	[ClassId] [bigint] NULL,
	[AppCode] [nvarchar](15) NULL,
	[UpdateDate] [datetime] NULL DEFAULT (getdate()),
	[UpdatedEmail] [nvarchar](255) NULL,
	[AppCodeCreatedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentActivityMapping]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentActivityMapping](
	[ActivitiesMappingId] [bigint] IDENTITY(1,1) NOT NULL,
	[ActivityDetailsId] [bigint] NOT NULL,
	[IsStudentLevel] [bit] NOT NULL DEFAULT ((0)),
	[IsClassLevel] [bit] NOT NULL DEFAULT ((0)),
	[IsSchoolLevel] [bit] NOT NULL DEFAULT ((0)),
	[StudentId] [bigint] NOT NULL,
	[ClassId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivitiesMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentCheckin]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCheckin](
	[CheckInId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[StudentId] [bigint] NOT NULL,
	[ClassId] [bigint] NOT NULL,
	[IsPresent] [bit] NOT NULL,
	[CheckInDate] [datetime] NOT NULL DEFAULT (getdate()),
	[UpdateDate] [datetime] NOT NULL DEFAULT (getdate()),
	[UpdatedEmail] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CheckInId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentNotificationsMapping]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentNotificationsMapping](
	[NotificationsMappingId] [bigint] IDENTITY(1,1) NOT NULL,
	[NotificationsDetailsId] [bigint] NOT NULL,
	[IsStudentLevel] [bit] NOT NULL DEFAULT ((0)),
	[IsClassLevel] [bit] NOT NULL DEFAULT ((0)),
	[IsSchoolLevel] [bit] NOT NULL DEFAULT ((0)),
	[StudentId] [bigint] NOT NULL,
	[ClassId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationsMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentParent]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentParent](
	[StudentParentId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[StudentId] [bigint] NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[MobileNumber] [nvarchar](20) NOT NULL,
	[ContactNumber] [nvarchar](20) NULL,
	[IsActive] [bit] NOT NULL DEFAULT ((1)),
	[IsAppSignUp] [bit] NOT NULL DEFAULT ((0)),
	[UpdateDate] [datetime] NULL DEFAULT (getdate()),
	[UpdatedEmail] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[test]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[SchoolOtherInfoId] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolInfoId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SchoolOtherInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 27-05-2018 18:14:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[FirstName] [varchar](255) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[ContactNumber] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ActivityDetails] ON 

INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (1, 1, N'', N'', 1, CAST(N'2018-04-28 11:51:02.607' AS DateTime), N'test from swagger', N'428a0e47-863a-43dd-aca3-c29445b9feca.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (2, 0, N'3|4|5', N'', 8, CAST(N'2018-05-13 12:09:00.000' AS DateTime), NULL, N'b3440874-adfe-4e5c-a366-73ddc9c1f8a7.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (3, 0, N'20|21', N'7|10', 8, CAST(N'2018-05-13 12:14:00.000' AS DateTime), N'Notes ', N'02f87d7f-376f-4052-bef4-a5dcd468f3a2.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (4, 0, N'', N'', 8, CAST(N'2018-05-13 12:17:00.000' AS DateTime), NULL, N'45ef52b6-73d2-4dcd-9e86-27c0ab2a724e.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (5, 0, N'20|21', N'7|10', 8, CAST(N'2018-05-13 12:20:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (6, 0, N'3|5', N'', 8, CAST(N'2018-05-13 12:34:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (7, 0, N'', N'', 8, CAST(N'2018-05-13 13:27:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (8, 0, N'14|15|17', N'', 8, CAST(N'2018-05-13 13:27:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (9, 0, N'14|15|16|17', N'', 8, CAST(N'2018-05-13 13:27:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (10, 0, N'19', N'', 8, CAST(N'2018-05-13 13:46:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (11, 0, N'', N'', 8, CAST(N'2018-05-13 13:50:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (12, 0, N'20', N'9', 8, CAST(N'2018-05-13 13:54:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (13, 0, N'18', N'', 8, CAST(N'2018-05-13 13:54:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (14, 0, N'15', N'', 8, CAST(N'2018-05-13 13:54:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (15, 0, N'', N'', 8, CAST(N'2018-05-13 13:55:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (16, 0, N'', N'', 8, CAST(N'2018-05-13 13:55:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (17, 0, N'', N'', 8, CAST(N'2018-05-13 14:46:00.000' AS DateTime), N'Test from andriod', N'd7989398-06e8-40f5-84f2-df5b6c74c1ad.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (18, 0, N'20|21', N'8|10', 8, CAST(N'2018-05-13 14:47:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (19, 0, N'14|17', N'', 8, CAST(N'2018-05-13 14:48:00.000' AS DateTime), N'Test notes from Android', NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (20, 0, N'18', N'', 8, CAST(N'2018-05-13 13:08:00.000' AS DateTime), N'Test from andriod nap', NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (21, 0, N'3|7|9', N'', 8, CAST(N'2018-05-13 14:51:00.000' AS DateTime), NULL, N'dafbd55b-0544-4acd-bded-3af3cfdd2055.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (22, 0, N'1', N'2', 8, CAST(N'2018-05-13 14:52:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (23, 0, N'2', N'5', 8, CAST(N'2018-05-13 15:04:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (24, 0, N'5', N'', 8, CAST(N'2018-05-13 18:46:00.000' AS DateTime), NULL, N'2b5430d5-449d-4f7f-bd4a-726024144f75.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (25, 0, N'3', N'', 8, CAST(N'2018-05-14 10:04:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (26, 0, N'', N'', 8, CAST(N'2018-05-14 10:08:00.000' AS DateTime), NULL, N'8b4fa84a-7eef-45d9-9c12-0d72ba89d0c1.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (27, 0, N'5|7|8|9', N'', 8, CAST(N'2018-05-14 10:33:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (28, 0, N'19', N'', 8, CAST(N'2018-05-14 10:43:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (29, 0, N'5|6|7|9', N'', 8, CAST(N'2018-05-14 11:17:00.000' AS DateTime), NULL, N'fbead26f-53ba-4c7d-b1dd-813e221b2538.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (30, 0, N'1|2', N'3|5', 8, CAST(N'2018-05-14 11:19:00.000' AS DateTime), N'Hxhccbcnckflh', N'53d06b99-815f-4076-8b18-2945163d0543.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (31, 0, N'5|6|8|10', N'', 8, CAST(N'2018-05-14 12:10:00.000' AS DateTime), N'Htrhbbfbg', N'48551052-b542-48d6-9568-379232d9ed73.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (32, 0, N'11', N'', 8, CAST(N'2018-05-15 17:06:00.000' AS DateTime), NULL, N'b5175ff8-31a8-4488-bf7d-bd424b43e9b3.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (33, 0, N'9', N'', 8, CAST(N'2018-05-15 20:04:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (34, 0, N'3|4|5|7|8|11', N'', 8, CAST(N'2018-05-16 12:56:00.000' AS DateTime), N'Gfghh gghfhjhh', N'456e17ec-6a23-40b2-bde9-e082c90432ff.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (35, 0, N'1|2', N'1|4', 8, CAST(N'2018-05-19 10:40:00.000' AS DateTime), NULL, N'd2b770ac-2ef4-406e-bce5-c510e893a00f.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (36, 0, N'6|13', N'', 8, CAST(N'2018-05-19 10:41:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (37, 0, N'18', N'', 8, CAST(N'2018-05-19 10:41:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (38, 0, N'', N'', 8, CAST(N'2018-05-19 13:30:00.000' AS DateTime), NULL, N'705b6423-ade3-4336-8878-9b48dd7abd81.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (39, 0, N'', N'', 8, CAST(N'2018-05-19 13:30:00.000' AS DateTime), NULL, N'5b720110-c682-45a7-8f96-2a9784b30503.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (40, 0, N'1|2', N'3|4', 8, CAST(N'2018-05-19 14:10:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (41, 0, N'21', N'10', 8, CAST(N'2018-05-19 15:32:00.000' AS DateTime), N'Cvcv', NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (42, 0, N'1', N'3', 8, CAST(N'2018-05-19 15:23:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (43, 0, N'1|2', N'2|5', 8, CAST(N'2018-05-19 16:14:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (44, 0, N'2', N'5', 8, CAST(N'2018-05-19 16:33:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (45, 0, N'5|7|10', N'', 8, CAST(N'2018-05-19 16:34:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (46, 0, N'20', N'9', 8, CAST(N'2018-05-19 16:35:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (47, 0, N'7|9', N'', 8, CAST(N'2018-05-19 16:37:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (48, 0, N'11', N'', 8, CAST(N'2018-05-19 16:38:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (49, 0, N'20', N'8', 8, CAST(N'2018-05-19 17:57:00.000' AS DateTime), NULL, N'be8574db-03bd-40ba-b1ce-3ac4a65f256e.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (50, 0, N'', N'', 8, CAST(N'2018-05-19 18:43:00.000' AS DateTime), NULL, N'529dd78c-c505-41dc-b7ff-07c9403d6845.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (51, 0, N'9', N'', 8, CAST(N'2018-05-19 19:52:00.000' AS DateTime), NULL, N'923cf485-5357-467b-8460-8c9915ae0a79.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (52, 0, N'20|21', N'7|10', 8, CAST(N'2018-05-19 20:07:00.000' AS DateTime), NULL, N'98e02990-88b8-4c79-80f0-475ff8edee4d.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (53, 0, N'', N'', 8, CAST(N'2018-05-19 22:28:00.000' AS DateTime), NULL, N'0aae70b0-d0de-4aff-bbb9-a67d2d983b56.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (54, 0, N'', N'', 8, CAST(N'2018-05-20 10:39:00.000' AS DateTime), NULL, N'1ea1d41a-2e6b-40cf-9784-85f2a6104b9e.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (55, 0, N'4|5|6|7|8', N'', 8, CAST(N'2018-05-20 14:03:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (56, 2, N'1', N'1', 8, CAST(N'2018-05-20 14:17:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (57, 2, N'1|2', N'1|6', 8, CAST(N'2018-05-20 14:17:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (58, 2, N'1|2', N'2|5', 8, CAST(N'2018-05-20 14:18:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (59, 2, N'1', N'1', 8, CAST(N'2018-05-20 14:18:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (60, 3, N'3', N'', 8, CAST(N'2018-05-20 14:18:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (61, 3, N'3|13', N'', 8, CAST(N'2018-05-20 14:19:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (62, 3, N'7', N'', 8, CAST(N'2018-05-20 14:21:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (63, 1, N'', N'', 8, CAST(N'2018-05-20 14:40:00.000' AS DateTime), NULL, N'2611f2a1-a74f-4915-9429-6e11ffb9634e.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (64, 1, N'', N'', 8, CAST(N'2018-05-20 14:45:00.000' AS DateTime), NULL, N'ac86d8f6-50c6-48cf-ab19-1b17aedbbd24.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (65, 1, N'', N'', 8, CAST(N'2018-05-20 14:46:00.000' AS DateTime), NULL, N'ed8872cb-8c54-49b5-9342-76c36eacbd13.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (66, 2, N'1|2', N'1|4', 8, CAST(N'2018-05-20 14:48:00.000' AS DateTime), NULL, N'a638d524-5997-44cb-9175-d694befd0b27.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (67, 3, N'3|4|5|6|7|8|9', N'', 8, CAST(N'2018-05-20 14:49:00.000' AS DateTime), NULL, N'f6f5606f-b8ba-40c4-a916-eb2cd1b9c03c.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (68, 3, N'6', N'', 8, CAST(N'2018-05-20 14:56:00.000' AS DateTime), NULL, N'1c8e2b8b-7f3a-47c1-bff0-d1c0fac58368.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (69, 1, N'', N'', 8, CAST(N'2018-05-20 15:21:00.000' AS DateTime), NULL, N'f00df150-7a33-4e62-8dcc-2f48d2b714d0.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (70, 1, N'', N'', 8, CAST(N'2018-05-20 15:26:00.000' AS DateTime), NULL, N'beed048e-44b6-4426-8c50-d7fc6969aaef.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (71, 6, N'20|21', N'7|10', 8, CAST(N'2018-05-20 15:27:00.000' AS DateTime), NULL, N'86e4fe0b-0615-44b0-95b3-f5cac02569bb.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (72, 1, N'', N'', 8, CAST(N'2018-05-21 10:46:00.000' AS DateTime), NULL, N'ce7c555b-6850-4635-9a9b-03f57cb0fc51.jpeg', 1)
INSERT [dbo].[ActivityDetails] ([ActivityDetailsId], [ActivityTypeId], [ActivitySubTypeIds], [ActivitySubTypeChildIds], [StaffId], [ActivityDateTime], [Notes], [ImageURL], [IsActive]) VALUES (73, 1, N'', N'', 8, CAST(N'2018-05-21 16:45:00.000' AS DateTime), NULL, N'b13a10e2-0109-4f55-8e37-c4444a54bc1c.jpeg', 1)
SET IDENTITY_INSERT [dbo].[ActivityDetails] OFF
SET IDENTITY_INSERT [dbo].[ActivitySubType] ON 

INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (1, 2, N'Solid')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (2, 2, N'Liquid')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (3, 3, N'Language')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (4, 3, N'Drawing')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (5, 3, N'Play')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (6, 3, N'Arts')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (7, 3, N'Science')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (8, 3, N'History')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (9, 3, N'Hindi')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (10, 3, N'Social Science')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (11, 3, N'GK')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (12, 3, N'Computer')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (13, 3, N'English')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (14, 4, N'Well Done')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (15, 4, N'Observation')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (16, 4, N'Attention')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (17, 4, N'Other')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (18, 5, N'Start')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (19, 5, N'End')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (20, 6, N'Potty')
INSERT [dbo].[ActivitySubType] ([ActivitySubTypeId], [ActivityTypeId], [Name]) VALUES (21, 6, N'Diaper')
SET IDENTITY_INSERT [dbo].[ActivitySubType] OFF
SET IDENTITY_INSERT [dbo].[ActivitySubTypeChild] ON 

INSERT [dbo].[ActivitySubTypeChild] ([ActivitySubTypeChildId], [ActivitySubTypeId], [Name]) VALUES (1, 1, N'All')
INSERT [dbo].[ActivitySubTypeChild] ([ActivitySubTypeChildId], [ActivitySubTypeId], [Name]) VALUES (2, 1, N'Some')
INSERT [dbo].[ActivitySubTypeChild] ([ActivitySubTypeChildId], [ActivitySubTypeId], [Name]) VALUES (3, 1, N'None')
INSERT [dbo].[ActivitySubTypeChild] ([ActivitySubTypeChildId], [ActivitySubTypeId], [Name]) VALUES (4, 2, N'All')
INSERT [dbo].[ActivitySubTypeChild] ([ActivitySubTypeChildId], [ActivitySubTypeId], [Name]) VALUES (5, 2, N'Some')
INSERT [dbo].[ActivitySubTypeChild] ([ActivitySubTypeChildId], [ActivitySubTypeId], [Name]) VALUES (6, 2, N'None')
INSERT [dbo].[ActivitySubTypeChild] ([ActivitySubTypeChildId], [ActivitySubTypeId], [Name]) VALUES (7, 20, N'Normal')
INSERT [dbo].[ActivitySubTypeChild] ([ActivitySubTypeChildId], [ActivitySubTypeId], [Name]) VALUES (8, 20, N'Dry')
INSERT [dbo].[ActivitySubTypeChild] ([ActivitySubTypeChildId], [ActivitySubTypeId], [Name]) VALUES (9, 20, N'Wet')
INSERT [dbo].[ActivitySubTypeChild] ([ActivitySubTypeChildId], [ActivitySubTypeId], [Name]) VALUES (10, 21, N'Diaper Changed')
SET IDENTITY_INSERT [dbo].[ActivitySubTypeChild] OFF
SET IDENTITY_INSERT [dbo].[ActivityType] ON 

INSERT [dbo].[ActivityType] ([ActivityTypeId], [ActivityName], [IsActive]) VALUES (1, N'Photo', 1)
INSERT [dbo].[ActivityType] ([ActivityTypeId], [ActivityName], [IsActive]) VALUES (2, N'Food', 1)
INSERT [dbo].[ActivityType] ([ActivityTypeId], [ActivityName], [IsActive]) VALUES (3, N'Learning', 1)
INSERT [dbo].[ActivityType] ([ActivityTypeId], [ActivityName], [IsActive]) VALUES (4, N'Notes', 1)
INSERT [dbo].[ActivityType] ([ActivityTypeId], [ActivityName], [IsActive]) VALUES (5, N'Nap', 1)
INSERT [dbo].[ActivityType] ([ActivityTypeId], [ActivityName], [IsActive]) VALUES (6, N'Potty', 1)
SET IDENTITY_INSERT [dbo].[ActivityType] OFF
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminId], [Name], [UserName], [Email], [Password], [RoleId], [IsActive], [CreatedDate]) VALUES (1, N'Ganesh', N'Ganesh', N'rahultanwar706@gmail.com', N'FwM4gZV5f8Hu+Vdx3SseeQ==', 1, 1, CAST(N'2017-08-20 16:53:21.563' AS DateTime))
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (1, 1, N'Nursery', 1, CAST(N'2018-04-10 11:54:49.827' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (2, 1, N'LKG', 1, CAST(N'2018-04-10 11:55:39.247' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (3, 1, N'Pre HKG', 1, CAST(N'2018-04-10 11:55:39.247' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (4, 1, N'HKG', 1, CAST(N'2018-04-10 11:55:39.247' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (5, 1, N'First', 1, CAST(N'2018-04-15 04:25:37.273' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (6, 1, N'Second', 1, CAST(N'2018-04-21 04:16:17.713' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (7, 1, N'Third', 1, CAST(N'2018-04-21 07:52:01.503' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (8, 1, N'Fourth', 1, CAST(N'2018-04-21 07:57:19.200' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (9, 1, N'seventh', 1, CAST(N'2018-04-21 07:58:04.170' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (10, 1, N'ninth', 1, CAST(N'2018-04-21 21:39:24.720' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (11, 1, N'tenth', 1, CAST(N'2018-04-21 21:41:54.773' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (12, 1, N'eleventh', 1, CAST(N'2018-04-21 21:59:31.607' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (13, 1, N'12', 1, CAST(N'2018-04-21 22:10:16.540' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (14, 1, N'13', 1, CAST(N'2018-04-21 22:26:41.433' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (15, 1, N'Class X', 1, CAST(N'2018-04-29 06:11:16.130' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (16, 3, N'First', 1, CAST(N'2018-05-01 06:41:06.133' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (17, 7, N'First', 1, CAST(N'2018-05-01 06:48:20.680' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (18, 2, N'Nursery', 1, CAST(N'2018-05-01 08:24:42.507' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (19, 2, N'LKG', 1, CAST(N'2018-05-01 08:24:58.537' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (20, 2, N'HKG', 1, CAST(N'2018-05-01 08:25:04.507' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (21, 16, N'test', 1, CAST(N'2018-05-19 01:48:17.513' AS DateTime), NULL)
INSERT [dbo].[Class] ([ClassId], [SchoolInfoId], [ClassName], [IsActive], [UpdateDate], [UpdatedEmail]) VALUES (22, 1, N'test', 1, CAST(N'2018-05-19 02:27:46.080' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Class] OFF
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (2, N'2', CAST(N'2017-12-09 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2017-12-09 00:00:00.000' AS DateTime), CAST(N'2017-12-09 21:12:48.000' AS DateTime), N'Wagheshwar Paint House', N'27AODPJ1125J1Z7', NULL, N'Near Kaveri Hotel and soyrik mangal karyalaya, old bhadle wasti, wagholi - 412207', N'Near Kaveri Hotel and soyrik mangal karyalaya, old bhadle wasti, wagholi - 412207', CAST(10.00 AS Decimal(13, 2)), CAST(400.00 AS Decimal(13, 2)), CAST(5703.10 AS Decimal(13, 2)), CAST(798.43 AS Decimal(13, 2)), CAST(798.43 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(1596.87 AS Decimal(13, 2)), CAST(7299.97 AS Decimal(13, 2)), CAST(7300.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (3, N'3', CAST(N'2017-12-20 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2017-12-20 00:00:00.000' AS DateTime), CAST(N'2017-12-20 10:12:28.000' AS DateTime), N'Wagheshwar paint House', N'27AODPJ1125J1Z7', NULL, N'Near Kaveri Hotel, Old Bhadle wasti, Wagholi-412207', N'Near Kaveri Hotel, Old Bhadle wasti, Wagholi-412207', CAST(25.00 AS Decimal(13, 2)), CAST(1000.00 AS Decimal(13, 2)), CAST(14257.75 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(3992.17 AS Decimal(13, 2)), CAST(18249.92 AS Decimal(13, 2)), CAST(18250.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (4, N'4', CAST(N'2017-12-11 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2017-12-11 00:00:00.000' AS DateTime), CAST(N'2017-12-11 11:12:31.000' AS DateTime), N'Wagheshwar Paint House', N'27AODPJ1125J1Z7', NULL, N'Near Kaveri Hotel, Old Bhadle wasti, Wagholi-412207', N'Near Kaveri Hotel, Old Bhadle wasti, Wagholi-412207', CAST(30.00 AS Decimal(13, 2)), CAST(1200.00 AS Decimal(13, 2)), CAST(17109.30 AS Decimal(13, 2)), CAST(2395.30 AS Decimal(13, 2)), CAST(2395.30 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(4790.60 AS Decimal(13, 2)), CAST(21899.90 AS Decimal(13, 2)), CAST(21900.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (5, N'5', CAST(N'2017-12-27 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2017-12-27 00:00:00.000' AS DateTime), CAST(N'2017-12-27 19:12:23.000' AS DateTime), N'Wagheshwar Paint House', N'27AODPJ1125J1Z7', NULL, N'Near Kaveri Hotel, Old Bhadle wasti, Wagholi-412207', N'Near Kaveri Hotel, Old Bhadle wasti, Wagholi-412207', CAST(25.00 AS Decimal(13, 2)), CAST(1000.00 AS Decimal(13, 2)), CAST(14257.75 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(3992.17 AS Decimal(13, 2)), CAST(18249.92 AS Decimal(13, 2)), CAST(18250.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (6, N'6', CAST(N'2018-01-08 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-01-08 00:00:00.000' AS DateTime), CAST(N'2018-01-08 11:01:57.000' AS DateTime), N'Wagheshwar Paint House', N'27AODPJ1125J1Z7', NULL, N'Near Kaveri Hotel, Old Bhadale Wasti, Wagholi-412207', N'Near Kaveri Hotel, Old Bhadale Wasti, Wagholi-412207', CAST(25.00 AS Decimal(13, 2)), CAST(1000.00 AS Decimal(13, 2)), CAST(14257.75 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(3992.17 AS Decimal(13, 2)), CAST(18249.92 AS Decimal(13, 2)), CAST(18250.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (7, N'7', CAST(N'2018-01-11 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-01-11 00:00:00.000' AS DateTime), CAST(N'2018-01-11 14:01:33.000' AS DateTime), N'Wagheshwar Paint House', N'27AODPJ1125J1Z7', NULL, N'Near Kaveri Hotel, Old Bhadale Wasti, Wagholi-412207', N'Near Kaveri Hotel, Old Bhadale Wasti, Wagholi-412207', CAST(25.00 AS Decimal(13, 2)), CAST(1000.00 AS Decimal(13, 2)), CAST(14257.75 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(3992.17 AS Decimal(13, 2)), CAST(18249.92 AS Decimal(13, 2)), CAST(18250.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (8, N'8', CAST(N'2018-01-14 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-01-14 00:00:00.000' AS DateTime), CAST(N'2018-01-14 14:01:02.000' AS DateTime), N'S D ENTERPRISES', N'27AEJPC1890B1ZU', NULL, N'Manisha Driving school, shop no 7, Sai capital, Opp Tukai Darshan Kaman, Saswad Road, Hadapsar, Pune-411028', N'Marvel Ideal Spacio, Undri, Pune', CAST(30.00 AS Decimal(13, 2)), CAST(1200.00 AS Decimal(13, 2)), CAST(18281.40 AS Decimal(13, 2)), CAST(2559.40 AS Decimal(13, 2)), CAST(2559.40 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(5118.79 AS Decimal(13, 2)), CAST(23400.19 AS Decimal(13, 2)), CAST(23400.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (9, N'9', CAST(N'2018-01-16 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-01-16 00:00:00.000' AS DateTime), CAST(N'2018-01-16 14:01:40.000' AS DateTime), N'S D ENTERPRISES ', N'27AEJPC1890B1ZU', NULL, N'Manisha Driving school, shop no 7, Sai capital, Opp Tukai Darshan Kaman, Saswad Road, Hadapsar, Pune-411028', N'Marvel Ideal Spacio, Undri Pune', CAST(50.00 AS Decimal(13, 2)), CAST(2000.00 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(8531.32 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)), CAST(39000.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (10, N'10', CAST(N'2018-01-17 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-01-17 00:00:00.000' AS DateTime), CAST(N'2018-01-17 16:01:28.000' AS DateTime), N'WAGHESHWAR PAINT HOUSE', N'27AODPJ1125J1Z7', NULL, N'Near Kaveri hotel, Old Bhadale Wasti, Wagholi 412207', N'Near Kaveri hotel, Old Bhadale Wasti, Wagholi 412207', CAST(25.00 AS Decimal(13, 2)), CAST(1000.00 AS Decimal(13, 2)), CAST(14257.75 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(3992.17 AS Decimal(13, 2)), CAST(18249.92 AS Decimal(13, 2)), CAST(18250.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (11, N'11', CAST(N'2018-01-20 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-01-20 00:00:00.000' AS DateTime), CAST(N'2018-01-20 17:01:44.000' AS DateTime), N'S D ENTERPRISES', N'27AEJPC1890B1ZU', NULL, N'Manisha Driving School, Shop no 7, Sai capital, opp Tukai Darshan kaman, Saswad Rd, Hadapsar pune-411028', N'Marvel Ideal Spacio, Undri, Pune', CAST(50.00 AS Decimal(13, 2)), CAST(2000.00 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(8531.32 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)), CAST(39000.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (12, N'12', CAST(N'2018-01-24 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-01-24 00:00:00.000' AS DateTime), CAST(N'2018-01-24 15:01:55.000' AS DateTime), N'S D ENTERPRISES ', N'27AEJPC1890B1ZU', NULL, N'Manisha Driving School, Shop no 7, Sai capital, opp Tukai Darshan kaman, Saswad Rd, Hadapsar pune-411028', N'Marvel Ideal Spacio, Undri, Pune', CAST(50.00 AS Decimal(13, 2)), CAST(2000.00 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(8531.32 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)), CAST(39000.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (13, N'13', CAST(N'2018-01-24 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-01-24 00:00:00.000' AS DateTime), CAST(N'2018-01-24 16:01:09.000' AS DateTime), N'SANNRAJ GROUP', N'27BTYPP8300A2ZG', NULL, N'P No. 7, S No. 63, Sai Nagar Lane No4, Santosh Nagar, Katraj, Pune 411046', N'Marvel Ideal Spacio, Undri, Pune', CAST(50.00 AS Decimal(13, 2)), CAST(2000.00 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(8531.32 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)), CAST(39000.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (14, N'14', CAST(N'2018-01-29 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-01-29 00:00:00.000' AS DateTime), CAST(N'2018-01-29 15:01:46.000' AS DateTime), N'TILE HUB', N'27EEIPS2381A1ZH', NULL, N'Near Hotel Free Bird, Pune Nagar Highway, Wagholi, Pune-412207', N'Near Hotel Free Bird, Pune Nagar Highway, Wagholi, Pune-412207', CAST(25.00 AS Decimal(13, 2)), CAST(500.00 AS Decimal(13, 2)), CAST(6356.25 AS Decimal(13, 2)), CAST(572.06 AS Decimal(13, 2)), CAST(572.06 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(1144.13 AS Decimal(13, 2)), CAST(7500.38 AS Decimal(13, 2)), CAST(7500.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (15, N'15', CAST(N'2018-02-07 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-02-07 00:00:00.000' AS DateTime), CAST(N'2018-02-07 12:02:03.000' AS DateTime), N'WAGHESHWAR PAINT HOUSE', N'27AODPJ1125J1Z7', NULL, N'Near Kaveri Hotel, Old Bhadale Wasti, Wagholi-412207', N'Near Kaveri Hotel, Old Bhadale Wasti, Wagholi-412207', CAST(25.00 AS Decimal(13, 2)), CAST(1000.00 AS Decimal(13, 2)), CAST(14257.75 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(3992.17 AS Decimal(13, 2)), CAST(18249.92 AS Decimal(13, 2)), CAST(18250.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (16, N'16', CAST(N'2018-02-07 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-02-07 00:00:00.000' AS DateTime), CAST(N'2018-02-07 14:02:00.000' AS DateTime), N'TILE HUB', N'27EEIPS2381A1ZH', NULL, N'Near Hotel Free Bird, Pune Nagar Highway, Wagholi, Pune-412207', N'Near Hotel Free Bird, Pune Nagar Highway, Wagholi, Pune-412207', CAST(3.00 AS Decimal(13, 2)), CAST(60.00 AS Decimal(13, 2)), CAST(762.75 AS Decimal(13, 2)), CAST(68.65 AS Decimal(13, 2)), CAST(68.65 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(137.29 AS Decimal(13, 2)), CAST(900.04 AS Decimal(13, 2)), CAST(900.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (17, N'17', CAST(N'2018-02-09 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-02-09 00:00:00.000' AS DateTime), CAST(N'2018-02-09 17:02:41.000' AS DateTime), N'S D ENTERPRISES', N'27AEJPC1890B1ZU', NULL, N'Manisha Motor Driving School, Shop No. 7, Sai Capital, Opp Tukai Darshan Kaman, Saswad Rd, Hadapsar, Pune-411028', N'Marvel Ideal Spacio, Undri, Pune', CAST(50.00 AS Decimal(13, 2)), CAST(2000.00 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(8531.32 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)), CAST(39000.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (18, N'18', CAST(N'2018-02-12 00:00:00.000' AS DateTime), NULL, NULL, N'MH 12 JF 4136', NULL, CAST(N'2018-02-12 00:00:00.000' AS DateTime), CAST(N'2018-02-12 14:02:53.000' AS DateTime), N'MANGALMURTI PAINTING CONTRACT COMPANY ', N'27BPFPS7838F1ZE', NULL, N'PUNE', N'MARVEL IDEAL SPACIO, UNDRI, PUNE', CAST(40.00 AS Decimal(13, 2)), CAST(1600.00 AS Decimal(13, 2)), CAST(24375.20 AS Decimal(13, 2)), CAST(3412.53 AS Decimal(13, 2)), CAST(3412.53 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(6825.06 AS Decimal(13, 2)), CAST(31200.26 AS Decimal(13, 2)), CAST(31200.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (19, N'19', CAST(N'2018-02-13 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-02-13 00:00:00.000' AS DateTime), CAST(N'2018-02-13 15:02:43.000' AS DateTime), N'WAGHESHWAR PAINT HOUSE', N'27AODPJ1125J1Z7', NULL, N'NEAR KAVERI HOTEL, OLD BHADALE WASTI, WAGHOLI-412207', N'NEAR KAVERI HOTEL, OLD BHADALE WASTI, WAGHOLI-412207', CAST(20.00 AS Decimal(13, 2)), CAST(800.00 AS Decimal(13, 2)), CAST(11406.20 AS Decimal(13, 2)), CAST(1596.87 AS Decimal(13, 2)), CAST(1596.87 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(3193.74 AS Decimal(13, 2)), CAST(14599.94 AS Decimal(13, 2)), CAST(14600.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (20, N'20', CAST(N'2018-02-23 00:00:00.000' AS DateTime), NULL, NULL, N'MH 12 JF 4136', NULL, CAST(N'2018-02-23 00:00:00.000' AS DateTime), CAST(N'2018-02-23 10:02:15.000' AS DateTime), N'S D ENTERPRISES', N'27AEJPC1890B1ZU', NULL, N'SHOP NO 7, SAI CAPITAL, SASWAD RD, HADAPSAR PUNE-411028', N'MARVEL IDEAL SPACIO, UNDRI, PUNE', CAST(50.00 AS Decimal(13, 2)), CAST(2000.00 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(8531.32 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)), CAST(39000.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (21, N'21', CAST(N'2018-02-26 00:00:00.000' AS DateTime), NULL, NULL, N'MH 12 JF 4136', NULL, CAST(N'2018-02-26 00:00:00.000' AS DateTime), CAST(N'2018-02-26 16:02:49.000' AS DateTime), N'MATAJI HARDWARE AND ELECTRICALS', N'27AIVPC0007C1ZS', NULL, N'SERIAL NO 43, SHOP NO 20 & 21, KHARADI BYPASS, CHANDAN NAGAR, PUNE ', N'SERIAL NO 43, SHOP NO 20 & 21, KHARADI BYPASS, CHANDAN NAGAR, PUNE ', CAST(15.00 AS Decimal(13, 2)), CAST(500.00 AS Decimal(13, 2)), CAST(7500.00 AS Decimal(13, 2)), CAST(1050.00 AS Decimal(13, 2)), CAST(1050.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(2100.00 AS Decimal(13, 2)), CAST(9600.00 AS Decimal(13, 2)), CAST(9600.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (22, N'22', CAST(N'2018-03-16 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-03-16 00:00:00.000' AS DateTime), CAST(N'2018-03-16 12:03:00.000' AS DateTime), N'MANGALMURTI PAINTING CONTRACT COMPANY', N'27BPFPS7838F1ZE', NULL, N'Pune', N'Marvel Ideal Spacio, undri', CAST(50.00 AS Decimal(13, 2)), CAST(2000.00 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(8531.32 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)), CAST(39000.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (23, N'23', CAST(N'2018-03-20 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-03-20 00:00:00.000' AS DateTime), CAST(N'2018-03-20 12:03:13.000' AS DateTime), N'S D ENTERPRISES', N'27AEJPC1890B1ZU', NULL, N'Manisha motor driving school, shop no 7. sai capital, saswad road, hadapsar, pune-411028', N'Marvel Ideal Spacio, Undri', CAST(50.00 AS Decimal(13, 2)), CAST(2000.00 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(8531.32 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)), CAST(39000.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (24, N'24', CAST(N'2018-03-21 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-03-21 00:00:00.000' AS DateTime), CAST(N'2018-03-21 12:03:05.000' AS DateTime), N'Sanjay Shirodkar', N'Not Applicable', NULL, N'Plot No. 11, Kubera Bahar Bungalow Society, Baner Pashan Link Road Pune', N'Plot No. 11, Kubera Bahar Bungalow Society, Baner Pashan Link Road Pune', CAST(8.00 AS Decimal(13, 2)), CAST(260.00 AS Decimal(13, 2)), CAST(3812.50 AS Decimal(13, 2)), CAST(533.75 AS Decimal(13, 2)), CAST(533.75 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(1067.50 AS Decimal(13, 2)), CAST(4880.00 AS Decimal(13, 2)), CAST(4880.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (25, N'25', CAST(N'2018-03-23 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-03-23 00:00:00.000' AS DateTime), CAST(N'2018-03-23 12:03:12.000' AS DateTime), N'SANNRAJ GROUP', N'27BTYPP8300A2ZG', NULL, N'P No. 7, S No 63, Sai Nagar, Lane No 4, Santosh Nagar, Katraj, Pune-411046', N'Marvel Ideal Spacio, Undri', CAST(50.00 AS Decimal(13, 2)), CAST(2000.00 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(8531.32 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)), CAST(39000.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (26, N'26', CAST(N'2018-04-04 00:00:00.000' AS DateTime), NULL, NULL, N'MH 12 JF 4032', NULL, CAST(N'2018-04-04 00:00:00.000' AS DateTime), CAST(N'2018-04-04 11:04:04.000' AS DateTime), N'Wagheshwar paint house', N'27AODPJ1125J1Z7', NULL, N'Near kaveri hotel, Old Bhadale wasti, Wagholi-412207 ', N'Near kaveri hotel, Old Bhadale wasti, Wagholi-412207 ', CAST(20.00 AS Decimal(13, 2)), CAST(800.00 AS Decimal(13, 2)), CAST(11406.20 AS Decimal(13, 2)), CAST(1596.87 AS Decimal(13, 2)), CAST(1596.87 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(3193.74 AS Decimal(13, 2)), CAST(14599.94 AS Decimal(13, 2)), CAST(14600.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (27, N'27', CAST(N'2018-04-28 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-04-28 00:00:00.000' AS DateTime), CAST(N'2018-04-28 11:04:15.000' AS DateTime), N'Sannraj Group', N'27BTYPP8300A2ZG', NULL, N'Santosh Nagar, Katraj, Pune 411046', N'Marvel ideal spacio, Undri Pune', CAST(55.00 AS Decimal(13, 2)), CAST(2000.00 AS Decimal(13, 2)), CAST(30468.90 AS Decimal(13, 2)), CAST(4265.65 AS Decimal(13, 2)), CAST(4265.65 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(8531.29 AS Decimal(13, 2)), CAST(39000.19 AS Decimal(13, 2)), CAST(39000.00 AS Decimal(13, 2)))
INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceNumber], [InvoiceDate], [PO_No], [TransportationMode], [Veh_No], [LR_No], [LR_Date], [DateTimeSupply], [CustomerName], [GST_No], [PAN_No], [CompanyAddress], [ShippingAddress], [Total_Nos_Bag], [Total_Nos_Kg], [TotalAmountBeforeTax], [Total_CGST], [Total_SGST], [Total_IGST], [Total_GST], [TotalAmountAfterTax], [TotalAfterRoundOff]) VALUES (28, N'28', CAST(N'2018-05-03 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, CAST(N'2018-05-03 00:00:00.000' AS DateTime), CAST(N'2018-05-03 12:05:39.000' AS DateTime), N'S D ENTERPRISES ', N'27AEJPC1890B1ZU', NULL, N'Manisha Driving School, Shop no 7, Sai capital, Opp Tukai Darshan kaman, Saswad Road, Hadapsar, Pune-411028', N'Marvel Ideal Spacio, Undri, Pune', CAST(100.00 AS Decimal(13, 2)), CAST(2000.00 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(8531.32 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)), CAST(39000.00 AS Decimal(13, 2)))
SET IDENTITY_INSERT [dbo].[Invoice] OFF
SET IDENTITY_INSERT [dbo].[InvoiceLine] ON 

INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (2, 2, N'Homesure wallputty (HSN: 32141000)', CAST(10.00 AS Decimal(13, 2)), N'40', CAST(600.00 AS Decimal(13, 2)), CAST(6000.00 AS Decimal(13, 2)), CAST(29.69 AS Decimal(13, 2)), CAST(5703.10 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(798.43 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(798.43 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(7299.97 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (3, 3, N'Homesure Wallputty (HSN;32141000)', CAST(25.00 AS Decimal(13, 2)), N'40', CAST(600.00 AS Decimal(13, 2)), CAST(15000.00 AS Decimal(13, 2)), CAST(29.69 AS Decimal(13, 2)), CAST(14257.75 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(18249.92 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (4, 4, N'Homesure Wallputty (HSN:32141000)', CAST(30.00 AS Decimal(13, 2)), N'40', CAST(600.00 AS Decimal(13, 2)), CAST(18000.00 AS Decimal(13, 2)), CAST(29.69 AS Decimal(13, 2)), CAST(17109.30 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(2395.30 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(2395.30 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(21899.90 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (5, 5, N'Homesure Wallputty (HSN:32141000)', CAST(25.00 AS Decimal(13, 2)), N'40', CAST(600.00 AS Decimal(13, 2)), CAST(15000.00 AS Decimal(13, 2)), CAST(29.69 AS Decimal(13, 2)), CAST(14257.75 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(18249.92 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (6, 6, N'Homesure Wallputty (HSN:32141000)', CAST(25.00 AS Decimal(13, 2)), N'40', CAST(600.00 AS Decimal(13, 2)), CAST(15000.00 AS Decimal(13, 2)), CAST(29.69 AS Decimal(13, 2)), CAST(14257.75 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(18249.92 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (7, 7, N'Homesure Wallputty (HSN:32141000)', CAST(25.00 AS Decimal(13, 2)), N'40', CAST(600.00 AS Decimal(13, 2)), CAST(15000.00 AS Decimal(13, 2)), CAST(29.69 AS Decimal(13, 2)), CAST(14257.75 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(18249.92 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (8, 8, N'Homesure Wallputty (HSN32141000)', CAST(30.00 AS Decimal(13, 2)), N'40', CAST(610.00 AS Decimal(13, 2)), CAST(18300.00 AS Decimal(13, 2)), CAST(0.62 AS Decimal(13, 2)), CAST(18281.40 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(2559.40 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(2559.40 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(23400.19 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (9, 9, N'Homesure Wallputty', CAST(50.00 AS Decimal(13, 2)), N'40', CAST(610.00 AS Decimal(13, 2)), CAST(30500.00 AS Decimal(13, 2)), CAST(0.62 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (10, 10, N'Homesure Wallputty (HSN:32141000)', CAST(25.00 AS Decimal(13, 2)), N'40', CAST(600.00 AS Decimal(13, 2)), CAST(15000.00 AS Decimal(13, 2)), CAST(29.69 AS Decimal(13, 2)), CAST(14257.75 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(18249.92 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (11, 11, N'Homesure Wallputty(HSN:32141000)', CAST(50.00 AS Decimal(13, 2)), N'40', CAST(610.00 AS Decimal(13, 2)), CAST(30500.00 AS Decimal(13, 2)), CAST(0.62 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (12, 12, N'Homesure Wallputty(HSN:32141000)', CAST(50.00 AS Decimal(13, 2)), N'40', CAST(610.00 AS Decimal(13, 2)), CAST(30500.00 AS Decimal(13, 2)), CAST(0.62 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (13, 13, N'Homesure Wallputty(HSN:32141000)', CAST(50.00 AS Decimal(13, 2)), N'40', CAST(610.00 AS Decimal(13, 2)), CAST(30500.00 AS Decimal(13, 2)), CAST(0.62 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (14, 14, N'Homesure Tile adhesive Silver Star(HSN:38245090)', CAST(25.00 AS Decimal(13, 2)), N'20', CAST(254.25 AS Decimal(13, 2)), CAST(6356.25 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(6356.25 AS Decimal(13, 2)), CAST(9.00 AS Decimal(13, 2)), CAST(572.06 AS Decimal(13, 2)), CAST(9.00 AS Decimal(13, 2)), CAST(572.06 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(7500.38 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (15, 15, N'Homesure Wallputty(HSN;32141000)', CAST(25.00 AS Decimal(13, 2)), N'40', CAST(600.00 AS Decimal(13, 2)), CAST(15000.00 AS Decimal(13, 2)), CAST(29.69 AS Decimal(13, 2)), CAST(14257.75 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(1996.09 AS Decimal(13, 2)), NULL, NULL, CAST(18249.92 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (16, 16, N'Homesure Tile Adhesive Silver Star(HSN:38245090)', CAST(3.00 AS Decimal(13, 2)), N'20', CAST(254.25 AS Decimal(13, 2)), CAST(762.75 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(762.75 AS Decimal(13, 2)), CAST(9.00 AS Decimal(13, 2)), CAST(68.65 AS Decimal(13, 2)), CAST(9.00 AS Decimal(13, 2)), CAST(68.65 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(900.04 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (17, 17, N'Homesure Wallputty (HSN:32141000)', CAST(50.00 AS Decimal(13, 2)), N'40', CAST(610.00 AS Decimal(13, 2)), CAST(30500.00 AS Decimal(13, 2)), CAST(0.62 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (18, 18, N'Homesure Wallputty', CAST(40.00 AS Decimal(13, 2)), N'40', CAST(610.00 AS Decimal(13, 2)), CAST(24400.00 AS Decimal(13, 2)), CAST(0.62 AS Decimal(13, 2)), CAST(24375.20 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(3412.53 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(3412.53 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(31200.26 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (19, 19, N'Homesure Wallputty', CAST(20.00 AS Decimal(13, 2)), N'40', CAST(600.00 AS Decimal(13, 2)), CAST(12000.00 AS Decimal(13, 2)), CAST(29.69 AS Decimal(13, 2)), CAST(11406.20 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(1596.87 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(1596.87 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(14599.94 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (20, 20, N'Homesure Wallputty', CAST(50.00 AS Decimal(13, 2)), N'40', CAST(610.00 AS Decimal(13, 2)), CAST(30500.00 AS Decimal(13, 2)), CAST(0.62 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (21, 21, N'Homesure Wallputty', CAST(10.00 AS Decimal(13, 2)), N'40', CAST(579.00 AS Decimal(13, 2)), CAST(5790.00 AS Decimal(13, 2)), CAST(0.88 AS Decimal(13, 2)), CAST(5781.20 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(809.37 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(809.37 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(7399.94 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (22, 21, N'Homesure Wallputty', CAST(5.00 AS Decimal(13, 2)), N'20', CAST(344.00 AS Decimal(13, 2)), CAST(1720.00 AS Decimal(13, 2)), CAST(0.24 AS Decimal(13, 2)), CAST(1718.80 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(240.63 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(240.63 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(2200.06 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (23, 22, N'Homesure Wallputty', CAST(50.00 AS Decimal(13, 2)), N'40', CAST(610.00 AS Decimal(13, 2)), CAST(30500.00 AS Decimal(13, 2)), CAST(0.62 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (24, 23, N'Homesure Wallputty', CAST(50.00 AS Decimal(13, 2)), N'40', CAST(610.00 AS Decimal(13, 2)), CAST(30500.00 AS Decimal(13, 2)), CAST(0.62 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (25, 24, N'Homesure Wallputty', CAST(2.00 AS Decimal(13, 2)), N'40', CAST(593.75 AS Decimal(13, 2)), CAST(1187.50 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(1187.50 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(166.25 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(166.25 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(1520.00 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (26, 24, N'Homesure coarse Putty', CAST(6.00 AS Decimal(13, 2)), N'30', CAST(437.50 AS Decimal(13, 2)), CAST(2625.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(2625.00 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(367.50 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(367.50 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(3360.00 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (27, 25, N'Homesure Wallputty', CAST(50.00 AS Decimal(13, 2)), N'40', CAST(610.00 AS Decimal(13, 2)), CAST(30500.00 AS Decimal(13, 2)), CAST(0.62 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (28, 26, N'Homesure wallputty', CAST(20.00 AS Decimal(13, 2)), N'40', CAST(600.00 AS Decimal(13, 2)), CAST(12000.00 AS Decimal(13, 2)), CAST(29.69 AS Decimal(13, 2)), CAST(11406.20 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(1596.87 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(1596.87 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(14599.94 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (29, 27, N'Homesure wallputty', CAST(45.00 AS Decimal(13, 2)), N'40', CAST(610.00 AS Decimal(13, 2)), CAST(27450.00 AS Decimal(13, 2)), CAST(0.62 AS Decimal(13, 2)), CAST(27422.10 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(3839.09 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(3839.09 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(35100.29 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (30, 27, N'Homesure wallputty ', CAST(10.00 AS Decimal(13, 2)), N'20', CAST(305.00 AS Decimal(13, 2)), CAST(3050.00 AS Decimal(13, 2)), CAST(0.32 AS Decimal(13, 2)), CAST(3046.80 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(426.55 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(426.55 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(3899.90 AS Decimal(13, 2)))
INSERT [dbo].[InvoiceLine] ([InvoiceLineID], [InvoiceID], [Description], [Nos_Bag], [Uom], [Rate], [Amount], [Discount], [TaxableValue], [CGST_Rate], [CGST_Amount], [SGST_Rate], [SGST_Amount], [IGST_Rate], [IGST_Amount], [Total]) VALUES (31, 28, N'Homesure wallputty', CAST(100.00 AS Decimal(13, 2)), N'20', CAST(305.00 AS Decimal(13, 2)), CAST(30500.00 AS Decimal(13, 2)), CAST(0.31 AS Decimal(13, 2)), CAST(30469.00 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(14.00 AS Decimal(13, 2)), CAST(4265.66 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(0.00 AS Decimal(13, 2)), CAST(39000.32 AS Decimal(13, 2)))
SET IDENTITY_INSERT [dbo].[InvoiceLine] OFF
SET IDENTITY_INSERT [dbo].[NotificationsDetails] ON 

INSERT [dbo].[NotificationsDetails] ([NotificationsDetailsId], [NotificationTypeId], [StaffInfoId], [NotificationDate], [ImageUrl], [DocumentUrl], [Note], [IsActive]) VALUES (1, 1, 1, CAST(N'2018-05-27 17:51:00.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[NotificationsDetails] ([NotificationsDetailsId], [NotificationTypeId], [StaffInfoId], [NotificationDate], [ImageUrl], [DocumentUrl], [Note], [IsActive]) VALUES (2, 1, 1, CAST(N'2018-05-27 17:51:00.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[NotificationsDetails] ([NotificationsDetailsId], [NotificationTypeId], [StaffInfoId], [NotificationDate], [ImageUrl], [DocumentUrl], [Note], [IsActive]) VALUES (3, 1, 1, CAST(N'2018-05-27 17:51:00.000' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[NotificationsDetails] ([NotificationsDetailsId], [NotificationTypeId], [StaffInfoId], [NotificationDate], [ImageUrl], [DocumentUrl], [Note], [IsActive]) VALUES (4, 1, 1, CAST(N'2018-05-27 17:59:00.000' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[NotificationsDetails] OFF
SET IDENTITY_INSERT [dbo].[NotificationType] ON 

INSERT [dbo].[NotificationType] ([NotificationTypeId], [NotificationName], [IsActive]) VALUES (1, N'Assignment', 1)
INSERT [dbo].[NotificationType] ([NotificationTypeId], [NotificationName], [IsActive]) VALUES (2, N'Event', 1)
INSERT [dbo].[NotificationType] ([NotificationTypeId], [NotificationName], [IsActive]) VALUES (3, N'Notice', 1)
SET IDENTITY_INSERT [dbo].[NotificationType] OFF
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[roles] ([RoleId], [RoleName]) VALUES (2, N'User')
INSERT [dbo].[roles] ([RoleId], [RoleName]) VALUES (3, N'SuperAdmin')
INSERT [dbo].[roles] ([RoleId], [RoleName]) VALUES (4, N'SchoolAdmin')
INSERT [dbo].[roles] ([RoleId], [RoleName]) VALUES (5, N'Staff')
INSERT [dbo].[roles] ([RoleId], [RoleName]) VALUES (6, N'Parent')
SET IDENTITY_INSERT [dbo].[roles] OFF
SET IDENTITY_INSERT [dbo].[SchoolBasicInfo] ON 

INSERT [dbo].[SchoolBasicInfo] ([SchoolInfoId], [Name], [Email], [ContactNumber], [Address], [City], [State], [KeyContactName], [KeyDesignation], [IsActive], [SchoolUniqueId], [UpdateDate], [UpdatedEmail]) VALUES (1, N'DPS', N'rahultanwar706@gmail.com', N'8949298946', N'wagholi pune', N'pune', N'AS', N'DP', N'KD', 1, N'DPSpune2875', CAST(N'2018-05-26 04:35:36.743' AS DateTime), NULL)
INSERT [dbo].[SchoolBasicInfo] ([SchoolInfoId], [Name], [Email], [ContactNumber], [Address], [City], [State], [KeyContactName], [KeyDesignation], [IsActive], [SchoolUniqueId], [UpdateDate], [UpdatedEmail]) VALUES (2, N'Delhi Public School', N'dps@mail.com', N'8569365824', N'ABC', N'Pune', N'MH', N'Pankaj', N'Vice Principle', 1, N'DELHI-MH-PUN', CAST(N'2018-05-26 10:37:53.727' AS DateTime), NULL)
INSERT [dbo].[SchoolBasicInfo] ([SchoolInfoId], [Name], [Email], [ContactNumber], [Address], [City], [State], [KeyContactName], [KeyDesignation], [IsActive], [SchoolUniqueId], [UpdateDate], [UpdatedEmail]) VALUES (3, N'Alpha', N'tanwar1991rahul@gmail.com', N'8949298946', N'wagholi pune', N'pune', N'BR', N'DP', N'KD', 1, N'ALPHA-BR-PUN', CAST(N'2018-05-27 05:17:40.833' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[SchoolBasicInfo] OFF
SET IDENTITY_INSERT [dbo].[SchoolOtherInfo] ON 

INSERT [dbo].[SchoolOtherInfo] ([SchoolOtherInfoId], [SchoolInfoId], [SchoolTypeIds], [BoardTypeId], [OtherContactName], [OtherEmail], [OtherContacNumber], [Designation], [Tagline], [Notes], [IsActive], [Validity], [logo], [AllowVideo], [AllowBranding], [AllowDocument], [UpdateDate], [UpdatedEmail]) VALUES (6, 3, N'1|2', 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2018-04-27 18:30:00.000' AS DateTime), N'260c42cf-1921-4c1d-bae7-ea9bfd452606.png', 0, 1, 0, CAST(N'2018-05-27 05:18:50.567' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[SchoolOtherInfo] OFF
SET IDENTITY_INSERT [dbo].[SchoolUserMapping] ON 

INSERT [dbo].[SchoolUserMapping] ([MappingId], [SchoolInfoId], [UserId]) VALUES (1, 1, 48)
INSERT [dbo].[SchoolUserMapping] ([MappingId], [SchoolInfoId], [UserId]) VALUES (5, 2, 57)
INSERT [dbo].[SchoolUserMapping] ([MappingId], [SchoolInfoId], [UserId]) VALUES (9, 1, 1)
INSERT [dbo].[SchoolUserMapping] ([MappingId], [SchoolInfoId], [UserId]) VALUES (10, 2, 1)
INSERT [dbo].[SchoolUserMapping] ([MappingId], [SchoolInfoId], [UserId]) VALUES (11, 3, 60)
SET IDENTITY_INSERT [dbo].[SchoolUserMapping] OFF
SET IDENTITY_INSERT [dbo].[StaffInfo] ON 

INSERT [dbo].[StaffInfo] ([StaffInfoId], [UserId], [SchoolInfoId], [FirstName], [LastName], [Email], [MobileNumber], [StaffTypeId], [Address], [StaffSubTypeId], [OtherInfo], [MarriedStatus], [Gender], [Dob], [DateOfJoining], [DateOfLeaving], [IsActive], [IsAppSignUp], [UpdateDate], [UpdatedEmail]) VALUES (1, 59, 1, N'Teacher', N'One', N'teacherone@mail.com', N'5896369874', 1, N'xyz', 1, N'abc', 1, N'1', CAST(N'1976-05-08' AS Date), CAST(N'2018-01-01' AS Date), NULL, 1, 0, CAST(N'2018-05-27 00:12:49.943' AS DateTime), N'er.pankajtak@gmail.com')
SET IDENTITY_INSERT [dbo].[StaffInfo] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentId], [SchoolInfoId], [StudentUniqueId], [Name], [Gender], [DOB], [IsActive], [AadharNumber], [ClassId], [AppCode], [UpdateDate], [UpdatedEmail], [AppCodeCreatedDate]) VALUES (1, 1, N'PAN16943', N'Pankaj Tak', N'1', CAST(N'2010-02-01' AS Date), 1, N'342323243', 4, N'vr28zl4w9h8', CAST(N'2018-04-29 06:54:50.240' AS DateTime), N'teacherone@mail.com', CAST(N'2018-05-27' AS Date))
INSERT [dbo].[Student] ([StudentId], [SchoolInfoId], [StudentUniqueId], [Name], [Gender], [DOB], [IsActive], [AadharNumber], [ClassId], [AppCode], [UpdateDate], [UpdatedEmail], [AppCodeCreatedDate]) VALUES (2, 1, N'JIT1969', N'Jitendra Soni', N'2', CAST(N'2016-12-31' AS Date), 1, N'45454545', 2, NULL, CAST(N'2018-04-29 06:43:04.863' AS DateTime), N'teacherone@mail.com', NULL)
INSERT [dbo].[Student] ([StudentId], [SchoolInfoId], [StudentUniqueId], [Name], [Gender], [DOB], [IsActive], [AadharNumber], [ClassId], [AppCode], [UpdateDate], [UpdatedEmail], [AppCodeCreatedDate]) VALUES (3, 1, N'STU16622', N'Student One', N'1', CAST(N'2012-01-09' AS Date), 1, N'34343434', 2, NULL, CAST(N'2018-04-29 07:12:58.597' AS DateTime), N'teacherone@mail.com', NULL)
INSERT [dbo].[Student] ([StudentId], [SchoolInfoId], [StudentUniqueId], [Name], [Gender], [DOB], [IsActive], [AadharNumber], [ClassId], [AppCode], [UpdateDate], [UpdatedEmail], [AppCodeCreatedDate]) VALUES (4, 1, N'STU14175', N'Student Two', N'2', CAST(N'2016-02-01' AS Date), 1, N'454545454', 2, NULL, CAST(N'2018-04-29 07:13:30.427' AS DateTime), N'teacherone@mail.com', NULL)
INSERT [dbo].[Student] ([StudentId], [SchoolInfoId], [StudentUniqueId], [Name], [Gender], [DOB], [IsActive], [AadharNumber], [ClassId], [AppCode], [UpdateDate], [UpdatedEmail], [AppCodeCreatedDate]) VALUES (5, 7, N'RAH71500', N'rahul', N'1', CAST(N'2018-04-09' AS Date), 1, N'34324dfds', 17, NULL, CAST(N'2018-05-01 07:16:47.570' AS DateTime), N'er.pankajtak@gmail.com', NULL)
INSERT [dbo].[Student] ([StudentId], [SchoolInfoId], [StudentUniqueId], [Name], [Gender], [DOB], [IsActive], [AadharNumber], [ClassId], [AppCode], [UpdateDate], [UpdatedEmail], [AppCodeCreatedDate]) VALUES (6, 2, N'STU23264', N'Student One', N'1', CAST(N'2016-02-08' AS Date), 1, N'3434343534', 18, NULL, CAST(N'2018-05-01 08:25:52.490' AS DateTime), N'alpha@mail.com', NULL)
INSERT [dbo].[Student] ([StudentId], [SchoolInfoId], [StudentUniqueId], [Name], [Gender], [DOB], [IsActive], [AadharNumber], [ClassId], [AppCode], [UpdateDate], [UpdatedEmail], [AppCodeCreatedDate]) VALUES (7, 2, N'STU25947', N'Student Two', N'2', CAST(N'2016-06-13' AS Date), 1, N'232323', 18, NULL, CAST(N'2018-05-01 08:26:35.023' AS DateTime), N'alpha@mail.com', NULL)
INSERT [dbo].[Student] ([StudentId], [SchoolInfoId], [StudentUniqueId], [Name], [Gender], [DOB], [IsActive], [AadharNumber], [ClassId], [AppCode], [UpdateDate], [UpdatedEmail], [AppCodeCreatedDate]) VALUES (8, 2, N'STU22971', N'Student 3', N'1', CAST(N'2016-05-01' AS Date), 1, N'23232323', 19, NULL, CAST(N'2018-05-01 08:27:01.007' AS DateTime), N'alpha@mail.com', NULL)
INSERT [dbo].[Student] ([StudentId], [SchoolInfoId], [StudentUniqueId], [Name], [Gender], [DOB], [IsActive], [AadharNumber], [ClassId], [AppCode], [UpdateDate], [UpdatedEmail], [AppCodeCreatedDate]) VALUES (9, 2, N'STU23386', N'Student 4', N'2', CAST(N'2016-03-03' AS Date), 1, N'34343232', 20, NULL, CAST(N'2018-05-01 08:27:32.177' AS DateTime), N'alpha@mail.com', NULL)
INSERT [dbo].[Student] ([StudentId], [SchoolInfoId], [StudentUniqueId], [Name], [Gender], [DOB], [IsActive], [AadharNumber], [ClassId], [AppCode], [UpdateDate], [UpdatedEmail], [AppCodeCreatedDate]) VALUES (10, 1, N'MAN11859', N'Mangesh Sudrik', N'1', CAST(N'1983-07-17' AS Date), 1, N'CAOPS26', 6, NULL, CAST(N'2018-05-19 01:33:18.070' AS DateTime), N'er.pankajtak@gmail.com', NULL)
INSERT [dbo].[Student] ([StudentId], [SchoolInfoId], [StudentUniqueId], [Name], [Gender], [DOB], [IsActive], [AadharNumber], [ClassId], [AppCode], [UpdateDate], [UpdatedEmail], [AppCodeCreatedDate]) VALUES (11, 1, N'ANA12065', N'Anant', N'1', CAST(N'2018-05-06' AS Date), 1, N'zzzzz', 2, NULL, CAST(N'2018-05-19 02:06:12.697' AS DateTime), N'er.pankajtak@gmail.com', NULL)
INSERT [dbo].[Student] ([StudentId], [SchoolInfoId], [StudentUniqueId], [Name], [Gender], [DOB], [IsActive], [AadharNumber], [ClassId], [AppCode], [UpdateDate], [UpdatedEmail], [AppCodeCreatedDate]) VALUES (12, 16, N'ANA168187', N'Anant', N'1', CAST(N'2018-05-06' AS Date), 1, N'xxxx', 21, NULL, CAST(N'2018-05-19 01:48:44.483' AS DateTime), N'er.pankajtak@gmail.com', NULL)
INSERT [dbo].[Student] ([StudentId], [SchoolInfoId], [StudentUniqueId], [Name], [Gender], [DOB], [IsActive], [AadharNumber], [ClassId], [AppCode], [UpdateDate], [UpdatedEmail], [AppCodeCreatedDate]) VALUES (13, 1, N'Om16807', N'Om', N'1', CAST(N'2013-12-07' AS Date), 1, N'5859', 2, NULL, CAST(N'2018-05-19 01:50:16.093' AS DateTime), N'er.pankajtak@gmail.com', NULL)
INSERT [dbo].[Student] ([StudentId], [SchoolInfoId], [StudentUniqueId], [Name], [Gender], [DOB], [IsActive], [AadharNumber], [ClassId], [AppCode], [UpdateDate], [UpdatedEmail], [AppCodeCreatedDate]) VALUES (14, 1, N'MAN16765', N'Mangesh SUDRIK', N'1', CAST(N'1983-05-14' AS Date), 1, N'CAOPs26', 22, NULL, CAST(N'2018-05-19 02:10:40.330' AS DateTime), N'er.pankajtak@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentActivityMapping] ON 

INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (1, 1, 1, 0, 0, 1, 0)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (2, 1, 1, 0, 0, 2, 0)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (3, 1, 1, 0, 0, 3, 0)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (4, 1, 1, 0, 0, 4, 0)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (5, 2, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (6, 2, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (7, 2, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (8, 2, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (9, 3, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (10, 3, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (11, 3, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (12, 3, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (13, 4, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (14, 4, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (15, 4, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (16, 4, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (17, 5, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (18, 5, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (19, 5, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (20, 5, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (21, 6, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (22, 6, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (23, 6, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (24, 6, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (25, 7, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (26, 7, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (27, 7, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (28, 7, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (29, 8, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (30, 8, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (31, 8, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (32, 8, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (33, 9, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (34, 9, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (35, 9, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (36, 9, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (37, 10, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (38, 10, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (39, 10, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (40, 10, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (41, 11, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (42, 11, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (43, 11, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (44, 11, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (45, 12, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (46, 12, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (47, 12, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (48, 12, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (49, 13, 0, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (50, 14, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (51, 14, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (52, 14, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (53, 14, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (54, 15, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (55, 15, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (56, 15, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (57, 15, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (58, 16, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (59, 16, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (60, 16, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (61, 16, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (62, 17, 0, 1, 0, 1, 2)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (63, 17, 0, 1, 0, 2, 2)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (64, 18, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (65, 18, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (66, 18, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (67, 18, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (68, 19, 0, 1, 0, 3, 3)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (69, 20, 0, 1, 0, 2, 2)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (70, 21, 0, 1, 0, 1, 2)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (71, 21, 0, 1, 0, 2, 2)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (72, 22, 0, 1, 0, 1, 2)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (73, 22, 0, 1, 0, 2, 2)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (74, 23, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (75, 23, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (76, 23, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (77, 23, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (78, 24, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (79, 24, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (80, 24, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (81, 24, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (82, 25, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (83, 25, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (84, 25, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (85, 25, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (86, 26, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (87, 26, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (88, 26, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (89, 26, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (90, 27, 0, 0, 0, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (91, 27, 0, 0, 0, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (92, 28, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (93, 28, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (94, 28, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (95, 28, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (96, 29, 0, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (97, 29, 0, 0, 0, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (98, 29, 0, 0, 0, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (99, 30, 0, 0, 0, 1, NULL)
GO
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (100, 30, 0, 0, 0, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (101, 30, 0, 0, 0, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (102, 31, 0, 0, 0, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (103, 31, 0, 0, 0, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (104, 32, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (105, 32, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (106, 32, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (107, 32, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (108, 33, 0, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (109, 34, 0, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (110, 34, 0, 0, 0, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (111, 34, 0, 0, 0, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (112, 35, 0, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (113, 36, 0, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (114, 37, 0, 0, 0, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (115, 38, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (116, 38, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (117, 38, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (118, 38, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (119, 39, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (120, 39, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (121, 39, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (122, 39, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (123, 40, 0, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (124, 41, 0, 0, 0, 13, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (125, 42, 0, 0, 0, 10, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (126, 43, 0, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (127, 44, 0, 0, 0, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (128, 45, 0, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (129, 46, 0, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (130, 47, 0, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (131, 47, 0, 0, 0, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (132, 48, 0, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (133, 48, 0, 0, 0, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (134, 49, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (135, 49, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (136, 49, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (137, 49, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (138, 49, 0, 0, 1, 10, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (139, 49, 0, 0, 1, 11, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (140, 49, 0, 0, 1, 13, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (141, 49, 0, 0, 1, 14, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (142, 50, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (143, 50, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (144, 50, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (145, 50, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (146, 50, 0, 0, 1, 10, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (147, 50, 0, 0, 1, 11, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (148, 50, 0, 0, 1, 13, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (149, 50, 0, 0, 1, 14, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (150, 51, 0, 0, 0, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (151, 51, 0, 0, 0, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (152, 52, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (153, 52, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (154, 52, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (155, 52, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (156, 52, 0, 0, 1, 10, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (157, 52, 0, 0, 1, 11, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (158, 52, 0, 0, 1, 13, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (159, 52, 0, 0, 1, 14, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (160, 53, 0, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (161, 53, 0, 0, 0, 10, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (162, 53, 0, 0, 0, 14, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (163, 54, 0, 0, 0, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (164, 54, 0, 0, 0, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (165, 54, 0, 0, 0, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (166, 54, 0, 0, 0, 10, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (167, 55, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (168, 55, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (169, 55, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (170, 55, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (171, 55, 0, 0, 1, 10, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (172, 55, 0, 0, 1, 11, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (173, 55, 0, 0, 1, 13, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (174, 55, 0, 0, 1, 14, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (175, 56, 0, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (176, 57, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (177, 57, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (178, 57, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (179, 57, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (180, 57, 0, 0, 1, 10, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (181, 57, 0, 0, 1, 11, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (182, 57, 0, 0, 1, 13, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (183, 57, 0, 0, 1, 14, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (184, 58, 0, 1, 0, 2, 2)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (185, 58, 0, 1, 0, 3, 2)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (186, 58, 0, 1, 0, 4, 2)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (187, 58, 0, 1, 0, 11, 2)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (188, 58, 0, 1, 0, 13, 2)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (189, 59, 1, 0, 0, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (190, 60, 0, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (191, 61, 0, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (192, 62, 1, 0, 0, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (193, 63, 1, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (194, 64, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (195, 64, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (196, 64, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (197, 64, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (198, 64, 0, 0, 1, 10, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (199, 64, 0, 0, 1, 11, NULL)
GO
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (200, 64, 0, 0, 1, 13, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (201, 64, 0, 0, 1, 14, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (202, 65, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (203, 65, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (204, 65, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (205, 65, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (206, 65, 0, 0, 1, 10, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (207, 65, 0, 0, 1, 11, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (208, 65, 0, 0, 1, 13, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (209, 65, 0, 0, 1, 14, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (210, 66, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (211, 66, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (212, 66, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (213, 66, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (214, 66, 0, 0, 1, 10, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (215, 66, 0, 0, 1, 11, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (216, 66, 0, 0, 1, 13, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (217, 66, 0, 0, 1, 14, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (218, 67, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (219, 67, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (220, 67, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (221, 67, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (222, 67, 0, 0, 1, 10, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (223, 67, 0, 0, 1, 11, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (224, 67, 0, 0, 1, 13, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (225, 67, 0, 0, 1, 14, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (226, 68, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (227, 68, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (228, 68, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (229, 68, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (230, 68, 0, 0, 1, 10, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (231, 68, 0, 0, 1, 11, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (232, 68, 0, 0, 1, 13, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (233, 68, 0, 0, 1, 14, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (234, 69, 1, 0, 0, 10, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (235, 70, 1, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (236, 70, 1, 0, 0, 2, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (237, 71, 1, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (238, 72, 1, 0, 0, 1, NULL)
INSERT [dbo].[StudentActivityMapping] ([ActivitiesMappingId], [ActivityDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (239, 73, 1, 0, 0, 3, NULL)
SET IDENTITY_INSERT [dbo].[StudentActivityMapping] OFF
SET IDENTITY_INSERT [dbo].[StudentCheckin] ON 

INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (1, 8, 1, 1, 1, CAST(N'2018-04-15 06:24:17.123' AS DateTime), CAST(N'2018-04-15 06:24:17.123' AS DateTime), NULL)
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (2, 8, 2, 1, 0, CAST(N'2018-04-15 06:24:17.140' AS DateTime), CAST(N'2018-04-15 06:24:17.140' AS DateTime), NULL)
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (3, 8, 3, 1, 0, CAST(N'2018-04-15 06:24:17.140' AS DateTime), CAST(N'2018-04-15 06:24:17.140' AS DateTime), NULL)
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (4, 8, 4, 1, 0, CAST(N'2018-04-15 06:24:17.140' AS DateTime), CAST(N'2018-04-15 06:24:17.140' AS DateTime), NULL)
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (5, 8, 5, 1, 0, CAST(N'2018-04-15 06:24:17.140' AS DateTime), CAST(N'2018-04-15 06:24:17.140' AS DateTime), NULL)
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (6, 8, 6, 1, 0, CAST(N'2018-04-15 06:24:17.140' AS DateTime), CAST(N'2018-04-15 06:24:17.140' AS DateTime), NULL)
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (7, 8, 7, 1, 0, CAST(N'2018-04-15 06:24:17.140' AS DateTime), CAST(N'2018-04-15 06:24:17.140' AS DateTime), NULL)
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (8, 8, 8, 1, 0, CAST(N'2018-04-15 06:24:17.140' AS DateTime), CAST(N'2018-04-15 06:24:17.140' AS DateTime), NULL)
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (9, 8, 9, 1, 0, CAST(N'2018-04-15 06:24:17.140' AS DateTime), CAST(N'2018-04-15 06:24:17.140' AS DateTime), NULL)
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (10, 8, 10, 1, 0, CAST(N'2018-04-15 06:24:17.140' AS DateTime), CAST(N'2018-04-15 06:24:17.140' AS DateTime), NULL)
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (11, 8, 11, 1, 0, CAST(N'2018-04-15 06:24:17.140' AS DateTime), CAST(N'2018-04-15 06:24:17.140' AS DateTime), NULL)
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (12, 8, 12, 1, 0, CAST(N'2018-04-15 06:24:17.157' AS DateTime), CAST(N'2018-04-15 06:24:17.157' AS DateTime), NULL)
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (13, 8, 13, 1, 0, CAST(N'2018-04-15 06:24:17.157' AS DateTime), CAST(N'2018-04-15 06:24:17.157' AS DateTime), NULL)
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (14, 8, 14, 1, 0, CAST(N'2018-04-15 06:24:17.157' AS DateTime), CAST(N'2018-04-15 06:24:17.157' AS DateTime), NULL)
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (24, 8, 4, 2, 1, CAST(N'2018-04-16 10:40:47.187' AS DateTime), CAST(N'2018-04-16 10:40:47.187' AS DateTime), NULL)
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (25, 8, 1, 1, 0, CAST(N'2018-04-16 10:41:11.203' AS DateTime), CAST(N'2018-04-16 11:02:01.443' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (26, 8, 5, 1, 0, CAST(N'2018-04-16 10:41:11.203' AS DateTime), CAST(N'2018-04-16 11:02:01.443' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (27, 8, 6, 1, 1, CAST(N'2018-04-16 10:41:11.203' AS DateTime), CAST(N'2018-04-16 11:02:01.443' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (28, 8, 7, 1, 0, CAST(N'2018-04-16 10:41:11.220' AS DateTime), CAST(N'2018-04-16 11:02:01.443' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (29, 8, 10, 1, 1, CAST(N'2018-04-16 10:41:11.220' AS DateTime), CAST(N'2018-04-16 11:02:01.457' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (30, 8, 1, 1, 0, CAST(N'2018-04-19 04:21:48.273' AS DateTime), CAST(N'2018-04-19 04:48:19.097' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (31, 8, 5, 1, 1, CAST(N'2018-04-19 04:21:48.463' AS DateTime), CAST(N'2018-04-19 04:48:19.097' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (32, 8, 6, 1, 1, CAST(N'2018-04-19 04:21:48.523' AS DateTime), CAST(N'2018-04-19 04:48:19.097' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (33, 8, 7, 1, 0, CAST(N'2018-04-19 04:21:48.523' AS DateTime), CAST(N'2018-04-19 04:48:19.097' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (34, 8, 10, 1, 0, CAST(N'2018-04-19 04:21:48.523' AS DateTime), CAST(N'2018-04-19 04:48:19.097' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (35, 8, 4, 2, 1, CAST(N'2018-04-19 04:23:21.217' AS DateTime), CAST(N'2018-04-19 04:23:21.217' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (36, 8, 1, 1, 1, CAST(N'2018-04-20 05:58:44.140' AS DateTime), CAST(N'2018-04-20 08:16:41.083' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (37, 8, 5, 1, 0, CAST(N'2018-04-20 05:58:44.700' AS DateTime), CAST(N'2018-04-20 23:37:46.463' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (38, 8, 6, 1, 1, CAST(N'2018-04-20 05:58:44.733' AS DateTime), CAST(N'2018-04-20 23:37:46.510' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (39, 8, 7, 1, 1, CAST(N'2018-04-20 05:58:44.733' AS DateTime), CAST(N'2018-04-20 23:37:46.510' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (40, 8, 10, 1, 1, CAST(N'2018-04-20 05:58:44.733' AS DateTime), CAST(N'2018-04-20 23:37:46.510' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (41, 8, 5, 1, 1, CAST(N'2018-04-21 00:00:41.210' AS DateTime), CAST(N'2018-04-21 22:07:49.290' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (42, 8, 6, 1, 1, CAST(N'2018-04-21 00:00:41.303' AS DateTime), CAST(N'2018-04-21 22:07:49.290' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (43, 8, 7, 1, 1, CAST(N'2018-04-21 00:00:41.333' AS DateTime), CAST(N'2018-04-21 22:07:49.290' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (44, 8, 10, 1, 1, CAST(N'2018-04-21 00:00:41.350' AS DateTime), CAST(N'2018-04-21 22:07:49.290' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (45, 8, 1, 2, 0, CAST(N'2018-04-21 00:01:24.757' AS DateTime), CAST(N'2018-04-21 04:01:12.370' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (46, 8, 2, 2, 1, CAST(N'2018-04-21 00:01:24.757' AS DateTime), CAST(N'2018-04-21 04:01:29.917' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (47, 8, 3, 2, 1, CAST(N'2018-04-21 00:01:24.757' AS DateTime), CAST(N'2018-04-21 04:01:12.387' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (48, 8, 4, 2, 0, CAST(N'2018-04-21 00:01:24.757' AS DateTime), CAST(N'2018-04-21 15:04:51.187' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (49, 8, 16, 2, 0, CAST(N'2018-04-21 00:01:24.757' AS DateTime), CAST(N'2018-04-21 15:04:51.277' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (50, 8, 15, 2, 1, CAST(N'2018-04-21 03:59:32.277' AS DateTime), CAST(N'2018-04-21 15:04:51.277' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (51, 8, 1, 1, 1, CAST(N'2018-04-21 04:20:01.043' AS DateTime), CAST(N'2018-04-21 22:07:49.257' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (52, 8, 2, 1, 1, CAST(N'2018-04-21 04:20:01.043' AS DateTime), CAST(N'2018-04-21 22:07:49.273' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (53, 8, 3, 1, 1, CAST(N'2018-04-21 04:20:01.060' AS DateTime), CAST(N'2018-04-21 22:07:49.273' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (54, 8, 12, 1, 0, CAST(N'2018-04-21 04:20:01.060' AS DateTime), CAST(N'2018-04-21 22:07:49.290' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (55, 8, 13, 1, 0, CAST(N'2018-04-21 04:20:01.060' AS DateTime), CAST(N'2018-04-21 04:20:01.060' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (56, 8, 14, 1, 0, CAST(N'2018-04-21 04:20:01.073' AS DateTime), CAST(N'2018-04-21 04:20:01.073' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (57, 8, 1, 1, 1, CAST(N'2018-04-22 01:46:46.443' AS DateTime), CAST(N'2018-04-22 01:46:46.443' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (58, 8, 2, 1, 0, CAST(N'2018-04-22 01:46:46.473' AS DateTime), CAST(N'2018-04-22 01:46:46.473' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (59, 8, 3, 1, 0, CAST(N'2018-04-22 01:46:46.583' AS DateTime), CAST(N'2018-04-22 01:46:46.583' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (60, 8, 5, 1, 0, CAST(N'2018-04-22 01:46:46.583' AS DateTime), CAST(N'2018-04-22 01:46:46.583' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (61, 8, 6, 1, 0, CAST(N'2018-04-22 01:46:46.583' AS DateTime), CAST(N'2018-04-22 01:46:46.583' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (62, 8, 7, 1, 0, CAST(N'2018-04-22 01:46:46.583' AS DateTime), CAST(N'2018-04-22 01:46:46.583' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (63, 8, 10, 1, 0, CAST(N'2018-04-22 01:46:46.600' AS DateTime), CAST(N'2018-04-22 01:46:46.600' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (64, 8, 12, 1, 0, CAST(N'2018-04-22 01:46:46.600' AS DateTime), CAST(N'2018-04-22 01:46:46.600' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (65, 8, 1, 1, 1, CAST(N'2018-04-23 03:57:20.080' AS DateTime), CAST(N'2018-04-23 11:35:08.360' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (66, 8, 2, 1, 1, CAST(N'2018-04-23 03:57:20.173' AS DateTime), CAST(N'2018-04-23 11:35:08.983' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (67, 8, 3, 1, 1, CAST(N'2018-04-23 03:57:20.220' AS DateTime), CAST(N'2018-04-23 11:35:08.983' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (68, 8, 5, 1, 1, CAST(N'2018-04-23 03:57:20.237' AS DateTime), CAST(N'2018-04-23 11:35:08.983' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (69, 8, 6, 1, 1, CAST(N'2018-04-23 03:57:20.237' AS DateTime), CAST(N'2018-04-23 11:35:08.983' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (70, 8, 7, 1, 1, CAST(N'2018-04-23 03:57:20.237' AS DateTime), CAST(N'2018-04-23 11:35:08.983' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (71, 8, 10, 1, 1, CAST(N'2018-04-23 03:57:20.237' AS DateTime), CAST(N'2018-04-23 11:35:09.000' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (72, 8, 12, 1, 1, CAST(N'2018-04-23 03:57:20.250' AS DateTime), CAST(N'2018-04-23 11:35:09.000' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (73, 8, 4, 2, 1, CAST(N'2018-04-23 06:48:51.347' AS DateTime), CAST(N'2018-04-23 11:03:11.657' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (74, 8, 15, 2, 1, CAST(N'2018-04-23 06:48:51.377' AS DateTime), CAST(N'2018-04-23 11:03:11.670' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (75, 8, 16, 2, 1, CAST(N'2018-04-23 06:48:51.377' AS DateTime), CAST(N'2018-04-23 11:03:11.670' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (76, 8, 1, 1, 1, CAST(N'2018-04-25 05:32:18.157' AS DateTime), CAST(N'2018-04-25 06:48:26.333' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (77, 8, 2, 1, 1, CAST(N'2018-04-25 05:32:18.237' AS DateTime), CAST(N'2018-04-25 06:48:26.333' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (78, 8, 3, 1, 1, CAST(N'2018-04-25 05:32:18.457' AS DateTime), CAST(N'2018-04-25 06:48:26.333' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (79, 8, 5, 1, 1, CAST(N'2018-04-25 05:32:18.457' AS DateTime), CAST(N'2018-04-25 06:48:26.350' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (80, 8, 6, 1, 1, CAST(N'2018-04-25 05:32:18.457' AS DateTime), CAST(N'2018-04-25 06:48:26.350' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (81, 8, 7, 1, 1, CAST(N'2018-04-25 05:32:18.457' AS DateTime), CAST(N'2018-04-25 06:48:26.350' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (82, 8, 10, 1, 1, CAST(N'2018-04-25 05:32:18.457' AS DateTime), CAST(N'2018-04-25 06:48:26.350' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (83, 8, 12, 1, 1, CAST(N'2018-04-25 05:32:18.457' AS DateTime), CAST(N'2018-04-25 06:48:26.350' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (84, 8, 4, 2, 0, CAST(N'2018-04-25 05:33:07.847' AS DateTime), CAST(N'2018-04-25 06:50:11.333' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (85, 8, 15, 2, 1, CAST(N'2018-04-25 05:33:07.847' AS DateTime), CAST(N'2018-04-25 06:50:11.333' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (86, 8, 16, 2, 0, CAST(N'2018-04-25 05:33:07.847' AS DateTime), CAST(N'2018-04-25 06:50:11.333' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (87, 8, 1, 1, 1, CAST(N'2018-04-26 02:50:30.473' AS DateTime), CAST(N'2018-04-26 13:44:53.887' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (88, 8, 2, 1, 1, CAST(N'2018-04-26 02:50:30.677' AS DateTime), CAST(N'2018-04-26 13:44:54.340' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (89, 8, 3, 1, 1, CAST(N'2018-04-26 02:50:30.707' AS DateTime), CAST(N'2018-04-26 13:44:54.340' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (90, 8, 5, 1, 1, CAST(N'2018-04-26 02:50:30.723' AS DateTime), CAST(N'2018-04-26 13:44:54.357' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (91, 8, 6, 1, 0, CAST(N'2018-04-26 02:50:30.723' AS DateTime), CAST(N'2018-04-26 13:44:54.357' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (92, 8, 7, 1, 0, CAST(N'2018-04-26 02:50:31.020' AS DateTime), CAST(N'2018-04-26 13:44:54.357' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (93, 8, 10, 1, 1, CAST(N'2018-04-26 02:50:31.020' AS DateTime), CAST(N'2018-04-26 13:44:54.357' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (94, 8, 12, 1, 0, CAST(N'2018-04-26 02:50:31.020' AS DateTime), CAST(N'2018-04-26 13:44:54.370' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (95, 8, 4, 2, 0, CAST(N'2018-04-26 06:33:00.803' AS DateTime), CAST(N'2018-04-26 13:15:36.787' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (96, 8, 15, 2, 0, CAST(N'2018-04-26 06:33:01.037' AS DateTime), CAST(N'2018-04-26 13:15:37.490' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (97, 8, 16, 2, 0, CAST(N'2018-04-26 06:33:01.397' AS DateTime), CAST(N'2018-04-26 13:15:37.490' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (98, 8, 1, 1, 0, CAST(N'2018-04-27 01:05:28.717' AS DateTime), CAST(N'2018-04-27 01:06:09.750' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (99, 8, 2, 1, 1, CAST(N'2018-04-27 01:05:28.827' AS DateTime), CAST(N'2018-04-27 01:06:09.750' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (100, 8, 3, 1, 1, CAST(N'2018-04-27 01:05:29.297' AS DateTime), CAST(N'2018-04-27 01:06:09.750' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (101, 8, 5, 1, 0, CAST(N'2018-04-27 01:05:29.310' AS DateTime), CAST(N'2018-04-27 01:06:09.763' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (102, 8, 6, 1, 0, CAST(N'2018-04-27 01:05:29.310' AS DateTime), CAST(N'2018-04-27 01:06:09.763' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (103, 8, 7, 1, 0, CAST(N'2018-04-27 01:05:29.310' AS DateTime), CAST(N'2018-04-27 01:06:09.763' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (104, 8, 10, 1, 0, CAST(N'2018-04-27 01:05:29.310' AS DateTime), CAST(N'2018-04-27 01:06:09.763' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (105, 8, 12, 1, 0, CAST(N'2018-04-27 01:05:29.310' AS DateTime), CAST(N'2018-04-27 01:06:09.763' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (106, 8, 4, 1, 0, CAST(N'2018-04-30 00:15:33.107' AS DateTime), CAST(N'2018-04-30 08:39:21.370' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (107, 8, 1, 2, 1, CAST(N'2018-05-01 01:04:48.057' AS DateTime), CAST(N'2018-05-01 01:04:48.057' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (108, 8, 2, 2, 1, CAST(N'2018-05-01 01:04:48.057' AS DateTime), CAST(N'2018-05-01 01:04:48.057' AS DateTime), N'teacherone@mail.com')
GO
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (109, 8, 4, 1, 0, CAST(N'2018-05-01 01:20:25.063' AS DateTime), CAST(N'2018-05-01 01:20:25.063' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (110, 8, 4, 1, 1, CAST(N'2018-05-13 01:05:16.887' AS DateTime), CAST(N'2018-05-13 01:05:16.903' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (111, 8, 1, 2, 1, CAST(N'2018-05-13 23:39:16.190' AS DateTime), CAST(N'2018-05-13 23:39:16.190' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (112, 8, 2, 2, 1, CAST(N'2018-05-13 23:39:16.220' AS DateTime), CAST(N'2018-05-13 23:39:16.220' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (113, 8, 4, 1, 0, CAST(N'2018-05-15 07:30:10.237' AS DateTime), CAST(N'2018-05-15 07:30:10.237' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (114, 8, 1, 2, 1, CAST(N'2018-05-15 07:30:23.253' AS DateTime), CAST(N'2018-05-15 07:31:50.223' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (115, 8, 2, 2, 1, CAST(N'2018-05-15 07:30:23.253' AS DateTime), CAST(N'2018-05-15 07:31:50.223' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (116, 8, 1, 2, 1, CAST(N'2018-05-18 22:10:05.253' AS DateTime), CAST(N'2018-05-18 22:10:05.253' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (117, 8, 2, 2, 1, CAST(N'2018-05-18 22:10:05.300' AS DateTime), CAST(N'2018-05-18 22:10:05.300' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (118, 8, 2, 2, 1, CAST(N'2018-05-19 03:04:47.147' AS DateTime), CAST(N'2018-05-19 07:37:27.087' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (119, 8, 3, 2, 1, CAST(N'2018-05-19 03:04:47.193' AS DateTime), CAST(N'2018-05-19 07:37:27.103' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (120, 8, 4, 2, 1, CAST(N'2018-05-19 03:04:47.193' AS DateTime), CAST(N'2018-05-19 07:37:27.103' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (121, 8, 11, 2, 1, CAST(N'2018-05-19 03:04:47.193' AS DateTime), CAST(N'2018-05-19 07:37:27.103' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (122, 8, 13, 2, 1, CAST(N'2018-05-19 03:04:47.193' AS DateTime), CAST(N'2018-05-19 07:37:27.103' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (123, 8, 14, 22, 1, CAST(N'2018-05-19 03:09:41.730' AS DateTime), CAST(N'2018-05-19 03:09:41.730' AS DateTime), N'teacherone@mail.com')
INSERT [dbo].[StudentCheckin] ([CheckInId], [UserId], [StudentId], [ClassId], [IsPresent], [CheckInDate], [UpdateDate], [UpdatedEmail]) VALUES (124, 8, 10, 6, 1, CAST(N'2018-05-20 02:56:19.360' AS DateTime), CAST(N'2018-05-20 02:56:19.360' AS DateTime), N'teacherone@mail.com')
SET IDENTITY_INSERT [dbo].[StudentCheckin] OFF
SET IDENTITY_INSERT [dbo].[StudentNotificationsMapping] ON 

INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (1, 1, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (2, 1, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (3, 1, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (4, 1, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (5, 1, 0, 0, 1, 10, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (6, 1, 0, 0, 1, 11, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (7, 1, 0, 0, 1, 13, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (8, 1, 0, 0, 1, 14, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (9, 2, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (10, 2, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (11, 2, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (12, 2, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (13, 2, 0, 0, 1, 10, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (14, 2, 0, 0, 1, 11, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (15, 2, 0, 0, 1, 13, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (16, 2, 0, 0, 1, 14, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (17, 3, 0, 0, 1, 1, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (18, 3, 0, 0, 1, 2, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (19, 3, 0, 0, 1, 3, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (20, 3, 0, 0, 1, 4, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (21, 3, 0, 0, 1, 10, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (22, 3, 0, 0, 1, 11, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (23, 3, 0, 0, 1, 13, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (24, 3, 0, 0, 1, 14, NULL)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (25, 4, 0, 1, 0, 2, 2)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (26, 4, 0, 1, 0, 3, 2)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (27, 4, 0, 1, 0, 4, 2)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (28, 4, 0, 1, 0, 11, 2)
INSERT [dbo].[StudentNotificationsMapping] ([NotificationsMappingId], [NotificationsDetailsId], [IsStudentLevel], [IsClassLevel], [IsSchoolLevel], [StudentId], [ClassId]) VALUES (29, 4, 0, 1, 0, 13, 2)
SET IDENTITY_INSERT [dbo].[StudentNotificationsMapping] OFF
SET IDENTITY_INSERT [dbo].[StudentParent] ON 

INSERT [dbo].[StudentParent] ([StudentParentId], [UserId], [StudentId], [FirstName], [LastName], [Gender], [Email], [MobileNumber], [ContactNumber], [IsActive], [IsAppSignUp], [UpdateDate], [UpdatedEmail]) VALUES (2, 56, 1, N'Pankaj', N'Tak', N'1', N'rahultanwar706@gmail.com', N'5698236589', NULL, 1, 0, CAST(N'2018-05-26 09:38:06.733' AS DateTime), N'er.pankajtak@gmail.com')
INSERT [dbo].[StudentParent] ([StudentParentId], [UserId], [StudentId], [FirstName], [LastName], [Gender], [Email], [MobileNumber], [ContactNumber], [IsActive], [IsAppSignUp], [UpdateDate], [UpdatedEmail]) VALUES (3, 58, 1, N'Rani', N'Tak', N'2', N'rahul1991tanwar@gmail.com', N'8949298946', N'8949298946', 1, 0, CAST(N'2018-05-26 23:45:28.553' AS DateTime), N'er.pankajtak@gmail.com')
SET IDENTITY_INSERT [dbo].[StudentParent] OFF
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserId], [RoleId], [FirstName], [LastName], [Email], [Password], [ContactNumber]) VALUES (1, 3, N'Pankaj', N'Tak', N'er.pankajtak@gmail.com', N'123456', NULL)
INSERT [dbo].[UserProfile] ([UserId], [RoleId], [FirstName], [LastName], [Email], [Password], [ContactNumber]) VALUES (56, 6, N'Pankaj', N'Tak', N'rahultanwar706@gmail.com', N'jhPyLx9F', N'5698236589')
INSERT [dbo].[UserProfile] ([UserId], [RoleId], [FirstName], [LastName], [Email], [Password], [ContactNumber]) VALUES (57, 4, N'', N'', N'dps@mail.com', N'q6G3FDDm', N'8569365824')
INSERT [dbo].[UserProfile] ([UserId], [RoleId], [FirstName], [LastName], [Email], [Password], [ContactNumber]) VALUES (58, 6, N'Rani', N'Tak', N'rahul1991tanwar@gmail.com', N'BExwPMBe', N'8949298946')
INSERT [dbo].[UserProfile] ([UserId], [RoleId], [FirstName], [LastName], [Email], [Password], [ContactNumber]) VALUES (59, 5, N'Teacher', N'One', N'teacherone@mail.com', N'gxgOdHMV', N'5896369874')
INSERT [dbo].[UserProfile] ([UserId], [RoleId], [FirstName], [LastName], [Email], [Password], [ContactNumber]) VALUES (60, 4, N'', N'', N'tanwar1991rahul@gmail.com', N'tM7J9xOu', N'8949298946')
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_InvoiceNumber]    Script Date: 27-05-2018 18:14:29 ******/
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [UQ_InvoiceNumber] UNIQUE NONCLUSTERED 
(
	[InvoiceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StaffClasses] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[StaffDocument] ADD  DEFAULT ((0)) FOR [ManualVerification]
GO
ALTER TABLE [dbo].[StaffDocument] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[StaffExperience] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[StaffOtherInfo] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[InvoiceLine]  WITH CHECK ADD  CONSTRAINT [FK__InvoiceLi__Invoi__0CBAE877] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InvoiceLine] CHECK CONSTRAINT [FK__InvoiceLi__Invoi__0CBAE877]
GO
USE [master]
GO
ALTER DATABASE [anaghaenterprises] SET  READ_WRITE 
GO
