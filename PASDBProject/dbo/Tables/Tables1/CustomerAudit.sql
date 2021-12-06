﻿CREATE TABLE [dbo].[CustomerAudit] (
    [AuditCustomerId]       BIGINT         IDENTITY (1, 1) NOT NULL,
    [CustomerId]            BIGINT         NOT NULL,
    [CustomerAffiliationId] INT            NULL,
    [CustomerTypeId]        INT            NOT NULL,
    [Name]                  VARCHAR (100)  NOT NULL,
    [CustomerCode]          VARCHAR (100)  NOT NULL,
    [DoingBuinessAsName]    VARCHAR (50)   NULL,
    [IsParent]              BIT            NOT NULL,
    [ParentId]              BIGINT         NULL,
    [CustomerPhone]         VARCHAR (20)   NULL,
    [CustomerPhoneExt]      VARCHAR (20)   NULL,
    [Email]                 VARCHAR (100)  NULL,
    [AddressId]             BIGINT         NOT NULL,
    [IsAddressForBilling]   BIT            NOT NULL,
    [IsAddressForShipping]  BIT            NOT NULL,
    [IsCustomerAlsoVendor]  BIT            NOT NULL,
    [ContractReference]     VARCHAR (100)  NULL,
    [IsPBHCustomer]         BIT            NOT NULL,
    [PBHCustomerMemo]       VARCHAR (MAX)  NULL,
    [CustomerURL]           NVARCHAR (500) NULL,
    [RestrictPMA]           BIT            NOT NULL,
    [RestrictDER]           BIT            NOT NULL,
    [ManagementStructureId] BIGINT         NULL,
    [MasterCompanyId]       INT            NOT NULL,
    [CreatedBy]             VARCHAR (256)  NOT NULL,
    [UpdatedBy]             VARCHAR (256)  NOT NULL,
    [CreatedDate]           DATETIME2 (7)  NOT NULL,
    [UpdatedDate]           DATETIME2 (7)  NOT NULL,
    [IsActive]              BIT            NOT NULL,
    [IsDeleted]             BIT            NOT NULL,
    [IsCRMCustomer]         BIT            NULL,
    [BillingAddressId]      BIGINT         NULL,
    [ShippingAddressId]     BIGINT         NULL,
    CONSTRAINT [PK_CustomerAudit] PRIMARY KEY CLUSTERED ([AuditCustomerId] ASC),
    CONSTRAINT [FK_CustomerAudit_Customer] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer] ([CustomerId])
);
