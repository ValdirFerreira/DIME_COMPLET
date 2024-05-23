Insert into [dbo].[tblProjeto]
Select
'Monday', 'Monday', Usuario, Senha, Servidor, ServidorMirror, UsuarioTeste, SenhaTeste, ServidorTeste, SenhaDescriptografada, FlagProducao, ServidorNC
From [dbo].[tblProjeto] Where descProjeto = 'csifca'


