using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = CookieHelper.GetCookieValue("AdminID");
            string pwd = CookieHelper.GetCookieValue("AdminPwd");
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
        else if(Session["CheckCode"] != null)
        {
            string checkcode = Session["CheckCode"].ToString();
            if (TextBox1.Text != checkcode)
                JSHelper.ShowAlert("验证码错误！");
            else
            {
                using (var db = new TeachingCenterEntities())
                {
                    Admin ad = db.Admin.Single(a => a.Admin_id == id);
                    if (ad.Admin_pwd == PwdHelper.MD5(pwd))
                    {
                        if (cbxRemeberUser.Checked == true)
                        {
                            CookieHelper.SetCookie("AdminID", txtID.Text, DateTime.Now.AddDays(30));
                            CookieHelper.SetCookie("AdminPwd", txtPwd.Text, DateTime.Now.AddDays(30));
                        }
                        JSHelper.ShowAlert("登陆成功");
                        Session["AdminID"] = id;
                        Server.Transfer("Index.aspx");
                    }
                        
                }
            }


        }

    }

   
}