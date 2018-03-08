<%@ WebHandler Language="C#" Class="SrcContentHandler" %>

using System;
using System.Web;
using System.Linq;
using Newtonsoft.Json;
using System.Collections.Generic;

public class SrcContentHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string id = context.Request["id"];
        if (string.IsNullOrEmpty(id))
        {
            context.Response.Write("");
        }
        else
        {
            int ID = Convert.ToInt32(id);
            using (var db = new TeachingCenterEntities())
            {
                var src = (from it in db.EducateSource where it.id == ID select it).FirstOrDefault();
                Dictionary<string, string> edu_src = new Dictionary<string, string>();
                edu_src.Add("title", src.title);
                edu_src.Add("body", src.body);
                edu_src.Add("publisher", src.publisher);
                edu_src.Add("publish_time", src.publish_time);
                edu_src.Add("view_times", src.view_times.ToString());
                string json = JsonConvert.SerializeObject(edu_src);
                context.Response.Write(json);
            }
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}