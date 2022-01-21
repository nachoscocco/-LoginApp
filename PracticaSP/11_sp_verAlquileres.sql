USE [TestSc]
GO
/****** Object:  StoredProcedure [dbo].[sp_rent_sell_manage]    Script Date: 21/1/2022 15:40:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create  or alter  PROCEDURE [dbo].[sp_rent_report]
	
	
AS
BEGIN
	declare @tablaAux TABLE(cod_usr int ,nom_peli varchar(500),fecha_alq datetime)
	
	insert into @tablaAux
	select al.cod_usuario as codigoUsuario,
		   p.txt_desc as nombrePelicula,
		   al.fecha_alq as fechaAlquiler
	from dbo.tAlquiler al
	inner join dbo.tPelicula p on p.cod_pelicula = al.cod_pelicula
	
	select * from @tablaAux

END
