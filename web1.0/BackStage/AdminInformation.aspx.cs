using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_AdminInformation : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string teacher = Session["AdminID"].ToString();
            using (var db = new TeachingCenterEntities())
            {
                Admin admin = db.Admin.Single(a => a.Admin_id == teacher);
                lbID.Text = admin.Admin_id;
                lbName.Text = admin.Admin_name;
                lbEmail.Text = admin.Admin_emai;
                lbCheck.Text = Convert.ToBoolean(admin.Admin_emai_check) ? "已验证" : "未验证 点击去验证>> ";
                if (!Convert.ToBoolean(admin.Admin_emai_check))
                {
                    lbCheck.CssClass = lbCheck.CssClass + " lbCheck";
                    lbCheck.Enabled = true;
                }
                    
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登录！", "Login.aspx");
        }
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        string name = txtName.Text;
        string email = txtEmail.Text;
        if (name.Length == 0 || email.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else
        {
            string teacher = Session["AdminID"].ToString();
            using (var db = new TeachingCenterEntities())
            {
                Admin admin = db.Admin.Single(a => a.Admin_id == teacher);
                admin.Admin_name = name;
                admin.Admin_emai = email;
                admin.Admin_emai_check = 0;
                db.SaveChanges();
                Server.Transfer("AdminInformation.aspx");
                //JSHelper.AlertThenRedirect("修改成功！", "AdminInformation.aspx");
            }
        }
    }

    protected void btnEditor_Click(object sender, EventArgs e)
    {
        txtEmail.Visible = true;
        txtName.Visible = true;
        btnSub.Visible = true;
        lbName.Visible = false;
        lbEmail.Visible = false;
        lbCheck.Visible = false;
        btnEditor.Visible = false;
        divCheck.Visible = false;
    }

    protected void lbCheck_Click(object sender, EventArgs e)
    {
        divCheck.Visible = true;
        lbCheck.Visible = false;
        SendMail();
    }

    protected void btnCheck_Click(object sender, EventArgs e)
    {
        string teacher = Session["AdminID"].ToString();
        using (var db = new TeachingCenterEntities())
        {
            Admin admin = db.Admin.Single(a => a.Admin_id == teacher);
            if (txtCheck.Text != Session["random"].ToString())
                JSHelper.ShowAlert("验证码错误!");
            else
            {
                admin.Admin_emai_check = 1;
                db.SaveChanges();
                Server.Transfer("AdminInformation.aspx");
                //JSHelper.AlertThenRedirect("验证成功！", "AdminInformation.aspx");
            }
                
         }
    }

    protected void lbPwd_Click(object sender, EventArgs e)
    {
        string teacher = Session["AdminID"].ToString();
        using (var db = new TeachingCenterEntities())
        {
            Admin admin = db.Admin.Single(a => a.Admin_id == teacher);
            if (!Convert.ToBoolean(admin.Admin_emai_check))
                JSHelper.ShowAlert("请先验证邮箱！");
            else
            {
                divPwd.Visible = true;
                lbPwd.Visible = false;
                SendMail();
            }

            
        }
        
    }

    private void SendMail()
    {
        string teacher = Session["AdminID"].ToString();
        using (var db = new TeachingCenterEntities())
        {
            Admin admin = db.Admin.Single(a => a.Admin_id == teacher);
            Session["random"] = MailHelper.Random_check(admin.Admin_emai);
        }
    }

    protected void txtPwd_Click(object sender, EventArgs e)
    {
        if (txtCheckPwd.Text != Session["random"].ToString())
            JSHelper.ShowAlert("验证码错误！");
        else
        {
            divPwd.Visible = false;
            divEditor.Visible = true;
        }
    }

    protected void btnNewPwd_Click(object sender, EventArgs e)
    {
        string teacher = Session["AdminID"].ToString();
        using (var db = new TeachingCenterEntities())
        {
            Admin admin = db.Admin.Single(a => a.Admin_id == teacher);
            admin.Admin_pwd = PwdHelper.MD5(txtNewPwd.Text);
            db.SaveChanges();
            Server.Transfer("AdminInformation.aspx");
            //JSHelper.AlertThenRedirect("修改成功！", "AdminInformation.aspx");
        }
    }

}