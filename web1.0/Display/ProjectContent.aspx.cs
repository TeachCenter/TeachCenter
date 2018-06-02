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
        try
        {
            //判断是不是评审
            if (!TeacherHelper.isJudge(Session["TeacherNumber"].ToString()))
                liJudge.Visible = false;

            int project_id = 1;
            if (Request.QueryString["id"] != null)
            {
                project_id = Convert.ToInt32(Request.QueryString["id"]);
            }
            else
                Response.Redirect("main-index.aspx");
            using (var db = new TeachingCenterEntities())
            {
                // 获取当前项目
                var projectinfo = (from it in db.ProjectInfo where it.project_id == project_id select it).FirstOrDefault();
                txtName.Text = projectinfo.name; // 项目名称
                txtCategory.Text = projectinfo.category_name; // 项目类型
                txtDuty.Text = projectinfo.teacher_name; // 项目负责人
                DateTime time = Convert.ToDateTime(projectinfo.submit_time); // 获取年月日
                txtYear.Text = time.Year.ToString();
                txtMonth.Text = time.Month.ToString();
                txtDay.Text = time.Day.ToString();
                var project = (from it in db.Project where it.project_id == project_id select it).FirstOrDefault();
                txtMoney.Text = project.fund; // 资助金额
                string department = (from it in db.Teacher where it.id == project.teacher_id select it).FirstOrDefault().department;
                txtDepartment.Text = department; // 院系
                var project_stage = (from it in db.ProjectStage where it.project_id == project_id orderby it.stage descending select it).FirstOrDefault();
                // 判断当前项目阶段
                if (project_stage.stage == 0)
                    txtStage.Text = "初审";
                else if (project_stage.stage == 1)
                    txtStage.Text = "中期";
                else
                    txtStage.Text = "结题";
                Content.Text = Server.HtmlDecode(project_stage.project_content); // 项目内容
                int index = project_stage.project_file.IndexOf("/");
                lbFileName.Text = project_stage.project_file.Substring(index + 1); // 项目文件
                // 判断当前项目状态（是否通过及是否超时）
                if (project_stage.is_pass == 1)
                    txtReslut.Text = "是";
                else if (project_stage.is_pass == 0)
                    txtReslut.Text = "否";
                else if (project_stage.is_pass == -100)
                {
                    //divOutofTime.Visible = true;
                    //txtOutofTime.Text = "已超过提交时间";
                }
                else
                    txtReslut.Text = "尚未评判结果";          
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登录！", "main-index.aspx");
        }
    }

    public string getFileName()
    {
        try
        {
            int project_id = Convert.ToInt32(Request.QueryString["id"]);
            using (var db = new TeachingCenterEntities())
            {
                var project_stage = (from it in db.ProjectStage where it.project_id == project_id select it).FirstOrDefault();
                return project_stage.project_file;
            }
        }
        catch
        {
            return "";
        }
    }
    protected void lbtReturn_Click(object sender, EventArgs e)
    {
        Session.Remove("TeacherNumber");
        JSHelper.AlertThenRedirect("注销成功！", "main-index.aspx");
    }
}
