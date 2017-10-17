using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Display_Person_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            //判断是不是评审
            if (!TeacherHelper.isJudge(Session["TeacherNumber"].ToString()))
                liJudge.Visible = false;

            int teacher_id = TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString());
            using (var db = new TeachingCenterEntities())
            {
                var teacher = (from it in db.Teacher where it.id == teacher_id select it).FirstOrDefault();
                lbName.Text = teacher.name;
                lbType.Text = teacher.is_judge == 0 ? "教师" : "评审";
                HtmlInputHidden isCompleted = FindControl("isCompleted") as HtmlInputHidden;
                if (teacher.gender == 5 || teacher.department == "" || teacher.rank == "")
                    isCompleted.Value = "0";
                else
                    isCompleted.Value = "1";
                var project = from it in db.Project where it.teacher_id == teacher_id select it;
                List<Project> proList = new List<Project>();
                foreach(Project item in project)
                {
                    var category = (from it in db.ProjectCategory where it.id == item.category select it).FirstOrDefault();
                    int stage1 = category.stage;
                    var stage = (from it in db.ProjectStage where it.project_id == item.project_id orderby it.stage descending select it).FirstOrDefault();
                    int stage2 = stage.stage;
                    if (stage.stage < category.stage)
                        proList.Add(item);
                }
                rptProject.DataSource = proList;
                rptProject.DataBind();

                if (getJudgeNumber() == 0)
                    divJudge.Visible = false;
                if (teacher.is_judge == 0)
                    liJudge.Visible = false;
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登录！", "main-index.aspx");
        }
    }

    public int getStage(int id)
    {
        try
        {
            using (var db = new TeachingCenterEntities())
            {
                var stage = (from it in db.ProjectStage where it.project_id == id orderby it.stage descending select it).FirstOrDefault();
                return stage.stage;
            }
        }
        catch
        {
            return 0;
        }
    }

    public string getNumber(int stage)
    {
        if (stage == 0)
            return "二";
        else
            return "三";
    }

    public int getJudgeNumber()
    {
        try
        {
            int judge_id = Convert.ToInt32(TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString()));
            using (var db = new TeachingCenterEntities())
            {
                var project = from it in db.ProjectJudge where it.judge_id == judge_id && it.is_pass == -1 select it;
                int number = project.Count();
                foreach(ProjectJudge item in project)
                {
                    var category = (from it in db.ProjectCategory where it.id == item.category select it).FirstOrDefault();
                    DateTime now = DateTime.Now;
                    DateTime end = Convert.ToDateTime(category.judge_end_time);
                    if (DateTime.Compare(now, end) < 0)
                        number = number - 1;
                }
                return number;
            }
        }
        catch
        {
            return 0;
        }
            
    }

    protected void lbtReturn_Click(object sender, EventArgs e)
    {
        Session.Remove("TeacherNumber");
        JSHelper.AlertThenRedirect("注销成功！", "main-index.aspx");
    }
}