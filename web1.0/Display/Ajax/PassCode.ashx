<%@ WebHandler Language="C#" Class="PassCode" %>

using System;
using System.Web;
using System.Linq;

public class PassCode : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string message;
        //context.Response.Write("Hello World");
        //string number = context.Request["inputNumber"];
        string number = context.Request.Form["inputNumber"];
        //string number = "12345asdfasdsfsadsafasdfas67";
        try
        {
            if (number == null)
                message = "请输入工号！";
            else if (TeacherHelper.checkNumber(number))
                message = "工号不存在！";
            else
            {
                using (var db = new TeachingCenterEntities())
                {
                    //string email = (from it in db.Teacher where it.number == number select it).ToString();
                    string email = db.Teacher.FirstOrDefault(a => a.number == number).email.ToString();
                    if ((from it in db.PasswordCode where it.teacher_number == number select it).Any())
                    {
                        PasswordCode pwdcode = (from it in db.PasswordCode where it.teacher_number == number select it).FirstOrDefault();
                        string code = MailHelper.Random_check(email);
                        pwdcode.code = code;
                        pwdcode.send_time = DateTime.Now;
                        db.SaveChanges();
                    }
                    else
                    {
                        string code = MailHelper.Random_check(email);
                        PasswordCode pwdcode = new PasswordCode();
                        pwdcode.teacher_number = number;
                        pwdcode.code = code;
                        pwdcode.send_time = DateTime.Now;
                        db.PasswordCode.Add(pwdcode);
                        db.SaveChanges();
                    }
                    message = "验证码发送成功，请至邮箱查收！";
                    //JSHelper.ShowAlert("验证码发送成功，请至邮箱查收！");
                }
            }
        }
        catch(Exception ex)
        {
                message = ex.Message;
        }

        context.Response.Write(message);

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}