

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

ALTER TABLE [dbo].[tblTraducaoComponenteObjetoTraducao]  WITH CHECK ADD  CONSTRAINT [FK_tblTraducaoComponenteObjetoTraducao_tblTraducaoComponenteObjetoTraducao] FOREIGN KEY([IdiomaId])
REFERENCES [dbo].[tblTraducaoIdioma] ([CodIdioma])
GO

ALTER TABLE [dbo].[tblTraducaoComponenteObjetoTraducao] CHECK CONSTRAINT [FK_tblTraducaoComponenteObjetoTraducao_tblTraducaoComponenteObjetoTraducao]
GO


