<%@ WebHandler Language="C#" Class="Develop_Handler" %>

using System;
using System.Web;
using System.Linq;
using Newtonsoft.Json;
using System.Collections;
using System.Collections.Generic;

public class Develop_Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        int page = Convert.ToInt32( context.Request.Form["page"]);
        //int page = 2;
        using (var db = new TeachingCenterEntities())
        {
            var dev = from it in db.Develop
                      where it.Develop_deleted == 0
                      orderby it.Develop_time descending
                      select new
                      {
                          Develop_id = it.Develop_id,
                          Develop_title = it.Develop_title,
                          Develop_content = it.Develop_content,
                          Develop_author = it.Develop_author,
                          Develop_hit = it.Develop_hit,
                          Develop_link = it.Develop_link,
                          Develop_href = it.Develop_link=="" ? "DevelopList?id=" : it.Develop_link,
                          Develop_time = it.Develop_time
                      };

        int count = dev.Count();
        dev = dev.Skip((page-1) * 5).Take(5);
        ArrayList all = new ArrayList();
        all.Add(count);
        all.Add(dev);
        string final = JsonConvert.SerializeObject(all);
        context.Response.Write(final);
    }
}

public bool IsReusable {
    get {
        return false;
    }
}

}