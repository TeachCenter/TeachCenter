<%@ WebHandler Language="C#" Class="Login_Handler" %>

using System;
using System.Web;
using System.Linq;

using System.Web.SessionState;  

public class Login_Handler : IHttpHandler, IRequiresSessionState   {

    public void ProcessRequest(HttpContext context)
    {
        //context.Response.ContentType = "text/plain";
        //string id = "1", pwd = "admin";
        //bool cbxRemeberUser = true;
        string id = context.Request.Form["id"];
        string pwd = context.Request.Form["pwd"];
        bool cbxRemeberUser = Convert.ToBoolean( context.Request.Form["remember"]);
        if (id.Length == 0 || pwd.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else
        {
            using (var db = new TeachingCenterEntities())
            {
                Teacher ad = db.Teacher.Single(a => a.number == id);
                if (ad.password == PwdHelper.MD5(pwd))
                {
                    if (cbxRemeberUser == true)
                    {
                        CookieHelper.SetCookie("TeacherNumber", id, DateTime.Now.AddDays(30));
                        CookieHelper.SetCookie("TeacherPwd", pwd, DateTime.Now.AddDays(30));
                    }
                    JSHelper.ShowAlert("登录成功");
                    context.Session["TeacherNumber"] = id;
                    //context.Server.Transfer("Index.aspx");
                }

            }
        }
    }


    public bool IsReusable {
        get {
            return false;
        }
    }

}