using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using Microsoft.AspNet.FriendlyUrls;
using Microsoft.AspNet.FriendlyUrls.Resolvers;

namespace SportsPro
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings, new MyUrlResolver());

            routes.MapPageRoute("RegisterProducts", "CustomerSupport/ProductRegistration", "~/ProductRegistration.aspx");
            routes.MapPageRoute("CustomerSurvey", "CustomerSupport/CustomerSurvey", "~/CustomerSurvey.aspx");
            routes.MapPageRoute("SurveyComplete", "CustomerSupport/SurveyComplete", "~/SurveyComplete.aspx");

            routes.MapPageRoute("CustomerIncidentDisplay", "TechSupport/CustomerIncidents", "~/CustomerIncidentDisplay.aspx");
            routes.MapPageRoute("IncidentUpdate", "TechSupport/UpdateIncidents", "~/IncidentUpdate.aspx");
        }
    }
    public class MyUrlResolver : WebFormsFriendlyUrlResolver {
        protected override bool TrySetMobileMasterPage(HttpContextBase httpContext, Page page, string mobileSuffix) {
                return false;
        }
        public override string ConvertToFriendlyUrl(string path) {
            // Handle ".aspx" requests for files not in "path" folders
            if (path.Contains("Registration") || path.Contains("Survey")) {
                return "~/CustomerSupport" + path.Replace(".aspx", "");
            }
            // etc... TechSupport "Incident" files
            return base.ConvertToFriendlyUrl(path);
        }

        public override void PreprocessRequest(HttpContextBase httpContext, IHttpHandler httpHandler) {
            // Handle friendly url requests for files not in "path" folders
            string path = httpContext.Request.CurrentExecutionFilePath;
            if (path.Contains("Registration") || path.Contains("Survey")) {
                httpContext.Response.Redirect("~/CustomerSupport"+path);
            }
            // etc... TechSupport "Incident" files
            base.PreprocessRequest(httpContext, httpHandler);
        }
    }
}
