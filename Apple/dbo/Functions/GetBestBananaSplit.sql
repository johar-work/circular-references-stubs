CREATE FUNCTION [dbo].[GetBestBananaSplit] ()
RETURNS VARCHAR(20)
AS
BEGIN
	RETURN
	(
		SELECT TOP(1)
			BS.Name 
		FROM [$(Banana)].dbo.Split BS
		ORDER BY
			BS.Rank DESC
	);
END;
GO

