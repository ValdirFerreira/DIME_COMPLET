

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

ALTER TABLE [dbo].[tblTraducaoIdioma]  WITH CHECK ADD  CONSTRAINT [FK_tblIdioma_tblIdioma] FOREIGN KEY([CodIdioma])
REFERENCES [dbo].[tblTraducaoIdioma] ([CodIdioma])
GO

ALTER TABLE [dbo].[tblTraducaoIdioma] CHECK CONSTRAINT [FK_tblIdioma_tblIdioma]
GO

--CodIdioma	DescIdioma	SiglaIdioma	FlagAtivo
--1	Portugues	por	1
--2	Ingles	ing	1
--3	Espanhol	esp	1


