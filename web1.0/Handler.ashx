<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Linq;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Data.Objects;
using System.Web.UI.WebControls;

public class Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string id = context.Request["id"];
        if(string.IsNullOrEmpty(id))
            context.Response.Write("");
        else
        {
            int pdf_id = Convert.ToInt32(id);
            using (var db = new TeachingCenterEntities())
            {
                var pdf_url = (from it in db.ProjectStage where it.project_id == pdf_id orderby it.stage descending select it).FirstOrDefault().project_file;
                string url = "/BackStage/" + PdfHelper.WordToPdfWithWPS(pdf_url);              
                string json = JsonConvert.SerializeObject(url);
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