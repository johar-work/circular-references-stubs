CREATE TABLE [dbo].[Pie] (
    [PieId]    INT          IDENTITY (1, 1) NOT NULL,
    [Name]     VARCHAR (20) NOT NULL,
    [Rank]     INT          NOT NULL,
    [RecipeId] INT          NOT NULL
);
GO

ALTER TABLE [dbo].[Pie]
    ADD CONSTRAINT [PK_Pie] PRIMARY KEY CLUSTERED ([PieId] ASC);
GO

ALTER TABLE [dbo].[Pie]
    ADD CONSTRAINT [FK_PieRecipe] FOREIGN KEY ([RecipeId]) REFERENCES [dbo].[Recipe] ([RecipeId]);
GO

