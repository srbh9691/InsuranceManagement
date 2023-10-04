USE [InsuranceManagement]
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetPolicy]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_GetPolicy]
GO
/****** Object:  StoredProcedure [dbo].[SSP_DeletePolicy]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_DeletePolicy]
GO
/****** Object:  StoredProcedure [dbo].[SSP_AddUpdatePolicy]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_AddUpdatePolicy]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerPolicy_Documents]') AND type in (N'U'))
ALTER TABLE [dbo].[CustomerPolicy_Documents] DROP CONSTRAINT IF EXISTS [FK_CustomerPolicy_Documents_CustomerPolicy]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerPolicy_Details]') AND type in (N'U'))
ALTER TABLE [dbo].[CustomerPolicy_Details] DROP CONSTRAINT IF EXISTS [FK_CustomerPolicy_Details_CustomerPolicy]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Vehicle_Ownership]') AND type in (N'U'))
ALTER TABLE [dbo].[Customer_Vehicle_Ownership] DROP CONSTRAINT IF EXISTS [FK_Customer_Vehicle_Ownership_Vehicle]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Vehicle_Ownership]') AND type in (N'U'))
ALTER TABLE [dbo].[Customer_Vehicle_Ownership] DROP CONSTRAINT IF EXISTS [FK_Customer_Vehicle_Ownership_Customer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Policy_Purchase]') AND type in (N'U'))
ALTER TABLE [dbo].[Customer_Policy_Purchase] DROP CONSTRAINT IF EXISTS [FK_Customer_Policy_Purchase_CustomerPolicy]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Policy_Purchase]') AND type in (N'U'))
ALTER TABLE [dbo].[Customer_Policy_Purchase] DROP CONSTRAINT IF EXISTS [FK_Customer_Policy_Purchase_Customer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_PhoneNo]') AND type in (N'U'))
ALTER TABLE [dbo].[Customer_PhoneNo] DROP CONSTRAINT IF EXISTS [FK_Customer_PhoneNo_Customer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Name]') AND type in (N'U'))
ALTER TABLE [dbo].[Customer_Name] DROP CONSTRAINT IF EXISTS [FK_Customer_Name_Customer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Documents]') AND type in (N'U'))
ALTER TABLE [dbo].[Customer_Documents] DROP CONSTRAINT IF EXISTS [FK_Customer_Documents_Customer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Address]') AND type in (N'U'))
ALTER TABLE [dbo].[Customer_Address] DROP CONSTRAINT IF EXISTS [FK_Customer_Address_Customer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Claim_Intimation]') AND type in (N'U'))
ALTER TABLE [dbo].[Claim_Intimation] DROP CONSTRAINT IF EXISTS [FK_ClaimIntimation_Customer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Claim_Intimation]') AND type in (N'U'))
ALTER TABLE [dbo].[Claim_Intimation] DROP CONSTRAINT IF EXISTS [FK_ClaimIntimation_Claim]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Claim_Documents]') AND type in (N'U'))
ALTER TABLE [dbo].[Claim_Documents] DROP CONSTRAINT IF EXISTS [FK_Claim_Documents_Claim]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Claim_BankDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[Claim_BankDetails] DROP CONSTRAINT IF EXISTS [FK_Claim_BankDetails_Claim]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Claim]') AND type in (N'U'))
ALTER TABLE [dbo].[Claim] DROP CONSTRAINT IF EXISTS [FK_Claim_CustomerPolicy]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Claim]') AND type in (N'U'))
ALTER TABLE [dbo].[Claim] DROP CONSTRAINT IF EXISTS [FK_Claim_Customer]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Vehicle]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Policy]
GO
/****** Object:  Table [dbo].[CustomerPolicy_Documents]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP TABLE IF EXISTS [dbo].[CustomerPolicy_Documents]
GO
/****** Object:  Table [dbo].[CustomerPolicy_Details]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP TABLE IF EXISTS [dbo].[CustomerPolicy_Details]
GO
/****** Object:  Table [dbo].[CustomerPolicy]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP TABLE IF EXISTS [dbo].[CustomerPolicy]
GO
/****** Object:  Table [dbo].[Customer_Vehicle_Ownership]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Customer_Vehicle_Ownership]
GO
/****** Object:  Table [dbo].[Customer_Policy_Purchase]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Customer_Policy_Purchase]
GO
/****** Object:  Table [dbo].[Customer_PhoneNo]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Customer_PhoneNo]
GO
/****** Object:  Table [dbo].[Customer_Name]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Customer_Name]
GO
/****** Object:  Table [dbo].[Customer_Documents]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Customer_Documents]
GO
/****** Object:  Table [dbo].[Customer_Address]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Customer_Address]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Claim_Intimation]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Claim_Intimation]
GO
/****** Object:  Table [dbo].[Claim_Documents]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Claim_Documents]
GO
/****** Object:  Table [dbo].[Claim_BankDetails]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Claim_BankDetails]
GO
/****** Object:  Table [dbo].[Claim]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP TABLE IF EXISTS [dbo].[Claim]
GO
/****** Object:  User [Admin]    Script Date: 10/4/2023 10:35:22 PM ******/
DROP USER IF EXISTS [Admin]
GO
/****** Object:  User [Admin]    Script Date: 10/4/2023 10:35:22 PM ******/
CREATE USER [Admin] FOR LOGIN [Admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Admin]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [Admin]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [Admin]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [Admin]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [Admin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Admin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Admin]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [Admin]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [Admin]
GO
/****** Object:  Table [dbo].[Claim]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claim](
	[ClaimID] [nvarchar](50) NOT NULL,
	[CustomerID] [bigint] NOT NULL,
	[CustomerPolicyID] [nvarchar](50) NOT NULL,
	[ClaimType] [nvarchar](20) NOT NULL,
	[DamageDetails] [nvarchar](max) NOT NULL,
	[SettlementStatus] [nvarchar](50) NOT NULL,
	[ApprovedAmount] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_Claim_1] PRIMARY KEY CLUSTERED 
(
	[ClaimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Claim_BankDetails]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claim_BankDetails](
	[ClaimID] [nvarchar](50) NOT NULL,
	[IFSCCode] [nvarchar](10) NOT NULL,
	[AccountNo] [bigint] NOT NULL,
	[AccountHolderName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Claim_BankDetails] PRIMARY KEY CLUSTERED 
(
	[ClaimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Claim_Documents]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claim_Documents](
	[ClaimID] [nvarchar](50) NOT NULL,
	[DocumentID] [bigint] NOT NULL,
	[DocumentName] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Claim_Documents] PRIMARY KEY CLUSTERED 
(
	[ClaimID] ASC,
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Claim_Intimation]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claim_Intimation](
	[ClaimID] [nvarchar](50) NOT NULL,
	[CustomerID] [bigint] NOT NULL,
	[ClaimIntimationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ClaimIntimation] PRIMARY KEY CLUSTERED 
(
	[ClaimID] ASC,
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [bigint] NOT NULL,
	[EmailId] [nvarchar](75) NOT NULL,
	[DateOfBirth] [datetime] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Address]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Address](
	[CustomerID] [bigint] NOT NULL,
	[HouseNo] [nvarchar](50) NOT NULL,
	[Area] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Zip] [int] NOT NULL,
 CONSTRAINT [PK_Customer_Address] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Documents]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Documents](
	[CustomerID] [bigint] NOT NULL,
	[DocumentID] [bigint] NOT NULL,
	[DocumentName] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Customer_Documents] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Name]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Name](
	[CustomerID] [bigint] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customer_Name] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_PhoneNo]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_PhoneNo](
	[CustomerID] [bigint] NOT NULL,
	[PhoneNo] [bigint] NOT NULL,
 CONSTRAINT [PK_Customer_PhoneNo] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[PhoneNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Policy_Purchase]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Policy_Purchase](
	[CustomerID] [bigint] NOT NULL,
	[CustomerPolicyID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customer_Policy_Purchase] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[CustomerPolicyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Vehicle_Ownership]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Vehicle_Ownership](
	[CustomerID] [bigint] NOT NULL,
	[VehicleChesisNo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customer_Vehicle_Ownership] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[VehicleChesisNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPolicy]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPolicy](
	[CustomerPolicyID] [nvarchar](50) NOT NULL,
	[PolicyID] [bigint] NOT NULL,
	[VehicleChesisNo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customer_Policy] PRIMARY KEY CLUSTERED 
(
	[CustomerPolicyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPolicy_Details]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPolicy_Details](
	[CustomerPolicyID] [nvarchar](50) NOT NULL,
	[PolicyStartDate] [datetime] NOT NULL,
	[PolicyEndDate] [datetime] NOT NULL,
	[InsuredDeclaredValue] [decimal](8, 2) NOT NULL,
	[Status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Customer_PolicyDetails] PRIMARY KEY CLUSTERED 
(
	[CustomerPolicyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPolicy_Documents]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPolicy_Documents](
	[CustomerPolicyID] [nvarchar](50) NOT NULL,
	[DocumentID] [bigint] NOT NULL,
	[DocumentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CustomerPolicyID_Documents] PRIMARY KEY CLUSTERED 
(
	[CustomerPolicyID] ASC,
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policy](
	[PolicyID] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TypeOfPolicy] [nvarchar](10) NOT NULL,
	[Premium] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_Policy] PRIMARY KEY CLUSTERED 
(
	[PolicyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[VehicleChesisNo] [nvarchar](50) NOT NULL,
	[RegistrationNumber] [nvarchar](20) NOT NULL,
	[TypeOfVehicle] [nvarchar](20) NOT NULL,
	[Make] [nvarchar](20) NOT NULL,
	[Model] [int] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[LastClaim] [datetime] NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[VehicleChesisNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Claim] ([ClaimID], [CustomerID], [CustomerPolicyID], [ClaimType], [DamageDetails], [SettlementStatus], [ApprovedAmount]) VALUES (N'CL1001', 1, N'IN2W1001', N'Cashless', N'HandleDamaged', N'Settled', CAST(10000.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Claim] ([ClaimID], [CustomerID], [CustomerPolicyID], [ClaimType], [DamageDetails], [SettlementStatus], [ApprovedAmount]) VALUES (N'CL1002', 4, N'IN4W1004', N'Reimbursement', N'BumperDamaged', N'NotSettled', CAST(0.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Claim_BankDetails] ([ClaimID], [IFSCCode], [AccountNo], [AccountHolderName]) VALUES (N'CL1001', N'INGB4004', 14141252, N'Ram Gupta')
GO
INSERT [dbo].[Claim_Documents] ([ClaimID], [DocumentID], [DocumentName]) VALUES (N'CL1001', 1001, N'VehiclePhoto')
GO
INSERT [dbo].[Claim_Documents] ([ClaimID], [DocumentID], [DocumentName]) VALUES (N'CL1002', 1002, N'VehiclePhoto')
GO
INSERT [dbo].[Claim_Intimation] ([ClaimID], [CustomerID], [ClaimIntimationDate]) VALUES (N'CL1001', 1, CAST(N'2021-05-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Claim_Intimation] ([ClaimID], [CustomerID], [ClaimIntimationDate]) VALUES (N'CL1002', 4, CAST(N'2023-06-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer] ([CustomerID], [EmailId], [DateOfBirth]) VALUES (1, N'ram@gmail.com', CAST(N'1990-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer] ([CustomerID], [EmailId], [DateOfBirth]) VALUES (2, N'shyam@gmail.com', CAST(N'1991-06-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer] ([CustomerID], [EmailId], [DateOfBirth]) VALUES (3, N'mohan@yahoo.com', CAST(N'1992-07-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer] ([CustomerID], [EmailId], [DateOfBirth]) VALUES (4, N'radha@yahoo.com', CAST(N'2000-06-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer_Address] ([CustomerID], [HouseNo], [Area], [City], [Zip]) VALUES (1, N'1103', N'Magarpatta', N'Pune', 411013)
GO
INSERT [dbo].[Customer_Address] ([CustomerID], [HouseNo], [Area], [City], [Zip]) VALUES (2, N'1203', N'Hadapsar', N'Pune', 411020)
GO
INSERT [dbo].[Customer_Address] ([CustomerID], [HouseNo], [Area], [City], [Zip]) VALUES (3, N'89', N'Indrapuram', N'Agra', 282001)
GO
INSERT [dbo].[Customer_Address] ([CustomerID], [HouseNo], [Area], [City], [Zip]) VALUES (4, N'57', N'Ayodyakunj', N'Mathura', 283004)
GO
INSERT [dbo].[Customer_Documents] ([CustomerID], [DocumentID], [DocumentName]) VALUES (1, 1001, N'AadharCard')
GO
INSERT [dbo].[Customer_Documents] ([CustomerID], [DocumentID], [DocumentName]) VALUES (2, 1002, N'PanCard')
GO
INSERT [dbo].[Customer_Documents] ([CustomerID], [DocumentID], [DocumentName]) VALUES (3, 1003, N'DrivingLicence')
GO
INSERT [dbo].[Customer_Documents] ([CustomerID], [DocumentID], [DocumentName]) VALUES (3, 1004, N'PanCard')
GO
INSERT [dbo].[Customer_Documents] ([CustomerID], [DocumentID], [DocumentName]) VALUES (4, 1005, N'AadharCard')
GO
INSERT [dbo].[Customer_Name] ([CustomerID], [FirstName], [LastName]) VALUES (1, N'Ram', N'Gupta')
GO
INSERT [dbo].[Customer_Name] ([CustomerID], [FirstName], [LastName]) VALUES (2, N'Shyam', N'Narayan')
GO
INSERT [dbo].[Customer_Name] ([CustomerID], [FirstName], [LastName]) VALUES (3, N'Mohan', N'Yadav')
GO
INSERT [dbo].[Customer_Name] ([CustomerID], [FirstName], [LastName]) VALUES (4, N'Radha', N'Kumari')
GO
INSERT [dbo].[Customer_PhoneNo] ([CustomerID], [PhoneNo]) VALUES (1, 9988776655)
GO
INSERT [dbo].[Customer_PhoneNo] ([CustomerID], [PhoneNo]) VALUES (2, 8899774455)
GO
INSERT [dbo].[Customer_PhoneNo] ([CustomerID], [PhoneNo]) VALUES (3, 7485967485)
GO
INSERT [dbo].[Customer_PhoneNo] ([CustomerID], [PhoneNo]) VALUES (3, 8585858596)
GO
INSERT [dbo].[Customer_PhoneNo] ([CustomerID], [PhoneNo]) VALUES (4, 9598754685)
GO
INSERT [dbo].[Customer_Policy_Purchase] ([CustomerID], [CustomerPolicyID]) VALUES (1, N'IN2W1001')
GO
INSERT [dbo].[Customer_Policy_Purchase] ([CustomerID], [CustomerPolicyID]) VALUES (2, N'IN4W1002')
GO
INSERT [dbo].[Customer_Policy_Purchase] ([CustomerID], [CustomerPolicyID]) VALUES (3, N'IN2W1003')
GO
INSERT [dbo].[Customer_Policy_Purchase] ([CustomerID], [CustomerPolicyID]) VALUES (4, N'IN4W1004')
GO
INSERT [dbo].[Customer_Vehicle_Ownership] ([CustomerID], [VehicleChesisNo]) VALUES (1, N'1425NHBG1235')
GO
INSERT [dbo].[Customer_Vehicle_Ownership] ([CustomerID], [VehicleChesisNo]) VALUES (2, N'2536BGFC9652')
GO
INSERT [dbo].[Customer_Vehicle_Ownership] ([CustomerID], [VehicleChesisNo]) VALUES (3, N'8524MHBF1524')
GO
INSERT [dbo].[Customer_Vehicle_Ownership] ([CustomerID], [VehicleChesisNo]) VALUES (4, N'9685MNGS4123')
GO
INSERT [dbo].[CustomerPolicy] ([CustomerPolicyID], [PolicyID], [VehicleChesisNo]) VALUES (N'IN2W1001', 1000001, N'1425NHBG1235')
GO
INSERT [dbo].[CustomerPolicy] ([CustomerPolicyID], [PolicyID], [VehicleChesisNo]) VALUES (N'IN2W1003', 1000003, N'8524MHBF1524')
GO
INSERT [dbo].[CustomerPolicy] ([CustomerPolicyID], [PolicyID], [VehicleChesisNo]) VALUES (N'IN4W1002', 1000002, N'2536BGFC9652')
GO
INSERT [dbo].[CustomerPolicy] ([CustomerPolicyID], [PolicyID], [VehicleChesisNo]) VALUES (N'IN4W1004', 1000004, N'9685MNGS4123')
GO
INSERT [dbo].[CustomerPolicy_Details] ([CustomerPolicyID], [PolicyStartDate], [PolicyEndDate], [InsuredDeclaredValue], [Status]) VALUES (N'IN2W1001', CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2023-11-04T00:00:00.000' AS DateTime), CAST(80000.00 AS Decimal(8, 2)), N'Active')
GO
INSERT [dbo].[CustomerPolicy_Details] ([CustomerPolicyID], [PolicyStartDate], [PolicyEndDate], [InsuredDeclaredValue], [Status]) VALUES (N'IN2W1003', CAST(N'2023-04-12T00:00:00.000' AS DateTime), CAST(N'2024-04-11T00:00:00.000' AS DateTime), CAST(400000.00 AS Decimal(8, 2)), N'Active')
GO
INSERT [dbo].[CustomerPolicy_Details] ([CustomerPolicyID], [PolicyStartDate], [PolicyEndDate], [InsuredDeclaredValue], [Status]) VALUES (N'IN4W1002', CAST(N'2023-05-12T00:00:00.000' AS DateTime), CAST(N'2027-04-11T00:00:00.000' AS DateTime), CAST(850000.00 AS Decimal(8, 2)), N'Active')
GO
INSERT [dbo].[CustomerPolicy_Details] ([CustomerPolicyID], [PolicyStartDate], [PolicyEndDate], [InsuredDeclaredValue], [Status]) VALUES (N'IN4W1004', CAST(N'2021-04-21T00:00:00.000' AS DateTime), CAST(N'2022-03-20T00:00:00.000' AS DateTime), CAST(400000.00 AS Decimal(8, 2)), N'Not Active')
GO
INSERT [dbo].[CustomerPolicy_Documents] ([CustomerPolicyID], [DocumentID], [DocumentName]) VALUES (N'IN2W1001', 1001, N'PolicyDocument')
GO
INSERT [dbo].[CustomerPolicy_Documents] ([CustomerPolicyID], [DocumentID], [DocumentName]) VALUES (N'IN2W1003', 1003, N'PolicyDocument')
GO
INSERT [dbo].[CustomerPolicy_Documents] ([CustomerPolicyID], [DocumentID], [DocumentName]) VALUES (N'IN4W1002', 1002, N'PolicyDocument')
GO
INSERT [dbo].[CustomerPolicy_Documents] ([CustomerPolicyID], [DocumentID], [DocumentName]) VALUES (N'IN4W1004', 1004, N'PolicyDocument')
GO
INSERT [dbo].[Policy] ([PolicyID], [Name], [TypeOfPolicy], [Premium]) VALUES (1000001, N'Own Damage Gold Package', N'2Wheeler', CAST(1500.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Policy] ([PolicyID], [Name], [TypeOfPolicy], [Premium]) VALUES (1000002, N'Third Party Gold Package', N'2Wheeler', CAST(2500.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Policy] ([PolicyID], [Name], [TypeOfPolicy], [Premium]) VALUES (1000003, N'Own Damage Silver Package', N'4Wheeler', CAST(10000.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Policy] ([PolicyID], [Name], [TypeOfPolicy], [Premium]) VALUES (1000004, N'Third Party Diamond Package', N'4Wheeler', CAST(25000.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Vehicle] ([VehicleChesisNo], [RegistrationNumber], [TypeOfVehicle], [Make], [Model], [PurchaseDate], [LastClaim]) VALUES (N'1425NHBG1235', N'MH12BH2525', N'Bike', N'Honda', 2005, CAST(N'2005-11-14T00:00:00.000' AS DateTime), CAST(N'2021-05-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Vehicle] ([VehicleChesisNo], [RegistrationNumber], [TypeOfVehicle], [Make], [Model], [PurchaseDate], [LastClaim]) VALUES (N'2536BGFC9652', N'DL14HB5241', N'Car', N'Toyota', 2009, CAST(N'2009-02-14T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Vehicle] ([VehicleChesisNo], [RegistrationNumber], [TypeOfVehicle], [Make], [Model], [PurchaseDate], [LastClaim]) VALUES (N'8524MHBF1524', N'HR14BV5241', N'Scooter', N'Hero', 2014, CAST(N'2014-05-14T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Vehicle] ([VehicleChesisNo], [RegistrationNumber], [TypeOfVehicle], [Make], [Model], [PurchaseDate], [LastClaim]) VALUES (N'9685MNGS4123', N'UP41BV4125', N'Jeep', N'Mahindra', 2020, CAST(N'2020-01-04T00:00:00.000' AS DateTime), NULL)
GO
ALTER TABLE [dbo].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_Claim_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Claim] CHECK CONSTRAINT [FK_Claim_Customer]
GO
ALTER TABLE [dbo].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_Claim_CustomerPolicy] FOREIGN KEY([CustomerPolicyID])
REFERENCES [dbo].[CustomerPolicy] ([CustomerPolicyID])
GO
ALTER TABLE [dbo].[Claim] CHECK CONSTRAINT [FK_Claim_CustomerPolicy]
GO
ALTER TABLE [dbo].[Claim_BankDetails]  WITH CHECK ADD  CONSTRAINT [FK_Claim_BankDetails_Claim] FOREIGN KEY([ClaimID])
REFERENCES [dbo].[Claim] ([ClaimID])
GO
ALTER TABLE [dbo].[Claim_BankDetails] CHECK CONSTRAINT [FK_Claim_BankDetails_Claim]
GO
ALTER TABLE [dbo].[Claim_Documents]  WITH CHECK ADD  CONSTRAINT [FK_Claim_Documents_Claim] FOREIGN KEY([ClaimID])
REFERENCES [dbo].[Claim] ([ClaimID])
GO
ALTER TABLE [dbo].[Claim_Documents] CHECK CONSTRAINT [FK_Claim_Documents_Claim]
GO
ALTER TABLE [dbo].[Claim_Intimation]  WITH CHECK ADD  CONSTRAINT [FK_ClaimIntimation_Claim] FOREIGN KEY([ClaimID])
REFERENCES [dbo].[Claim] ([ClaimID])
GO
ALTER TABLE [dbo].[Claim_Intimation] CHECK CONSTRAINT [FK_ClaimIntimation_Claim]
GO
ALTER TABLE [dbo].[Claim_Intimation]  WITH CHECK ADD  CONSTRAINT [FK_ClaimIntimation_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Claim_Intimation] CHECK CONSTRAINT [FK_ClaimIntimation_Customer]
GO
ALTER TABLE [dbo].[Customer_Address]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Address_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Customer_Address] CHECK CONSTRAINT [FK_Customer_Address_Customer]
GO
ALTER TABLE [dbo].[Customer_Documents]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Documents_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Customer_Documents] CHECK CONSTRAINT [FK_Customer_Documents_Customer]
GO
ALTER TABLE [dbo].[Customer_Name]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Name_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Customer_Name] CHECK CONSTRAINT [FK_Customer_Name_Customer]
GO
ALTER TABLE [dbo].[Customer_PhoneNo]  WITH CHECK ADD  CONSTRAINT [FK_Customer_PhoneNo_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Customer_PhoneNo] CHECK CONSTRAINT [FK_Customer_PhoneNo_Customer]
GO
ALTER TABLE [dbo].[Customer_Policy_Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Policy_Purchase_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Customer_Policy_Purchase] CHECK CONSTRAINT [FK_Customer_Policy_Purchase_Customer]
GO
ALTER TABLE [dbo].[Customer_Policy_Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Policy_Purchase_CustomerPolicy] FOREIGN KEY([CustomerPolicyID])
REFERENCES [dbo].[CustomerPolicy] ([CustomerPolicyID])
GO
ALTER TABLE [dbo].[Customer_Policy_Purchase] CHECK CONSTRAINT [FK_Customer_Policy_Purchase_CustomerPolicy]
GO
ALTER TABLE [dbo].[Customer_Vehicle_Ownership]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Vehicle_Ownership_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Customer_Vehicle_Ownership] CHECK CONSTRAINT [FK_Customer_Vehicle_Ownership_Customer]
GO
ALTER TABLE [dbo].[Customer_Vehicle_Ownership]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Vehicle_Ownership_Vehicle] FOREIGN KEY([VehicleChesisNo])
REFERENCES [dbo].[Vehicle] ([VehicleChesisNo])
GO
ALTER TABLE [dbo].[Customer_Vehicle_Ownership] CHECK CONSTRAINT [FK_Customer_Vehicle_Ownership_Vehicle]
GO
ALTER TABLE [dbo].[CustomerPolicy_Details]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPolicy_Details_CustomerPolicy] FOREIGN KEY([CustomerPolicyID])
REFERENCES [dbo].[CustomerPolicy] ([CustomerPolicyID])
GO
ALTER TABLE [dbo].[CustomerPolicy_Details] CHECK CONSTRAINT [FK_CustomerPolicy_Details_CustomerPolicy]
GO
ALTER TABLE [dbo].[CustomerPolicy_Documents]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPolicy_Documents_CustomerPolicy] FOREIGN KEY([CustomerPolicyID])
REFERENCES [dbo].[CustomerPolicy] ([CustomerPolicyID])
GO
ALTER TABLE [dbo].[CustomerPolicy_Documents] CHECK CONSTRAINT [FK_CustomerPolicy_Documents_CustomerPolicy]
GO
/****** Object:  StoredProcedure [dbo].[SSP_AddUpdatePolicy]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 4/Oct/2023
-- Description:	Add/Update Policy Details
-- =============================================
CREATE PROCEDURE [dbo].[SSP_AddUpdatePolicy]	
	@PolicyID bigint,
	@Name nvarchar(50),
	@TypeOFPolicy nvarchar(10),
	@Premium decimal(8,2)
AS
BEGIN    
	IF EXISTS (SELECT PolicyID FROM Policy WHERE PolicyID = @policyID)
		BEGIN
			UPDATE Policy
				SET PolicyID=@PolicyID,
					Name=@Name,
					TypeOfPolicy=@TypeOFPolicy,
					Premium=@Premium
				WHERE PolicyID=@PolicyID
		END
	ELSE
		BEGIN
			INSERT INTO Policy(PolicyID, Name, TypeOfPolicy, Premium)
						VALUES(@PolicyID, @Name, @TypeOFPolicy, @Premium)			
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_DeletePolicy]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 4/Oct/2023
-- Description:	Delete Policy 
-- =============================================
CREATE PROCEDURE [dbo].[SSP_DeletePolicy]	
@PolicyID nvarchar(8)
AS
	BEGIN    
		DELETE FROM Policy WHERE PolicyID=@PolicyID
	END
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetPolicy]    Script Date: 10/4/2023 10:35:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 4/Oct/2023
-- Description:	Get Policy Details
-- =============================================
CREATE PROCEDURE [dbo].[SSP_GetPolicy]	
AS
	BEGIN    
		SELECT PolicyID, Name, TypeOfPolicy, Premium
		FROM Policy
	END
GO
