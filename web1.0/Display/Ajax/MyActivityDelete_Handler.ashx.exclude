<%@ WebHandler Language="C#" Class="MyActivityDelete_Handler" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using System.Collections;
using System;

public class MyActivityDelete_Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        try
        {
            //int teacher = 1, id = 1;
            int teacher = TeacherHelper.getTeacherIDByNumber(context.Session["TeacherNumber"].ToString());
            int id = Convert.ToInt16(context.Request.Form["Activity_id"]);
            using(var db = new TeachingCenterEntities())
            {
                ActivityTeacher at = db.ActivityTeacher.Single(a => a.activity_id == id && a.teacher_id == teacher);
                Activity ac = db.Activity.Single(a => a.Activity_id == id);
                db.ActivityTeacher.Remove(at);
                db.Activity.Remove(ac);
                db.SaveChanges();
                JSHelper.AlertThenRedirect("取消成功！", "MyActivityList.html");
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
        }

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}