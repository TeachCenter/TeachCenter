using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_MyServiceEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //int teacher = TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString());
            int teacher = 2;
            if (!IsPostBack)
                using (var db = new TeachingCenterEntities())
                {
                    int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                    Service ser = db.Service.Single(a => a.Service_id == id);
                    ltType.Text = ServiceHelper.getCategoryName(ser.Service_category);
                    ltTeacher.Text = TeacherHelper.getTeacherNameByID(teacher);
                    txtPhone.Value = ser.Service_phone;
                    txtIntroduction.Value = ser.Service_remarks;

                }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "main-index.aspx");
        }
    }

    protected void ltbChange_Click(object sender, EventArgs e)
    {
        string intro = txtIntroduction.Value;
        string phone = txtPhone.Value;
        if (intro.Length == 0 || phone.Length == 0)
            JSHelper.ShowAlert("输入存在空值！");
        else
        {
            try
            {
                int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                using (var db = new TeachingCenterEntities())
                {
                    Service ser = db.Service.Single(a => a.Service_id == id);
                    ser.Service_phone = phone;
                    ser.Service_remarks = intro;
                    db.SaveChanges();
                    JSHelper.AlertThenRedirect("修改成功！", "MyService.aspx");
                }
            }
            catch
            {
                //JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
            }

        }
    }
}