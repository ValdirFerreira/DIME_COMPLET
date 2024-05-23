

CREATE TABLE [dbo].[tblUser](
	[CodUser] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[UpdateDate] [date]  NULL,	
    [CodUserPerfil] [int] NOT NULL,
	[FlagAtivo] [bit] NOT NULL,
	[Token] [varchar](100) NULL,

)
GO


ALTER TABLE [dbo].[tblUser] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO

ALTER TABLE [dbo].[tblUser] ADD  DEFAULT ((1)) FOR [FlagAtivo]
GO





