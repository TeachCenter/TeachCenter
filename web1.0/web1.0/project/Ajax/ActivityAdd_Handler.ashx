<%@ WebHandler Language="C#" Class="ActivityAdd_Handler" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using System.Collections;
using System;

public class ActivityAdd_Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        try
        {
            int teacher = TeacherHelper.getTeacherIDByNumber(context.Session["TeacherNumber"].ToString());
            int id = Convert.ToInt32(context.Request.Form["Activity_id"]);
            //int teacher = 1, id = 3;
            using (var db = new TeachingCenterEntities())
            {
                Activity ac = db.Activity.Single(a => a.Activity_id == id);
                if (ac.Activity_nowcount >= ac.Activity_limitcount)
                    JSHelper.ShowAlert("操作失败，人数已达到上限。");
                else if (ac.Activity_time < DateTime.Now)
                    JSHelper.ShowAlert("该活动已结束！");
                else
                {
                    var acs = from it in db.ActivityTeacher where it.teacher_id == teacher && it.activity_id == id select it;

                    if (acs.Count() > 0)
                        JSHelper.ShowAlert("您已参加了该项目！");
                    else
                    {
                        ac.Activity_nowcount++;
                        ActivityTeacher at = new ActivityTeacher();
                        at.activity_id = id;
                        at.teacher_id = teacher;
                        db.ActivityTeacher.Add(at);
                        db.SaveChanges();
                        JSHelper.ShowAlert("参与成功！");
                    }

                }
            }
        }
        catch (Exception e)
        {
            JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx" + e.Message);
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}