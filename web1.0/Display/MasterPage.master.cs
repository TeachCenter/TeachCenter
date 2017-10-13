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
        }
        else
        {
            divPerson.Visible = true;
            divEnter.Visible = false;
        }
        if (!IsPostBack)
        {
            string id = CookieHelper.GetCookieValue("TeacherNumber");
            string pwd = CookieHelper.GetCookieValue("TeacherPwd");
            if (id != null && pwd != null)
            {
                txtID.Text = id;
                txtPwd.Attributes["value"] = pwd;
                //cbxRemeberUser.Checked = true;

            }
            
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
                if (TextBox1.Text != Session["PngLogin"].ToString())
                    JSHelper.AlertThenRedirect("验证码错误！", "main-index.aspx");
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
                            JSHelper.AlertThenRedirect("登陆成功！", "main-index.aspx");
                            Session["TeacherNumber"] = id;
                            //Server.Transfer("Index.aspx");
                            //JSHelper.js("window.history.go(0);");
                        }
                        else
                            JSHelper.AlertThenRedirect("密码错误！", "main-index.aspx");
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
                    //teacher.image = "";
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
}
