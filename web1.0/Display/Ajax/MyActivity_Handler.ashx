<%@ WebHandler Language="C#" Class="MyActivity_Handler" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using System.Collections;
using System;

public class MyActivity_Handler : IHttpHandler {

    private class Ac
    {
        public int Activity_id;
        public string Activity_title;
        public DateTime Activity_time;
        public string Activity_place;
        public string Activity_category;
        public string Activity_href;
    }

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        try
        {
            int teacher = 1;
            //int teacher = TeacherHelper.getTeacherIDByNumber(context.Session["TeacherNumber"].ToString());
            using (var db = new TeachingCenterEntities())
            {
                var at = from it in db.ActivityTeacher where it.teacher_id == teacher select it;
                List<Ac> list = new List<Ac>() ;
                foreach(var i in at)
                {
                    Activity ac = db.Activity.Single(e => e.Activity_id == i.activity_id);
                    Ac a = new Ac();
                    a.Activity_id = ac.Activity_id;
                    a.Activity_category = ActivityHelper.getCategoryName(ac.Activity_categoryid);
                    a.Activity_place = ac.Activity_place;
                    a.Activity_time = ac.Activity_time;
                    a.Activity_title = ac.Activity_title;
                    a.Activity_href = "Activity.html?id=" + ac.Activity_id;
                    list.Add(a);
                }
                list.Sort(SortList);
                string final = JsonConvert.SerializeObject(list);
                context.Response.Write(final);
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
        }
    }
    
    private int SortList(Ac a,Ac b)
    {
        if (a.Activity_time < b.Activity_time)
            return 1;
        else if (a.Activity_time == b.Activity_time)
            return 0;
        else
            return -1;
    }


    public bool IsReusable {
        get {
            return false;
        }
    }

}