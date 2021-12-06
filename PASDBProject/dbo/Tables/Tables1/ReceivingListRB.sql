﻿CREATE TABLE [dbo].[ReceivingListRB] (
    [ReceivingListRBId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]              VARCHAR (50)   NOT NULL,
    [Description]       VARCHAR (256)  NULL,
    [Memo]              NVARCHAR (MAX) NULL,
    [MasterCompanyId]   INT            NOT NULL,
    [CreatedBy]         VARCHAR (256)  NOT NULL,
    [UpdatedBy]         VARCHAR (256)  NOT NULL,
    [CreatedDate]       DATETIME2 (7)  NOT NULL,
    [UpdatedDate]       DATETIME2 (7)  NOT NULL,
    [IsActive]          BIT            NOT NULL,
    [IsDeleted]         BIT            NOT NULL,
    CONSTRAINT [PK_ReceivingListRB] PRIMARY KEY CLUSTERED ([ReceivingListRBId] ASC),
    CONSTRAINT [FK_ReceivingListRB_MasterCompany] FOREIGN KEY ([MasterCompanyId]) REFERENCES [dbo].[MasterCompany] ([MasterCompanyId])
);
