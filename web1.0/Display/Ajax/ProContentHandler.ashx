<%@ WebHandler Language="C#" Class="ProContentHandler" %>

using System;
using System.Web;
using System.Linq;
using System.Collections.Generic;
using Newtonsoft.Json;

public class ProContentHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string id = "6";// context.Request["id"];
        if(string.IsNullOrEmpty(id))
            context.Response.Write("");
        else
        {
            int pro_id = Convert.ToInt32(id);
            using (var db = new TeachingCenterEntities())
            {
                var project = (from it in db.ProjectCategory where it.id == pro_id select it).FirstOrDefault();
                string url = "/BackStage/" + PdfHelper.WordToPdfWithWPS(project.project_file);
                Dictionary<string, string> project_content = new Dictionary<string, string>();
                project_content.Add("title", project.name);
                project_content.Add("body", project.project_content);
                project_content.Add("file_path", url);
                project_content.Add("end_time", project.end_time);
                project_content.Add("publish_time", project.publish_time);
                string json = JsonConvert.SerializeObject(project_content);
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