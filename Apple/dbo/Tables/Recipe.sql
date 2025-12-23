CREATE TABLE [dbo].[Recipe] (
    [RecipeId]    INT            IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (1000) NOT NULL,
);
GO

ALTER TABLE [dbo].[Recipe]
    ADD CONSTRAINT [PK_Recipe] PRIMARY KEY CLUSTERED ([RecipeId] ASC);
GO

