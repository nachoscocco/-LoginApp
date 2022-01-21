USE [TestSc]
GO
/****** Object:  StoredProcedure [dbo].[sp_abm_peliculas]    Script Date: 21/1/2022 13:49:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[sp_assign_gender](
	@peli_id int,
	@gen_id int 
    
	)
	
	
AS
BEGIN
	declare @gen_actual as int = (SELECT cod_genero from dbo.tGeneroPelicula where cod_pelicula = @peli_id)

	if(@gen_actual is null)
		begin
			insert into dbo.tGeneroPelicula values(@peli_id, @gen_id)
		end
	else
		begin
			set @peli_id = 999
		end
	return @peli_id
END
