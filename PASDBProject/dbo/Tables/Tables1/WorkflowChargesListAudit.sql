﻿CREATE TABLE [dbo].[WorkflowChargesListAudit] (
    [WorkflowChargesListAuditId] BIGINT          IDENTITY (1, 1) NOT NULL,
    [WorkflowChargesListId]      BIGINT          NOT NULL,
    [WorkflowId]                 BIGINT          NOT NULL,
    [WorkflowChargeTypeId]       TINYINT         NOT NULL,
    [Description]                VARCHAR (500)   NULL,
    [Quantity]                   SMALLINT        NULL,
    [UnitCost]                   DECIMAL (18, 2) NULL,
    [ExtendedCost]               DECIMAL (18, 2) NULL,
    [UnitPrice]                  DECIMAL (18, 2) NULL,
    [ExtendedPrice]              DECIMAL (18, 2) NULL,
    [VendorId]                   BIGINT          NULL,
    [TaskId]                     BIGINT          NOT NULL,
    [MasterCompanyId]            INT             NOT NULL,
    [CreatedBy]                  VARCHAR (256)   NULL,
    [UpdatedBy]                  VARCHAR (256)   NULL,
    [CreatedDate]                DATETIME2 (7)   NOT NULL,
    [UpdatedDate]                DATETIME2 (7)   NULL,
    [IsActive]                   BIT             NULL,
    [VendorName]                 VARCHAR (256)   NULL,
    [Order]                      INT             NULL,
    [IsDeleted]                  BIT             NOT NULL,
    [Memo]                       NVARCHAR (MAX)  NULL,
    [WFParentId]                 BIGINT          NULL,
    [IsVersionIncrease]          BIT             NULL,
    CONSTRAINT [PK_ProcessChargesListAudit] PRIMARY KEY CLUSTERED ([WorkflowChargesListAuditId] ASC)
);
