<%@ WebHandler Language="C#" Class="MyProject" %>

using System;
using System.Web;
using System.Linq;
using Newtonsoft.Json;
using System.Collections;
using System.Data;
using System.Web.SessionState;

public class MyProject : IHttpHandler,IRequiresSessionState {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string pageSize = context.Request["pageSize"];
        string pageIndex = context.Request["pageNumber"];
        int teacher_id = 1;
        if (HttpContext.Current.Session["TeacherNumber"] != null)
            teacher_id = TeacherHelper.getTeacherIDByNumber(HttpContext.Current.Session["TeacherNumber"].ToString());
        else
            HttpContext.Current.Response.Redirect("~/Display/main-index.aspx");
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
                var project = from it in db.Project
                              where it.teacher_id == teacher_id
                              where it.is_deleted == 0
                              orderby it.submit_time descending
                              select new
                              {
                                  it.project_id,
                                  it.name,
                                  it.submit_time,
                                  it.teacher_id
                              };
                int count = project.Count();
                project = project.Take(size * index).Skip(size * (index - 1));
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
                ArrayList all = new ArrayList();
                all.Add(dt);
                all.Add(count);
                string json = JsonConvert.SerializeObject(all);
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