using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_EditPwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int teacher_id = 1;
            if (Session["TeacherNumber"] != null)
                teacher_id = TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString());
            else
                Response.Redirect("main-index.aspx");
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登录！", "main-index.aspx");
        }
    }

    protected void lbtReturn_Click(object sender, EventArgs e)
    {
        Session.Remove("TeacherNumber");
        JSHelper.AlertThenRedirect("注销成功！", "main-index.aspx");
    }

    protected void lbtnSubmit_Click(object sender, EventArgs e)
    {
        int teacher_id = TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString());
        string oldpwd = txtOld.Text;
        string newpwd = txtNew.Text;
        string checkpwd = txtCheck.Text;
        using (var db = new TeachingCenterEntities())
        {
            Teacher teacher = (from it in db.Teacher where it.id == teacher_id select it).FirstOrDefault();
            if (oldpwd.Length == 0 || newpwd.Length == 0 || checkpwd.Length == 0)
                Response.Write("<script>alert('输入不能为空！');</script>");
            else if (PwdHelper.MD5(oldpwd) != teacher.password)
                Response.Write("<script>alert('原密码错误！');</script>");
            else if (newpwd != checkpwd)
                Response.Write("<script>alert('两次输入密码不一致！');</script>");
            else
            {
                teacher.password = PwdHelper.MD5(newpwd);
                db.SaveChanges();
                JSHelper.AlertThenRedirect("修改成功！", "EditInfo.aspx");
            }
        }
    }
}