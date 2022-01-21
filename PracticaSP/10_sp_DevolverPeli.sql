USE [TestSc]
GO
/****** Object:  StoredProcedure    Script Date: 21/1/2022 15:19:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create or alter    PROCEDURE [dbo].[sp_return_movie]( @cod_alq int )
	
	
AS
BEGIN
	declare @cod_peli int = (select cod_pelicula from dbo.tAlquiler where cod_alq = @cod_alq)
	DECLARE @CANT int = (select cant_disponibles_alquiler from dbo.tPelicula where cod_pelicula = @cod_peli)+1
	delete from dbo.tAlquiler where cod_alq = @cod_alq

	update dbo.tPelicula set cant_disponibles_alquiler = @CANT
	where cod_pelicula = @cod_peli

END
