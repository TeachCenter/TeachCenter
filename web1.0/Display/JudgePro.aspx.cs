using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Display_JudgePro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["TeacherNumber"] = 1;
        if (!IsPostBack)
        {
            int judge_id = 1;
            if (Session["TeacherNumber"] != null)
                judge_id = Convert.ToInt32(TeacherHelper.getTeacherIDByNumber( Session["TeacherNumber"].ToString()));
            else
                Response.Redirect("main-index.aspx");
            int project_id = 5;
            int stage = 0;
            if(Request.QueryString["id"] != null && Request.QueryString["stage"] != null)
            {
                project_id = Convert.ToInt32(Request.QueryString["id"]);
                stage = Convert.ToInt32(Request.QueryString["stage"]);
            }
            else
                Response.Redirect("main-index.aspx");
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
                var project_stage = (from it in db.ProjectStage where it.project_id == project_id select it).FirstOrDefault();
                Content.Text = Server.HtmlDecode(project_stage.project_content);
                int index = project_stage.project_file.IndexOf("/");
                lbFileName.Text = project_stage.project_file.Substring(index + 1);
            }
        }
    }

    protected void lbtnSubmit_Click(object sender, EventArgs e)
    {
        string message = txtMessage.Text;
        int judge_id = Convert.ToInt32(TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString()));
        int project_id = Convert.ToInt32(Request.QueryString["id"]);
        int stage = Convert.ToInt32(Request.QueryString["stage"]);
        int is_pass = 0;
        HtmlInputHidden result = FindControl("result") as HtmlInputHidden;
        if (result.Value == "")
            Response.Write("<script>alert('请选择是否通过！');</script>");
        else
        {
            is_pass = Convert.ToInt32(result.Value);
            using (var db = new TeachingCenterEntities())
            {
                var record = (from it in db.ProjectJudge where it.judge_id == judge_id && it.project_id == project_id && it.stage == stage select it).FirstOrDefault();
                record.comment = message;
                record.is_pass = is_pass;
                db.SaveChanges();
                Response.Write("<script>alert('提交评审结果成功！');location.href='MyJudgePro.aspx';</script>");
            }
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