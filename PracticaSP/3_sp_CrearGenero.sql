USE [TestSc]
GO
/****** Object:  StoredProcedure [dbo].[sp_create_role]    Script Date: 21/1/2022 13:41:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter PROCEDURE [dbo].[sp_create_gender](@txt_desc varchar(500) =null)
	
	
AS
BEGIN
	insert into dbo.tGenero values(@txt_desc)
	
END
