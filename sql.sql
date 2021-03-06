USE [master]
GO
/****** Object:  Database [Banking]    Script Date: 15/08/2014 11:58:39 ******/
CREATE DATABASE [Banking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Banking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Banking.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Banking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Banking_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Banking] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Banking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Banking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Banking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Banking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Banking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Banking] SET ARITHABORT OFF 
GO
ALTER DATABASE [Banking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Banking] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Banking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Banking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Banking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Banking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Banking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Banking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Banking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Banking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Banking] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Banking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Banking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Banking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Banking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Banking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Banking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Banking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Banking] SET RECOVERY FULL 
GO
ALTER DATABASE [Banking] SET  MULTI_USER 
GO
ALTER DATABASE [Banking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Banking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Banking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Banking] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Banking', N'ON'
GO
USE [Banking]
GO
/****** Object:  StoredProcedure [dbo].[AccountType]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AccountType]
@AccountNumber int
AS 
	SELECT
	AccountType
	FROM 
	Account
	WHERE 
	AccountNumber = @AccountNumber
;

GO
/****** Object:  StoredProcedure [dbo].[Balance]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Balance] 
	@AccountNumber int,
	@AmountSub money
AS
BEGIN
	SELECT SUM(CASE
	WHEN T.TransactionType = 'D'
	THEN +T.Amount
	ELSE -T.Amount
	END) - @AmountSub as Balance
	FROM	
	Transactions as T 	
	where T.AccountNumber = @AccountNumber 
;
END;


GO
/****** Object:  StoredProcedure [dbo].[ChangePassword]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-------------------------------
------ ChangePassword.sql -----
-------------------------------

CREATE PROCEDURE [dbo].[ChangePassword]
(
	@UserID nvarchar(50),
	@Password nvarchar(20)
)

AS
UPDATE [Banking].dbo.Login
SET [Password] = @Password,
	[ModifyDate] = CURRENT_TIMESTAMP
WHERE [UserID] = @UserID;


GO
/****** Object:  StoredProcedure [dbo].[DeleteBillPay]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBillPay]
    @BillPayID int
AS 
	DELETE
	FROM BillPay
	WHERE BillPayID = @BillPayID
;

GO
/****** Object:  StoredProcedure [dbo].[GetAddress]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAddress]
	-- Add the parameters for the stored procedure here
	@CustomerID nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Address from dbo.Customer where CustomerID = @CustomerID
END

GO
/****** Object:  StoredProcedure [dbo].[GetCity]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCity]
	-- Add the parameters for the stored procedure here
	@CustomerID nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT City from dbo.Customer where CustomerID = @CustomerID
END

GO
/****** Object:  StoredProcedure [dbo].[GetCustomerName]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomerName]
	-- Add the parameters for the stored procedure here
	@CustomerID nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CustomerName from dbo.Customer where CustomerID = @CustomerID
END

GO
/****** Object:  StoredProcedure [dbo].[GetPhone]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPhone]
	-- Add the parameters for the stored procedure here
	@CustomerID nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Phone from dbo.Customer where CustomerID = @CustomerID
END

GO
/****** Object:  StoredProcedure [dbo].[GetPostCode]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPostCode]
	-- Add the parameters for the stored procedure here
	@CustomerID nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT PostCode from dbo.Customer where CustomerID = @CustomerID
END

GO
/****** Object:  StoredProcedure [dbo].[GetSessionCustomerID]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSessionCustomerID]
	-- Add the parameters for the stored procedure here
	@UserID nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CustomerID from dbo.Login where UserID = @UserID
END

GO
/****** Object:  StoredProcedure [dbo].[GetState]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetState]
	-- Add the parameters for the stored procedure here
	@CustomerID nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT State from dbo.Customer where CustomerID = @CustomerID
END

GO
/****** Object:  StoredProcedure [dbo].[GetTFN]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTFN]
	-- Add the parameters for the stored procedure here
	@CustomerID nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TFN from dbo.Customer where CustomerID = @CustomerID
END

GO
/****** Object:  StoredProcedure [dbo].[InsertBillPay]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------------
-- InsertBillPay.sql -----
-------------------------------


CREATE PROCEDURE [dbo].[InsertBillPay]
    @CurrentAccountNumber int,
	@PayeeID int,
	@Amount money,
	@ScheduleDate datetime,
	@period nvarchar(1),
	@modifydate datetime
AS 

	INSERT INTO dbo.BillPay
	(
		AccountNumber,
		PayeeID, 
		Amount, 
		ScheduleDate, 
		Period,
		ModifyDate
	)
	VALUES
	(
		@CurrentAccountNumber,
		@PayeeID,
		@Amount,
		@ScheduleDate,
		@period,
		@modifydate
	)

GO
/****** Object:  StoredProcedure [dbo].[InsertBillPayFee]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[InsertBillPayFee]
	@CurrentAccountNumber int
AS 

DECLARE @CurrentBalance money


INSERT dbo.Transactions
(TransactionType, AccountNumber, Amount, Comment, ModifyDate)
Values
(
	'S',
	@CurrentAccountNumber,
	0.20,
	'BillPay Fee',
	SYSDATETIME()
)
	


GO
/****** Object:  StoredProcedure [dbo].[InsertBillPayTransfer]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertBillPayTransfer]
	@CurrentAccountNumber int,
	@amount float,
	@text nvarchar(255)
AS 

INSERT dbo.Transactions
(TransactionType, AccountNumber, Amount, Comment, ModifyDate)
Values
(
	'B',
	@CurrentAccountNumber,
	@amount,
	@text,
	SYSDATETIME()
)
	


GO
/****** Object:  StoredProcedure [dbo].[InsertDeposit]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------------
------ InsertDeposit.sql ------
-------------------------------

CREATE PROCEDURE [dbo].[InsertDeposit]
    @AccountChosen int,
	@Amount money,
	@Comment nvarchar(255)
AS
BEGIN
	INSERT INTO [dbo].[Transactions]
           ([TransactionType]
           ,[AccountNumber]
           ,[Amount]
           ,[Comment]
           ,[ModifyDate])
     VALUES
           (
		   'D'
           ,@AccountChosen
           ,@Amount
           ,@Comment
           ,CURRENT_TIMESTAMP)

IF (select COUNT(T.TransactionID) from [dbo].[Transactions] as T where T.AccountNumber = @AccountChosen)>= 6
BEGIN
	INSERT INTO [dbo].[Transactions]
           ([TransactionType]
           ,[AccountNumber]
           ,[Amount]
           ,[Comment]
           ,[ModifyDate])
     VALUES
           ('S'
           ,@AccountChosen
           ,'0.20'
           ,'FEES'
           ,CURRENT_TIMESTAMP)
	
END


END

;


GO
/****** Object:  StoredProcedure [dbo].[InsertStatementFee]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------
-- InsertStatementFee.sql -----
-------------------------------


CREATE PROCEDURE [dbo].[InsertStatementFee]
    @UserID nvarchar(50),
	@CurrentAccountNumber int
AS 

DECLARE @CurrentBalance money


IF (select COUNT(T.TransactionID) from [dbo].[Transactions] as T where T.AccountNumber = @CurrentAccountNumber)>= 5

BEGIN
INSERT dbo.Transactions
(TransactionType, AccountNumber, Amount, Comment, ModifyDate)
Values
(
	'S',
	@CurrentAccountNumber,
	0.20,
	'Internet Transaction History',
	SYSDATETIME()
)
	
END
ELSE
BEGIN
INSERT dbo.Transactions
(TransactionType, AccountNumber, Amount, Comment, ModifyDate)
Values
(
	'S',
	@CurrentAccountNumber,
	0.00,
	'Internet Transaction History',
	SYSDATETIME()
)

END


GO
/****** Object:  StoredProcedure [dbo].[InsertTransfer]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[InsertTransfer]
	@AccountChosen int,
	@AccountTo int,
	@Amount money,
	@Comment nvarchar(255)
AS


DECLARE @Balance1 money
CREATE TABLE #tmpTable
(
    Balance money
)
--We call the balance procedure to check if we can deposit without going under the limit
INSERT INTO #tmpTable (Balance)
EXEC [dbo].[Balance] @AmountSub = @Amount , @AccountNumber = @AccountChosen
SELECT
    @Balance1 = Balance
FROM 
    #tmpTable
print @Balance1
DROP TABLE #tmpTable

--=============================================
-- IF MORE THAN 4 FREE TRANSACTIONS
--=============================================


IF (select COUNT(T.TransactionID) from [dbo].[Transactions] as T where T.AccountNumber = @AccountChosen)>= 5
BEGIN
IF( ((select A.AccountType from [dbo].[Account] as A where A.AccountNumber = @AccountChosen) = 'C' AND @Balance1>=200.20)
OR (select A.AccountType from [dbo].[Account] as A where A.AccountNumber = @AccountChosen) = 'S' AND @Balance1>=0.20)
BEGIN
	INSERT INTO [dbo].[Transactions]
           ([TransactionType]
           ,[AccountNumber]
           ,[Amount]
           ,[Comment]
           ,[ModifyDate])
     VALUES
           ('S'
           ,@AccountChosen
           ,'0.20'
           ,'FEES'
           ,CURRENT_TIMESTAMP)
		   
	INSERT INTO [dbo].[Transactions]
           ([TransactionType]
           ,[AccountNumber]
           ,[Amount]
           ,[Comment]
           ,[ModifyDate])
     VALUES
           (
		   'T'
           ,@AccountChosen
           ,@Amount
           ,@Comment
           ,CURRENT_TIMESTAMP)
		   
	INSERT INTO [dbo].[Transactions]
		   ([TransactionType]
		   ,[AccountNumber]
		   ,[Amount]
		   ,[Comment]
		   ,[ModifyDate])
	VALUES
		   (
		   'D'
		   ,@AccountTo
		   ,@Amount
		   ,@Comment
		   ,CURRENT_TIMESTAMP)
END
END
ELSE
BEGIN

--=============================================
-- IF LESS THAN 4 FREE TRANSACTIONS
--=============================================


IF( ((select A.AccountType from [dbo].[Account] as A where A.AccountNumber = @AccountChosen) = 'C' AND @Balance1>=200)
OR (select A.AccountType from [dbo].[Account] as A where A.AccountNumber = @AccountChosen) = 'S' AND @Balance1>=0)
	INSERT INTO [dbo].[Transactions]
           ([TransactionType]
           ,[AccountNumber]
           ,[Amount]
           ,[Comment]
           ,[ModifyDate])
     VALUES
           (
		   'T'
           ,@AccountChosen
           ,@Amount
           ,@Comment
           ,CURRENT_TIMESTAMP)
		   
	INSERT INTO [dbo].[Transactions]
		   ([TransactionType]
		   ,[AccountNumber]
		   ,[Amount]
		   ,[Comment]
		   ,[ModifyDate])
	 VALUES
		   (
		   'D'
		   ,@AccountTo
		   ,@Amount
		   ,@Comment
		   ,CURRENT_TIMESTAMP)
END
;


GO
/****** Object:  StoredProcedure [dbo].[InsertWithdraw]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-------------------------------
------ InsertWithdraw.sql -----
-------------------------------


CREATE PROCEDURE [dbo].[InsertWithdraw]
	@AccountChosen int,
	@Amount money,
	@Comment nvarchar(255)
AS
DECLARE @Balance1 money
CREATE TABLE #tmpTable
(
    Balance money
)
--We call the balance procedure to check if we can deposit without going under the limit
INSERT INTO #tmpTable (Balance)
EXEC [dbo].[Balance] @AmountSub = @Amount , @AccountNumber = @AccountChosen
SELECT
    @Balance1 = Balance
FROM 
    #tmpTable
print @Balance1
DROP TABLE #tmpTable

IF (select COUNT(T.TransactionID) from [dbo].[Transactions] as T where T.AccountNumber = @AccountChosen)>= 5
BEGIN
IF( ((select A.AccountType from [dbo].[Account] as A where A.AccountNumber = @AccountChosen) = 'C' AND @Balance1>=200.20)
OR (select A.AccountType from [dbo].[Account] as A where A.AccountNumber = @AccountChosen) = 'S' AND @Balance1>=0.20)
BEGIN
	INSERT INTO [dbo].[Transactions]
           ([TransactionType]
           ,[AccountNumber]
           ,[Amount]
           ,[Comment]
           ,[ModifyDate])
     VALUES
           ('S'
           ,@AccountChosen
           ,'0.20'
           ,'FEES'
           ,CURRENT_TIMESTAMP)
		   
	INSERT INTO [dbo].[Transactions]
           ([TransactionType]
           ,[AccountNumber]
           ,[Amount]
           ,[Comment]
           ,[ModifyDate])
     VALUES
           (
		   'W'
           ,@AccountChosen
           ,@Amount
           ,@Comment
           ,CURRENT_TIMESTAMP)
END
END
ELSE
BEGIN
IF( ((select A.AccountType from [dbo].[Account] as A where A.AccountNumber = @AccountChosen) = 'C' AND @Balance1>=200)
OR (select A.AccountType from [dbo].[Account] as A where A.AccountNumber = @AccountChosen) = 'S' AND @Balance1>=0)
	INSERT INTO [dbo].[Transactions]
           ([TransactionType]
           ,[AccountNumber]
           ,[Amount]
           ,[Comment]
           ,[ModifyDate])
     VALUES
           (
		   'W'
           ,@AccountChosen
           ,@Amount
           ,@Comment
           ,CURRENT_TIMESTAMP)
END;


GO
/****** Object:  StoredProcedure [dbo].[SelectAccountNo]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------------
----- SelectAccountNo.sql -----
-------------------------------


CREATE PROCEDURE [dbo].[SelectAccountNo]
    @UserID nvarchar(50),
	@AccountType nvarchar(1)
AS 

SELECT 
	DISTINCT A.AccountNumber
	FROM
	(
	(Login AS L 
	JOIN
	Customer AS C 
	ON L.CustomerID = C.CustomerID)
	JOIN 
	Account AS A 
	ON A.CustomerID = C.CustomerID)

	WHERE
	L.UserID = @UserID AND
	A.AccountType = @AccountType;


GO
/****** Object:  StoredProcedure [dbo].[SelectAccounts]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAccounts]
    @UserID nvarchar(50)
AS 
	SELECT CASE
	WHEN A.AccountType='C'
	THEN 'CHECKING - ' + CAST(A.AccountNumber AS VARCHAR(10))+ ' '+C.CustomerName
	ELSE 'SAVING - ' + CAST(A.AccountNumber AS VARCHAR(10))+ ' '+C.CustomerName
	END as FullAccount,
	A.AccountNumber
	FROM	
	
	(Login AS L 
	JOIN
	Customer AS C 
	ON L.CustomerID = C.CustomerID)
	JOIN
	Account AS A 
	ON A.CustomerID = C.CustomerID
	WHERE
	L.UserID = @UserID 
;


GO
/****** Object:  StoredProcedure [dbo].[SelectAccountsDisplay]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SelectAccountsDisplay]
    @UserID nvarchar(50)
AS 
	SELECT CASE
	WHEN A.AccountType='C'
	THEN 'CHECKING - ' + CAST(A.AccountNumber AS VARCHAR(10))+ ' '+C.CustomerName
	ELSE 'SAVING - ' + CAST(A.AccountNumber AS VARCHAR(10))+ ' '+C.CustomerName
	END as FullAccount,
	SUM(CASE
	WHEN T.TransactionType = 'D'
	THEN +T.Amount
	ELSE -T.Amount
	END) as Balance
	from
	((Login AS L 
	JOIN
	Customer AS C 
	ON L.CustomerID = C.CustomerID)
	JOIN
	Account AS A 
	ON A.CustomerID = C.CustomerID)
	JOIN
	Transactions as T
	ON T.AccountNumber = A.AccountNumber
	WHERE
	L.UserID = @UserID 
	GROUP BY  A.AccountType,A.AccountNumber,C.CustomerName
;

GO
/****** Object:  StoredProcedure [dbo].[SelectAllAccounts]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------------
---- SelectAllAccounts.sql ----
-------------------------------

CREATE PROCEDURE [dbo].[SelectAllAccounts]
    @AccountChosen int
AS 
	SELECT CASE
	WHEN A.AccountType='C'
	THEN 'CHECKING - ' + CAST(A.AccountNumber AS VARCHAR(10))+ ' '+C.CustomerName
	ELSE 'SAVING - ' + CAST(A.AccountNumber AS VARCHAR(10))+ ' '+C.CustomerName
	END as FullAccount,
	A.AccountNumber
	FROM	
	Account AS A 
	JOIN
	Customer AS C 
	ON A.CustomerID = C.CustomerID
	WHERE
	A.AccountNumber != @AccountChosen
;


GO
/****** Object:  StoredProcedure [dbo].[SelectBillPay]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectBillPay]
AS 
	SELECT
	*
	FROM BillPay
;

GO
/****** Object:  StoredProcedure [dbo].[SelectBillPayForAccount]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectBillPayForAccount]
@AccountNo int
AS 
	SELECT
	*
	FROM BillPay
	WHERE AccountNumber = @AccountNo
;

GO
/****** Object:  StoredProcedure [dbo].[SelectBillPayForUser]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectBillPayForUser]
@UserID nvarchar(50)
AS 
	SELECT
	B.BillPayID,
	B.AccountNumber,
	B.Amount,
	B.ScheduleDate,
	B.Period,
	B.ModifyDate,
	B.PauseFlag
	FROM 
	((BillPay AS B JOIN Account ON B.AccountNumber = Account.AccountNumber)
	JOIN Customer ON Customer.CustomerID = Account.CustomerID)
	JOIN Login ON Login.CustomerID = Customer.CustomerID
	WHERE
	Login.UserID = @UserID
;

GO
/****** Object:  StoredProcedure [dbo].[SelectBillPayWithBillPayNo]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectBillPayWithBillPayNo]
@BillPayID int
AS 
	SELECT
	*
	FROM BillPay
	WHERE BillPayID = @BillPayID
;

GO
/****** Object:  StoredProcedure [dbo].[SelectCustomer]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectCustomer]
    @UserID nvarchar(50),
	@pwd nvarchar(20)
AS 

SELECT  L.isAdmin, L.UserID
	FROM
	Login AS L 
	WHERE
	L.UserID = @UserID AND
	L.Password = @pwd;


GO
/****** Object:  StoredProcedure [dbo].[SelectNameCustomers]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectNameCustomers]
AS
BEGIN
	SELECT C.CustomerName, L.UserID
	from Customer as C
	JOIN
	Login as L
	on
	C.CustomerID = L.CustomerID;
	
END

GO
/****** Object:  StoredProcedure [dbo].[SelectPayees]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectPayees]
AS 
	SELECT
	Payee.PayeeID,
	Payee.PayeeName
	FROM Payee
;

GO
/****** Object:  StoredProcedure [dbo].[SelectTransactions]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------------
--- SelectTransactions.sql ----
-------------------------------

CREATE PROCEDURE [dbo].[SelectTransactions]
    @UserID nvarchar(50),
	@AccountNumber int
AS 
	SELECT 
	T.TransactionID,
	T.TransactionType,
	T.AccountNumber,
	T.DestAccount,
	T.Amount,
	T.Comment,
	T.ModifyDate

	FROM
	
	(
	(Login AS L 
	JOIN
	Customer AS C 
	ON L.CustomerID = C.CustomerID)
	JOIN
	Account AS A 
	ON A.CustomerID = C.CustomerID)
	JOIN
	dbo.Transactions AS T 
	ON T.AccountNumber = A.AccountNumber

	WHERE
	L.UserID = @UserID AND
	A.AccountNumber = @AccountNumber
	  ;


GO
/****** Object:  StoredProcedure [dbo].[TransactionCount]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TransactionCount]
@AccountNumber int
AS 
	SELECT COUNT(TransactionID) 
	from [dbo].[Transactions]
	WHERE AccountNumber = @AccountNumber;


GO
/****** Object:  StoredProcedure [dbo].[UpdateBillPay]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBillPay]
    @BillPayID int,
	@AccountNo int,
	@PayeeID int,
	@Amount money,
	@ScheduleDate DateTime,
	@ModifyDate DateTime,
	@Period nvarchar(1)
AS 
	UPDATE 
	BillPay
	SET 
	AccountNumber = @AccountNo,
	PayeeID = @PayeeID,
	Amount = @Amount,
	ScheduleDate = @ScheduleDate,
	ModifyDate = @ModifyDate,
	Period = @Period
	WHERE
	BillPayID = @BillPayID
;

GO
/****** Object:  StoredProcedure [dbo].[UpdateBillPayPauseFlag]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBillPayPauseFlag]
    @BillPayID int,
	@Pause nvarchar(1)
AS 
	UPDATE 
	BillPay
	SET 
	PauseFlag = @Pause
	WHERE
	BillPayID = @BillPayID
;

GO
/****** Object:  StoredProcedure [dbo].[UpdateBillPayScheduleDate]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateBillPayScheduleDate]
    @BillPayID int,
	@ScheduleDate DateTime,
	@ModifyDate DateTime,
	@Period nvarchar(1)
AS 
	UPDATE 
	BillPay
	SET 
	ScheduleDate = @ScheduleDate,
	ModifyDate = @ModifyDate,
	Period = @Period
	WHERE
	BillPayID = @BillPayID
;

GO
/****** Object:  StoredProcedure [dbo].[UpdateProfile]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------
-- UpdateProfileProcedure.sql -
-------------------------------

CREATE PROCEDURE [dbo].[UpdateProfile]
(    
	@CustomerID int,
	@CustomerName nvarchar(50),
	@TFN nvarchar(11),
	@Address nvarchar(50),
	@City nvarchar(40),
	@State nvarchar(20),
	@Postcode nvarchar(10),
	@Phone nvarchar(15)
)

AS
UPDATE [Banking].dbo.Customer
SET [CustomerName] = @CustomerName, 
	[TFN] = @TFN, 
	[Address] = @Address,
	[City] = @City,
	[State] = @State, 
	[Postcode] = @Postcode,
	[Phone] = @Phone
WHERE CustomerID=@CustomerID ;


GO
/****** Object:  Table [dbo].[Account]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountNumber] [int] IDENTITY(1,1) NOT NULL,
	[AccountType] [nvarchar](1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillPay]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillPay](
	[BillPayID] [int] IDENTITY(1,1) NOT NULL,
	[AccountNumber] [int] NOT NULL,
	[PayeeID] [int] NOT NULL,
	[Amount] [money] NOT NULL,
	[ScheduleDate] [datetime] NOT NULL,
	[Period] [nvarchar](1) NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
	[PauseFlag] [nvarchar](1) NULL,
 CONSTRAINT [PK_BillPay] PRIMARY KEY CLUSTERED 
(
	[BillPayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[TFN] [nvarchar](11) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](40) NULL,
	[State] [nvarchar](20) NULL,
	[Postcode] [nvarchar](10) NULL,
	[Phone] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[ModifyDate] [datetime] NOT NULL,
	[isAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payee]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payee](
	[PayeeID] [int] IDENTITY(1,1) NOT NULL,
	[PayeeName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](40) NULL,
	[State] [nvarchar](20) NULL,
	[PostCode] [nvarchar](10) NULL,
	[Phone] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Payee] PRIMARY KEY CLUSTERED 
(
	[PayeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 15/08/2014 11:58:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionType] [nvarchar](1) NOT NULL,
	[AccountNumber] [int] NOT NULL,
	[DestAccount] [int] NULL,
	[Amount] [money] NULL,
	[Comment] [nvarchar](255) NULL,
	[ModifyDate] [datetime] NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_CustomerID]
GO
ALTER TABLE [dbo].[BillPay]  WITH CHECK ADD  CONSTRAINT [FK_BillPay_Account] FOREIGN KEY([AccountNumber])
REFERENCES [dbo].[Account] ([AccountNumber])
GO
ALTER TABLE [dbo].[BillPay] CHECK CONSTRAINT [FK_BillPay_Account]
GO
ALTER TABLE [dbo].[BillPay]  WITH CHECK ADD  CONSTRAINT [FK_BillPay_Payee] FOREIGN KEY([PayeeID])
REFERENCES [dbo].[Payee] ([PayeeID])
GO
ALTER TABLE [dbo].[BillPay] CHECK CONSTRAINT [FK_BillPay_Payee]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_CustomerID]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Account] FOREIGN KEY([AccountNumber])
REFERENCES [dbo].[Account] ([AccountNumber])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transaction_Account]
GO
USE [master]
GO
ALTER DATABASE [Banking] SET  READ_WRITE 
GO
