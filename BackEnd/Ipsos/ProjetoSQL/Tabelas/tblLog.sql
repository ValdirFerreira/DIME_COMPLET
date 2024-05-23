

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblLog](
	[IdLog]      [int] IDENTITY(1,1) NOT NULL,    
	[CodUser]  [int]     NULL,	
	[Email] [varchar](150)  NULL,
    [DataLog]    [datetime] NOT NULL,
	[Informacao] [varchar](max) NULL,
	
	
PRIMARY KEY CLUSTERED 
(
	[IdLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblLog] ADD  DEFAULT (getdate()) FOR [DataLog]
GO




