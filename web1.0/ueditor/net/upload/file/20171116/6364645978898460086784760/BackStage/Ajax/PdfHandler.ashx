﻿<%@ WebHandler Language="C#" Class="PdfHandler" %>

using System;
using System.Web;
using System.Linq;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Data.Objects;
using System.Web.UI.WebControls;

public class PdfHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string id = context.Request["id"];
        if(string.IsNullOrEmpty(id))
            context.Response.Write("");
        else
        {
            int project_id = Convert.ToInt32(id);
            string localPath = System.Web.HttpContext.Current.Server.MapPath("../../");
            localPath = localPath.Replace("\\", @"\");
            using (var db = new TeachingCenterEntities())
            {
                var project = (from it in db.ProjectStage where it.project_id == project_id orderby it.stage descending select it).FirstOrDefault();
                string file_path = project.project_file;
                string url = "/BackStage/" + PdfHelper.WordToPdf(file_path, localPath);
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