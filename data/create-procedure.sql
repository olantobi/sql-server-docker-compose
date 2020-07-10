
use bi_server
GO

IF OBJECT_ID ( 'Sales.TestProcedure', 'P' ) IS NOT NULL
    DROP PROCEDURE Sales.TestProcedure;
GO

CREATE PROCEDURE Sales.TestProcedure
    @StartDate DATE,
    @EndDate DATE,
    @CustomerId NVARCHAR(20)
AS
    SET NOCOUNT ON;
    SELECT TOP (1000) [order_id]
      ,[orders].[customer_id]
      ,[order_status]
      ,[order_date]
      ,[store_id]
      ,[staff_id]
      , [first_name]
      , [last_name]
      ,[phone]
      ,[email]
  FROM [bi_server].[sales].[orders]
  left join [bi_server].[sales].[customers]
  on [bi_server].[sales].[customers].[customer_id] = [bi_server].[sales].[orders].[customer_id]
  where [bi_server].[sales].[orders].[customer_id] = @CustomerId
  and order_date between @StartDate and @EndDate
GO