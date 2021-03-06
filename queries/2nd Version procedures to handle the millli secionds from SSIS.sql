--2nd Version procedures to handle the millli secionds from SSIS


create PROCEDURE [dbo].[InsertSSISBatch2]
(
	 @BatchID INT OUTPUT
	,@MachineName VARCHAR(100)	
	,@UserName VARCHAR(100)	
	,@PackageName VARCHAR(100)	
	,@BatchStartTime VARCHAR(50)
	,@BatchEndTime  VARCHAR(50)
	,@ElapsedTime  VARCHAR(MAX)	
	,@ExecutionStatus  VARCHAR(100)
)
AS 
BEGIN
		INSERT INTO SSISBatch
		(
		 MachineName
		,UserName
		,PackageName
		,BatchStartTime
		,BatchEndTime
		,ElapsedTime
		,ExecutionStatus
		)
	SELECT 
		 @MachineName
		,@UserName
		,@PackageName
		,CAST(CAST(@BatchStartTime AS DATETIME2) AS DATETIME)
		,CAST(CAST(@BatchEndTime AS DATETIME2) AS DATETIME)
		,@ElapsedTime
		,@ExecutionStatus

	SELECT @BatchID = @@IDENTITY

END



GO 

create PROCEDURE [dbo].[UpdateSSISBatch2]
(
	 @BatchID INT
	,@ExecutionStatus VARCHAR(100)
	,@BatchEndTime VARCHAR(50)
)
AS
BEGIN
	
	DECLARE @BatchStartTime DATETIME
	SELECT @BatchStartTime = BatchStartTime FROM SSISBatch 
	WHERE BatchID = @BatchID
	
	UPDATE SSISBatch
	SET 
	  ExecutionStatus = @ExecutionStatus
	 ,BatchEndTime = 	CAST(CAST(@BatchEndTime AS DATETIME2) AS DATETIME) 
	 ,ElapsedTime = dbo.DateAndTimeNarration(@BatchStartTime,CAST(CAST(@BatchEndTime AS DATETIME2) AS DATETIME))
	WHERE BatchID = @BatchID
END

GO 

create PROCEDURE [dbo].[InsertSSISTask2]
(
 @TaskID INT OUTPUT
,@BatchID INT
,@TaskStartTime VARCHAR(50)
,@TaskEndTime VARCHAR(50)
,@TaskElapsedTime VARCHAR(MAX)
,@ExecutionStatus VARCHAR(100)
,@SourceType VARCHAR(100)
,@DestinationType VARCHAR(100)
,@SourceAddress  VARCHAR(MAX)
,@DestinationAddress VARCHAR(MAX)
,@ExtractedRows BIGINT
,@LoadedRows BIGINT
,@RejectedRows BIGINT
)
AS 
BEGIN

	INSERT INTO SSISTask
	(
	 BatchID
	,TaskStartTime
	,TaskEndTime
	,TaskElapsedTime
	,ExecutionStatus
	,SourceType
	,DestinationType
	,SourceAddress
	,DestinationAddress
	,ExtractedRows
	,LoadedRows
	,RejectedRows
	)

	SELECT 
	 @BatchID
	,CAST(CAST(@TaskStartTime AS DATETIME2) AS DATETIME) 
	,CAST(CAST(@TaskEndTime AS DATETIME2) AS DATETIME) 
	,@TaskElapsedTime
	,@ExecutionStatus
	,@SourceType
	,@DestinationType
	,@SourceAddress
	,@DestinationAddress
	,@ExtractedRows
	,@LoadedRows
	,@RejectedRows

		SELECT @TaskID = @@IDENTITY

END

GO 

create PROCEDURE [dbo].[UpdateSSISTask2]
(
	 @TaskID INT
	,@BatchID INT
	,@TaskEndTime VARCHAR(50)
	,@ExtractedRows BIGINT
	,@LoadedRows BIGINT 
	,@RejectedRows BIGINT
	,@ExecutionStatus VARCHAR(MAX)
)
AS 
BEGIN
	
	DECLARE @TaskStartTime DATETIME
	SELECT  @TaskStartTime  = TaskStartTime FROM SSISTask 
	WHERE BatchID = @BatchID
	AND TaskID = @TaskID

	UPDATE SSISTask
	SET 
	 TaskEndTime = CAST(CAST(@TaskEndTime  AS DATETIME2) AS DATETIME) 
	,TaskElapsedTime = dbo.DateAndTimeNarration(@TaskStartTime,CAST(CAST(@TaskEndTime  AS DATETIME2) AS DATETIME))
	,ExtractedRows = @ExtractedRows 
	,LoadedRows = @LoadedRows 
	,RejectedRows = @RejectedRows 
	,ExecutionStatus = @ExecutionStatus 
	WHERE BatchID = @BatchID
	AND TaskID = @TaskID
END




