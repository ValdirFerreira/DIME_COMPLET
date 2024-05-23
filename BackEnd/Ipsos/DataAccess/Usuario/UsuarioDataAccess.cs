using Dapper;
using DataAccess.Config;
using Entities.Usuario;
using Helpers.Logtxt;
using Newtonsoft.Json;
using SisConn;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using static System.Net.WebRequestMethods;

namespace DataAccess.Usuario
{
    public class UsuarioDataAccess
    {

        private readonly string usuarioEmail = string.Empty;

        public UsuarioDataAccess(string usuario)
        {
            usuarioEmail = usuario;
        }



        public async Task<DadosCadastro> ObterUsuario(string celular)
        {

            //return new DadosCadastro
            //{
            //    Email = "teste@teste.com",
            //    Id = 1,
            //    Nome = "Valdir ferreira"
            //};


            try
            {
                var celularAjust = celular.Substring(4);  //"+55 (11)97699-0019";

                celularAjust = celularAjust.Replace("-", "");
                celularAjust = celularAjust.Replace(")", "");
                celular = celularAjust.Replace("(", "");

                string sqlComand = @"SELECT 
                                           id_cadastro as Id
                                           ,telefone as Celular
                                           ,nome  as Nome         
                                           ,email  as Email    
                                      FROM cadastro where telefone = @celular";

                using (SqlConnection conexaoBD = new SqlConnection(Conexao.strConexao))
                {
                    var param = new DynamicParameters();
                    param.Add("@celular", celular);


                    var responseBase = conexaoBD.QueryFirstOrDefault<DadosCadastro>(sqlComand, param, null, 300, CommandType.Text);

                    return responseBase;
                }
            }
            catch (SqlException ex)
            {
                LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, "[" + usuarioEmail + "]" + ex.Message);

            }
            return null;
        }




        #region Métodos caso precise relacionados ao usuário

        public UsuarioModel Login(LoginUsuario login)
        {
            try
            {
                string sqlComand = @"SELECT *  FROM tblUser with(nolock) where  Email = @email AND Password = @password AND FlagAtivo = 1";

                using (SqlConnection conexaoBD = new SqlConnection(Conexao.strConexao))
                {
                    var param = new DynamicParameters();
                    param.Add("@email", login.Email);
                    param.Add("@password", login.Password);

                    return conexaoBD.QueryFirstOrDefault<UsuarioModel>(sqlComand, param, null, 300, CommandType.Text);
                }
            }
            catch (SqlException ex)
            {
                LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, "[" + usuarioEmail + "]" + ex.Message);
                throw new Exception(ex.Message);
            }
        }

        public int InsertUser(UsuarioModel usuarioModel)
        {
            try
            {
                usuarioModel.CreateDate = DateTime.Now;
                usuarioModel.UpdateDate = DateTime.Now;
                usuarioModel.FlagAtivo = true;
                usuarioModel.Token = "";

                using (SqlConnection conexaoBD = new SqlConnection(Conexao.strConexao))
                {
                    var q = @"insert into tblUser
                                                (Name
                                                ,Email
                                                ,Password
                                                ,CreateDate 
                                                ,UpdateDate
                                                ,FlagAtivo
                                                ,CodUserPerfil
                                                ,DashboardVolumetria
                                                ,DashboardBMR)
                                                values 
                                                        (@Name
                                                        ,@Email
                                                        ,@Password
                                                        ,@CreateDate 
                                                        ,@UpdateDate
                                                        ,@FlagAtivo
                                                        ,@CodUserPerfil
                                                        ,@DashboardVolumetria
                                                        ,@DashboardBMR)";

                    var result = conexaoBD.Execute(q, new
                    {
                        @Name = usuarioModel.Name,
                        @Email = usuarioModel.Email,
                        @Password = usuarioModel.Password,
                        @CreateDate = usuarioModel.CreateDate,
                        @UpdateDate = usuarioModel.UpdateDate,
                        @FlagAtivo = usuarioModel.FlagAtivo,
                        @CodUserPerfil = 2, // COMUN
                        @DashboardVolumetria = usuarioModel.DashboardVolumetria,
                        @DashboardBMR = usuarioModel.DashboardBMR

                    });


                    return 1;
                }
            }
            catch (Exception ex)
            {
                LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, "[" + usuarioEmail + "]" + ex.Message);
                return 0;
            }
        }

        public int UpdatePopupUser(UsuarioModel usuarioModel)
        {
            try
            {

                usuarioModel.UpdateDate = DateTime.Now;

                using (SqlConnection conexaoBD = new SqlConnection(Conexao.strConexao))
                {
                    var q = @"update tblUser set                                         
                                        FlagPopUp = @FlagPopUp, 
                                        UpdateDate = @UpdateDate
                                        where CodUser = @CodUser";

                    var result = conexaoBD.Execute(q, new
                    {
                        @FlagPopUp = usuarioModel.FlagPopUp,
                        @UpdateDate = usuarioModel.UpdateDate,
                        @CodUser = usuarioModel.CodUser,
                    });


                    return 1;
                }
            }
            catch (Exception ex)
            {
                LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, "[" + usuarioEmail + "]" + ex.Message);
                return 0;
            }
        }

        public int UpdateUser(UsuarioModel usuarioModel)
        {
            try
            {

                usuarioModel.UpdateDate = DateTime.Now;

                using (SqlConnection conexaoBD = new SqlConnection(Conexao.strConexao))
                {
                    var q = @"update tblUser set                                         
                                        Name         = @Name,
                                        Email        = @Email,
                                        Password     = @Password,
                                        UpdateDate   = @UpdateDate,
                                        FlagAtivo       = @FlagAtivo,
                                        CodUserPerfil   = @CodUserPerfil,
                                        DashboardVolumetria = @DashboardVolumetria,
                                        DashboardBMR = @DashboardBMR
                                        where CodUser = @CodUser";

                    var result = conexaoBD.Execute(q, new
                    {
                        @Name = usuarioModel.Name,
                        @Email = usuarioModel.Email,
                        @Password = usuarioModel.Password,
                        @UpdateDate = usuarioModel.UpdateDate,
                        @FlagAtivo = usuarioModel.FlagAtivo,
                        @CodUserPerfil = usuarioModel.CodUserPerfil,
                        @DashboardVolumetria = usuarioModel.DashboardVolumetria,
                        @DashboardBMR = usuarioModel.DashboardBMR,
                        @CodUser = usuarioModel.CodUser

                    });


                    return 1;
                }
            }
            catch (Exception ex)
            {
                LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, "[" + usuarioEmail + "]" + ex.Message);
                return 0;
            }
        }


        public List<UsuarioModel> ListUsers(UsuarioModel usuarioModel)
        {
            try
            {
                string sqlComand = @"SELECT *  FROM tblUser with(nolock) ";

                using (SqlConnection conexaoBD = new SqlConnection(Conexao.strConexao))
                {
                    return conexaoBD.Query<UsuarioModel>(sqlComand, null, null, false, 300, CommandType.Text).ToList();
                }
            }
            catch (SqlException ex)
            {
                LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, "[" + usuarioEmail + "]" + ex.Message);
                throw new Exception(ex.Message);
            }
        }

        /// <summary>
        /// Somente Altera o Status
        /// </summary>
        /// <param name="commentModele"></param>
        /// <returns></returns>
        public int UserForDelete(UsuarioModel usuarioModel)
        {
            try
            {
                usuarioModel.FlagAtivo = false;

                using (SqlConnection conexaoBD = new SqlConnection(Conexao.strConexao))
                {
                    var q = @"update tblUser set                                         
                                        FlagAtivo       = @FlagAtivo
                                        where CodUser = @CodUser";

                    var result = conexaoBD.Execute(q, new
                    {
                        @Active = usuarioModel.FlagAtivo,
                        @CodUser = usuarioModel.CodUser,
                    });


                    return 1;
                }
            }
            catch (Exception ex)
            {
                LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, "[" + usuarioEmail + "]" + ex.Message);

                return 0;
            }

            return 1;
        }



        public EsqueceuSenhaModel SolicitarNovaSenha(string email)
        {
            try
            {
                using (SqlConnection conexaoBD = new SqlConnection(Conexao.strConexao))
                {
                    var ChecaEmail = new EsqueceuSenhaModel();

                    ChecaEmail = conexaoBD.Query<EsqueceuSenhaModel>("SELECT Email, Name FROM Monday.dbo.tblUser WITH(NOLOCK) where Email = @Email", new { Email = email }, null).FirstOrDefault();
                    if (ChecaEmail != null)
                    {
                        string tokenEmailRecuperacao = Guid.NewGuid().ToString();
                        conexaoBD.QueryAsync<EsqueceuSenhaModel>("INSERT INTO Monday.dbo.tblRecuperacaoSenhaUserToken WITH(ROWLOCK) VALUES (@Token,@Email,@DataCriacaoToken,NULL)", new { Token = tokenEmailRecuperacao, Email = email, DataCriacaoToken = DateTime.Now }, null, 300).Result.ToList();

                        // Enviando Email
                        string url = "";// ConfigurationManager.AppSettings["urlRecuperacaoSenha"].ToString();
                        url = $"{url}/#/home/recuperar-senha?token={tokenEmailRecuperacao}";
                        string msgHtmlQueSeraEnviadaPorEmail;

                        msgHtmlQueSeraEnviadaPorEmail = LayoutHTMLRecuperarSenhaEmail(url, ChecaEmail.Name, "QuintoAndar");
                        EnviarEmailRecuperacaoDeSenha(ChecaEmail.Email, msgHtmlQueSeraEnviadaPorEmail); // Comentar em dev
                        return ChecaEmail;
                    }
                    else
                    {
                        return null;
                    }
                }

            }
            catch (Exception ex)
            {
                LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, "[" + usuarioEmail + "]" + ex.Message);
                return null;
            }
        }

        private string LayoutHTMLRecuperarSenhaEmail(string url, string userName, string sistema)
        {
            string html = string.Empty;
            html = $@"
                  <body style="" - ms - text - size - adjust: 100 %; -webkit - text - size - adjust: 100 %; width: 100 %; height: 100 %; margin: 0; padding: 0; background - color: #ffffff;""> 
                  <center> 
                  <table align=""center"" border=""0"" cellpadding=""0"" cellspacing=""0"" height=""100%"" width=""100%"" id=""bodyTable"" style=""border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; width: 100%; height: 100%; margin: 0; padding: 0; background-color: #ffffff;""> 
                  <tbody>
                  <tr>
                  <td align=""center"" valign=""top"" id=""bodyCell"" style=""mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; width: 100%; height: 100%; margin: 0; padding: 0; border-top: 0;""> 
                  <table border=""0"" cellpadding=""0"" cellspacing=""0"" width=""100%"" style=""border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;""> 
                  <tbody>
                  <tr>
                  <td align=""center"" valign=""top"" class=""section1Column"" style=""mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: transparent; border-top: 0; border-bottom: 0px; padding-top: 0px; padding-bottom: 0px;""> 
                  <table border=""0"" cellpadding=""0"" cellspacing=""0"" width=""100%"" class=""sectionContainer"" style=""border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; width:100%; max-width: 600px !important; background-color: transparent;""> 
                  <tbody>
                  <tr> 
                  <td valign=""top"" style=""mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;"">
                  <table class=""columnContainer"" align=""left"" border=""0"" cellpadding=""0"" cellspacing=""0"" width=""600"" style=""width:600px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;"">
                  <tbody>
                  <tr> <td class=""columnContainerCell"" valign=""top"" style=""mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; font-size: 16px; line-height: 110%; font-family: Helvetica, Arial, sans-serif; color: #666666;""> 
                  <table border=""0"" cellpadding=""0"" cellspacing=""0"" width=""100%"" class=""columnContainerSize"" style=""border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; width:100%; max-width: 600px !important; background-color: transparent;"">
                  <tbody><tr>  </tr> </tbody></table> </td> </tr> </tbody></table> </td> </tr> </tbody></table>  </td> </tr>
                  <tr>
                  <td align = ""center"" valign = ""top"" class=""section1Column"" style=""mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: transparent; border-top: 0; border-bottom: 0px; padding-top: 0px; padding-bottom: 0px;""> 
                  <table border = ""0"" cellpadding=""0"" cellspacing=""0"" width=""100%"" class=""sectionContainer"" style=""border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; width:100%; max-width: 600px !important; background-color: #FFFFFF;""> 
                  <tbody>
                  <tr> 
                  <td valign = ""top"" style=""mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;""> <table class=""columnContainer"" align=""left"" border=""0"" cellpadding=""0"" cellspacing=""0"" width=""600"" style=""width:600px;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;""> <tbody><tr> <td class=""columnContainerCell"" valign=""top"" style=""mso-line-height-rule: exactly; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; font-size: 16px; line-height: 110%; font-family: Helvetica, Arial, sans-serif; color: #666666;""> <table width = ""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" style=""-webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; mso-table-lspace:0pt; mso-table-rspace:0pt; border-collapse:collapse !important;""> <tbody><tr> <td bgcolor = ""transparent"" align=""center"" style=""-webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; mso-table-lspace:0pt; mso-table-rspace:0pt; padding-top: 9px; padding-bottom: 9px; padding-left: 18px; padding-right: 18px;""> <a href = ""#"" title="""" target=""_blank"" style=""-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%"">  </a> </td> </tr> </tbody></table>
                  <table width = ""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" style=""-webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; mso-table-lspace:0pt; mso-table-rspace:0pt; border-collapse:collapse !important;""> <tbody><tr> <td bgcolor = ""transparent"" align=""center"" style=""-webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; mso-table-lspace:0pt; mso-table-rspace:0pt; padding-top: 9px; padding-bottom: 9px; padding-left: 18px; padding-right: 18px;"">  </td> </tr> </tbody></table>
                  <table width = ""100%"" border=""0"" cellspacing=""0"" cellpadding=""0"" style=""-webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; mso-table-lspace:0pt; mso-table-rspace:0pt; border-collapse:collapse !important;""> <tbody><tr> <td bgcolor = ""transparent"" align=""left"" style=""-webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; mso-table-lspace:0pt; mso-table-rspace:0pt; font-size: 16px; line-height: 150%; font-family: Helvetica, Arial, sans-serif; color: #666666; padding: 9px 18px; word-break: break-word !important;"" class=""padding""> <h1 style = ""text-align: center; line-height: 125%;""><span style=""color: #292929;font-size: 24px;"">Recuperação de senha</span></h1> <p style = ""text-align: center; line-height: 150%;"" > Olá <strong> {userName}</strong>, você solicitou a recuperação da senha do <strong>{sistema}</strong> <br>
                 Clique abaixo e você será redirecionado para alterar a senha.

                  </p> <center><table border = ""0"" cellpadding= ""14"" cellspacing= ""0"" style= ""background: gray;border-radius:6px;color:#ffffff;cursor:pointer;display:inline-block;font-size:20px;font-weight:bold;line-height:24px;margin:0px auto;text-align:center;"" class=""button main""> <tbody> <tr> <td align = ""center"" style=""vertical-align:middle"" class=""emailButtonContent""><font color = ""#444444"" ><a target=""_blank"" style=""text-decoration:none; padding: 0 8px;"" href=""{url}""><font color = ""white"" > Mudar senha</font></a></font></td> </tr> </tbody> </table> </center>
                 </td> </tr> </tbody></table> </td> </tr> </tbody></table> </td> </tr> </tbody></table>  </td> </tr> 
                 </tbody></table> </td> </tr> </tbody></table> </center>  
                 </body>";

            return html;
        }

        private int EnviarEmailRecuperacaoDeSenha(string destinatario, string mensagemHtml)
        {

            try
            {
                clsAcessoBanco obj_Banco = new clsAcessoBanco();
                var parametros = new DynamicParameters();
                parametros.Add("@BancoOrigem", "Monday");
                parametros.Add("@CodEmailBancoOrigem", 0);
                parametros.Add("@CodCliente", 0);
                parametros.Add("@Destinatario", destinatario);
                parametros.Add("@Remetente", "noreply@ipsossurvey.com.br");
                parametros.Add("@NRemetente", "noreply@ipsossurvey.com.br");
                parametros.Add("@Assunto", "Recuperación de la Contraseña - Banistmo");
                parametros.Add("@CorpoHTML", mensagemHtml);
                parametros.Add("@CorporTexto", "");
                parametros.Add("@CodLote", 0);
                parametros.Add("@Cco", "");
                parametros.Add("codEmailEnvioOUT", DbType.Int64, direction: ParameterDirection.Output);
                string strSql = @"[BRSAP2SQL02\BRSAP2SQL02].IpsosMail.dbo.sp_InsereNovoQuickEmail";

                using (SqlConnection conexaoBD = new SqlConnection(Conexao.strConexao))
                {
                    conexaoBD.Query<int>(strSql, parametros, null, true, null, commandType: CommandType.StoredProcedure);
                    int newID = parametros.Get<int>("codEmailEnvioOUT");
                    return newID;
                }
            }
            catch (Exception ex)
            {
                LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, "[" + usuarioEmail + "]" + ex.Message);
                throw ex;
            }
        }


        public bool VerificarSeTokenJaFoiUtilizadoAoAlterarSenha(string token)
        {
            try
            {
                using (SqlConnection conexaoBD = new SqlConnection(Conexao.strConexao))
                {
                    var ChecaToken = new ChecaTokenModel();

                    ChecaToken = conexaoBD.Query<ChecaTokenModel>("SELECT DataTokenUtilizado, Token FROM Monday.dbo.tblRecuperacaoSenhaUserToken WITH(NOLOCK) where Token = @Token", new { Token = token }, null).FirstOrDefault();

                    if (ChecaToken != null)
                    {
                        if (String.IsNullOrWhiteSpace(ChecaToken.DataTokenUtilizado.ToString()))
                        {
                            return true;
                        }

                        return false;
                    }
                    else
                    {
                        return false;
                    }

                }

            }
            catch (Exception ex)
            {
                LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, "[" + usuarioEmail + "]" + ex.Message);
                return false;
            }
        }

        public bool AtualizarSenha(AtualizarSenhaModel objAtualizarSenha)
        {
            try
            {
                using (SqlConnection conexaoBD = new SqlConnection(Conexao.strConexao))
                {
                    if (VerificarSeTokenJaFoiUtilizadoAoAlterarSenha(objAtualizarSenha.Token))
                    {

                        CapturaEmailCadastradoViaToken(objAtualizarSenha);

                        if (string.IsNullOrWhiteSpace(objAtualizarSenha.Email))
                        {
                            return false;
                        }

                        conexaoBD.Query("UPDATE tblUser WITH(ROWLOCK) SET Password = @Password WHERE Email = @Email", new { Password = objAtualizarSenha.Senha, Email = objAtualizarSenha.Email }, null);
                        conexaoBD.Query("UPDATE Monday.dbo.tblRecuperacaoSenhaUserToken WITH(ROWLOCK) SET DataTokenUtilizado = @DataTokenUtilizado WHERE Token = @Token", new { DataTokenUtilizado = DateTime.Now, Token = objAtualizarSenha.Token }, null);
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception ex)
            {
                LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, "[" + usuarioEmail + "]" + ex.Message);
                return false;
            }
        }

        public void CapturaEmailCadastradoViaToken(AtualizarSenhaModel objAtualizarSenha)
        {
            try
            {
                using (SqlConnection conexaoBD = new SqlConnection(Conexao.strConexao))
                {
                    var Email = new AtualizarSenhaModel();

                    Email = conexaoBD.Query<AtualizarSenhaModel>("SELECT DataTokenUtilizado, Token, Email FROM Monday.dbo.tblRecuperacaoSenhaUserToken WITH(NOLOCK) where Token = @Token", new { Token = objAtualizarSenha.Token }, null).FirstOrDefault();

                    if (Email != null)
                    {
                        objAtualizarSenha.Email = Email.Email;
                    }
                }

            }
            catch (Exception ex)
            {
                LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, "[" + usuarioEmail + "]" + ex.Message);
                throw ex;
            }
        }


        public List<GraficosDash> GraficosDash(UsuarioModel usuarioModel)
        {
            try
            {
                string sqlComand = @"select * from tblGraficosDash with(nolock) where FlagAtivo = 1";

                using (SqlConnection conexaoBD = new SqlConnection(Conexao.strConexao))
                {
                    return conexaoBD.Query<GraficosDash>(sqlComand, null, null, false, 300, CommandType.Text).ToList();
                }
            }
            catch (SqlException ex)
            {
                LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, "[" + usuarioEmail + "]" + ex.Message);
                throw new Exception(ex.Message);
            }
        }


        public async Task<UsuarioModel> LoginIntegracaoEMS_Expenses(string nomeRede)
        {
            var usuarioTradutor = new UsuarioModel();
            var usuarioEMS = new UsuarioModel();
            try
            {
                // string sqlComand = @"Select LOWER(Login) as Name, EMail as Email From [dbo].[tblUsuario] with(nolock) Where LOWER(login)  = @nomeRede";
                string sqlComand = @"Select LOWER(Login) as Name, EMail as Email From [BRSAP2SQL02\BRSAP2SQL02].EMS_Expenses_Management.[dbo].[tblUsuario] with(nolock) Where LOWER(login)  = @nomeRede";

                //var nomeRede = IpsosCriptografia.Decrypt(nome);
                using (SqlConnection conexaoBD = new SqlConnection(Conexao.strConexaoEMS))
                {
                    var param = new DynamicParameters();
                    param.Add("@nomeRede", nomeRede.ToLower());
                    usuarioEMS = conexaoBD.QueryFirstOrDefault<UsuarioModel>(sqlComand, param, null, 300, CommandType.Text);
                }

                if (usuarioEMS != null)
                {
                    usuarioTradutor = await RecuperaUsuarioPorEmail(usuarioEMS.Email);
                    if (usuarioTradutor == null)
                    {
                        InsertUser(new UsuarioModel
                        {
                            Email = usuarioEMS.Email,
                            Name = nomeRede,
                            Password = "1234",
                            CodUserPerfil = 2, // COMUM
                            DashboardBMR = 0,
                            DashboardVolumetria = 1
                        });

                        usuarioTradutor = await RecuperaUsuarioPorEmail(usuarioEMS.Email);
                    }
                }

            }
            catch (SqlException ex)
            {

                // _contextLog.InsertLog(new LogSistema { Email = "ruben.silva@fcamara.com.br", IdArquivo = 0, IdUsuario = 11, Informacao = ex.Message });
                LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, "[" + usuarioEmail + "]" + ex.Message);
                throw new Exception(ex.Message);
            }

            return usuarioTradutor;
        }


        public async Task<UsuarioModel> RecuperaUsuarioPorEmail(string email)
        {
            try
            {
                string sqlComand = @"select * FROM tblUser as U  with(nolock)
                                     where  Email = @email AND U.FlagAtivo = 1";

                using (SqlConnection conexaoBD = new SqlConnection(Conexao.strConexao))
                {
                    var param = new DynamicParameters();
                    param.Add("@email", email);

                    return conexaoBD.QueryFirstOrDefault<UsuarioModel>(sqlComand, param, null, 300, CommandType.Text);
                }
            }
            catch (SqlException ex)
            {
                LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, "[" + usuarioEmail + "]" + ex.Message);
                throw new Exception(ex.Message);
            }
        }

        #endregion 
    }
}
