<%@ WebHandler Language="C#" Class="ProContentHandler" %>

using System;
using System.Web;
using System.Linq;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Data.Objects;
using System.Web.UI.WebControls;

public class ProContentHandler : IHttpHandler {
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string id = "6";// context.Request["id"];
        if(string.IsNullOrEmpty(id))
            context.Response.Write("");
        else
        {
            int project_id = Convert.ToInt32(id);
            string localPath = System.Web.HttpContext.Current.Server.MapPath("../../");
            localPath = localPath.Replace("\\", "/");
            using (var db = new TeachingCenterEntities())
            {
                var project = (from it in db.ProjectCategory where it.id == project_id select it).FirstOrDefault();
                string file_path = project.project_file;
                string url = "/BackStage/" + PdfHelper.WordToPdfWithWPS(file_path, localPath);
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