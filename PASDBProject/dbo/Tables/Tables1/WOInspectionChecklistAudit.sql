﻿CREATE TABLE [dbo].[WOInspectionChecklistAudit] (
    [WOInspectionAuditId]                  BIGINT         IDENTITY (1, 1) NOT NULL,
    [WOInspectionId]                       BIGINT         NOT NULL,
    [ReceivingCustomerWorkId]              BIGINT         NOT NULL,
    [CertNum]                              VARCHAR (200)  NULL,
    [CustomerName]                         VARCHAR (100)  NULL,
    [CustomerRef]                          NVARCHAR (250) NULL,
    [ACTailNum]                            NVARCHAR (250) NULL,
    [PartNumber]                           VARCHAR (200)  NULL,
    [PartDiscription]                      VARCHAR (MAX)  NULL,
    [Manufacturer]                         VARCHAR (200)  NULL,
    [SerialNumber]                         VARCHAR (200)  NULL,
    [IstheIDPlatemissing]                  BIT            NULL,
    [DothePNsonunitID]                     BIT            NULL,
    [IstheShippingContainerDamaged]        BIT            NULL,
    [Doestheunithavephysicaldamage]        BIT            NULL,
    [Doestheunithavelooseormissingparts]   BIT            NULL,
    [Arethecapsshuntsorclipsmissing]       BIT            NULL,
    [Aretheconnectorspinsdamaged]          BIT            NULL,
    [Isthereaservicehistoryforthisunit]    BIT            NULL,
    [AreXXXXXXwarrantysealstamperedwith]   BIT            NULL,
    [Doestheunithaswarranty]               BIT            NULL,
    [HavetheotherRSsseals]                 BIT            NULL,
    [Notes]                                NVARCHAR (MAX) NULL,
    [WorkRequested]                        NVARCHAR (MAX) NULL,
    [SpecialInstructions]                  VARCHAR (250)  NULL,
    [TroubleReported]                      VARCHAR (250)  NULL,
    [ApplicableADs]                        NVARCHAR (MAX) NULL,
    [ShippingContainers]                   NVARCHAR (MAX) NULL,
    [Comments]                             NVARCHAR (MAX) NULL,
    [TechnicalDataIsitCurrentandAvailable] BIT            NULL,
    [ReceivedBy]                           NVARCHAR (256) NULL,
    [Date]                                 DATETIME2 (7)  NULL,
    [MasterCompanyId]                      INT            NULL,
    [CreatedBy]                            NVARCHAR (256) NULL,
    [UpdatedBy]                            NVARCHAR (256) NULL,
    [CreatedDate]                          DATETIME2 (7)  CONSTRAINT [DF_WOInspectionChecklistAudit_CreatedDate] DEFAULT (getdate()) NULL,
    [UpdatedDate]                          DATETIME2 (7)  CONSTRAINT [DF_WOInspectionChecklistAudit_UpdatedDate] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_WOInspectionChecklistAudit] PRIMARY KEY CLUSTERED ([WOInspectionAuditId] ASC)
);

