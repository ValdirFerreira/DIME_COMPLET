using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebIntegracao.Criptografia;
using WebIntegracao.Models;

namespace WebIntegracao.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            if (System.Web.HttpContext.Current.Session["usuario"] != null)
            {
                var sessionUser = System.Web.HttpContext.Current.Session["usuario"].ToString();
                if (sessionUser != null)
                {
                    var informacao = string.Concat("Usuário Redirecionado - ", sessionUser, " ", DateTime.Now.ToString());
                    LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, informacao);
                    
                    var usuarioRede = IpsosCriptografia.Encrypt(sessionUser);

                    var configAmbiente = ConfigurationManager.AppSettings.Get("ConfigAmbiente");

                    switch (configAmbiente)
                    {                  
                        case "0":
                            // return Redirect("http://localhost:4200/#/home/login?param=" + usuarioRede);
                            //return Redirect("http://192.168.19.4/PortalTraducaoExcel/#/home/login?param=" + usuarioRede);
                            var urlDEV = ConfigurationManager.AppSettings.Get("urlDEV").ToString();
                            return Redirect(string.Concat(urlDEV, "/#/login?param=", usuarioRede));
                            

                        case "1":
                            var urlHML = ConfigurationManager.AppSettings.Get("urlHML").ToString();
                            return Redirect(string.Concat(urlHML, "/#/login?param=", usuarioRede));

                        case "2":
                            var urlPROD = ConfigurationManager.AppSettings.Get("urlPROD").ToString();
                            return Redirect(string.Concat(urlPROD, "/#/login?param=", usuarioRede));

                        case "3":
                            var urlLocal = ConfigurationManager.AppSettings.Get("urlLocal").ToString();
                            return Redirect(string.Concat(urlLocal, "/#/login?param=", usuarioRede));

                        default:
                            var urlPRODD = ConfigurationManager.AppSettings.Get("urlPROD").ToString();
                            return Redirect(string.Concat(urlPRODD, "/#/login?param=", usuarioRede));
                    }                   
                }
            }
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}