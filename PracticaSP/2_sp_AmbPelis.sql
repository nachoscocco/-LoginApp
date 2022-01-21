USE [TestSc]
GO
/****** Object:  StoredProcedure [dbo].[sp_create_user]    Script Date: 21/1/2022 13:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- INGRESAR ACCION 1 = INSERT
-- INGRESAR ACCION 2 = UPDATE
-- INGRESAR ACCION 3 = baja logica
--CUALQUIER OTRA NO HARA NADA



alter PROCEDURE [dbo].[sp_abm_peliculas](
	@action int,
	@id_peli int =null,
    @txt_desc varchar(500),
	@cant_disponibles_alquiler int =null,	
	@cant_disponibles_venta int =null,
	@precio_alquiler numeric(18,2) =null,
	@precio_venta numeric(18,2) =null
	)
	
	
AS
BEGIN

if(@action =1)
	begin
		insert into dbo.tPelicula values(@txt_desc,@cant_disponibles_alquiler,@cant_disponibles_venta,@precio_alquiler,@precio_venta)
	end
else if(@action = 2)
	begin
		update dbo.tPelicula set txt_desc =@txt_desc,
								 cant_disponibles_alquiler =@cant_disponibles_alquiler,
								 cant_disponibles_venta = @cant_disponibles_venta,
								 precio_alquiler = @precio_alquiler,
								 precio_venta = @precio_venta where cod_pelicula = @id_peli
	end
else if (@action = 3)
	begin
		update dbo.tPelicula set cant_disponibles_alquiler =0,
								 cant_disponibles_venta = 0
							     where cod_pelicula = @id_peli
	end
else 
	begin
		set @action = 999
	end
	
	return @action
	
END
