<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using Newtonsoft.Json;
using System.Linq;

public class Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
        using (var db = new TeachingCenterEntities())
        {
            var dataSource = from it in db.ActivityCategory select it;
            string final = JsonConvert.SerializeObject(dataSource);
            context.Response.Write(final);
        }


    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}