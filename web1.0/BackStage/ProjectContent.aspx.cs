using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class BackStage_ProjectContent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string teacher = Session["AdminID"].ToString();
            if (!IsPostBack)
            {
                int id = 0;
                if (Request.QueryString["id"] != null)
                    id = Convert.ToInt32(Request.QueryString["id"]);
                else
                    Response.Redirect("ProjectList.aspx");
                Dictionary<int, string> stage = new Dictionary<int, string>();
                stage.Add(0, "初审");
                stage.Add(1, "中期");
                stage.Add(2, "结题");
                Dictionary<int, string> status = new Dictionary<int, string>();
                status.Add(-2, "未分配至评审");
                status.Add(-1, "未评判结果");
                status.Add(1, "已通过当前阶段");
                status.Add(0, "未通过");
                using (var db = new TeachingCenterEntities())
                {
                    var project = db.ProjectInfo.SingleOrDefault(a => a.project_id == id);
                    lbName.Text = project.name;
                    lbCategory.Text = project.category_name;
                    lbTeacher.Text = project.teacher_name;
                    content_id.Value = id.ToString();
                    var project_stage = (from it in db.ProjectStage where it.project_id == id orderby it.stage descending select it).FirstOrDefault();
                    int now_stage = project_stage.stage;
                    int now_status = project_stage.is_pass;
                    lbStage.Text = stage[now_stage];
                    lbStatus.Text = status[now_status];
                    lbContent.Text = Server.HtmlDecode(project_stage.project_content);
                    if (now_status == -2)
                        btnDeliver.Visible = true;
                    if (now_status == -1)
                        btnJudge.Visible = true;

                    // 绑定评审列表
                    var judge = from it in db.Teacher where it.is_judge == 1 select it;
                    rptJudge.DataSource = judge.ToList();
                    rptJudge.DataBind();
                }
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
        }        
    }

    protected void btnDeliver_Click(object sender, EventArgs e)
    {
        Judge.Visible = true;
    }

    protected void btnCheck_Click(object sender, EventArgs e)
    {
        int project_id = 0;
        if (Request.QueryString["id"] != null)
            project_id = Convert.ToInt32(Request.QueryString["id"]);
        Dictionary<string, int> stage = new Dictionary<string, int>();
        stage.Add("初审",0);
        stage.Add("中期",1);
        stage.Add( "结题",2);
        int stage_number = Convert.ToInt32(stage[lbStage.Text]);
        using (var db = new TeachingCenterEntities())
        {
            foreach (RepeaterItem item in rptJudge.Items)
            {
                HtmlInputCheckBox isDelete = item.FindControl("isDelete") as HtmlInputCheckBox;
                HtmlInputHidden judge_id = item.FindControl("id") as HtmlInputHidden;
                int id = Convert.ToInt32(judge_id.Value);
                if (isDelete.Checked == true)
                {
                    ProjectJudge data = new ProjectJudge();
                    var project = db.Project.SingleOrDefault(a => a.project_id == project_id);
                    data.project_id = project_id;
                    data.category = project.category;
                    data.teacher_id = project.teacher_id;
                    data.judge_id = id;
                    var judge = db.Teacher.SingleOrDefault(a => a.id == id);
                    data.judge_name = judge.name;
                    var project_stage = (from it in db.ProjectStage where it.project_id == project_id orderby it.stage descending select it).FirstOrDefault();
                    data.stage = project_stage.stage;
                    data.comment = "";
                    data.is_pass = -1;
                    db.ProjectJudge.Add(data);
                    db.SaveChanges();
                    var update = db.ProjectStage.SingleOrDefault(a => a.project_id == project_id && a.stage == data.stage);
                    update.is_pass = -1;
                    db.SaveChanges();
                    Response.Write("<script>alert('已成功分配给评审！');location.href='ProjectList.aspx';</script>");
                }
            }
        }
    }

    protected void btnJudge_Click(object sender, EventArgs e)
    {
        int id = 0;
        if (Request.QueryString["id"] != null)
        {
            id = Convert.ToInt32(Request.QueryString["id"]);
            Response.Redirect("ProjectJudge.aspx?id="+id);
        }           
        else
            Response.Redirect("ProjectList.aspx");
        
    }
}