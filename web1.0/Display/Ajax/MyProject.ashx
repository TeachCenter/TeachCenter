<%@ WebHandler Language="C#" Class="MyProject" %>

using System;
using System.Web;
using System.Linq;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Data;
using System.Web.SessionState;

public class MyProject : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string pageSize = context.Request["pageSize"];
        string pageIndex = context.Request["pageNumber"];
        int teacher_id = 1;
        //if (HttpContext.Current.Session["TeacherNumber"] != null)
        //    teacher_id = Convert.ToInt32(HttpContext.Current.Session["TeacherNumber"].ToString());
        //else
        //    HttpContext.Current.Response.Redirect("~/Display/index.aspx");
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
                var project = (from it in db.Project where it.teacher_id == teacher_id orderby it.submit_time descending select it).Take(size * index).Skip(size * (index - 1));
                DataTable dt = new DataTable();
                dt.Columns.Add("id");
                dt.Columns.Add("title");
                dt.Columns.Add("submit_time");
                dt.Columns.Add("teacher_name");
                dt.Columns.Add("department");
                foreach(var item in project)
                {
                    DataRow newRow = dt.NewRow();
                    newRow["id"] = item.project_id;
                    newRow["title"] = item.name;
                    newRow["submit_time"] = item.submit_time;
                    newRow["teacher_name"] = getName(item.teacher_id);
                    newRow["department"] = getDepartment(item.teacher_id);
                    dt.Rows.Add(newRow);
                }
                string json = JsonConvert.SerializeObject(dt);
                context.Response.Write(json);
            }
        }
    }


    public bool IsReusable {
        get {
            return false;
        }
    }

    public string getName(int id)
    {
        using (var db = new TeachingCenterEntities())
        {
            string name = (from it in db.Teacher where it.id == id select it).FirstOrDefault().name;
            return name;
        }
    }

    public string getDepartment(int id)
    {
        using (var db = new TeachingCenterEntities())
        {
            string department = (from it in db.Teacher where it.id == id select it).FirstOrDefault().department;
            return department;
        }
    }

}