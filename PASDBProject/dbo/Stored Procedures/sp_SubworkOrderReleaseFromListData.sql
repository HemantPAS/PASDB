/*************************************************************           
 ** File:   [sp_workOrderReleaseFromListData]           
 ** Author:   Subhash Saliya
 ** Description: Get Search Data for GetSubWOAsset List    
 ** Purpose:         
 ** Date:   23-march-2020        
          
 ** PARAMETERS:           
 @POId varchar(60)   
         
 ** RETURN VALUE:           
  
 **************************************************************           
  ** Change History           
 **************************************************************           
 ** PR   Date         Author		Change Description            
 ** --   --------     -------		--------------------------------          
    1    03/23/2020   Subhash Saliya Created


     
 EXECUTE [sp_workOrderReleaseFromListData] 10, 1, null, -1, '',null, '','','',null,null,null,null,null,null,0,1
**************************************************************/ 

CREATE Procedure [dbo].[sp_SubworkOrderReleaseFromListData]
@SubWorkOrderId bigint,
@SubWOPartNoId bigint
AS
BEGIN

	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SET NOCOUNT ON;

		BEGIN TRY
		BEGIN TRANSACTION
			BEGIN  
				 SELECT 
					   wro.[SubReleaseFromId]
					  ,wro.[WorkorderId]
					  ,wro.[SubWorkOrderId]
					  ,wro.[SubWOPartNoId]
					  ,wro.[Country]
					  ,wro.[OrganizationName]
					  ,wro.[InvoiceNo]
					  ,wro.[ItemName]
					  ,wro.[Description]
					  ,wro.[PartNumber]
					  ,wro.[Reference]
					  ,wro.[Quantity]
					  ,wro.[Batchnumber]
					  ,wro.[status]
					  ,wro.[Remarks]
					  ,wro.[Certifies]
					  ,wro.[approved]
					  ,wro.[Nonapproved]
					  ,wro.[AuthorisedSign]
					  ,wro.[AuthorizationNo]
					  ,wro.[PrintedName]
					  ,wro.[Date]
					  ,wro.[AuthorisedSign2]
					  ,wro.[ApprovalCertificate]
					  ,wro.[PrintedName2]
					  ,wro.[Date2]
					  ,wro.[CFR]
					  ,wro.[Otherregulation]
					  ,wro.[MasterCompanyId]
					  ,wro.[CreatedBy]
					  ,wro.[UpdatedBy]
					  ,wro.[CreatedDate]
					  ,wro.[UpdatedDate]
					  ,wro.[IsActive]
					  ,wro.[IsDeleted]
					  ,wro.[trackingNo]
					  ,wro.[OrganizationAddress]
					  ,wro.[is8130from]
					  ,wro.[IsClosed]
					  ,wop.CustomerRequestDate  as ReceivedDate
					  ,wop.[islocked]
					  ,case when wro.[is8130from] = 1 then '8130 Form' else '9130 Form' end as FormType 
					  ,ManagementStructureId = (select top 1 ManagementStructureId from WorkOrderPartNumber WITH(NOLOCK) where WorkOrderId=wop.WorkOrderId) 
				FROM [dbo].[SubWorkOrder_ReleaseFrom_8130] wro WITH(NOLOCK)
				      LEFT JOIN dbo.SubWorkOrderPartNumber wop WITH(NOLOCK) on wro.SubWOPartNoId = wop.SubWOPartNoId
				WHERE wro.SubWorkOrderId=@SubWorkOrderId AND wro.SubWOPartNoId =@SubWOPartNoId  
			END
		COMMIT  TRANSACTION

		END TRY    
		BEGIN CATCH      
			IF @@trancount > 0
				PRINT 'ROLLBACK'
				ROLLBACK TRAN;
				DECLARE   @ErrorLogID  INT, @DatabaseName VARCHAR(100) = db_name() 

-----------------------------------PLEASE CHANGE THE VALUES FROM HERE TILL THE NEXT LINE----------------------------------------
              , @AdhocComments     VARCHAR(150)    = 'sp_SubworkOrderReleaseFromListData' 
              , @ProcedureParameters VARCHAR(3000)  = '@Parameter1 = '''+ ISNULL(@SubWorkOrderId, '') + '''
													   @Parameter2 = ' + ISNULL(CAST(@SubWOPartNoId AS varchar(10)) ,'') +''
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