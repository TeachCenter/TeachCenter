<%@ WebHandler Language="C#" Class="IndexBanner_Handler" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;

public class IndexBanner_Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        using (var db = new TeachingCenterEntities())
        {
            var intro = (from it in db.Picture orderby it.is_top descending select it).ToList().Take(4);
            string final = JsonConvert.SerializeObject(intro);
            context.Response.Write(final);
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}