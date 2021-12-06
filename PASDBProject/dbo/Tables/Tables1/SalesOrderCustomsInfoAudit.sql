﻿CREATE TABLE [dbo].[SalesOrderCustomsInfoAudit] (
    [AuditSalesOrderCustomsInfoId] BIGINT          IDENTITY (1, 1) NOT NULL,
    [SalesOrderCustomsInfoId]      BIGINT          NOT NULL,
    [SalesOrderShippingId]         BIGINT          NOT NULL,
    [EntryType]                    VARCHAR (100)   NULL,
    [EPU]                          VARCHAR (100)   NULL,
    [CustomsValue]                 DECIMAL (20, 2) NULL,
    [NetMass]                      DECIMAL (20, 2) NULL,
    [EntryStatus]                  VARCHAR (100)   NULL,
    [EntryNumber]                  VARCHAR (100)   NULL,
    [VATValue]                     DECIMAL (20, 2) NULL,
    [UCR]                          VARCHAR (100)   NULL,
    [MasterUCR]                    VARCHAR (100)   NULL,
    [MovementRefNo]                VARCHAR (100)   NULL,
    [CommodityCode]                VARCHAR (100)   NULL,
    [MasterCompanyId]              INT             NOT NULL,
    [CreatedBy]                    VARCHAR (256)   NOT NULL,
    [UpdatedBy]                    VARCHAR (256)   NOT NULL,
    [CreatedDate]                  DATETIME2 (7)   NOT NULL,
    [UpdatedDate]                  DATETIME2 (7)   NOT NULL,
    [IsActive]                     BIT             NOT NULL,
    [IsDeleted]                    BIT             NOT NULL,
    CONSTRAINT [PK_SalesOrderCustomsInfoAudit] PRIMARY KEY CLUSTERED ([AuditSalesOrderCustomsInfoId] ASC),
    CONSTRAINT [FK_SalesOrderCustomsInfoAudit_SalesOrderCustomsInfo] FOREIGN KEY ([SalesOrderCustomsInfoId]) REFERENCES [dbo].[SalesOrderCustomsInfo] ([SalesOrderCustomsInfoId])
);
