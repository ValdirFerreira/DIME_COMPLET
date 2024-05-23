

IF OBJECT_ID('dbo.tblTraducaoIdioma', 'U') IS NOT NULL
    DROP TABLE dbo.tblTraducaoIdioma;
GO
/****** Object:  Table [dbo].[tblTraducaoIdioma]    Script Date: 15/12/2022 10:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTraducaoIdioma](
	[CodIdioma] [int] IDENTITY(1,1) NOT NULL,
	[DescIdioma] [varchar](50) NULL,
	[SiglaIdioma] [varchar](10) NULL,
	[FlagAtivo] [tinyint] NULL,
 CONSTRAINT [PK_tblIdioma] PRIMARY KEY CLUSTERED 
(
	[CodIdioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[tblTraducaoIdioma] ON 

INSERT [dbo].[tblTraducaoIdioma] ([CodIdioma], [DescIdioma], [SiglaIdioma], [FlagAtivo]) VALUES (1, N'Portugues', N'por', 1)
INSERT [dbo].[tblTraducaoIdioma] ([CodIdioma], [DescIdioma], [SiglaIdioma], [FlagAtivo]) VALUES (2, N'Ingles', N'ing', 1)
INSERT [dbo].[tblTraducaoIdioma] ([CodIdioma], [DescIdioma], [SiglaIdioma], [FlagAtivo]) VALUES (3, N'Espanhol', N'esp', 1)
SET IDENTITY_INSERT [dbo].[tblTraducaoIdioma] OFF
GO


IF OBJECT_ID('dbo.tblTraducaoComponenteObjetoTraducao', 'U') IS NOT NULL
    DROP TABLE dbo.tblTraducaoComponenteObjetoTraducao;
GO
/****** Object:  Table [dbo].[tblTraducaoComponenteObjetoTraducao]    Script Date: 15/12/2022 10:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTraducaoComponenteObjetoTraducao](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdiomaId] [int] NOT NULL,
	[Objeto] [nvarchar](150) NOT NULL,
	[Texto] [nvarchar](2000) NULL,
 CONSTRAINT [PK_tblTraducaoComponenteObjetoTraducao] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ON 

-- Insert statements for tblTraducaoComponenteObjetoTraducao
INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (0, 1, N'T0', N'Directorio de Instituiciones Medios Y Empresas • DIME');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (1, 1, N'T1', N'Entidad a buscar por razón social, nombre comercial o RUC');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (2, 1, N'T2', N'Directorio en Actualización 2024');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (3, 1, N'T3', N'Contamos con');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (4, 1, N'T4', N'¿Qué es el Ipsos Dime?');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (5, 1, N'T5', N'¿Por qué suscribirse al Ipsos DIME?');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (6, 1, N'T6', N'TEXTO PRICING');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (7, 1, N'T7', N'Bibendum amet at molestie mattis');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (8, 1, N'T8', N'Premium');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (9, 1, N'T9', N'Quisque donec nibh diam tellus integer eros.');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (10, 1, N'T10', N'Suscripción anual');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (11, 1, N'T11', N'Quiero este');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (12, 1, N'T12', N'Acceso total a toda la información del directorio');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (13, 1, N'T13', N'Permitirá realizar diversas operaciones como: filtrar, exportar, imprimir los datos');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (14, 1, N'T14', N'Acceso a 5 licencias');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (15, 1, N'T15', N'Datos generales: Razón social, dirección, teléfono, web, ranking por sector, etc.');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (16, 1, N'T16', N'WhatsApp, Facebook, Instagram, Linkedin, entre otros');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (17, 1, N'T17', N'Contactos: Más de 120 mil con cargos y correos corporativos');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (18, 1, N'T18', N'Ejecutivo');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (19, 1, N'T19', N'Quisque donec nibh diam tellus integer eros.');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (20, 1, N'T20', N'Visualizador de los principales datos de cada una de las entidades');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (21, 1, N'T21', N'Se puede hacer búsqueda por entidad o por sector económico');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (22, 1, N'T22', N'Más de 12 mil empresas e instituciones públicas y privadas con sus principales campos');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (23, 1, N'T23', N'Contactos: Más de 120 mil con cargos y correos corporativos');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (24, 1, N'T24', N'Empresas');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (25, 1, N'T25', N'Acceso parcial de la información, solo al segmento EMPRESAS');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (26, 1, N'T26', N'Contiene: Más de 8 mil empresas y los principales medios de comunicación');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (27, 1, N'T27', N'Contactos: Más de 80 mil con cargos y correos corporativos');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (28, 1, N'T28', N'Sobre el contenido del directorio');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (29, 1, N'T29', N'Tranquilo, ¡siempre estaremos contigo!');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (30, 1, N'T30', N'¿Qué necesitas?');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (31, 1, N'T31', N'Ipsos Opinión y Mercado S.A. RUC:20260497414');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (32, 1, N'T32', N'Email us');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (33, 1, N'T33', N'dime@ipsos.com');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (34, 1, N'T34', N'Phone');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (35, 1, N'T35', N'(51) 6100100');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (36, 1, N'T36', N'address');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (37, 1, N'T37', N'Av. Reducto, 1363 • Miraflores');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (38, 1, N'T38', N'Conéctese con nosotros:');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (39, 1, N'T39', N'¿Tiene alguna duda? — Podemos ayudarle.');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (40, 1, N'T40', N'¿Tienes un proyecto? ¡Escríbeme si quieres trabajar juntos en algo emocionante! ¿O necesitas nuestra ayuda? No dudes en contactarnos.');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (41, 1, N'T41', N'Empresa');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (42, 1, N'T42', N'Actividad Económica');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (43, 1, N'T43', N'Nombres');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (44, 1, N'T44', N'Correo electrónico');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (45, 1, N'T45', N'Comentario');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (46, 1, N'T46', N'Enviar mensaje');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (47, 1, N'T47', N'Ipsos DIME');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (48, 1, N'T48', N'Ipsos Opinión y Mercado S.A. RUC:20260497414');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (49, 1, N'T49', N'Ipsos Perú');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (50, 1, N'T50', N'App Trends');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (51, 1, N'T51', N'Marketing Data');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (52, 1, N'T52', N'Opinión Data Plus');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (53, 1, N'T53', N'Ipsos DIME @ 2024. Reservados todos los derechos');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (54, 1, N'T54', N'Privacidad y Protección de Datos');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (55, 1, N'T55', N'Términos Legales');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (56, 1, N'T56', N'Solicite una cotización — Colaborar juntos.');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (57, 1, N'T57', N'¿Tienes un proyecto? ¡Escríbeme si quieres trabajar juntos en algo emocionante! ¿O necesitas nuestra ayuda? No dudes en contactarnos.');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (58, 1, N'T58', N'Empresa');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (59, 1, N'T59', N'Actividad Económica');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (60, 1, N'T60', N'Nombres');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (61, 1, N'T61', N'Correo electrónico');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (62, 1, N'T62', N'Comentario');

INSERT INTO [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) 
VALUES (63, 1, N'T63', N'Enviar mensaje');


SET IDENTITY_INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] OFF
GO

IF OBJECT_ID('[dbo].[pr_Lista_Traducao]', 'P') IS NOT NULL
BEGIN
    DROP PROCEDURE [dbo].[pr_Lista_Traducao]
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_Lista_Traducao]
  @idiomaId INT
AS
BEGIN
  -- 'por'  1
  -- 'ing'  2
  -- 'esp'  3

  SELECT Objeto AS objeto, Texto AS valor
  FROM tblTraducaoComponenteObjetoTraducao t1 WITH (NOLOCK)
  JOIN tblTraducaoIdioma t2 WITH (NOLOCK) ON t1.IdiomaId = t2.CodIdioma
  WHERE t2.CodIdioma = @idiomaId
END
GO


IF OBJECT_ID('dbo.tblFaqPortal', 'U') IS NOT NULL
    DROP TABLE dbo.tblFaqPortal;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFaqPortal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdKeyFaq] int NOT NULL,
	[KeyFaq] [nvarchar](150) NOT NULL,
	[TitleFaq] [nvarchar](MAX) NULL,
	[TextoFaq] [nvarchar](MAX) NULL,
 CONSTRAINT [PK_tblFaqPortal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


SET IDENTITY_INSERT [dbo].[tblFaqPortal] ON 

INSERT INTO [dbo].[tblFaqPortal] 
    ([Id], [IdKeyFaq], [KeyFaq], [TitleFaq], [TextoFaq]) 
VALUES 
    (1, 1, N'Contenido', N'¿CUANTOS CAMPOS CONTIENE EL DIME ACTUALMENTE?', 
     N'Contamos actualmente con más de 45 campos divididos en las siguientes categorías: datos generales, redes sociales y contactos.'),
    (2, 1, N'Contenido', N'¿EL DIRECTORIO CUENTA CON UNA CLASIFICACIÓN POR SECTOR ECONÓMICO?', 
     N'Sí, el directorio clasifica la información en 34 sectores económicos como: agricultura, almacenamiento y manipulación de carga, bancos, bebidas, comercio, educación, electricidad, grandes almacenes, industria, inmobiliarias, marketing y publicidad, medios de comunicación, minería, petróleo, pesca, salud, seguridad, seguros, servicios, telecomunicaciones, textiles, turismo, vehículos, venta, entre otros.'),
    (3, 1, N'Contenido', N'¿EXISTE UN RANKING POR FACTURACIÓN EN EL DIME?', 
     N'Sí, en el Ipsos DIME manejamos dos tipos de ranking: uno general en donde las entidades se colocan en orden de facturación y un ranking sectorial, donde cada entidad ocupa un puesto según su sector económico.'),

	 ------

	 (4, 2, N'Directorio', N'¿OFRECEN CAPACITACIONES PARA EL BUEN USO DEL PRODUCTO?', 
     N'Sí; el DIRECTORIO tiene derecho a una capacitación gratuita al momento de adquirir el producto para asegurar su correcta utilización.'),
    (5, 2, N'Directorio', N'¿ES POSIBLE SEGMENTAR LA INFORMACIÓN TODAS LAS VECES QUE SE REQUIERAN?', 
     N'Sí es posible. Durante el año de suscripción se pueden hacer filtros ilimitados por cualquiera de los campos presentados en el directorio, lo que permite llegar rápidamente al target que se está buscando.'),
    (6, 2, N'Directorio', N'¿SE PUEDE OFRECER A TERCEROS LOS DATOS DEL DIRECTORIO?', 
     N'No, no se pueden entregar los datos del directorio a terceros debido a la existencia de un contrato de confidencialidad. Esta información pertenece a Ipsos quien comparte la información únicamente con sus suscriptores.'),

	 -----

	  (7, 3, N'Actualización', N'¿CON QUÉ FRECUENCIA SE ACTUALIZAN LAS ENTIDADES DEL DIRECTORIO?', 
     N'Cada entidad, ya sea empresa, institución o medio de comunicación, se actualiza una vez al año. Sin embargo, en casos específicos, puede haber actualización hasta dos veces al año.'),
    (8, 3, N'Actualización', N'¿CUÁNTAS ENTIDADES SE ACTUALIZAN MENSUALMENTE?', 
     N'En promedio se actualizan 1,000 entidades mensuales, y alrededor de 12,000 contactos, lo cual hace que tengamos 12,000 empresas actualizadas en el año.'),
    (9, 3, N'Actualización', N'¿CUÁL ES LA FUENTE DE INFORMACIÓN PARA LA ACTUALIZACIÓN DEL DIRECTORIO?', 
     N'La actualización se realiza a través de búsqueda de información en páginas web, redes sociales, medios de comunicación y/o revistas especializadas.'),

	 -----

	 (10, 4, N'Producto', N'¿CUÁNDO SE ENTREGAN LOS ACCESOS AL Ipsos DIME?', 
     N'Máximo 24 horas después de reportar el pago total de la factura.'),
    (11, 4, N'Producto', N'¿ES LA RENOVACIÓN DEL DIME AUTOMÁTICA?',
     N'La renovación del IpsosDIME no es automática. Se envía un aviso con un mes de anticipación para que los clientes puedan realizar la renovación respectiva. Si no se realiza dentro del mes acordado, se pierde el derecho a un precio con descuento y el cliente deberá suscribirse de nuevo como cliente nuevo.'),
    (12, 4, N'Producto', N'¿CUÁNTOS ACCESOS SE PUEDEN PROPORCIONAR CON LA ADQUISICIÓN DEL DIRECTORIO?', 
     N'Con la adquisición del directorio, se pueden proporcionar hasta 5 accesos en las presentaciones PREMIUM y EMPRESAS, y hasta 3 accesos en la presentación EJECUTIVO.'),
    (13, 4, N'Producto', N'¿EL DIME PROPORCIONA DATOS PERSONALES?', 
     N'Es importante recordar que el IpsosDIME no está sujeto a la Ley N° 29733, Ley de Protección de Datos Personales vigente en Perú desde 2011. Esto se debe a que los datos que presenta el Directorio son exclusivamente empresariales. No solicitamos ningún tipo de datos personales, como números de celular, DNI u otros que puedan ser considerados personales.');

SET IDENTITY_INSERT [dbo].[tblFaqPortal] OFF
GO

