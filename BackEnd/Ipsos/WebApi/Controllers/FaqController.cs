using Business.Criptografia;
using DataAccess.Faq;
using DataAccess.LogUsuario;
using DataAccess.Usuario;
using Entities.LogUsuario;
using Entities.Usuario;
using Helpers.Logtxt;
using System;
using System.Data.SqlClient;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using WebApi.Models;




namespace WebApi.Controllers
{
    [EnableCors("*", "*", "*")]
    [RoutePrefix("api/Faq")]
    [AllowAnonymous]
    public class FaqController : ApiController
    {
        private FaqDataAccess _context = new FaqDataAccess(Usuario.Email);
        private LogDataAccess _contextLog = new LogDataAccess(Usuario.Email);



        [HttpPost]
        [Route("ListFaqPortal")]
        [Authorize]
        public HttpResponseMessage ListFaqPortal(UsuarioModel usuarioModel)
        {
            var response = new Response();
            try
            {
                var listFaqPortal = _context.ListFaqPortal();
                return Request.CreateResponse(HttpStatusCode.OK, listFaqPortal);
            }
            catch (SqlException ex)
            {
                response.StatusCode = (int)HttpStatusCode.InternalServerError;
                response.Error = $"Bad request - ({ex.Message})";
                return Request.CreateResponse(HttpStatusCode.InternalServerError, response);
            }
        }

 

    }
}
