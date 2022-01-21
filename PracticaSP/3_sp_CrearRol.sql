-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
USE [TestSc]
GO
/****** Object:  StoredProcedure [dbo].[sp_create_user]    Script Date: 21/1/2022 13:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_create_role](@txt_desc varchar(500) =null)
	
	
AS
BEGIN
	insert into dbo.tRol values(@txt_desc,-1)
	
END
