using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = CookieHelper.GetCookieValue("TeacherNumber");
            string pwd = CookieHelper.GetCookieValue("TeacherPwd");
            if (id != null && pwd != null)
            {
                txtID.Text = id;
                txtPwd.Attributes["value"] = pwd;
                cbxRemeberUser.Checked = true;
            }
        }

    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        string id = txtID.Text;
        string pwd = txtPwd.Text;
        if (id.Length == 0 || pwd.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (Session["Png"] != null)
        {
            string checkcode = Session["Png"].ToString();
            if (TextBox1.Text != checkcode)
                JSHelper.ShowAlert("验证码错误！");
            else
            {
                using (var db = new TeachingCenterEntities())
                {
                    Teacher ad = db.Teacher.Single(a => a.number == id);
                    if (ad.password == PwdHelper.MD5(pwd))
                    {
                        if (cbxRemeberUser.Checked == true)
                        {
                            CookieHelper.SetCookie("TeacherNumber", txtID.Text, DateTime.Now.AddDays(30));
                            CookieHelper.SetCookie("TeacherPwd", txtPwd.Text, DateTime.Now.AddDays(30));
                        }
                        Session["TeacherNumber"] = id;
                        JSHelper.AlertThenRedirect("登陆成功！", "EditInfo.aspx");
                    }

                }
            }


        }

    }
}