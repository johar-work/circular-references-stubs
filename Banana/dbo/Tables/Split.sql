CREATE TABLE [dbo].[Split] (
    [SplitId] INT          IDENTITY (1, 1) NOT NULL,
    [Name]    VARCHAR (20) NOT NULL,
    [Rank]    INT          NOT NULL,
);
GO

ALTER TABLE [dbo].[Split]
    ADD CONSTRAINT [PK_Split] PRIMARY KEY CLUSTERED ([SplitId] ASC);
GO

