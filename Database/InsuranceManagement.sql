USE [InsuranceManagement]
GO
/****** Object:  StoredProcedure [dbo].[SSP_ValidateUser]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_ValidateUser]
GO
/****** Object:  StoredProcedure [dbo].[SSP_UpdateVehicle]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_UpdateVehicle]
GO
/****** Object:  StoredProcedure [dbo].[SSP_UpdatePerson]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_UpdatePerson]
GO
/****** Object:  StoredProcedure [dbo].[SSP_PurchasePolicy]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_PurchasePolicy]
GO
/****** Object:  StoredProcedure [dbo].[SSP_MakePersonInactive]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_MakePersonInactive]
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetPurchasedPolicies]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_GetPurchasedPolicies]
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetPolicy]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_GetPolicy]
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetPersonDetails]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_GetPersonDetails]
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetPassword]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_GetPassword]
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetEmployees]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_GetEmployees]
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetCustomerVehicles]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_GetCustomerVehicles]
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetCustomerInfo]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_GetCustomerInfo]
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetClaims]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_GetClaims]
GO
/****** Object:  StoredProcedure [dbo].[SSP_DeleteVehicle]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_DeleteVehicle]
GO
/****** Object:  StoredProcedure [dbo].[SSP_DeletePolicy]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_DeletePolicy]
GO
/****** Object:  StoredProcedure [dbo].[SSP_ApproveClaim]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_ApproveClaim]
GO
/****** Object:  StoredProcedure [dbo].[SSP_AddVehicle]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_AddVehicle]
GO
/****** Object:  StoredProcedure [dbo].[SSP_AddUpdatePolicy]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_AddUpdatePolicy]
GO
/****** Object:  StoredProcedure [dbo].[SSP_AddPersonAccount]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_AddPersonAccount]
GO
/****** Object:  StoredProcedure [dbo].[SSP_AddClaim]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[SSP_AddClaim]
GO
/****** Object:  StoredProcedure [dbo].[GetPassword]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[Vehicle]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[Vehicle]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[Policy]
GO
/****** Object:  Table [dbo].[Person_PhoneNo]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[Person_PhoneNo]
GO
/****** Object:  Table [dbo].[Person_Name]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[Person_Name]
GO
/****** Object:  Table [dbo].[Person_LoginInfo]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[Person_LoginInfo]
GO
/****** Object:  Table [dbo].[Person_Address]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[Person_Address]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[Person]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[Employee]
GO
/****** Object:  Table [dbo].[CustomerPolicy_Documents]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[CustomerPolicy_Documents]
GO
/****** Object:  Table [dbo].[CustomerPolicy_Details]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[CustomerPolicy_Details]
GO
/****** Object:  Table [dbo].[CustomerPolicy]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[CustomerPolicy]
GO
/****** Object:  Table [dbo].[Customer_Vehicle_Ownership]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[Customer_Vehicle_Ownership]
GO
/****** Object:  Table [dbo].[Customer_Policy_Purchase]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[Customer_Policy_Purchase]
GO
/****** Object:  Table [dbo].[Customer_Documents]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[Customer_Documents]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Claim_Intimation]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[Claim_Intimation]
GO
/****** Object:  Table [dbo].[Claim_Documents]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[Claim_Documents]
GO
/****** Object:  Table [dbo].[Claim_BankDetails]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[Claim_BankDetails]
GO
/****** Object:  Table [dbo].[Claim]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP TABLE IF EXISTS [dbo].[Claim]
GO
/****** Object:  User [Admin]    Script Date: 10/29/2023 11:08:28 PM ******/
DROP USER IF EXISTS [Admin]
GO
/****** Object:  User [Admin]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[Claim]    Script Date: 10/29/2023 11:08:28 PM ******/
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
	[SettlementStatus] [bit] NOT NULL,
	[ClaimAmount] [decimal](8, 2) NOT NULL,
	[ApprovedAmount] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_Claim_1] PRIMARY KEY CLUSTERED 
(
	[ClaimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Claim_BankDetails]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[Claim_Documents]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[Claim_Intimation]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[Customer_Documents]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[Customer_Policy_Purchase]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[Customer_Vehicle_Ownership]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[CustomerPolicy]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[CustomerPolicy_Details]    Script Date: 10/29/2023 11:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPolicy_Details](
	[CustomerPolicyID] [nvarchar](50) NOT NULL,
	[PolicyStartDate] [datetime] NOT NULL,
	[PolicyEndDate] [datetime] NOT NULL,
	[InsuredDeclaredValue] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_Customer_PolicyDetails] PRIMARY KEY CLUSTERED 
(
	[CustomerPolicyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerPolicy_Documents]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[Person]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[Person_Address]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[Person_LoginInfo]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[Person_Name]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[Person_PhoneNo]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[Policy]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  Table [dbo].[Vehicle]    Script Date: 10/29/2023 11:08:28 PM ******/
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
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[VehicleChesisNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Claim] ([ClaimID], [CustomerID], [CustomerPolicyID], [ApprovedBy], [ClaimType], [DamageDetails], [SettlementStatus], [ClaimAmount], [ApprovedAmount]) VALUES (N'C_1004_20231029013623', N'C_1004', N'2_RG1414AR969_20231029', N'E_1003', N'2 Wheeler', N'Bumper damage', 1, CAST(14000.00 AS Decimal(8, 2)), CAST(13500.00 AS Decimal(8, 2)))
INSERT [dbo].[Claim] ([ClaimID], [CustomerID], [CustomerPolicyID], [ApprovedBy], [ClaimType], [DamageDetails], [SettlementStatus], [ClaimAmount], [ApprovedAmount]) VALUES (N'C_1005_20231029013430', N'C_1005', N'4_VV78Shyam78_20231029', NULL, N'4 Wheeler', N'Door Damage', 0, CAST(10000.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Claim_BankDetails] ([ClaimID], [IFSCCode], [AccountNo], [AccountHolderName]) VALUES (N'C_1004_20231029013623', N'HGDS8585', 78778787878, N'Ram Gupta')
INSERT [dbo].[Claim_BankDetails] ([ClaimID], [IFSCCode], [AccountNo], [AccountHolderName]) VALUES (N'C_1005_20231029013430', N'IFSC1010', 1000000, N'ABC Gupta')
GO
INSERT [dbo].[Claim_Intimation] ([ClaimID], [CustomerID], [ClaimIntimationDate]) VALUES (N'C_1004_20231029013623', N'C_1004', CAST(N'2023-10-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Claim_Intimation] ([ClaimID], [CustomerID], [ClaimIntimationDate]) VALUES (N'C_1005_20231029013430', N'C_1005', CAST(N'2023-10-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer] ([CustomerID], [PersonID]) VALUES (N'C_1004', 1004)
INSERT [dbo].[Customer] ([CustomerID], [PersonID]) VALUES (N'C_1005', 1005)
GO
INSERT [dbo].[Customer_Policy_Purchase] ([CustomerID], [CustomerPolicyID]) VALUES (N'C_1004', N'1_PP7887GH12_20231029')
INSERT [dbo].[Customer_Policy_Purchase] ([CustomerID], [CustomerPolicyID]) VALUES (N'C_1004', N'1_PP7887GH12_2023102922')
INSERT [dbo].[Customer_Policy_Purchase] ([CustomerID], [CustomerPolicyID]) VALUES (N'C_1004', N'2_RG1414AR969_20231029')
INSERT [dbo].[Customer_Policy_Purchase] ([CustomerID], [CustomerPolicyID]) VALUES (N'C_1005', N'3_Shyam85VT10_20231029')
INSERT [dbo].[Customer_Policy_Purchase] ([CustomerID], [CustomerPolicyID]) VALUES (N'C_1005', N'4_VV78Shyam78_20231029')
GO
INSERT [dbo].[Customer_Vehicle_Ownership] ([CustomerID], [VehicleChesisNo]) VALUES (N'C_1004', N'PP7887GH12')
INSERT [dbo].[Customer_Vehicle_Ownership] ([CustomerID], [VehicleChesisNo]) VALUES (N'C_1004', N'RG1414AR969')
INSERT [dbo].[Customer_Vehicle_Ownership] ([CustomerID], [VehicleChesisNo]) VALUES (N'C_1005', N'Shyam85VT10')
INSERT [dbo].[Customer_Vehicle_Ownership] ([CustomerID], [VehicleChesisNo]) VALUES (N'C_1005', N'VV78Shyam78')
GO
INSERT [dbo].[CustomerPolicy] ([CustomerPolicyID], [PolicyID], [VehicleChesisNo]) VALUES (N'1_PP7887GH12_20231029', 1, N'PP7887GH12')
INSERT [dbo].[CustomerPolicy] ([CustomerPolicyID], [PolicyID], [VehicleChesisNo]) VALUES (N'1_PP7887GH12_2023102922', 1, N'PP7887GH12')
INSERT [dbo].[CustomerPolicy] ([CustomerPolicyID], [PolicyID], [VehicleChesisNo]) VALUES (N'2_RG1414AR969_20231029', 2, N'RG1414AR969')
INSERT [dbo].[CustomerPolicy] ([CustomerPolicyID], [PolicyID], [VehicleChesisNo]) VALUES (N'3_Shyam85VT10_20231029', 3, N'Shyam85VT10')
INSERT [dbo].[CustomerPolicy] ([CustomerPolicyID], [PolicyID], [VehicleChesisNo]) VALUES (N'4_VV78Shyam78_20231029', 4, N'VV78Shyam78')
GO
INSERT [dbo].[CustomerPolicy_Details] ([CustomerPolicyID], [PolicyStartDate], [PolicyEndDate], [InsuredDeclaredValue]) VALUES (N'1_PP7887GH12_20231029', CAST(N'2023-10-02T18:30:00.000' AS DateTime), CAST(N'2023-10-20T18:30:00.000' AS DateTime), CAST(45210.00 AS Decimal(8, 2)))
INSERT [dbo].[CustomerPolicy_Details] ([CustomerPolicyID], [PolicyStartDate], [PolicyEndDate], [InsuredDeclaredValue]) VALUES (N'1_PP7887GH12_2023102922', CAST(N'2023-10-28T18:30:00.000' AS DateTime), CAST(N'2024-10-07T18:30:00.000' AS DateTime), CAST(40000.00 AS Decimal(8, 2)))
INSERT [dbo].[CustomerPolicy_Details] ([CustomerPolicyID], [PolicyStartDate], [PolicyEndDate], [InsuredDeclaredValue]) VALUES (N'2_RG1414AR969_20231029', CAST(N'2023-10-01T18:30:00.000' AS DateTime), CAST(N'2023-10-19T18:30:00.000' AS DateTime), CAST(411100.00 AS Decimal(8, 2)))
INSERT [dbo].[CustomerPolicy_Details] ([CustomerPolicyID], [PolicyStartDate], [PolicyEndDate], [InsuredDeclaredValue]) VALUES (N'3_Shyam85VT10_20231029', CAST(N'2023-10-10T18:30:00.000' AS DateTime), CAST(N'2024-10-28T18:30:00.000' AS DateTime), CAST(55000.00 AS Decimal(8, 2)))
INSERT [dbo].[CustomerPolicy_Details] ([CustomerPolicyID], [PolicyStartDate], [PolicyEndDate], [InsuredDeclaredValue]) VALUES (N'4_VV78Shyam78_20231029', CAST(N'2023-10-10T18:30:00.000' AS DateTime), CAST(N'2023-10-13T18:30:00.000' AS DateTime), CAST(800000.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Employee] ([EmployeeId], [PersonId]) VALUES (N'E_1002', 1002)
INSERT [dbo].[Employee] ([EmployeeId], [PersonId]) VALUES (N'E_1003', 1003)
INSERT [dbo].[Employee] ([EmployeeId], [PersonId]) VALUES (N'E_1006', 1006)
GO
INSERT [dbo].[Person] ([PersonId], [EmailId], [DateOfBirth]) VALUES (1001, N'Admin@gmail.com', CAST(N'2000-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Person] ([PersonId], [EmailId], [DateOfBirth]) VALUES (1002, N'saurabh.09gupta@gmail.com', CAST(N'1991-06-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Person] ([PersonId], [EmailId], [DateOfBirth]) VALUES (1003, N'a', CAST(N'2023-10-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Person] ([PersonId], [EmailId], [DateOfBirth]) VALUES (1004, N'customer@gmail.com', CAST(N'1993-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Person] ([PersonId], [EmailId], [DateOfBirth]) VALUES (1005, N'v', CAST(N'2001-07-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Person] ([PersonId], [EmailId], [DateOfBirth]) VALUES (1006, N'Test', CAST(N'2023-10-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Person_Address] ([PersonID], [HouseNo], [Area], [City], [Zip]) VALUES (1001, N'1234', N'Test', N'Test', 200006)
INSERT [dbo].[Person_Address] ([PersonID], [HouseNo], [Area], [City], [Zip]) VALUES (1002, N'1103', N'IRIS', N'Pune', 411013)
INSERT [dbo].[Person_Address] ([PersonID], [HouseNo], [Area], [City], [Zip]) VALUES (1003, N'h', N'h', N'h', 85)
INSERT [dbo].[Person_Address] ([PersonID], [HouseNo], [Area], [City], [Zip]) VALUES (1004, N'7', N'ibs', N'Pune', 412365)
INSERT [dbo].[Person_Address] ([PersonID], [HouseNo], [Area], [City], [Zip]) VALUES (1005, N'v', N'v', N'v', 4)
INSERT [dbo].[Person_Address] ([PersonID], [HouseNo], [Area], [City], [Zip]) VALUES (1006, N'Test', N'Test', N'Test', 52)
GO
INSERT [dbo].[Person_LoginInfo] ([PersonId], [UserName], [Password], [IsActive]) VALUES (1001, N'Admin', N'Admin', 1)
INSERT [dbo].[Person_LoginInfo] ([PersonId], [UserName], [Password], [IsActive]) VALUES (1002, N'sg', N'sg', 1)
INSERT [dbo].[Person_LoginInfo] ([PersonId], [UserName], [Password], [IsActive]) VALUES (1003, N'a', N'a', 1)
INSERT [dbo].[Person_LoginInfo] ([PersonId], [UserName], [Password], [IsActive]) VALUES (1004, N'c', N'c', 1)
INSERT [dbo].[Person_LoginInfo] ([PersonId], [UserName], [Password], [IsActive]) VALUES (1005, N'v', N'v', 1)
INSERT [dbo].[Person_LoginInfo] ([PersonId], [UserName], [Password], [IsActive]) VALUES (1006, N'Test', N'Test', 0)
GO
INSERT [dbo].[Person_Name] ([PersonID], [FirstName], [LastName]) VALUES (1001, N'Admin', N'Admin')
INSERT [dbo].[Person_Name] ([PersonID], [FirstName], [LastName]) VALUES (1002, N'Saurabh', N'Gupta')
INSERT [dbo].[Person_Name] ([PersonID], [FirstName], [LastName]) VALUES (1003, N'a', N'a')
INSERT [dbo].[Person_Name] ([PersonID], [FirstName], [LastName]) VALUES (1004, N'Ram', N'Gupta')
INSERT [dbo].[Person_Name] ([PersonID], [FirstName], [LastName]) VALUES (1005, N'Shyam', N'Gupta')
INSERT [dbo].[Person_Name] ([PersonID], [FirstName], [LastName]) VALUES (1006, N'Test', N'Test')
GO
INSERT [dbo].[Person_PhoneNo] ([PersonID], [PhoneNo]) VALUES (1001, 9000000006)
INSERT [dbo].[Person_PhoneNo] ([PersonID], [PhoneNo]) VALUES (1002, 9852367410)
INSERT [dbo].[Person_PhoneNo] ([PersonID], [PhoneNo]) VALUES (1003, 43434343)
INSERT [dbo].[Person_PhoneNo] ([PersonID], [PhoneNo]) VALUES (1004, 986533212)
INSERT [dbo].[Person_PhoneNo] ([PersonID], [PhoneNo]) VALUES (1005, 9)
INSERT [dbo].[Person_PhoneNo] ([PersonID], [PhoneNo]) VALUES (1006, 36)
GO
INSERT [dbo].[Policy] ([PolicyID], [Name], [TypeOfPolicy], [Premium]) VALUES (1, N'2W Gold', N'2 Wheeler', CAST(900.00 AS Decimal(8, 2)))
INSERT [dbo].[Policy] ([PolicyID], [Name], [TypeOfPolicy], [Premium]) VALUES (2, N'4W Gold', N'4 Wheeler', CAST(8000.00 AS Decimal(8, 2)))
INSERT [dbo].[Policy] ([PolicyID], [Name], [TypeOfPolicy], [Premium]) VALUES (3, N'2W Third Party', N'2 Wheeler', CAST(600.00 AS Decimal(8, 2)))
INSERT [dbo].[Policy] ([PolicyID], [Name], [TypeOfPolicy], [Premium]) VALUES (4, N'4W Third Party', N'4 Wheeler', CAST(4000.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Vehicle] ([VehicleChesisNo], [RegistrationNumber], [TypeOfVehicle], [Make], [Model], [PurchaseDate]) VALUES (N'PP7887GH12', N'MH09HB8521', N'4 Wheeler', N'Totota', 2015, CAST(N'2015-03-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Vehicle] ([VehicleChesisNo], [RegistrationNumber], [TypeOfVehicle], [Make], [Model], [PurchaseDate]) VALUES (N'RG1414AR969', N'MH12VV8052', N'2 Wheeler', N'Honda', 2016, CAST(N'2016-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Vehicle] ([VehicleChesisNo], [RegistrationNumber], [TypeOfVehicle], [Make], [Model], [PurchaseDate]) VALUES (N'Shyam85VT10', N'UP83HN4141', N'2 Wheeler', N'Hero', 2014, CAST(N'2014-07-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Vehicle] ([VehicleChesisNo], [RegistrationNumber], [TypeOfVehicle], [Make], [Model], [PurchaseDate]) VALUES (N'VV78Shyam78', N'UP80AB8521', N'4 Wheeler', N'Maruti', 2021, CAST(N'2021-06-16T00:00:00.000' AS DateTime))
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
/****** Object:  StoredProcedure [dbo].[GetPassword]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SSP_AddClaim]    Script Date: 10/29/2023 11:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 18-Oct-2023
-- Description:	Add Claim
-- =============================================
CREATE PROCEDURE [dbo].[SSP_AddClaim]
		@PersonId bigint,
		@CustomerPolicyID nvarchar(50),
		@ClaimType nvarchar(20),
		@DamageDetails nvarchar(max),
		@ClaimAmount decimal(8,2),
		@IFSCCode nvarchar(10),
		@AccountNo bigint,
		@AccountHolderName nvarchar(50)
AS
BEGIN
	DECLARE @CustomerID nvarchar(20)
	SELECT @CustomerID=CustomerID FROM Customer WHERE PersonID=@PersonId

	IF @CustomerID IS NOT NULL
	BEGIN
		DECLARE @ClaimId nvarchar(50)
		DECLARE @IntimationDate nvarchar(10)
		DECLARE @FormatDate nvarchar(20)
		SELECT @IntimationDate=FORMAT(GETDATE(), N'yyyyMMdd')
		SELECT @FormatDate=FORMAT(GETDATE(),'yyyyMMddHHmmss')
		SET @ClaimId = @CustomerID + '_' + @FormatDate
		
		INSERT INTO Claim(ClaimID, CustomerID, CustomerPolicyID, ApprovedBy, ClaimType, DamageDetails, SettlementStatus, ClaimAmount, ApprovedAmount)
					VALUES(@ClaimId, @CustomerID, @CustomerPolicyID, NULL, @ClaimType, @DamageDetails, 0, @ClaimAmount, 0.0)

		INSERT INTO Claim_BankDetails(ClaimID, IFSCCode, AccountNo, AccountHolderName)
					VALUES(@ClaimId, @IFSCCode, @AccountNo, @AccountHolderName)

		INSERT INTO Claim_Intimation(ClaimID, CustomerID, ClaimIntimationDate)
					VALUES(@ClaimId, @CustomerID, @IntimationDate)
	END
	ELSE
	BEGIN
		PRINT 'Error finding CustomerID'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_AddPersonAccount]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SSP_AddUpdatePolicy]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SSP_AddVehicle]    Script Date: 10/29/2023 11:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 16/Oct/2023
-- Description:	Add Customer vehicle
-- =============================================
CREATE PROCEDURE [dbo].[SSP_AddVehicle]
		@PersonId bigint,
		@VehicleChesisNo nvarchar(50),
		@RegistrationNumber nvarchar(20),
		@TypeOfVehicle nvarchar(20),
		@Make nvarchar(20),
		@Model int,
		@PurchaseDate datetime
AS
BEGIN
	DECLARE @CustomerID nvarchar(20)
	SELECT @CustomerID=CustomerID FROM Customer WHERE PersonID=@PersonId

	IF @CustomerID IS NOT NULL
	BEGIN
		INSERT INTO Vehicle(VehicleChesisNo, RegistrationNumber, TypeOfVehicle, Make, Model, PurchaseDate)
					VALUES(@VehicleChesisNo, @RegistrationNumber, @TypeOfVehicle, @Make, @Model, @PurchaseDate)

		INSERT INTO Customer_Vehicle_Ownership(CustomerID, VehicleChesisNo)
					VALUES(@CustomerID, @VehicleChesisNo)
	END
	ELSE
	BEGIN
		PRINT 'Error finding CustomerID'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_ApproveClaim]    Script Date: 10/29/2023 11:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 28-Oct-2023
-- Description:	Approve Claim
-- =============================================
CREATE PROCEDURE [dbo].[SSP_ApproveClaim]
	@PersonId bigint,
	@ClaimID nvarchar(50),
	@ApprovedAmount decimal(8,2)

AS
BEGIN
	DECLARE @EmployeeID nvarchar(20)
	SELECT @EmployeeID=EmployeeId FROM Employee WHERE PersonID=@PersonId

	IF @EmployeeID IS NOT NULL
	BEGIN
		UPDATE Claim
		SET ApprovedAmount = @ApprovedAmount, ApprovedBy = @EmployeeID, SettlementStatus = 1
		WHERE ClaimID = @ClaimID
	END
	ELSE
	BEGIN
		PRINT 'Error finding EmployeeID'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_DeletePolicy]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SSP_DeleteVehicle]    Script Date: 10/29/2023 11:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 16/Oct/2023
-- Description:	Delete Customer vehicle
-- =============================================
CREATE PROCEDURE [dbo].[SSP_DeleteVehicle]
	@VehicleChesisNo nvarchar(50)
AS
BEGIN
	DELETE FROM Vehicle WHERE VehicleChesisNo = @VehicleChesisNo
	DELETE FROM Customer_Vehicle_Ownership WHERE VehicleChesisNo = @VehicleChesisNo
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetClaims]    Script Date: 10/29/2023 11:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 18-Oct-2023
-- Description:	Get My Claims
-- =============================================
CREATE PROCEDURE [dbo].[SSP_GetClaims]
	@PersonId bigint
AS
BEGIN
	IF (@PersonId = 0)
	BEGIN	
		SELECT CL.ClaimID,
			   CustomerPolicyID,
			   (SELECT FirstName FROM Person_Name WHERE PersonId=E.PersonId) AS ApprovedBy,
			   ClaimType,
			   SettlementStatus,
			   ClaimAmount,
			   ApprovedAmount,
			   DamageDetails,
			   ClaimIntimationDate,
			   IFSCCode,
			   AccountNo,
			   AccountHolderName
		FROM Person P
		INNER JOIN Person_Name PN ON PN.PersonID = P.PersonId
		INNER JOIN Customer C ON P.PersonId = C.PersonID
		INNER JOIN Claim_Intimation CI ON C.CustomerID = CI.CustomerID
		INNER JOIN Claim CL ON CL.ClaimID = CI.ClaimID
		INNER JOIN Claim_BankDetails CBD ON CL.ClaimID = CBD.ClaimID
		LEFT JOIN Employee E ON E.EmployeeId=ApprovedBy
	END
	ELSE
	BEGIN
		SELECT CL.ClaimID,
			   CustomerPolicyID,
			   (SELECT FirstName FROM Person_Name WHERE PersonId=E.PersonId) AS ApprovedBy,
			   ClaimType,
			   SettlementStatus,
			   ClaimAmount,
			   ApprovedAmount,
			   DamageDetails,
			   ClaimIntimationDate,
			   IFSCCode,
			   AccountNo,
			   AccountHolderName
		FROM Person P
		INNER JOIN Person_Name PN ON PN.PersonID = P.PersonId
		INNER JOIN Customer C ON P.PersonId = C.PersonID
		INNER JOIN Claim_Intimation CI ON C.CustomerID = CI.CustomerID
		INNER JOIN Claim CL ON CL.ClaimID = CI.ClaimID
		INNER JOIN Claim_BankDetails CBD ON CL.ClaimID = CBD.ClaimID
		LEFT JOIN Employee E ON E.EmployeeId=ApprovedBy
		WHERE C.PersonID = @PersonId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetCustomerInfo]    Script Date: 10/29/2023 11:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 29/Oct/2023
-- Description:	Get customer details
-- =============================================
CREATE PROCEDURE [dbo].[SSP_GetCustomerInfo]
		@PersonId bigint
AS
BEGIN	
	SELECT P.PersonId,
		   UserName,
		   EmailId,
		   DateOfBirth,
		   FirstName,
		   LastName,
		   (SELECT STRING_AGG(PhoneNo, ',') FROM Person_PhoneNo WHERE PersonId=P.PersonId) AS PhoneNo,
		   IsActive,
		   HouseNo,
		   Area,
		   City,
		   Zip
	  FROM Person P
	  INNER JOIN Person_Name PN ON P.PersonId=PN.PersonId
	  INNER JOIN Person_LoginInfo PLI ON P.PersonId=PLI.PersonId
	  INNER JOIN Person_Address A ON P.PersonId=A.PersonId
	  INNER JOIN Customer C ON P.PersonId=C.PersonId
	  WHERE P.PersonId = @PersonId
END

GO
/****** Object:  StoredProcedure [dbo].[SSP_GetCustomerVehicles]    Script Date: 10/29/2023 11:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 16/Oct/2023
-- Description:	Get Customer vehicle details
-- =============================================
CREATE PROCEDURE [dbo].[SSP_GetCustomerVehicles]
	@PersonId bigint
AS
BEGIN
	IF (@PersonId = 0)
	BEGIN
		SELECT V.VehicleChesisNo,
			   RegistrationNumber,
			   TypeOfVehicle,
			   Make,
			   Model,
			   PurchaseDate
		FROM Person P
		INNER JOIN Customer C ON P.PersonId = C.PersonID
		INNER JOIN Customer_Vehicle_Ownership CV ON C.CustomerID = CV.CustomerID
		INNER JOIN Vehicle V ON CV.VehicleChesisNo = V.VehicleChesisNo
	END
	ELSE
	BEGIN
		SELECT V.VehicleChesisNo,
			   RegistrationNumber,
			   TypeOfVehicle,
			   Make,
			   Model,
			   PurchaseDate
		FROM Person P
		INNER JOIN Customer C ON P.PersonId = C.PersonID
		INNER JOIN Customer_Vehicle_Ownership CV ON C.CustomerID = CV.CustomerID
		INNER JOIN Vehicle V ON CV.VehicleChesisNo = V.VehicleChesisNo
		WHERE C.PersonID = @PersonId
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SSP_GetEmployees]    Script Date: 10/29/2023 11:08:28 PM ******/
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
	SELECT P.PersonId,
		   UserName,
		   EmailId,
		   DateOfBirth,
		   FirstName,
		   LastName,
		   (SELECT STRING_AGG(PhoneNo, ',') FROM Person_PhoneNo WHERE PersonId=P.PersonId) AS PhoneNo,
		   IsActive,
		   HouseNo,
		   Area,
		   City,
		   Zip
	  FROM Person P
	  INNER JOIN Person_Name PN ON P.PersonId=PN.PersonId
	  INNER JOIN Person_LoginInfo PLI ON P.PersonId=PLI.PersonId
	  INNER JOIN Person_Address A ON P.PersonId=A.PersonId
	  INNER JOIN Employee E ON P.PersonId=E.PersonId
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_GetPassword]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SSP_GetPersonDetails]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SSP_GetPolicy]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SSP_GetPurchasedPolicies]    Script Date: 10/29/2023 11:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 18-Oct-2023
-- Description:	Get Purchased Policies
-- =============================================
CREATE PROCEDURE [dbo].[SSP_GetPurchasedPolicies]
	   @PersonId bigint
AS
BEGIN
	IF (@PersonId = 0)
	BEGIN	
		SELECT CPP.CustomerPolicyID,
			   CP.VehicleChesisNo,
			   PolicyStartDate,
			   PolicyEndDate,
			   InsuredDeclaredValue,
			   (SELECT CAST(CASE WHEN PolicyEndDate > getdate() THEN 1 ELSE 0 END AS bit)) AS Status
		FROM Person P
		INNER JOIN Customer C ON P.PersonId = C.PersonID
		INNER JOIN Customer_Policy_Purchase CPP ON C.CustomerID = CPP.CustomerID
		INNER JOIN CustomerPolicy CP ON CPP.CustomerPolicyID = CP.CustomerPolicyID
		INNER JOIN CustomerPolicy_Details CPD ON CPD.CustomerPolicyID = CP.CustomerPolicyID
	END
	ELSE
	BEGIN
		SELECT CPP.CustomerPolicyID,
			   CP.VehicleChesisNo,
			   PolicyStartDate,
			   PolicyEndDate,
			   InsuredDeclaredValue,
			   (SELECT CAST(CASE WHEN PolicyEndDate > getdate() THEN 1 ELSE 0 END AS bit)) AS Status
		FROM Person P
		INNER JOIN Customer C ON P.PersonId = C.PersonID
		INNER JOIN Customer_Policy_Purchase CPP ON C.CustomerID = CPP.CustomerID
		INNER JOIN CustomerPolicy CP ON CPP.CustomerPolicyID = CP.CustomerPolicyID
		INNER JOIN CustomerPolicy_Details CPD ON CPD.CustomerPolicyID = CP.CustomerPolicyID
		WHERE C.PersonID = @PersonId
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_MakePersonInactive]    Script Date: 10/29/2023 11:08:28 PM ******/
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
		UPDATE Person_LoginInfo SET IsActive=@IsActive WHERE PersonId=@PersonId
	END
	ELSE
	BEGIN
		PRINT 'USER DOES NOT EXISTS'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_PurchasePolicy]    Script Date: 10/29/2023 11:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 18-Oct-2023
-- Description:	Purchase Policy
-- =============================================
CREATE PROCEDURE [dbo].[SSP_PurchasePolicy]
	    @PersonId bigint,
		@PolicyID bigint,
		@VehicleChesisNo nvarchar(50),
		@PolicyStartDate datetime,
		@PolicyEndDate datetime,
		@InsuredDeclaredValue decimal(8,2)
AS
BEGIN
	DECLARE @CustomerID nvarchar(20)
	SELECT @CustomerID=CustomerID FROM Customer WHERE PersonID=@PersonId

	IF @CustomerID IS NOT NULL
	BEGIN
		DECLARE @CustomerPolicyID nvarchar(50)
		DECLARE @Date nvarchar(12)
		SELECT @Date=FORMAT(GETDATE(), N'yyyyMMddHHmm')
		SET @CustomerPolicyID = CONCAT(@PolicyID,'_',@VehicleChesisNo,'_', @Date)
		
		INSERT INTO CustomerPolicy(CustomerPolicyID, PolicyID, VehicleChesisNo)
					VALUES(@CustomerPolicyID, @PolicyID, @VehicleChesisNo)

		INSERT INTO Customer_Policy_Purchase(CustomerID, CustomerPolicyID)
					VALUES(@CustomerID, @CustomerPolicyID)

		INSERT INTO CustomerPolicy_Details(CustomerPolicyID, PolicyStartDate, PolicyEndDate, InsuredDeclaredValue)
					VALUES(@CustomerPolicyID, @PolicyStartDate, @PolicyEndDate, @InsuredDeclaredValue)
	END
	ELSE
	BEGIN
		PRINT 'Error finding CustomerID'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_UpdatePerson]    Script Date: 10/29/2023 11:08:28 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SSP_UpdateVehicle]    Script Date: 10/29/2023 11:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saurabh Gupta
-- Create date: 16/Oct/2023
-- Description:	Update Customer vehicle
-- =============================================
CREATE PROCEDURE [dbo].[SSP_UpdateVehicle]
		@VehicleChesisNo nvarchar(50),
		@RegistrationNumber nvarchar(20),
		@TypeOfVehicle nvarchar(20),
		@Make nvarchar(20),
		@Model int,
		@PurchaseDate datetime
AS
BEGIN
    IF EXISTS (SELECT VehicleChesisNo FROM Vehicle WHERE VehicleChesisNo = @VehicleChesisNo)
		BEGIN
			UPDATE Vehicle
			SET	   RegistrationNumber = @RegistrationNumber,
				   TypeOfVehicle = @TypeOfVehicle,
				   Make = @Make,
				   Model = @Model,
				   PurchaseDate = @PurchaseDate
			WHERE  VehicleChesisNo = @VehicleChesisNo
		END
		ELSE
			PRINT 'Vehicle DOES NOT EXISTS'
END
GO
/****** Object:  StoredProcedure [dbo].[SSP_ValidateUser]    Script Date: 10/29/2023 11:08:28 PM ******/
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
