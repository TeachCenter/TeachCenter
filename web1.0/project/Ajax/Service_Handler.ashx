<%@ WebHandler Language="C#" Class="Service_Handler" %>

using System;
using System.Web;
using System.Web.SessionState;

public class Service_Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        try
        {
            int teacher = TeacherHelper.getTeacherIDByNumber(context.Session["TeacherNumber"].ToString());
            //int teacher = 1;
            int category;
            try
            {
                category = Convert.ToInt32(context.Request.QueryString["id"].ToString());
            }
            catch
            {
                category = 1;
            }
            DateTime now = DateTime.Now;
            string phone = context.Request.Form["phone"];
            string remarks = context.Request.Form["remarks"];
            //string phone = "12345678901", remarks = "123";
            if (phone.Length == 0 )
                JSHelper.ShowAlert("联系方式不能为空！");
            else
                using (var db = new TeachingCenterEntities())
                {
                    var service = new Service();
                    service.Service_teacher = teacher;
                    service.Service_time = now;
                    service.Service_phone = phone;
                    service.Service_remarks = remarks;
                    service.Service_category = category;
                    db.Service.Add(service);
                    db.SaveChanges();
                    JSHelper.ShowAlert("申请成功！");
                }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登录！", "Login.aspx");
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}