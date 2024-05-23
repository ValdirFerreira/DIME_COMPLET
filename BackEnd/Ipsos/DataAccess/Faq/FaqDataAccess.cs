using Dapper;
using DataAccess.Config;
using Entities.Usuario;
using Helpers.Logtxt;
using SisConn;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities.FaqModel;

namespace DataAccess.Faq
{
    public class FaqDataAccess
    {

        private readonly string usuarioEmail = string.Empty;

        public FaqDataAccess(string usuario)
        {
            usuarioEmail = usuario;
        }


        public List<FaqPortal> ListFaqPortal()
        {
            try
            {
                string sqlComand = @"SELECT *  FROM tblFaqPortal with(nolock) ";

                using (SqlConnection conexaoBD = new SqlConnection(Conexao.strConexao))
                {
                    return conexaoBD.Query<FaqPortal>(sqlComand, null, null, false, 300, CommandType.Text).ToList();
                }
            }
            catch (SqlException ex)
            {
                LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, "[" + usuarioEmail + "]" + ex.Message);
                throw new Exception(ex.Message);
            }
        }


    }
}
