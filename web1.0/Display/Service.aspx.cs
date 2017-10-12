using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_Service : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string teacher = Session["TeacherNumber"].ToString();
            //string teacher = "1234567";
            int category;
            try
            {
                category = Convert.ToInt32(Request.QueryString["id"].ToString());
            }
            catch
            {
                category = 1;
            }
            ltType.Value = ServiceHelper.getCategoryName(category);
            //绑定服务类型
            using (var db = new TeachingCenterEntities())
            {
                var categoryList = from it in db.ServiceCategory select it;
                rptCategory.DataSource = categoryList.ToList();
                rptCategory.DataBind();
            }
            ltTeacher.Value = TeacherHelper.getTeacherNameByNumber(teacher);
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "main-index.aspx");
        }

    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        int category;
        try
        {
            category = Convert.ToInt32(Request.QueryString["id"].ToString());
        }
        catch
        {
            category = 1;
        }
        DateTime now = DateTime.Now;
        int teacher = TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString());
        //string teacher = "1234567";
        //int teacher = 0;
        string phone = txtPhone.Value;
        string remarks = txtRemarks.Value;
        if (phone.Length == 0)
            JSHelper.ShowAlert("联系方式不能为空！");
        else
            using (var db = new TeachingCenterEntities())
            {
                var service = new Service();
                service.Service_teacher = teacher;
                service.Service_time = now;
                service.Service_phone = phone;
                service.Service_remarks = remarks;
                service.Service_category = category;
                db.Service.Add(service);
                db.SaveChanges();
                JSHelper.ShowAlert("申请成功！");
            }
        // = ServiceHelper.getCategoryName(type);
    }
}