CREATE FUNCTION [dbo].[GetBestApplePie]()
RETURNS VARCHAR(20)
AS
BEGIN
	RETURN
	(
		SELECT TOP(1)
			AP.Name 
		FROM [$(Apple)].dbo.Pie AP
		ORDER BY
			AP.Rank DESC
	);
END;
GO

