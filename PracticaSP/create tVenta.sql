CREATE TABLE [dbo].tVenta(
	cod_venta [int] PRIMARY KEY IDENTITY,
	cod_usuario [int] NULL,
	cod_pelicula [int] NULL,
	[monto] [real] NULL,
	[fecha_venta] [datetime] NULL,
	CONSTRAINT fk_peli_vendida FOREIGN KEY(cod_pelicula) REFERENCES dbo.tPelicula(cod_pelicula),
	CONSTRAINT fk_user_venta FOREIGN KEY(cod_usuario) REFERENCES dbo.tUsers(cod_usuario))


