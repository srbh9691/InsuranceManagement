USE [InsuranceManagement]
GO
/****** Object:  StoredProcedure [dbo].[SSP_ValidateUser]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_ValidateUser]
GO
/****** Object:  StoredProcedure [dbo].[SSP_UpdatePerson]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_UpdatePerson]
GO
/****** Object:  StoredProcedure [dbo].[SSP_MakePersonInactive]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_MakePersonInactive]
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetPolicy]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_GetPolicy]
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetPersonDetails]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_GetPersonDetails]
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetPassword]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_GetPassword]
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetEmployees]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_GetEmployees]
GO
/****** Object:  StoredProcedure [dbo].[SSP_DeletePolicy]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_DeletePolicy]
GO
/****** Object:  StoredProcedure [dbo].[SSP_AddUpdatePolicy]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_AddUpdatePolicy]
GO
/****** Object:  StoredProcedure [dbo].[SSP_AddPersonAccount]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_AddPersonAccount]
GO
/****** Object:  StoredProcedure [dbo].[GetPassword]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP PROCEDURE IF EXISTS [dbo].[GetPassword]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person_PhoneNo]') AND type in (N'U'))
ALTER TABLE [dbo].[Person_PhoneNo] DROP CONSTRAINT IF EXISTS [FK_Person_PhoneNo_Person]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person_Name]') AND type in (N'U'))
ALTER TABLE [dbo].[Person_Name] DROP CONSTRAINT IF EXISTS [FK_Person_Name_Person]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person_LoginInfo]') AND type in (N'U'))
ALTER TABLE [dbo].[Person_LoginInfo] DROP CONSTRAINT IF EXISTS [FK_Person_LoginInfo_Person]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Person_Address]') AND type in (N'U'))
ALTER TABLE [dbo].[Person_Address] DROP CONSTRAINT IF EXISTS [FK_Person_Address_Person]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT IF EXISTS [FK_Employee_Person]
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
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer_Documents]') AND type in (N'U'))
ALTER TABLE [dbo].[Customer_Documents] DROP CONSTRAINT IF EXISTS [FK_Customer_Documents_Customer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT IF EXISTS [FK_Customer_Person]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Claim_Intimation]') AND type in (N'U'))
ALTER TABLE [dbo].[Claim_Intimation] DROP CONSTRAINT IF EXISTS [FK_Claim_Intimation_Customer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Claim_Intimation]') AND type in (N'U'))
ALTER TABLE [dbo].[Claim_Intimation] DROP CONSTRAINT IF EXISTS [FK_Claim_Intimation_Claim]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Claim_Documents]') AND type in (N'U'))
ALTER TABLE [dbo].[Claim_Documents] DROP CONSTRAINT IF EXISTS [FK_Claim_Documents_Claim]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Claim_BankDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[Claim_BankDetails] DROP CONSTRAINT IF EXISTS [FK_Claim_BankDetails_Claim]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Claim]') AND type in (N'U'))
ALTER TABLE [dbo].[Claim] DROP CONSTRAINT IF EXISTS [FK_Claim_Employee]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Claim]') AND type in (N'U'))
ALTER TABLE [dbo].[Claim] DROP CONSTRAINT IF EXISTS [FK_Claim_CustomerPolicy]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Claim]') AND type in (N'U'))
ALTER TABLE [dbo].[Claim] DROP CONSTRAINT IF EXISTS [FK_Claim_Customer]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Claim]') AND type in (N'U'))
ALTER TABLE [dbo].[Claim] DROP CONSTRAINT IF EXISTS [FK_Claim_Claim]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Vehicle]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Policy]
GO
/****** Object:  Table [dbo].[Person_PhoneNo]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Person_PhoneNo]
GO
/****** Object:  Table [dbo].[Person_Name]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Person_Name]
GO
/****** Object:  Table [dbo].[Person_LoginInfo]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Person_LoginInfo]
GO
/****** Object:  Table [dbo].[Person_Address]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Person_Address]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Person]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Employee]
GO
/****** Object:  Table [dbo].[CustomerPolicy_Documents]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[CustomerPolicy_Documents]
GO
/****** Object:  Table [dbo].[CustomerPolicy_Details]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[CustomerPolicy_Details]
GO
/****** Object:  Table [dbo].[CustomerPolicy]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[CustomerPolicy]
GO
/****** Object:  Table [dbo].[Customer_Vehicle_Ownership]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Customer_Vehicle_Ownership]
GO
/****** Object:  Table [dbo].[Customer_Policy_Purchase]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Customer_Policy_Purchase]
GO
/****** Object:  Table [dbo].[Customer_Documents]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Customer_Documents]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Claim_Intimation]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Claim_Intimation]
GO
/****** Object:  Table [dbo].[Claim_Documents]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Claim_Documents]
GO
/****** Object:  Table [dbo].[Claim_BankDetails]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Claim_BankDetails]
GO
/****** Object:  Table [dbo].[Claim]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP TABLE IF EXISTS [dbo].[Claim]
GO
/****** Object:  User [Admin]    Script Date: 10/16/2023 12:50:55 AM ******/
DROP USER IF EXISTS [Admin]
GO
/****** Object:  User [Admin]    Script Date: 10/16/2023 12:50:55 AM ******/
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
/****** Object:  Table [dbo].[Claim]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claim](
	[ClaimID] [nvarchar](50) NOT NULL,
	[CustomerID] [nvarchar](20) NOT NULL,
	[CustomerPolicyID] [nvarchar](50) NOT NULL,
	[ApprovedBy] [nvarchar](20) NULL,
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
/****** Object:  Table [dbo].[Claim_BankDetails]    Script Date: 10/16/2023 12:50:55 AM ******/
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
/****** Object:  Table [dbo].[Claim_Documents]    Script Date: 10/16/2023 12:50:55 AM ******/
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
/****** Object:  Table [dbo].[Claim_Intimation]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claim_Intimation](
	[ClaimID] [nvarchar](50) NOT NULL,
	[CustomerID] [nvarchar](20) NOT NULL,
	[ClaimIntimationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ClaimIntimation] PRIMARY KEY CLUSTERED 
(
	[ClaimID] ASC,
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [nvarchar](20) NOT NULL,
	[PersonID] [bigint] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Documents]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Documents](
	[CustomerID] [nvarchar](20) NOT NULL,
	[DocumentID] [bigint] NOT NULL,
	[DocumentName] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Customer_Documents] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Policy_Purchase]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Policy_Purchase](
	[CustomerID] [nvarchar](20) NOT NULL,
	[CustomerPolicyID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customer_Policy_Purchase] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[CustomerPolicyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Vehicle_Ownership]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Vehicle_Ownership](
	[CustomerID] [nvarchar](20) NOT NULL,
	[VehicleChesisNo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customer_Vehicle_Ownership] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[VehicleChesisNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPolicy]    Script Date: 10/16/2023 12:50:55 AM ******/
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
/****** Object:  Table [dbo].[CustomerPolicy_Details]    Script Date: 10/16/2023 12:50:55 AM ******/
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
/****** Object:  Table [dbo].[CustomerPolicy_Documents]    Script Date: 10/16/2023 12:50:55 AM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [nvarchar](20) NOT NULL,
	[PersonId] [bigint] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [bigint] NOT NULL,
	[EmailId] [nvarchar](200) NOT NULL,
	[DateOfBirth] [datetime] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person_Address]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person_Address](
	[PersonID] [bigint] NOT NULL,
	[HouseNo] [nvarchar](50) NOT NULL,
	[Area] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Zip] [int] NOT NULL,
 CONSTRAINT [PK_Person_Address] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person_LoginInfo]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person_LoginInfo](
	[PersonId] [bigint] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Person_LoginInfo] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC,
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person_Name]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person_Name](
	[PersonID] [bigint] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Person_Name] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person_PhoneNo]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person_PhoneNo](
	[PersonID] [bigint] NOT NULL,
	[PhoneNo] [bigint] NOT NULL,
 CONSTRAINT [PK_Customer_PhoneNo] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC,
	[PhoneNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 10/16/2023 12:50:55 AM ******/
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
/****** Object:  Table [dbo].[Vehicle]    Script Date: 10/16/2023 12:50:55 AM ******/
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
INSERT [dbo].[Customer] ([CustomerID], [PersonID]) VALUES (N'C_100002', 100002)
GO
INSERT [dbo].[Employee] ([EmployeeId], [PersonId]) VALUES (N'E_100003', 100003)
GO
INSERT [dbo].[Employee] ([EmployeeId], [PersonId]) VALUES (N'E_100005', 100005)
GO
INSERT [dbo].[Employee] ([EmployeeId], [PersonId]) VALUES (N'E_100006', 100006)
GO
INSERT [dbo].[Person] ([PersonId], [EmailId], [DateOfBirth]) VALUES (100001, N's', CAST(N'1990-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Person] ([PersonId], [EmailId], [DateOfBirth]) VALUES (100002, N'saurabh.09gupta@gmail.com', CAST(N'1991-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Person] ([PersonId], [EmailId], [DateOfBirth]) VALUES (100003, N'a', CAST(N'2023-10-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Person] ([PersonId], [EmailId], [DateOfBirth]) VALUES (100004, N'b', CAST(N'2023-10-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Person] ([PersonId], [EmailId], [DateOfBirth]) VALUES (100005, N'b1', CAST(N'2023-10-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Person] ([PersonId], [EmailId], [DateOfBirth]) VALUES (100006, N'2', CAST(N'2023-10-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Person_Address] ([PersonID], [HouseNo], [Area], [City], [Zip]) VALUES (100002, N'89', N'agra', N'agra', 282001)
GO
INSERT [dbo].[Person_Address] ([PersonID], [HouseNo], [Area], [City], [Zip]) VALUES (100003, N'1', N'1', N' 1', 1)
GO
INSERT [dbo].[Person_Address] ([PersonID], [HouseNo], [Area], [City], [Zip]) VALUES (100005, N'1', N'1', N' 1', 1)
GO
INSERT [dbo].[Person_Address] ([PersonID], [HouseNo], [Area], [City], [Zip]) VALUES (100006, N'1', N'1', N' 1', 1)
GO
INSERT [dbo].[Person_LoginInfo] ([PersonId], [UserName], [Password], [IsActive]) VALUES (100002, N's', N's', 1)
GO
INSERT [dbo].[Person_LoginInfo] ([PersonId], [UserName], [Password], [IsActive]) VALUES (100003, N'a', N'a', 0)
GO
INSERT [dbo].[Person_LoginInfo] ([PersonId], [UserName], [Password], [IsActive]) VALUES (100004, N'b', N'b', 1)
GO
INSERT [dbo].[Person_LoginInfo] ([PersonId], [UserName], [Password], [IsActive]) VALUES (100005, N'b1', N'b1', 1)
GO
INSERT [dbo].[Person_LoginInfo] ([PersonId], [UserName], [Password], [IsActive]) VALUES (100006, N'2', N'2', 1)
GO
INSERT [dbo].[Person_Name] ([PersonID], [FirstName], [LastName]) VALUES (100002, N's', N'g')
GO
INSERT [dbo].[Person_Name] ([PersonID], [FirstName], [LastName]) VALUES (100003, N'a', N'a')
GO
INSERT [dbo].[Person_Name] ([PersonID], [FirstName], [LastName]) VALUES (100004, N'b', N'b')
GO
INSERT [dbo].[Person_Name] ([PersonID], [FirstName], [LastName]) VALUES (100005, N'b', N'b')
GO
INSERT [dbo].[Person_Name] ([PersonID], [FirstName], [LastName]) VALUES (100006, N'3', N'3')
GO
INSERT [dbo].[Person_PhoneNo] ([PersonID], [PhoneNo]) VALUES (100002, 1234567890)
GO
INSERT [dbo].[Person_PhoneNo] ([PersonID], [PhoneNo]) VALUES (100002, 9874563210)
GO
INSERT [dbo].[Person_PhoneNo] ([PersonID], [PhoneNo]) VALUES (100003, 1)
GO
INSERT [dbo].[Person_PhoneNo] ([PersonID], [PhoneNo]) VALUES (100003, 2)
GO
INSERT [dbo].[Person_PhoneNo] ([PersonID], [PhoneNo]) VALUES (100005, 4)
GO
INSERT [dbo].[Person_PhoneNo] ([PersonID], [PhoneNo]) VALUES (100005, 5)
GO
INSERT [dbo].[Person_PhoneNo] ([PersonID], [PhoneNo]) VALUES (100006, 2)
GO
INSERT [dbo].[Person_PhoneNo] ([PersonID], [PhoneNo]) VALUES (100006, 4)
GO
INSERT [dbo].[Policy] ([PolicyID], [Name], [TypeOfPolicy], [Premium]) VALUES (1, N'E0000003', N'ds', CAST(22.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Policy] ([PolicyID], [Name], [TypeOfPolicy], [Premium]) VALUES (2, N'E0000004', N'sd', CAST(23.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Policy] ([PolicyID], [Name], [TypeOfPolicy], [Premium]) VALUES (6, N'E0000001', N'lkjkh', CAST(52.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Policy] ([PolicyID], [Name], [TypeOfPolicy], [Premium]) VALUES (7, N'2 Wheeler Gold', N'2 Wheeler', CAST(2500.00 AS Decimal(8, 2)))
GO
ALTER TABLE [dbo].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_Claim_Claim] FOREIGN KEY([ClaimID])
REFERENCES [dbo].[Claim] ([ClaimID])
GO
ALTER TABLE [dbo].[Claim] CHECK CONSTRAINT [FK_Claim_Claim]
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
ALTER TABLE [dbo].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_Claim_Employee] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Claim] CHECK CONSTRAINT [FK_Claim_Employee]
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
ALTER TABLE [dbo].[Claim_Intimation]  WITH CHECK ADD  CONSTRAINT [FK_Claim_Intimation_Claim] FOREIGN KEY([ClaimID])
REFERENCES [dbo].[Claim] ([ClaimID])
GO
ALTER TABLE [dbo].[Claim_Intimation] CHECK CONSTRAINT [FK_Claim_Intimation_Claim]
GO
ALTER TABLE [dbo].[Claim_Intimation]  WITH CHECK ADD  CONSTRAINT [FK_Claim_Intimation_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Claim_Intimation] CHECK CONSTRAINT [FK_Claim_Intimation_Customer]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Person]
GO
ALTER TABLE [dbo].[Customer_Documents]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Documents_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Customer_Documents] CHECK CONSTRAINT [FK_Customer_Documents_Customer]
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
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Person]
GO
ALTER TABLE [dbo].[Person_Address]  WITH CHECK ADD  CONSTRAINT [FK_Person_Address_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Person_Address] CHECK CONSTRAINT [FK_Person_Address_Person]
GO
ALTER TABLE [dbo].[Person_LoginInfo]  WITH CHECK ADD  CONSTRAINT [FK_Person_LoginInfo_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Person_LoginInfo] CHECK CONSTRAINT [FK_Person_LoginInfo_Person]
GO
ALTER TABLE [dbo].[Person_Name]  WITH CHECK ADD  CONSTRAINT [FK_Person_Name_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Person_Name] CHECK CONSTRAINT [FK_Person_Name_Person]
GO
ALTER TABLE [dbo].[Person_PhoneNo]  WITH CHECK ADD  CONSTRAINT [FK_Person_PhoneNo_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Person_PhoneNo] CHECK CONSTRAINT [FK_Person_PhoneNo_Person]
GO
/****** Object:  StoredProcedure [dbo].[GetPassword]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 13/Oct/2023
-- Description:	Get Password
-- =============================================
CREATE PROCEDURE [dbo].[GetPassword]
	@EmailId nvarchar(200)
AS
BEGIN
	SELECT Password FROM Person_LoginInfo WHERE PersonId 
	IN (SELECT PersonId FROM Person WHERE EmailId = @EmailId)	 
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_AddPersonAccount]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 12-Oct-2023
-- Description:	Add person account to person tables
-- =============================================
CREATE PROCEDURE [dbo].[SSP_AddPersonAccount]
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@PhoneNo nvarchar(MAX),
	@UserName nvarchar(50),
	@Password nvarchar(50),
	@IsActive bit,
	@EmailId nvarchar(200),
	@DateOfBirth datetime,
	@HouseNo nvarchar(50),
	@Area nvarchar(50),
	@City nvarchar(50),
	@Zip int,
	@IsCustomer bit
AS
BEGIN
	DECLARE @PersonId bigint
	SELECT @PersonId=PersonId FROM Person WHERE EmailId=@EmailId
	IF (@PersonId IS NULL)
	BEGIN
		SELECT @PersonId=PersonId FROM Person_LoginInfo WHERE UserName=@UserName
	END

	IF (@PersonId IS NULL)
	BEGIN
	SET @PersonId = (SELECT MAX(PersonId) From Person) + 1

	INSERT INTO Person(PersonId, EmailId, DateOfBirth)
			VALUES(@PersonId, @EmailId, @DateOfBirth)
    
	INSERT INTO Person_LoginInfo(PersonId, UserName, Password, IsActive)
			VALUES(@PersonId, @UserName, @Password, @IsActive)

	INSERT INTO Person_Name(PersonId, FirstName, LastName)
			VALUES(@PersonId, @FirstName, @LastName)

	DELETE FROM Person_PhoneNo WHERE [PersonId]=@PersonId
	INSERT INTO Person_PhoneNo(PersonId, PhoneNo)
	SELECT @PersonId as PersonId, value as PhoneNo FROM STRING_SPLIT(@PhoneNo, ',')

	INSERT INTO Person_Address(PersonId, HouseNo, Area, City, Zip)
			VALUES(@PersonId, @HouseNo, @Area, @City, @Zip)

	IF (@IsCustomer = 1)
		BEGIN
			INSERT INTO [Customer]([CustomerId],[PersonId])
				 VALUES('C_'+CAST(@PersonId as nvarchar), @PersonId)
		END
		ELSE
		BEGIN
			INSERT INTO [Employee]([EmployeeId],[PersonId])
				 VALUES('E_'+CAST(@PersonId as nvarchar), @PersonId)
		END
	END
	ELSE
	BEGIN
		PRINT 'USER EXISTS'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_AddUpdatePolicy]    Script Date: 10/16/2023 12:50:55 AM ******/
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
				SET Name=@Name,
					TypeOfPolicy=@TypeOFPolicy,
					Premium=@Premium
				WHERE PolicyID=@PolicyID
		END
	ELSE
		BEGIN
			DECLARE @NewPolicyID AS bigint 	
			SET @NewPolicyID = (SELECT MAX(PolicyID) From Policy) + 1
			INSERT INTO Policy(PolicyID, Name, TypeOfPolicy, Premium)
						VALUES(@NewPolicyID, @Name, @TypeOFPolicy, @Premium)			
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_DeletePolicy]    Script Date: 10/16/2023 12:50:55 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SSP_GetEmployees]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 12/Oct/2023
-- Description:	Get all Employee details
-- =============================================
CREATE PROCEDURE [dbo].[SSP_GetEmployees]
AS
BEGIN	
	SELECT P.PersonId
		  ,UserName
		  ,EmailId
		  ,DateOfBirth
		  ,FirstName
		  ,LastName
		  ,(SELECT STRING_AGG(PhoneNo, ',') FROM Person_PhoneNo WHERE PersonId=P.PersonId) AS PhoneNo
		  ,IsActive
	  FROM Person P
	  INNER JOIN Person_Name PN ON P.PersonId=PN.PersonId
	  INNER JOIN Person_LoginInfo PLI ON P.PersonId=PLI.PersonId
	  INNER JOIN Employee E ON P.PersonId=E.PersonId
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetPassword]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 13/Oct/2023
-- Description:	Get Password
-- =============================================
CREATE PROCEDURE [dbo].[SSP_GetPassword]
	@EmailId nvarchar(200)
AS
BEGIN
	SELECT Password FROM Person_LoginInfo WHERE PersonId 
	IN (SELECT PersonId FROM Person WHERE EmailId = @EmailId)	 
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetPersonDetails]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 13/Oct/2023
-- Description:	Get Password
-- =============================================
CREATE PROCEDURE [dbo].[SSP_GetPersonDetails]
	@PersonId bigint
AS
BEGIN
	SELECT P.PersonId
		  ,UserName
		  ,Password
		  ,EmailId
		  ,DateOfBirth
		  ,FirstName
		  ,LastName
		  ,(SELECT STRING_AGG(PhoneNo, ',') FROM Person_PhoneNo WHERE PersonId=@PersonId) AS PhoneNo
	  FROM Person P
	  INNER JOIN Person_Name PN ON P.PersonId=PN.PersonId
	  INNER JOIN Person_LoginInfo PLI ON P.PersonId=PLI.PersonId
	 WHERE P.PersonId=@PersonId
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetPolicy]    Script Date: 10/16/2023 12:50:55 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SSP_MakePersonInactive]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 15/Oct/2023
-- Description:	Make Person Inactive
-- =============================================
CREATE PROCEDURE [dbo].[SSP_MakePersonInactive]
	@PersonId nvarchar(20),
	@IsActive bit
AS
BEGIN
	IF EXISTS(SELECT PersonId FROM Person WHERE PersonId=@PersonId)
	BEGIN
		UPDATE Person_LoginInfo SET @IsActive=0 WHERE @PersonId=PersonId
	END
	ELSE
	BEGIN
		PRINT 'USER DOES NOT EXISTS'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_UpdatePerson]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 15/Oct/2023
-- Description:	Updates the person
-- =============================================
CREATE PROCEDURE [dbo].[SSP_UpdatePerson]
	@PersonId bigint,
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@PhoneNo nvarchar(max),
	@UserName nvarchar(50),
	@Password nvarchar(50),
	@IsActive bit,
	@EmailId nvarchar(200),
	@DateOfBirth datetime,
	@HouseNo nvarchar(50),
	@Area nvarchar(50),
	@City nvarchar(50),
	@Zip int,
	@IsCustomer bit	
	
AS
BEGIN
	IF EXISTS(SELECT PersonId FROM Person WHERE PersonId=@PersonId)
	BEGIN

		UPDATE Person
		   SET EmailId = @EmailId
			  ,DateOfBirth = @DateOfBirth
		 WHERE PersonId=@PersonId

		UPDATE Person_LoginInfo
		   SET UserName=@UserName
		      ,Password=@Password,
			   IsActive=@IsActive
		 WHERE PersonId=@PersonId

		UPDATE Person_Name
		   SET FirstName=@FirstName
		      ,LastName=@LastName
		 WHERE PersonId=@PersonId

		DELETE FROM Person_PhoneNo WHERE PersonId=@PersonId
		INSERT INTO Person_PhoneNo(PersonId,PhoneNo)
		SELECT @PersonId as PersonId, value as PhoneNo FROM STRING_SPLIT(@PhoneNo, ',')

		UPDATE Person_Address
		   SET HouseNo=@HouseNo,
		       Area=@Area,
			   City=@City,
			   Zip=@Zip
		 WHERE PersonId=@PersonId

	END
	ELSE
	BEGIN
		PRINT 'USER DOES NOT EXISTS'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_ValidateUser]    Script Date: 10/16/2023 12:50:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 12/Oct/2023
-- Description:	Validates the user
-- =============================================
CREATE PROCEDURE [dbo].[SSP_ValidateUser]
	@UserName nvarchar(50),
	@Password nvarchar(50)
AS
BEGIN
    IF EXISTS (SELECT PersonId FROM Person_LoginInfo WHERE UserName=@UserName AND Password=@Password)
	BEGIN
		 DECLARE @PersonId bigint
		 DECLARE @IsCustomer bit
		 SELECT @PersonId=PersonId FROM Person_LoginInfo WHERE UserName=@UserName AND Password=@Password
		 IF EXISTS (SELECT * FROM [Customer] WHERE [PersonId]=@PersonId)
			SET @IsCustomer=1
		 ELSE
			SET @IsCustomer=0

		 SELECT N.PersonId, N.FirstName, @IsCustomer As IsCustomer
		 FROM   Person_LoginInfo LI INNER JOIN Person_Name N ON LI.PersonId=N.PersonId
		 WHERE  UserName=@UserName AND Password=@Password AND IsActive=1		 
	END
	ELSE
	BEGIN
		SELECT 0 AS PersonId, '' AS FirstName
	END
END
GO
