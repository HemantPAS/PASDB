﻿CREATE TABLE [dbo].[ExchangeQuoteFreightAudit] (
    [AuditExchangeQuoteFreightId] BIGINT          IDENTITY (1, 1) NOT NULL,
    [ExchangeQuoteFreightId]      BIGINT          NOT NULL,
    [ExchangeQuoteId]             BIGINT          NOT NULL,
    [ExchangeQuotePartId]         BIGINT          NULL,
    [ShipViaId]                   BIGINT          NOT NULL,
    [Weight]                      VARCHAR (50)    NULL,
    [Memo]                        NVARCHAR (MAX)  NULL,
    [Amount]                      DECIMAL (20, 3) NULL,
    [MarkupPercentageId]          BIGINT          NULL,
    [MarkupFixedPrice]            DECIMAL (20, 2) NULL,
    [HeaderMarkupId]              BIGINT          NULL,
    [BillingMethodId]             INT             NULL,
    [BillingRate]                 DECIMAL (20, 2) NULL,
    [BillingAmount]               DECIMAL (20, 2) NULL,
    [Length]                      DECIMAL (10, 2) NULL,
    [Width]                       DECIMAL (10, 2) NULL,
    [Height]                      DECIMAL (10, 2) NULL,
    [UOMId]                       BIGINT          NULL,
    [DimensionUOMId]              BIGINT          NULL,
    [CurrencyId]                  INT             NULL,
    [MasterCompanyId]             INT             NOT NULL,
    [CreatedBy]                   VARCHAR (256)   NOT NULL,
    [UpdatedBy]                   VARCHAR (256)   NOT NULL,
    [CreatedDate]                 DATETIME2 (7)   NOT NULL,
    [UpdatedDate]                 DATETIME2 (7)   NOT NULL,
    [IsActive]                    BIT             NOT NULL,
    [IsDeleted]                   BIT             NOT NULL,
    [HeaderMarkupPercentageId]    BIGINT          NULL,
    [ShipViaName]                 NVARCHAR (100)  NULL,
    [UOMName]                     NVARCHAR (100)  NULL,
    [DimensionUOMName]            NVARCHAR (100)  NULL,
    [CurrencyName]                NVARCHAR (100)  NULL,
    CONSTRAINT [PK_ExchangeQuoteFreightAudit] PRIMARY KEY CLUSTERED ([AuditExchangeQuoteFreightId] ASC)
);

