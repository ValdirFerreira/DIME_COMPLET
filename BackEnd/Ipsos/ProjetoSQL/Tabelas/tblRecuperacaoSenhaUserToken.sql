

CREATE TABLE [dbo].[tblRecuperacaoSenhaUserToken](
	[Token] [varchar](36) NOT NULL,
	[Email] [varchar](120) NOT NULL,
	[DataCriacaoToken] [datetime] NOT NULL,
	[DataTokenUtilizado] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


