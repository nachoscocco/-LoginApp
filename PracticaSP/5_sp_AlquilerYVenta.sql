USE [TestSc]
GO
/****** Object:  StoredProcedure [dbo].[sp_abm_peliculas]    Script Date: 21/1/2022 14:51:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--action 1=  alquiler
-- action 2= venta

create or alter PROCEDURE [dbo].[sp_rent_sell_manage](
	@action int,
	@cod_peli int =null,
	@cod_usr int

	)
	
	
AS
BEGIN
	if(@action=1)
		begin
			declare @cant_alq int =  (select cant_disponibles_alquiler from dbo.tPelicula p where p.cod_pelicula = @cod_peli)
			declare @precio_alq numeric(18,2) = (select precio_alquiler from dbo.tPelicula p where p.cod_pelicula = @cod_peli)
		
			if(@cant_alq = 0 )
				begin
					set @cod_peli = 800
				end
			else
				begin
				
					insert into dbo.tAlquiler  values(@cod_usr,@cod_peli,@precio_alq,SYSDATETIME())
					update dbo.tPelicula set cant_disponibles_alquiler = (@cant_alq-1) where cod_pelicula = @cod_peli
				end


		end
	else if(@action=2)
		begin
			declare @cant_ven int =  (select cant_disponibles_venta from dbo.tPelicula p where p.cod_pelicula = @cod_peli)
			declare @precio_ven numeric(18,2) = (select precio_venta from dbo.tPelicula p where p.cod_pelicula = @cod_peli)
		
			if(@cant_alq = 0 )
				begin
					set @cod_peli = 900
				end
			else
				begin
				
					insert into dbo.tVenta  values(@cod_usr,@cod_peli,@precio_ven,SYSDATETIME())
					update dbo.tPelicula set cant_disponibles_venta = (@cant_ven - 1) where cod_pelicula = @cod_peli
				end


		end
	else 
		begin
			set @cod_peli = 999
		end


END
