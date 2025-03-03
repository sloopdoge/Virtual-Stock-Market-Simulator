﻿CREATE TABLE [dbo].[Stocks]
(
    [Id]        INT                                     NOT NULL,
    [Symbol]    NVARCHAR(50)                            NOT NULL,
    [Name]      NVARCHAR(255)                           NOT NULL,
    [Price]     DECIMAL                                 NOT NULL,
    [CompanyId] UNIQUEIDENTIFIER                        NOT NULL,
    [CreatedAt] DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
    [UpdatedAt] DATETIME2 GENERATED ALWAYS AS ROW END   NOT NULL,
    PERIOD FOR SYSTEM_TIME ([CreatedAt], [UpdatedAt]),
    CONSTRAINT [PK_Stocks] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [PK_Stocks_Companies] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Companies] ([Id]) ON DELETE CASCADE
)
    WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[StocksHistory]));
