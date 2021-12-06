﻿CREATE TABLE [dbo].[LaborOHSettingsAudit] (
    [AuditLaborOHSettingsId]  BIGINT          IDENTITY (1, 1) NOT NULL,
    [LaborOHSettingsId]       BIGINT          NOT NULL,
    [LaborRateId]             INT             NOT NULL,
    [AverageRate]             DECIMAL (20, 2) NULL,
    [LaborHoursId]            INT             NOT NULL,
    [BurdenRateId]            INT             NOT NULL,
    [HourlyRate]              DECIMAL (20, 2) NULL,
    [FlatAmount]              DECIMAL (20, 2) NULL,
    [FlatAmountWeek]          DECIMAL (20, 2) NULL,
    [FunctionalCurrencyId]    INT             NULL,
    [TransactionalCurrencyId] INT             NULL,
    [ManagementStructureId]   BIGINT          NULL,
    [MasterCompanyId]         INT             NOT NULL,
    [CreatedDate]             DATETIME2 (7)   NOT NULL,
    [UpdatedDate]             DATETIME2 (7)   NOT NULL,
    [CreatedBy]               VARCHAR (256)   NOT NULL,
    [UpdatedBy]               VARCHAR (256)   NOT NULL,
    [IsActive]                BIT             NOT NULL,
    [IsDeleted]               BIT             NOT NULL,
    [laborHoursMedthodId]     BIGINT          NULL,
    [Level1]                  VARCHAR (200)   NULL,
    [Level2]                  VARCHAR (200)   NULL,
    [Level3]                  VARCHAR (200)   NULL,
    [Level4]                  VARCHAR (200)   NULL,
    [QuoteAverageRate]        DECIMAL (18, 2) NULL,
    CONSTRAINT [PK_AuditLaborOHSettings] PRIMARY KEY CLUSTERED ([AuditLaborOHSettingsId] ASC)
);
