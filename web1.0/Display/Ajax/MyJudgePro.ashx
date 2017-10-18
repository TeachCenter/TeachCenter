<%@ WebHandler Language="C#" Class="MyJudgePro" %>

using System;
using System.Web;
using System.Linq;
using Newtonsoft.Json;
using System.Collections;
using System.Data;
using System.Web.SessionState;

public class MyJudgePro : IHttpHandler,IRequiresSessionState {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string pageSize = context.Request["pageSize"];
        string pageIndex = context.Request["pageNumber"];
        int judge_id = 1;
        if (HttpContext.Current.Session["TeacherNumber"] != null)
            judge_id = TeacherHelper.getTeacherIDByNumber(HttpContext.Current.Session["TeacherNumber"].ToString());
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
                var project = from it in db.ProjectJudge
                              where it.judge_id == judge_id && it.is_pass == -1
                              orderby it.project_id descending
                              select new
                              {
                                  it.project_id,
                                  it.teacher_id,
                                  it.stage,
                                  it.category
                              };
                int count = project.Count();
                project = project.Take(size * index).Skip(size * (index - 1));
                DataTable dt = new DataTable();
                dt.Columns.Add("id");
                dt.Columns.Add("title");
                dt.Columns.Add("submit_time");
                dt.Columns.Add("teacher_name");
                dt.Columns.Add("department");
                dt.Columns.Add("stage");
                foreach(var item in project)
                {
                    DataRow newRow = dt.NewRow();
                    //var category = (from it in db.ProjectCategory where it.id == item.category select it).FirstOrDefault();
                    //DateTime now = DateTime.Now;
                    //DateTime end = Convert.ToDateTime(category.judge_end_time);
                    //if((now - end).TotalDays < 7)
                    //{
                    newRow["id"] = item.project_id;
                    newRow["title"] = getProName(item.project_id);
                    newRow["submit_time"] = getProTime(item.project_id);
                    newRow["teacher_name"] = getName(item.teacher_id);
                    newRow["department"] = getDepartment(item.teacher_id);
                    newRow["stage"] = item.stage;
                    dt.Rows.Add(newRow);
                    //}
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

    public string getProName(int id)
    {
        using (var db = new TeachingCenterEntities())
        {
            string name = (from it in db.Project where it.project_id == id select it).FirstOrDefault().name;
            return name;
        }
    }

    public string getProTime(int id)
    {
        using (var db = new TeachingCenterEntities())
        {
            string time = (from it in db.Project where it.project_id == id select it).FirstOrDefault().submit_time;
            return time;
        }
    }

}