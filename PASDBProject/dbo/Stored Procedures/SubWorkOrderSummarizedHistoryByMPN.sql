﻿
/*************************************************************           
 ** File:   [SubWorkOrderSummarizedHistoryByMPN]           
 ** Author:   Hemant Saliya
 ** Description: This stored procedure is used Sub WO Summarized History By MPN.    
 ** Purpose: This stored procedure is used Sub WO Summarized History.        
 ** Date:   07/13/2021        
          
 ** PARAMETERS:           
 @@WorkOrderId BIGINT
 @WorkOrderPartNumberId BIGINT
         
 ** RETURN VALUE:           
  
 **************************************************************           
  ** Change History           
 **************************************************************           
 ** PR   Date         Author		Change Description            
 ** --   --------     -------		--------------------------------          
    1    07/13/2021   Hemant Saliya Created
     
--EXEC [SubWorkOrderSummarizedHistoryByMPN] 295,0
**************************************************************/

CREATE PROCEDURE [dbo].[SubWorkOrderSummarizedHistoryByMPN]
@ItemMasterId BIGINT,
@IsTwelveMonth BIT = 1
AS
BEGIN
	   SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	   SET NOCOUNT ON;

		BEGIN TRY
			BEGIN TRANSACTION
				BEGIN  
					DECLARE @Month INT;
					IF(@IsTwelveMonth = 1)
					BEGIN
						SET @Month = 12
					END
					ELSE
					BEGIN
						SET @Month = 18
					END

					SELECT 
						IM.partnumber AS PartNumber,
						SWOP.ItemMasterId,
						WS.WorkScopeCode AS WorkScope,
						WS.WorkScopeId,
						C.Code AS CurrencyName,
						SUM(ISNULL(SWC.Revenue, 0)) AS Revenue,
						SUM(ISNULL(SWC.DirectCost, 0)) AS DirectCost,
						SUM(ISNULL(SWC.Margin, 0)) AS Margin,
						CASE WHEN SUM(ISNULL(SWC.Revenue, 0)) > 0 THEN CONVERT(DECIMAL(18,2),(SUM(ISNULL(SWC.Margin, 0)) * 100 ) / SUM(ISNULL(SWC.Revenue, 0))) ELSE 0 END AS RevenuePercentage,
						SUM(ISNULL(SWOP.TATDaysCurrent, 0)) As TATDays
					FROM dbo.SubWorkOrderCostDetails SWC WITH(NOLOCK) 
						JOIN dbo.SubWorkOrderPartNumber SWOP WITH(NOLOCK) ON SWC.SubWOPartNoId = SWOP.SubWOPartNoId
						JOIN dbo.ItemMaster IM WITH(NOLOCK) ON SWOP.ItemMasterId = IM.ItemMasterId
						JOIN dbo.WorkOrder WO WITH(NOLOCK) ON WO.WorkOrderId = SWC.WorkOrderId
						JOIN dbo.WorkScope WS WITH (NOLOCK) ON WS.WorkScopeId = SWOP.SubWorkOrderScopeId
						LEFT JOIN dbo.CustomerFinancial CF WITH (NOLOCK) ON CF.CustomerId = WO.CustomerId
						LEFT JOIN dbo.Currency C WITH (NOLOCK) ON C.CurrencyId = CF.CurrencyId						
					WHERE SWOP.ItemMasterId = @ItemMasterId AND DATEDIFF(MM, SWC.createdDate, GETDATE()) < @Month
					GROUP BY IM.partnumber, SWOP.ItemMasterId, WS.WorkScopeCode, WS.WorkScopeId ,C.Code
				END
			COMMIT  TRANSACTION
		END TRY    
		BEGIN CATCH      
			IF @@trancount > 0
				PRINT 'ROLLBACK'
				ROLLBACK TRAN;
				DECLARE   @ErrorLogID  INT, @DatabaseName VARCHAR(100) = db_name() 

-----------------------------------PLEASE CHANGE THE VALUES FROM HERE TILL THE NEXT LINE----------------------------------------
              , @AdhocComments     VARCHAR(150)    = 'WorkOrderQuoteSummarizedHistoryByMPN' 
              , @ProcedureParameters VARCHAR(3000)  = '@Parameter1 = '''+ ISNULL(CAST(@IsTwelveMonth AS VARCHAR(10)), '') + ''',
													   @Parameter2 = ' + ISNULL(@ItemMasterId ,'') +''
              , @ApplicationName VARCHAR(100) = 'PAS'
-----------------------------------PLEASE DO NOT EDIT BELOW----------------------------------------

              exec spLogException 
                       @DatabaseName           = @DatabaseName
                     , @AdhocComments          = @AdhocComments
                     , @ProcedureParameters = @ProcedureParameters
                     , @ApplicationName        =  @ApplicationName
                     , @ErrorLogID                    = @ErrorLogID OUTPUT ;
              RAISERROR ('Unexpected Error Occured in the database. Please let the support team know of the error number : %d', 16, 1,@ErrorLogID)
              RETURN(1);
		END CATCH
END