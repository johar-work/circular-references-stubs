CREATE TABLE [dbo].[Ingredient] (
    [IngredientId] INT          IDENTITY (1, 1) NOT NULL,
    [Name]         VARCHAR (50) NOT NULL,
    [SplitId]      INT          NOT NULL
);
GO

ALTER TABLE [dbo].[Ingredient]
    ADD CONSTRAINT [PK_Ingredient] PRIMARY KEY CLUSTERED ([IngredientId] ASC);
GO

ALTER TABLE [dbo].[Ingredient]
    ADD CONSTRAINT [FK_IngredientSplit] FOREIGN KEY ([SplitId]) REFERENCES [dbo].[Split] ([SplitId]);
GO

