USE [TestSc]
GO
/****** Object:  StoredProcedure [dbo].[sp_rent_sell_manage]    Script Date: 21/1/2022 15:15:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- INGRESAR ACCION 1 = INSERT


-- 1 stock alq
-- 2 stock venta

create or alter  PROCEDURE [dbo].[sp_get_stock](
	@action int,
	@cod_peli int =null

	)
	
	
AS
BEGIN
	if(@action=1)
		begin
			declare @cant_alq int =  (select cant_disponibles_alquiler from dbo.tPelicula p where p.cod_pelicula = @cod_peli)
			
		return @cant_alq


		end
	else if(@action=2)
		begin
			declare @cant_ven int =  (select cant_disponibles_venta from dbo.tPelicula p where p.cod_pelicula = @cod_peli)
			return @cant_ven
		end
	else 
		begin
			set @cod_peli = 999
		end


END
