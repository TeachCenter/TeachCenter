using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_ResetPwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string teacher = Session["AdminID"].ToString();
            divTeacher.Visible = false;
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
        }
        
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        string number = txtNumber.Text;
        if (TeacherHelper.checkNumber(number))
            JSHelper.ShowAlert("工号不存在！");
        else
        {
            using (var db = new TeachingCenterEntities())
            {
                Teacher te = db.Teacher.Single(a => a.number == number);
                ltName.Text = te.name;
                ltNumber.Text = te.number;
                
            }
            divTeacher.Visible = true;
        }
    }

    protected void BtnReset_Click(object sender, EventArgs e)
    {
        using (var db = new TeachingCenterEntities())
        {
            string number = ltNumber.Text;
            Teacher te = db.Teacher.Single(a => a.number == number);
            te.password = PwdHelper.MD5("ouc" + number);
            db.SaveChanges();
            Server.Transfer("ResetPwd.aspx");
            //JSHelper.AlertThenRedirect("重置成功！", "ResetPwd.aspx");
        }
    }
}