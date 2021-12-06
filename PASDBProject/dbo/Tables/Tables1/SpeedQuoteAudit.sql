﻿CREATE TABLE [dbo].[SpeedQuoteAudit] (
    [AuditSpeedQuoteId]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [SpeedQuoteId]            BIGINT          NOT NULL,
    [SpeedQuoteTypeId]        INT             NOT NULL,
    [OpenDate]                DATETIME2 (7)   NULL,
    [ValidForDays]            INT             NOT NULL,
    [QuoteExpireDate]         DATETIME2 (7)   NOT NULL,
    [AccountTypeId]           INT             NOT NULL,
    [CustomerId]              BIGINT          NOT NULL,
    [CustomerContactId]       BIGINT          NULL,
    [CustomerReference]       VARCHAR (100)   NULL,
    [ContractReference]       VARCHAR (100)   NULL,
    [SalesPersonId]           BIGINT          NULL,
    [AgentName]               VARCHAR (50)    NULL,
    [CustomerSeviceRepId]     BIGINT          NULL,
    [ProbabilityId]           BIGINT          NULL,
    [LeadSourceId]            INT             NULL,
    [LeadSourceReference]     VARCHAR (100)   NULL,
    [CreditLimit]             DECIMAL (18, 2) NULL,
    [CreditTermId]            INT             NULL,
    [EmployeeId]              BIGINT          NOT NULL,
    [RestrictPMA]             BIT             CONSTRAINT [DF_SpeedQuoteAudit_RestrictPMA] DEFAULT ((0)) NOT NULL,
    [RestrictDER]             BIT             CONSTRAINT [DF_SpeedQuoteAudit_RestrictDER] DEFAULT ((0)) NOT NULL,
    [ApprovedDate]            DATETIME2 (7)   NULL,
    [CurrencyId]              INT             NULL,
    [CustomerWarningId]       BIGINT          NULL,
    [Memo]                    NVARCHAR (MAX)  NULL,
    [Notes]                   NVARCHAR (MAX)  NULL,
    [MasterCompanyId]         INT             NOT NULL,
    [CreatedBy]               VARCHAR (256)   NOT NULL,
    [CreatedDate]             DATETIME2 (7)   CONSTRAINT [DF_SpeedQuoteAudit_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [UpdatedBy]               VARCHAR (256)   NOT NULL,
    [UpdatedDate]             DATETIME2 (7)   CONSTRAINT [DF_SpeedQuoteAudit_UpdatedDate] DEFAULT (getdate()) NOT NULL,
    [IsDeleted]               BIT             CONSTRAINT [DF_SpeedQuoteAudit_IsDeleted] DEFAULT ((0)) NOT NULL,
    [StatusId]                INT             CONSTRAINT [DF_SpeedQuoteAudit_StatusId] DEFAULT ((1)) NOT NULL,
    [StatusChangeDate]        DATETIME2 (7)   CONSTRAINT [DF_SpeedQuoteAudit_StatusChangeDate] DEFAULT (getdate()) NOT NULL,
    [ManagementStructureId]   BIGINT          NOT NULL,
    [Version]                 INT             NOT NULL,
    [AgentId]                 BIGINT          NULL,
    [QtyRequested]            INT             CONSTRAINT [DF_SpeedQuoteAudit_QtyRequested] DEFAULT ((0)) NULL,
    [QtyToBeQuoted]           INT             CONSTRAINT [DF_SpeedQuoteAudit_QtyToBeQuoted] DEFAULT ((0)) NULL,
    [SpeedQuoteNumber]        VARCHAR (50)    NOT NULL,
    [QuoteSentDate]           DATETIME2 (7)   NULL,
    [IsNewVersionCreated]     BIT             CONSTRAINT [DF_SpeedQuoteAudit_IsNewVersionCreated] DEFAULT ((0)) NOT NULL,
    [IsActive]                BIT             CONSTRAINT [DF_SpeedQuoteAudit_IsActive] DEFAULT ((1)) NOT NULL,
    [QuoteParentId]           BIGINT          NULL,
    [QuoteTypeName]           VARCHAR (50)    NULL,
    [AccountTypeName]         VARCHAR (50)    NULL,
    [CustomerName]            VARCHAR (50)    NULL,
    [SalesPersonName]         VARCHAR (50)    NULL,
    [CustomerServiceRepName]  VARCHAR (50)    NULL,
    [ProbabilityName]         VARCHAR (50)    NULL,
    [LeadSourceName]          VARCHAR (50)    NULL,
    [CreditTermName]          VARCHAR (50)    NULL,
    [EmployeeName]            VARCHAR (50)    NULL,
    [CurrencyName]            VARCHAR (50)    NULL,
    [CustomerWarningName]     VARCHAR (50)    NULL,
    [ManagementStructureName] VARCHAR (50)    NULL,
    [CustomerContactName]     VARCHAR (50)    NULL,
    [VersionNumber]           VARCHAR (50)    NULL,
    [CustomerCode]            VARCHAR (50)    NULL,
    [CustomerContactEmail]    VARCHAR (50)    NULL,
    [CreditLimitName]         VARCHAR (50)    NULL,
    [StatusName]              VARCHAR (50)    NULL,
    [Level1]                  VARCHAR (50)    NULL,
    [Level2]                  VARCHAR (50)    NULL,
    [Level3]                  VARCHAR (50)    NULL,
    [Level4]                  VARCHAR (50)    NULL,
    CONSTRAINT [PK_SpeedQuoteAudit] PRIMARY KEY CLUSTERED ([AuditSpeedQuoteId] ASC)
);
