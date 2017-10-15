using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_ProjectContent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是不是评审
        if (!TeacherHelper.isJudge(Session["TeacherNumber"].ToString()))
            liJudge.Visible = false;

        int project_id = 5;
        int stage = 0;
        if (Request.QueryString["id"] != null)
        {
            project_id = Convert.ToInt32(Request.QueryString["id"]);
        }
        else
            Response.Redirect("main-index.html");
        using (var db = new TeachingCenterEntities())
        {
            var projectinfo = (from it in db.ProjectInfo where it.project_id == project_id select it).FirstOrDefault();
            txtName.Text = projectinfo.name;
            txtCategory.Text = projectinfo.category_name;
            txtDuty.Text = projectinfo.teacher_name;
            DateTime time = Convert.ToDateTime(projectinfo.submit_time);
            txtYear.Text = time.Year.ToString();
            txtMonth.Text = time.Month.ToString();
            txtDay.Text = time.Day.ToString();
            var project = (from it in db.Project where it.project_id == project_id select it).FirstOrDefault();
            txtMoney.Text = project.fund;
            string department = (from it in db.Teacher where it.id == project.teacher_id select it).FirstOrDefault().department;
            txtDepartment.Text = department;
            var project_stage = (from it in db.ProjectStage where it.project_id == project_id orderby it.stage descending select it).FirstOrDefault();
            if (project_stage.stage == 0)
                txtStage.Text = "初审";
            else if (project_stage.stage == 0)
                txtStage.Text = "中期";
            else
                txtStage.Text = "结题";
            Content.Text = Server.HtmlDecode(project_stage.project_content);
            int index = project_stage.project_file.IndexOf("/");
            lbFileName.Text = project_stage.project_file.Substring(index + 1);
            if (project_stage.is_pass == 1)
                txtReslut.Text = "是";
            else if(project_stage.is_pass == 0)
                txtReslut.Text = "否";
            else
                txtReslut.Text = "尚未评判结果";
        }
    }

    public string getFileName()
    {
        int project_id = Convert.ToInt32(Request.QueryString["id"]);
        using (var db = new TeachingCenterEntities())
        {
            var project_stage = (from it in db.ProjectStage where it.project_id == project_id select it).FirstOrDefault();
            return project_stage.project_file;
        }
    }
}
