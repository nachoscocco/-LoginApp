CREATE TABLE [dbo].[tAlquiler](
	[cod_alq] [int] PRIMARY KEY IDENTITY,
	cod_usuario [int] NULL,
	cod_pelicula [int] NULL,
	[monto] [real] NULL,
	[fecha_alq] [datetime] NULL,
	CONSTRAINT fk_peli_alquilada FOREIGN KEY(cod_pelicula) REFERENCES dbo.tPelicula(cod_pelicula),
	CONSTRAINT fk_user_alquiler FOREIGN KEY(cod_usuario) REFERENCES dbo.tUsers(cod_usuario))


