USE [TestSc]
GO
/****** Object:  StoredProcedure [dbo].[sp_rent_sell_manage]    Script Date: 21/1/2022 15:40:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create  or alter  PROCEDURE [dbo].[sp_movies_rented](

	@cod_usr int 
)
	
	
AS
BEGIN
	declare @tablaAux TABLE(cod_usr int ,nom_peli varchar(500),monto_alq numeric(18,2),fechaAlquiler datetime)
	
	insert into @tablaAux
	select al.cod_usuario as codigoUsuario,
		   p.txt_desc as nombrePelicula,
		   p.precio_alquiler as montoAlquiler,
		   al.fecha_alq as fechaAlquiler
	from dbo.tAlquiler al
	inner join dbo.tPelicula p on p.cod_pelicula = al.cod_pelicula
	where al.cod_usuario = @cod_usr
	
	select * from @tablaAux

END
