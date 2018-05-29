using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["TeacherNumber"] == null)
        {
            divEnter.Visible = true;
            divPerson.Visible = false;
            mobileLogin.Visible = true;
            mobilePerson.Visible = false;
        }
        else
        {
            divPerson.Visible = true;
            divEnter.Visible = false;
            mobileLogin.Visible = false;
            mobilePerson.Visible = true;
        }
        if (!IsPostBack)
        {
            //string id = CookieHelper.GetCookieValue("TeacherNumber");
            //string pwd = CookieHelper.GetCookieValue("TeacherPwd");
            //if (id != null && pwd != null)
            //{
            //    txtID.Text = id;
            //    txtPwd.Attributes["value"] = pwd;
            //    //cbxRemeberUser.Checked = true;

            //}
            
        }
    }

    protected void ltbLogin_Click(object sender, EventArgs e)
    {
        string id = txtID.Text;
        string pwd = txtPwd.Text;
        if (id.Length == 0 || pwd.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (TeacherHelper.checkNumber(id))
            JSHelper.ShowAlert("工号不存在！");
        else
        {
            if (Session["PngLogin"] != null)
            {
                if (TextBox1.Value != Session["PngLogin"].ToString())
                    JSHelper.ShowAlert("验证码错误！");
                else
                    using (var db = new TeachingCenterEntities())
                    {
                        Teacher ad = db.Teacher.Single(a => a.number == id);
                        if (ad.password == PwdHelper.MD5(pwd))
                        {
                            //if (cbxRemeberUser.Checked == true)
                            {
                                CookieHelper.SetCookie("TeacherNumber", txtID.Text, DateTime.Now.AddDays(30));
                                CookieHelper.SetCookie("TeacherPwd", txtPwd.Text, DateTime.Now.AddDays(30));
                            }
                            //JSHelper.AlertThenRedirect("登陆成功！","main-index.aspx");
                           
                            Session["TeacherNumber"] = id;
                            Server.Transfer("main-index.aspx");
                            //JSHelper.js("window.history.go(0);");
                        }
                        else
                            JSHelper.ShowAlert("密码错误！");
                    }
            }


        }
    }

    protected void lbtRegister_Click(object sender, EventArgs e)
    {
        string name = txtName.Text;
        string pwd = txtNewPwd.Text;
        string repwd = txtCheckPwd.Text;
        string number = txtNumber.Text;
        string phone = txtPhone.Text;
        string email = txtEmail.Text;

            if (name == "" || pwd == "" || repwd == "" || number == "" || phone == "" || email == "")
                JSHelper.AlertThenRedirect("输入不能为空！", "main-index.aspx");
            //Server.Transfer("main-index.aspx");
            else if (pwd != repwd)
                JSHelper.AlertThenRedirect("前后密码不一致！", "main-index.aspx");
            else if (!TeacherHelper.checkNumber(number))
                JSHelper.AlertThenRedirect("该工号已存在！", "main-index.aspx");
            else
            {
                using (var db = new TeachingCenterEntities())
                {
                    Teacher teacher = new Teacher();

                    teacher.name = name;
                    teacher.password = PwdHelper.MD5(pwd);
                    teacher.gender = 0;
                    teacher.email = email;
                    teacher.number = number;
                    teacher.phone_number = phone;
                    teacher.department = "";
                    teacher.rank = "";
                    teacher.is_judge = 0;

                    db.Teacher.Add(teacher);
                    db.SaveChanges();
                    JSHelper.AlertThenRedirect("注册成功！", "main-index.aspx");
                    //JSHelper.js("window.location.reload();");
                }
            
        }
        
    }

    /*protected void lbtReturn_Click(object sender, EventArgs e)
    {
        Session.Remove("TeacherNumber");
        JSHelper.AlertThenRedirect("注销成功！", "main-index.aspx");
        //Server.Transfer("main-index.aspx");
    }*/

    protected void lbtExit_Click(object sender, EventArgs e)
    {
        Session.Remove("TeacherNumber");
        JSHelper.AlertThenRedirect("注销成功！", "main-index.aspx");
    }

    /*protected void lbtSendCode_Click(object sender, EventArgs e)
    {
        string number = txtNumber.Text;
        if (number.Length == 0)
            JSHelper.ShowAlert("请输入工号！");
        else if (TeacherHelper.checkNumber(number))
            JSHelper.ShowAlert("工号不存在！");        
        else
        {
            using (var db = new TeachingCenterEntities())
            {
                string email = (from it in db.Teacher where it.number == number select it.email).ToString();                
                if((from it in db.PasswordCode where it.teacher_number == number select it).Any())
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
                JSHelper.ShowAlert("验证码发送成功，请至邮箱查收！");
            }
        }
    }*/

    /*protected void lbtSubmit_Click(object sender, EventArgs e)
    {
        string number = txtNumber.Text;
        string code = txtCode.Text;
        DateTime time = DateTime.Now;
        if(number.Length == 0 || code.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (TeacherHelper.checkNumber(number))
            JSHelper.ShowAlert("工号不存在！");
        else
        {
            using (var db = new TeachingCenterEntities())
            {
                var pwdcode = (from it in db.PasswordCode where it.teacher_number == number && it.code == code select it).FirstOrDefault();
                DateTime send_time = pwdcode.send_time;
                if((time - send_time).TotalMinutes > 15)
                    JSHelper.ShowAlert("验证码已超时，请重新获取验证码！");
                else
                {
                    var teacher = (from it in db.Teacher where it.number == number select it).FirstOrDefault();
                    teacher.password = PwdHelper.MD5("ouc123");
                    db.PasswordCode.Remove(pwdcode);
                    db.SaveChanges();
                    JSHelper.AlertThenRedirect("重置密码成功，您的新密码为ouc123！", "main-index.aspx");
                }
            }
        }
    }*/

    //protected void GetCode_Click(object sender, EventArgs e)
    //{
    //    string number = inputNumber.Value;
    //    if (number.Length == 0)
    //        JSHelper.ShowAlert("请输入工号！");
    //    else if (TeacherHelper.checkNumber(number))
    //        JSHelper.ShowAlert("工号不存在！");
    //    else
    //    {
    //        using (var db = new TeachingCenterEntities())
    //        {
    //            string email = (from it in db.Teacher where it.number == number select it.email).ToString();
    //            if ((from it in db.PasswordCode where it.teacher_number == number select it).Any())
    //            {
    //                PasswordCode pwdcode = (from it in db.PasswordCode where it.teacher_number == number select it).FirstOrDefault();
    //                string code = MailHelper.Random_check(email);
    //                pwdcode.code = code;
    //                pwdcode.send_time = DateTime.Now;
    //                db.SaveChanges();
    //            }
    //            else
    //            {
    //                string code = MailHelper.Random_check(email);
    //                PasswordCode pwdcode = new PasswordCode();
    //                pwdcode.teacher_number = number;
    //                pwdcode.code = code;
    //                pwdcode.send_time = DateTime.Now;
    //                db.PasswordCode.Add(pwdcode);
    //                db.SaveChanges();
    //            }
    //            JSHelper.ShowAlert("验证码发送成功，请至邮箱查收！");
    //        }
    //    }
    

    protected void codesubmit_Click(object sender, EventArgs e)
    {
        string number = inputNumber.Text;
        string code = inputCode.Text;
        DateTime time = DateTime.Now;
        if (number.Length == 0 || code.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (TeacherHelper.checkNumber(number))
            JSHelper.ShowAlert("工号不存在！");
        else
        {
            using (var db = new TeachingCenterEntities())
            {
                var pwdcode = (from it in db.PasswordCode where it.teacher_number == number && it.code == code select it).FirstOrDefault();
                DateTime send_time = pwdcode.send_time;
                if ((time - send_time).TotalMinutes > 15)
                    JSHelper.ShowAlert("验证码已超时，请重新获取验证码！");
                else
                {
                    var teacher = (from it in db.Teacher where it.number == number select it).FirstOrDefault();
                    teacher.password = PwdHelper.MD5("ouc123");
                    db.PasswordCode.Remove(pwdcode);
                    db.SaveChanges();
                    JSHelper.AlertThenRedirect("重置密码成功，您的新密码为ouc123！", "main-index.aspx");
                }
            }
        }
    }
}
