using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_ProjectJudge : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var db = new TeachingCenterEntities())
            {
                int id = 0;
                if (Request.QueryString["id"] != null)
                    id = Convert.ToInt32(Request.QueryString["id"]);
                else
                    Response.Redirect("ProjectList.aspx");

                // 绑定项目列表
                int stage = (from it in db.ProjectStage where it.project_id == id orderby it.stage descending select it).FirstOrDefault().stage;
                var judge = from it in db.ProjectJudge where it.project_id == id && it.stage == stage select it;
                TotalPage.Text = Math.Ceiling(judge.Count() / 10.0).ToString();
                currentPage.Text = "1";
                rptResult.DataSource = judge.ToList().Take(10);
                rptResult.DataBind();
                Session["ds"] = judge.ToList();
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        using (var db = new TeachingCenterEntities())
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            ProjectStage result = (from it in db.ProjectStage where it.project_id == id orderby it.stage descending select it).FirstOrDefault();
            if (ddlResult.SelectedValue == "0")
                result.is_pass = 1;
            else
                result.is_pass = 0;
            db.SaveChanges();
        }
        Response.Write("<script>alert('提交成功！');location.href='ProjectList.aspx';</script>");
    }

    protected void Prev_Click(object sender, EventArgs e)
    {
        List<ProjectJudge> ls = new List<ProjectJudge>();
        if (Session["ds"] != null)
            ls = (List<ProjectJudge>)Session["ds"];
        int page = Convert.ToInt32(currentPage.Text) - 1;
        if (page < 1)
        {
            page = 1;
        }
        currentPage.Text = page.ToString();
        rptResult.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptResult.DataBind();
    }

    protected void First_Click(object sender, EventArgs e)
    {
        List<ProjectJudge> ls = new List<ProjectJudge>();
        if (Session["ds"] != null)
            ls = (List<ProjectJudge>)Session["ds"];
        currentPage.Text = "1";
        rptResult.DataSource = ls.Skip(0).Take(10);
        rptResult.DataBind();
    }

    protected void Last_Click(object sender, EventArgs e)
    {
        List<ProjectJudge> ls = new List<ProjectJudge>();
        if (Session["ds"] != null)
            ls = (List<ProjectJudge>)Session["ds"];
        int page = Convert.ToInt32(TotalPage.Text);
        currentPage.Text = page.ToString();
        rptResult.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptResult.DataBind();
    }

    protected void Next_Click(object sender, EventArgs e)
    {
        List<ProjectJudge> ls = new List<ProjectJudge>();
        if (Session["ds"] != null)
            ls = (List<ProjectJudge>)Session["ds"];
        int page = Convert.ToInt32(currentPage.Text) + 1;
        if (page > Convert.ToInt32(TotalPage.Text))
        {
            page = 1;
        }
        currentPage.Text = page.ToString();
        rptResult.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptResult.DataBind();
    }

    protected void Jump_Click(object sender, EventArgs e)
    {
        List<ProjectJudge> ls = new List<ProjectJudge>();
        if (Session["ds"] != null)
            ls = (List<ProjectJudge>)Session["ds"];
        int page = 1;
        if (turnTopage.Text.Length != 0)
        {
            page = Convert.ToInt32(turnTopage.Text);
        }
        if (page > Convert.ToInt32(TotalPage.Text) || page <= 0)
        {
            page = 1;
        }
        currentPage.Text = page.ToString();
        rptResult.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptResult.DataBind();
    }
}