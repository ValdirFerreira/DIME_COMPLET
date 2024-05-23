using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using WebIntegracao.Models;

namespace WebIntegracao
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Session_Start(Object sender, EventArgs e)
        {
            HttpContext.Current.Session["usuario"] = null;
        }

        protected void Application_AcquireRequestState(Object sender, EventArgs e)
        {
            try
            {
                HttpContext context = HttpContext.Current;
                if (context != null && context.Session != null)
                {
                    string userRede = Context.User.Identity.Name.ToString();

                    var informacao = string.Concat("Usuário Maquina - ", userRede, " ", DateTime.Now.ToString());
                    LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, informacao);

                    string[] userSplit = userRede.Split('\\');

                    var name = userSplit[1];
                    HttpContext.Current.Session["usuario"] = name;

                    //var informacao1 = string.Concat("Usuário Logado - ", name, " ", DateTime.Now.ToString());
                    //LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, informacao);

                }
            }
            catch (Exception ex)
            {
                LogText.Instance.Error(this.GetType().Name, System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message);
            }

        }

        protected void Application_AuthorizeRequest(object sender, EventArgs e)
        {
            HttpContext context = HttpContext.Current;


            if (context != null && context.Session != null)
            {
                var name = Context.User.Identity.Name;

                Session["usuario"] = name;

            }
        }
    }
}
