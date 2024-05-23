
/****** Object:  Table [dbo].[tblFile]    Script Date: 3/8/2023 4:47:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblFile](
	[IdFile] [int] IDENTITY(1,1) NOT NULL,
	[NameFile] [varchar](255) NULL,
	[FileExension] [varchar](50) NULL,
	[DateCreate] [datetime] NOT NULL,	
	[Aba1] [varchar](150) NULL,
	[Aba2] [varchar](150) NULL,
	[Aba3] [varchar](150) NULL,	
	[Aba4] [varchar](150) NULL,	
	[QtdColunasAba1] [int] NOT NULL,
	[QtdColunasAba2] [int] NOT NULL,
	[QtdColunasAba3] [int] NOT NULL,
	[StatusImportacao] [int] NOT NULL,
	[DateUpdateProcess] [datetime] NOT NULL,
	[IdUser] [int] NOT NULL,
	[InfoErro] [varchar](Max) NULL,
	[Mes] [int] NOT NULL,
	[Ano] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblFile] ADD  DEFAULT (getdate()) FOR [DateCreate]
GO

ALTER TABLE [dbo].[tblFile] ADD  DEFAULT ((0)) FOR [StatusImportacao]
GO

ALTER TABLE [dbo].[tblFile] ADD  DEFAULT (getdate()) FOR [DateUpdateProcess]
GO


