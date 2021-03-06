USE [TestSc]
GO
/****** Object:  StoredProcedure [dbo].[sp_create_user]    Script Date: 21/1/2022 13:07:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_create_user](

    @nro_doc varchar(50),
	@txt_user varchar(50) =null,	
	@txt_password varchar(50) =null,
	@txt_nombre varchar(200) =null,
	@txt_apellido varchar(200) =null,
	@cod_rol int =null)
	
	
AS
BEGIN
DECLARE @last_cod_usr AS INT 
SET @last_cod_usr  = (SELECT DISTINCT MAX(cod_usuario) from [TestSc].[dbo].[tUsers] ) 
	if (SELECT DISTINCT nro_doc from [TestSc].[dbo].[tUsers] WHERE nro_doc = @nro_doc) = @nro_doc 
		Begin
			  --ERROR
			  set @last_cod_usr=0;

		End
	else
		begin
			--declaro al usuario con rol 2 de usuario
			INSERT INTO [TestSc].[dbo].[tUsers] values(@txt_user,@txt_password,@txt_nombre,@txt_apellido,@nro_doc,2,-1)
		end
	return @last_cod_usr
END
