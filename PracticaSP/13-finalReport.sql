USE [TestSc]
GO
/****** Object:  StoredProcedure [dbo].[sp_movies_rented]    Script Date: 21/1/2022 16:02:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER  PROCEDURE [dbo].[sp_final_report]
	
	
AS
BEGIN
	declare @tablaAux TABLE(nom_peli varchar(500),monto_alq numeric(18,2),cantAlq int)

	insert into @tablaAux
	select  p.txt_desc as nombrePelicula,
		   SUM(al.monto) as montoTotal,
		   COUNT(al.cod_pelicula) as cantidadAlquileres
	from dbo.tAlquiler al
	inner join dbo.tPelicula p on p.cod_pelicula = al.cod_pelicula
	GROUP BY al.cod_pelicula , p.txt_desc
	select * from @tablaAux

END
