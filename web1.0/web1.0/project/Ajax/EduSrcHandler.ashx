<%@ WebHandler Language="C#" Class="EduSrcHandler" %>

using System;
using System.Web;
using System.Linq;
using Newtonsoft.Json;

public class EduSrcHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string pageSize = context.Request["pageSize"];
        string pageIndex = context.Request["pageNumber"];
        if (string.IsNullOrEmpty(pageSize) || string.IsNullOrEmpty(pageIndex))
        {
            context.Response.Write("");
        }
        else
        {
            int index = Convert.ToInt32(pageIndex);
            int size = Convert.ToInt32(pageSize);
            using (var db = new TeachingCenterEntities())
            {
                var src = (from it in db.EducateSource where it.is_deleted == 0 orderby it.publish_time descending select it).Take(size * index).Skip(size * (index - 1));
                foreach(var item in src)
                {
                    item.body = UeditorHelper.NoHTML(item.body);
                }
                string json = JsonConvert.SerializeObject(src);
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