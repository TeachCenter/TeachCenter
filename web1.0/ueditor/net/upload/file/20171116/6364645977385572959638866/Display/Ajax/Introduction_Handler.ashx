<%@ WebHandler Language="C#" Class="Introduction_Handler" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using System.Collections;

public class Introduction_Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        using (var db = new TeachingCenterEntities())
        {
            Introduction intro = db.Introduction.Single(a => a.Introduction_content != "");
            string final = JsonConvert.SerializeObject(intro);
            //HttpUtility.UrlDecode(final,);
            context.Response.Write(final);
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}