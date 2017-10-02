<%@ WebHandler Language="C#" Class="IndexDevelop_Handler" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;

public class IndexDevelop_Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        using (var db = new TeachingCenterEntities())
        {
            var dev = (from it in db.Develop
                      where it.Develop_deleted == 0
                      orderby it.Develop_time descending
                      select new
                      {
                          Develop_id = it.Develop_id,
                          Develop_title = it.Develop_title,
                          Develop_path = it.Develop_path
                      }).ToList().Take(3);
        string final = JsonConvert.SerializeObject(dev);
        context.Response.Write(final);
    }

}

public bool IsReusable {
    get {
        return false;
    }
}

}