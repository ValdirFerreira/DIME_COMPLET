
GO
/****** Object:  Table [dbo].[tblMensagemPopUp]    Script Date: 15/12/2022 10:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMensagemPopUp](
	[CodPopUP] [int] IDENTITY(1,1) NOT NULL,
	[DescPopUp] [varchar](4000) NULL,
	[FlagAtivo] [tinyint] NULL,
 CONSTRAINT [PK_tblMensagemPopUp] PRIMARY KEY CLUSTERED 
(
	[CodPopUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
/****** Object:  Table [dbo].[tblUser]    Script Date: 15/12/2022 10:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[CodUser] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[UpdateDate] [date] NULL,
	[CodUserPerfil] [int] NOT NULL,
	[FlagAtivo] [bit] NOT NULL,
	[Token] [varchar](100) NULL,
	[FlagPopUp] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserIdioma]    Script Date: 15/12/2022 10:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserIdioma](
	[CodUser] [int] NOT NULL,
	[CodIdioma] [int] NOT NULL,
 CONSTRAINT [PK_tblUserIdioma] PRIMARY KEY CLUSTERED 
(
	[CodUser] ASC,
	[CodIdioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserPerfil]    Script Date: 15/12/2022 10:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserPerfil](
	[CodUserPerfil] [int] IDENTITY(1,1) NOT NULL,
	[DescUserPerfil] [varchar](50) NULL,
 CONSTRAINT [PK_tblPerfil] PRIMARY KEY CLUSTERED 
(
	[CodUserPerfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

GO

/****** Object:  Table [dbo].[tblLog]    Script Date: 15/12/2022 10:29:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblLog](
	[IdLog] [int] IDENTITY(1,1) NOT NULL,
	[CodUser] [int] NULL,
	[Email] [varchar](150) NULL,
	[DataLog] [datetime] NOT NULL,
	[Informacao] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblLog] ADD  DEFAULT (getdate()) FOR [DataLog]
GO

SET IDENTITY_INSERT [dbo].[tblMensagemPopUp] ON 

INSERT [dbo].[tblMensagemPopUp] ([CodPopUP], [DescPopUp], [FlagAtivo]) VALUES (1, N'Quarter de BVC não são comparáveis um com o outro devido à perda de histórico.', 0)
INSERT [dbo].[tblMensagemPopUp] ([CodPopUP], [DescPopUp], [FlagAtivo]) VALUES (2, N'Devido às alterações no questionário e no set de marcas, o estudo de 2022 não tem consistência estatística para comparação com as ondas anteriores', 0)
SET IDENTITY_INSERT [dbo].[tblMensagemPopUp] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ON 

INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (2, 1, N'login.titulo', N'Iniciar Sessão')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (3, 1, N'login.sub-titulo', N'Informe seu Usuário e senha para acessar o portal.')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (4, 1, N'login.usuario', N'Usuário')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (5, 1, N'login.email.placeholder', N'Digite seu e-mail de acesso')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (8, 1, N'login.campoobrigatorio', N'Campo obrigatório')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (10, 1, N'login.senha', N'Senha')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (11, 1, N'login.usuarioInvalido', N'Email ou senha não conferem')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (12, 1, N'login.esqueceu.senha', N'Esqueceu a senha?')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (13, 1, N'login.btn.acessar', N'Acessar')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (14, 1, N'login.direitos', N'Todos os direitos reservados')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (15, 1, N'login.recupera.senha', N'Recuperação de acesso')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (16, 1, N'login.enviar', N'Enviar')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (17, 1, N'login.solicita.senha', N'Solicitação enviada com sucesso!')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (18, 1, N'login.acessar.email.altera.senha', N'Acesse seu e-mail para alterar a senha!')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (19, 1, N'login.ocorreu.erro', N'Ocorreu um erro!')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (20, 1, N'login.contato.suporte', N'Entre em contato com o suporte técnico para ajudá-lo
 recuperar o acesso ao sistema.')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (21, 1, N'login.fechar', N'Fechar')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (22, 1, N'recuperar.alteracao.senha', N'Alteração de senha')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (23, 1, N'recuperar.valida.qtd.caracteres', N'Deve conter pelo menos 8 caracteres.')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (24, 1, N'recuperar.valida.qtd.numeros', N'Deve conter pelo menos um número.')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (26, 1, N'recuperar.valida.qtd.maiuscula', N'Deve conter pelo menos uma letra maiúscula.')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (27, 1, N'recuperar.valida.qtd.minuscula', N'Deve conter pelo menos uma letra minúscula.')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (28, 1, N'recuperar.valida.qtd.caractere.especial', N'Deve conter pelo menos 1 caractere especial.')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (29, 1, N'recuparar.confirme.senha', N'Confirme sua senha:')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (30, 1, N'recuperar.campo.obrigatorio', N'Campo Obrigatótio')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (31, 1, N'recuperar.senha.nao.confere', N'As senhas não correspondem!')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (32, 1, N'recupera.alterar.senha', N'Alterar senha')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (33, 1, N'recuperar.alteracao.sucesso', N'Senha alterada com Sucesso!')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (34, 1, N'recuperar.texto.redirecionado', N'Você será redirecionado em alguns segundos...')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (35, 1, N'recuperar.texto.erro', N'Algo deu errado!')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (36, 1, N'recuperar.contato.suporte', N'Entre em contato com o suporte técnico para ajudá-lo
 recuperar o acesso ao sistema.')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (37, 1, N'recuperar.voltar', N'Voltar')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (38, 1, N'sidebar.menu1', N'One Page')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (39, 1, N'sidebar.menu2', N'Awareness')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (40, 1, N'sidebar.menu3', N'Funil
de Marca')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (41, 1, N'sidebar.menu4', N'Imagem Pura')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (42, 1, N'sidebar.menu5', N'Posicionamento da Marca')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (43, 1, N'sidebar.menu6', N'Brand Value Creator (BVC)')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (44, 1, N'sidebar.menu7', N'Comunicação')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (45, 1, N'navbar.titulo1', N'Imobiliária Digital')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (46, 1, N'navbar.titulo2', N'Awareness')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (47, 1, N'filtro.btn.filtrar', N'Filtrar')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (48, 1, N'navbar.dashboard-one', N'One Page')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (49, 1, N'navbar.dashboard-two', N'Awareness')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (50, 1, N'navbar.dashboard-three', N'Funil
de Marca')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (51, 1, N'navbar.dashboard-four', N'Imagem Pura')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (52, 1, N'navbar.dashboard-five', N'Posicionamento da Marca')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (53, 1, N'navbar.dashboard-six', N'Brand Value Creator (BVC)')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (54, 1, N'navbar.dashboard-seven', N'Comunicação')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (55, 1, N'menu.titulo', N'Escolha o seu destino')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (56, 1, N'menu.subtitulo', N'Utilize as opções disponiveis abaixo ')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (57, 1, N'dashboard-two-grafico2-titulo', N'Evolutivo de Marcas')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (58, 1, N'dashboard-two-grafico2-subtitulo', N'Valores em %')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (59, 1, N'dashboard-sig', N'Sig 95%')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (60, 1, N'dashboard-exporta', N'Exportar')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (61, 1, N'dashboard-two-leg-Awareness', N'Awareness - TOM')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (62, 1, N'dashboard-two-leg-Spontaneous', N'Spontaneous - OM')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (63, 1, N'dashboard-two-leg-Prompeted', N'Prompted')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (64, 1, N'dashboard-two-leg-total-Awareness', N'Total Awareness')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (65, 1, N'dashboard-two-grafico1-titulo', N'Comparativo de Marcas')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (66, 1, N'dashboard-two-grafico1-subtitulo', N'Valores em %')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (67, 1, N'dashboard-three-grafico2-subtitulo', N'Valores em %')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (68, 1, N'dashboard-three-grafico1-subtitulo', N'Valores em %')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (69, 1, N'dashboard-three-grafico1-titulo', N'Comparativo de Marcas')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (70, 1, N'dashboard-three-grafico2-titulo', N'Evolutivo de Marcas')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (71, 1, N'dashboard-three-leg-wave-anterior', N'Wave Anterior')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (72, 1, N'dashboard-four-grafico1-titulo', N'Comparativo de Marcas')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (73, 1, N'dashboard-four-grafico1-subtitulo', N'Valores em %')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (74, 1, N'navbar.descricao.filtro.regiao', N'Região')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (75, 1, N'navbar.descricao.filtro.demografico', N'Demográfico')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (76, 1, N'dashboard-four-grafico2-titulo', N'Imagem pura evolutiva entre dois períodos')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (77, 1, N'dashboard-four-grafico2-subtitulo', N'Valores em %')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (78, 1, N'dashboard-four-grafico3-titulo', N'Imagem pura evolutiva mais de dois períodos')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (79, 1, N'dashboard-four-grafico3-subtitulo', N'Valores em %')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (80, 1, N'grafico-funil-conhecimento', N'Awareness')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (81, 1, N'grafico-funil-consideracao', N'Consideration')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (82, 1, N'grafico-funil-uso', N'Trial')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (83, 1, N'grafico-funil-preferencia', N'Repurchase')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (84, 1, N'grafico-texto-tooltip-perc', N'Perc')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (85, 1, N'grafico-texto-tooltip-media', N'Média')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (86, 1, N'grafico-texto-tooltip-base', N'Base')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (87, 1, N'grafico-texto-tooltip-periodo', N'Período')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (88, 1, N'dashboard-five-grafico1-titulo', N'Comparativo de Marcas')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (89, 1, N'dashboard-five-grafico1-subtitulo', N'Valores em %')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (90, 1, N'dashboard-five-grafico2-titulo', N'Evolutivo de Marcas')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (91, 1, N'dashboard-five-grafico2-subtitulo', N'Valores em %')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (92, 1, N'dashboard-five-grafico3-titulo', N'Comparativo de Marcas')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (93, 1, N'dashboard-five-grafico3-subtitulo', N'Valores em %')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (96, 1, N'dashboard-six-grafico1-titulo', N'Comparativo de Marcas - Top 10')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (97, 1, N'dashboard-six-grafico1-subtitulo', N'Valores em %')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (98, 1, N'dashboard-six-grafico2-titulo', N'Evolutivo de Marcas')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (99, 1, N'dashboard-six-grafico3-titulo', N'Efeitos de Mercado')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (100, 1, N'dashboard-six-grafico3-subtitulo', N'Valores em %')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (101, 1, N'dashboard-six-grafico4-titulo', N'Efeitos de Mercado')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (102, 1, N'dashboard-six-grafico4-subtitulo', N'Valores em %')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (103, 1, N'grafico-barras-top-marcas.titulo1', N'Share de Desejo')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (104, 1, N'grafico-barras-top-marcas.titulo2', N'Efeitos de Mercado')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (105, 1, N'grafico-barras-top-marcas.titulo3', N'Equity Efetivo')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (106, 1, N'dashboard-seven-grafico1-titulo', N'Recall')
GO
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (107, 1, N'dashboard-seven-grafico1-subtitulo', N'Valores em %')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (108, 1, N'dashboard-seven-grafico2-titulo', N'Propaganda Milton TV')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (109, 1, N'sidebar-menu-sair', N'logoff')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (110, 1, N'login.emailSenhaObrigatorio', N'E-mail e senha são obrigatórios')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (111, 1, N'top-evolutivo.titulo1', N'Wave 1')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (112, 1, N'top-evolutivo.titulo2', N'Wave 2')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (113, 1, N'top-evolutivo.titulo3', N'Wave 3')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (114, 1, N'top-evolutivo.titulo4', N'Wave 4')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (115, 1, N'dashboard-diagnostico-propaganda.GAP', N'GAP vs
 Norma')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (116, 1, N'dashboard-seven-grafico3-titulo', N'Onde se lembra de ter visto a propaganda')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (117, 1, N'dashboard-seven-grafico4-titulo', N'Diagnóstico de Propaganda')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (118, 1, N'dashboard-comunicacao-titulo1', N'Quinto Andar')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (119, 1, N'dashboard-comunicacao-titulo2', N'Norma')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (120, 1, N'recall-coluna1.titulo', N'Viu o anúncio')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (121, 1, N'recall-coluna1.SubTitulo', N'Visibilidade')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (122, 1, N'recall-coluna2.titulo', N'Viu e associou com a marca')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (123, 1, N'recall-coluna2.SubTitulo', N'Brand Linkage')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (124, 1, N'recall-coluna3.titulo', N'Viu e associou a marca no total')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (125, 1, N'recall-coluna3.SubTitulo', N'Recall')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (126, 1, N'dashboard-square', N'-20 ou + 20')
INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] ([Id], [IdiomaId], [Objeto], [Texto]) VALUES (127, 1, N'grafico-funil-Loyalty', N'Loyalty')
SET IDENTITY_INSERT [dbo].[tblTraducaoComponenteObjetoTraducao] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTraducaoIdioma] ON 

INSERT [dbo].[tblTraducaoIdioma] ([CodIdioma], [DescIdioma], [SiglaIdioma], [FlagAtivo]) VALUES (1, N'Portugues', N'por', 1)
INSERT [dbo].[tblTraducaoIdioma] ([CodIdioma], [DescIdioma], [SiglaIdioma], [FlagAtivo]) VALUES (2, N'Ingles', N'ing', 1)
INSERT [dbo].[tblTraducaoIdioma] ([CodIdioma], [DescIdioma], [SiglaIdioma], [FlagAtivo]) VALUES (3, N'Espanhol', N'esp', 1)
SET IDENTITY_INSERT [dbo].[tblTraducaoIdioma] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([CodUser], [Name], [Password], [Email], [CreateDate], [UpdateDate], [CodUserPerfil], [FlagAtivo], [Token], [FlagPopUp]) VALUES (1, N'Ipsos - Teste', N'BB78J58', N'ipsos@teste.com.br', CAST(N'2022-05-11' AS Date), CAST(N'2022-05-11' AS Date), 1, 1, NULL, 1)
INSERT [dbo].[tblUser] ([CodUser], [Name], [Password], [Email], [CreateDate], [UpdateDate], [CodUserPerfil], [FlagAtivo], [Token], [FlagPopUp]) VALUES (2, N'Tania Mancini', N'1234', N'MZMHZ.FZMBHMH@HORNR.BNL', CAST(N'2022-07-04' AS Date), CAST(N'2022-07-04' AS Date), 1, 1, NULL, 1)
INSERT [dbo].[tblUser] ([CodUser], [Name], [Password], [Email], [CreateDate], [UpdateDate], [CodUserPerfil], [FlagAtivo], [Token], [FlagPopUp]) VALUES (3, N'Suzana Amalfi', N'Ad4sC0m2', N'LTYZMZ.TLZKEH@HORNR.BNL', CAST(N'2022-07-04' AS Date), CAST(N'2022-07-04' AS Date), 1, 1, NULL, 1)
INSERT [dbo].[tblUser] ([CodUser], [Name], [Password], [Email], [CreateDate], [UpdateDate], [CodUserPerfil], [FlagAtivo], [Token], [FlagPopUp]) VALUES (4, N'Marcio Lopes', N'P8Bj87rH', N'FZQBHN.ENODR@HORNR.BNL', CAST(N'2022-07-04' AS Date), CAST(N'2022-07-04' AS Date), 1, 1, NULL, 1)
INSERT [dbo].[tblUser] ([CodUser], [Name], [Password], [Email], [CreateDate], [UpdateDate], [CodUserPerfil], [FlagAtivo], [Token], [FlagPopUp]) VALUES (5, N'Yanka Martins', N'gA923BVE', N'RZMJZ.FZQSHMR@HORNR.BNL', CAST(N'2022-07-04' AS Date), CAST(N'2022-07-04' AS Date), 1, 1, NULL, 1)
INSERT [dbo].[tblUser] ([CodUser], [Name], [Password], [Email], [CreateDate], [UpdateDate], [CodUserPerfil], [FlagAtivo], [Token], [FlagPopUp]) VALUES (6, N'Andre Helaehil', N'sMI191z6', N'TMCQD.ADKZDGHK@HORNR.EQO', CAST(N'2022-07-04' AS Date), CAST(N'2022-07-04' AS Date), 1, 1, NULL, 1)
INSERT [dbo].[tblUser] ([CodUser], [Name], [Password], [Email], [CreateDate], [UpdateDate], [CodUserPerfil], [FlagAtivo], [Token], [FlagPopUp]) VALUES (7, N'Vinicius Matos', N'S6i2cD24', N'RKPKEKWU.ICVQU@KRUQU.EQO', CAST(N'2022-07-04' AS Date), CAST(N'2022-07-04' AS Date), 1, 1, NULL, 1)
INSERT [dbo].[tblUser] ([CodUser], [Name], [Password], [Email], [CreateDate], [UpdateDate], [CodUserPerfil], [FlagAtivo], [Token], [FlagPopUp]) VALUES (8, N'Leonardo Humes', N'c77uD91q', N'HGQPCTFQ.DWOGU@KRUQU.EQO', CAST(N'2022-07-04' AS Date), CAST(N'2022-07-04' AS Date), 1, 1, NULL, 1)
INSERT [dbo].[tblUser] ([CodUser], [Name], [Password], [Email], [CreateDate], [UpdateDate], [CodUserPerfil], [FlagAtivo], [Token], [FlagPopUp]) VALUES (9, N'Samara Soares', N'1JKu5B5c', N'OCOCTC.OQCTGU@KRUQU.EQO', CAST(N'2022-07-04' AS Date), CAST(N'2022-07-04' AS Date), 1, 1, NULL, 1)
INSERT [dbo].[tblUser] ([CodUser], [Name], [Password], [Email], [CreateDate], [UpdateDate], [CodUserPerfil], [FlagAtivo], [Token], [FlagPopUp]) VALUES (10, N'Paulina Maialle', N'491d4e1V', N'LCWNKPC.ICKCNNG@KRUQU.IUS', CAST(N'2022-07-04' AS Date), CAST(N'2022-07-04' AS Date), 1, 1, NULL, 1)
INSERT [dbo].[tblUser] ([CodUser], [Name], [Password], [Email], [CreateDate], [UpdateDate], [CodUserPerfil], [FlagAtivo], [Token], [FlagPopUp]) VALUES (11, N'Sara Missae Uemura', N'6eTgKP87', N'SGXG.UKSAXG@OVYUY.IUS', CAST(N'2022-07-04' AS Date), CAST(N'2022-07-04' AS Date), 1, 1, NULL, 1)
INSERT [dbo].[tblUser] ([CodUser], [Name], [Password], [Email], [CreateDate], [UpdateDate], [CodUserPerfil], [FlagAtivo], [Token], [FlagPopUp]) VALUES (12, N'Dayane Azeredo', N'WzRS11Y2', N'JGEGTK.GFKXKJU@OVYUY.IUS', CAST(N'2022-07-04' AS Date), CAST(N'2022-07-04' AS Date), 1, 1, NULL, 1)
INSERT [dbo].[tblUser] ([CodUser], [Name], [Password], [Email], [CreateDate], [UpdateDate], [CodUserPerfil], [FlagAtivo], [Token], [FlagPopUp]) VALUES (13, N'Soraia Marioti', N'F58Ns742', N'YUXGOG.SGXOUZO@WAOTZUGTJGX.IUS.HX', CAST(N'2022-07-04' AS Date), CAST(N'2022-07-04' AS Date), 1, 1, NULL, 1)
INSERT [dbo].[tblUser] ([CodUser], [Name], [Password], [Email], [CreateDate], [UpdateDate], [CodUserPerfil], [FlagAtivo], [Token], [FlagPopUp]) VALUES (14, N'Andrea Silva', N'49XZd7fZ', N'GTJXKJ.BRUEJ@ZDRWCXJWMJA.LXV.KA', CAST(N'2022-07-04' AS Date), CAST(N'2022-07-04' AS Date), 1, 1, NULL, 1)
INSERT [dbo].[tblUser] ([CodUser], [Name], [Password], [Email], [CreateDate], [UpdateDate], [CodUserPerfil], [FlagAtivo], [Token], [FlagPopUp]) VALUES (15, N'Joselena Barreira', N'2N638BOo', N'SXBNUNWJ.KJAANRAJ@ZDRWCXJWMJA.LXV.KA', CAST(N'2022-07-04' AS Date), CAST(N'2022-07-04' AS Date), 1, 1, NULL, 1)
INSERT [dbo].[tblUser] ([CodUser], [Name], [Password], [Email], [CreateDate], [UpdateDate], [CodUserPerfil], [FlagAtivo], [Token], [FlagPopUp]) VALUES (16, N'Fernanda Domingos', N'2AUR070s', N'ONAWJWMJ.MXVRWPXB@ZDRWCXJWMJA.LXV.KA', CAST(N'2022-07-04' AS Date), CAST(N'2022-07-04' AS Date), 1, 1, NULL, 1)
INSERT [dbo].[tblUser] ([CodUser], [Name], [Password], [Email], [CreateDate], [UpdateDate], [CodUserPerfil], [FlagAtivo], [Token], [FlagPopUp]) VALUES (17, N'Luz Quezada', N'CFrSBkmc', N'ODI.TDNIJMJ@RYBXB.LXV', CAST(N'2022-07-28' AS Date), CAST(N'2022-07-28' AS Date), 1, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
INSERT [dbo].[tblUserIdioma] ([CodUser], [CodIdioma]) VALUES (1, 1)
GO
SET IDENTITY_INSERT [dbo].[tblUserPerfil] ON 

INSERT [dbo].[tblUserPerfil] ([CodUserPerfil], [DescUserPerfil]) VALUES (1, N'Admin')
INSERT [dbo].[tblUserPerfil] ([CodUserPerfil], [DescUserPerfil]) VALUES (2, N'Comum')
INSERT [dbo].[tblUserPerfil] ([CodUserPerfil], [DescUserPerfil]) VALUES (3, N'Monitor')
SET IDENTITY_INSERT [dbo].[tblUserPerfil] OFF
GO
ALTER TABLE [dbo].[tblUser] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblUser] ADD  DEFAULT ((1)) FOR [FlagAtivo]
GO
ALTER TABLE [dbo].[tblTraducaoComponenteObjetoTraducao]  WITH CHECK ADD  CONSTRAINT [FK_tblTraducaoComponenteObjetoTraducao_tblTraducaoComponenteObjetoTraducao] FOREIGN KEY([IdiomaId])
REFERENCES [dbo].[tblTraducaoIdioma] ([CodIdioma])
GO
ALTER TABLE [dbo].[tblTraducaoComponenteObjetoTraducao] CHECK CONSTRAINT [FK_tblTraducaoComponenteObjetoTraducao_tblTraducaoComponenteObjetoTraducao]
GO
ALTER TABLE [dbo].[tblTraducaoIdioma]  WITH CHECK ADD  CONSTRAINT [FK_tblIdioma_tblIdioma] FOREIGN KEY([CodIdioma])
REFERENCES [dbo].[tblTraducaoIdioma] ([CodIdioma])
GO
ALTER TABLE [dbo].[tblTraducaoIdioma] CHECK CONSTRAINT [FK_tblIdioma_tblIdioma]
GO



GO
/****** Object:  StoredProcedure [dbo].[pr_Lista_PopUp]    Script Date: 15/12/2022 10:54:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[pr_Lista_PopUp]
			@CodUserParam int,
			@CodIdiomaParam int
as
Begin

Declare @CodUser int = 0
Declare @CodIdioma int = 0

Set @CodUser = @CodUserParam
Set @CodIdioma = @CodIdiomaParam 

Select Top 1
	   CodPopUp as IdItem,
	   DescPopUp as DescItem
from tblMensagemPopUp
Where FlagAtivo = 1


End


GO
/****** Object:  StoredProcedure [dbo].[pr_Lista_Traducao]    Script Date: 15/12/2022 10:54:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE proc [dbo].[pr_Lista_Traducao]  
 @idiomaId int  
 as  
  BEGIN
--'por'  1  
--'ing'  2  
--'esp'  3  
  
  
  select Objeto as objeto, Texto as valor from tblTraducaoComponenteObjetoTraducao t1 with(nolock)  
  JOIN tblTraducaoIdioma t2 with(nolock)  ON t1.IdiomaId = t2.CodIdioma
  where t2.CodIdioma = @idiomaId
  END


  GO

  CREATE TABLE [dbo].[tblConfigMonitor](
    [CodConfig] [int] IDENTITY(1,1) NOT NULL,
	[CodUser] [int]  NOT NULL,
	[CodGraficos] varchar(max),
	[QtdSegundos] [int]  NOT NULL,
)
GO





