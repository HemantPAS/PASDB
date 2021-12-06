﻿CREATE TABLE [dbo].[InvoicePaymentsAudit] (
    [PaymentAuditId]                      BIGINT          IDENTITY (1, 1) NOT NULL,
    [PaymentId]                           BIGINT          NOT NULL,
    [CustomerId]                          BIGINT          NOT NULL,
    [SOBillingInvoicingId]                BIGINT          NOT NULL,
    [ReceiptId]                           BIGINT          NOT NULL,
    [IsMultiplePaymentMethod]             BIT             NOT NULL,
    [IsCheckPayment]                      BIT             NULL,
    [IsWireTransfer]                      BIT             NULL,
    [IsEFT]                               BIT             NULL,
    [IsCCDCPayment]                       BIT             NULL,
    [MasterCompanyId]                     INT             NOT NULL,
    [PaymentAmount]                       DECIMAL (20, 2) NULL,
    [DiscAmount]                          DECIMAL (20, 2) NULL,
    [DiscType]                            INT             NULL,
    [BankFeeAmount]                       DECIMAL (20, 2) NULL,
    [BankFeeType]                         INT             NULL,
    [OtherAdjustAmt]                      DECIMAL (20, 2) NULL,
    [Reason]                              VARCHAR (50)    NULL,
    [RemainingBalance]                    DECIMAL (20, 2) NULL,
    [Status]                              VARCHAR (50)    NULL,
    [CreatedBy]                           VARCHAR (256)   NOT NULL,
    [UpdatedBy]                           VARCHAR (256)   NOT NULL,
    [CreatedDate]                         DATETIME2 (7)   NOT NULL,
    [UpdatedDate]                         DATETIME2 (7)   NOT NULL,
    [IsActive]                            BIT             NOT NULL,
    [IsDeleted]                           BIT             NOT NULL,
    [IsDeposite]                          BIT             NULL,
    [IsTradeReceivable]                   BIT             NULL,
    [TradeReceivableORMiscReceiptGLAccnt] BIGINT          NULL,
    [CtrlNum]                             VARCHAR (50)    NULL,
    CONSTRAINT [PK_InvoicePaymentsAudit] PRIMARY KEY CLUSTERED ([PaymentAuditId] ASC)
);
