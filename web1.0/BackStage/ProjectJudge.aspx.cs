using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_ProjectJudge : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string teacher = Session["AdminID"].ToString();
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
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
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

    protected void btnExport_Click(object sender, EventArgs e)
    {
        List<ProjectJudge> ls = new List<ProjectJudge>();
        if (Session["ds"] != null)
            ls = (List<ProjectJudge>)Session["ds"];
        DataTable dt = new DataTable();
        DataColumn dc1 = new DataColumn("评审姓名", System.Type.GetType("System.String"));
        DataColumn dc2 = new DataColumn("备注", System.Type.GetType("System.String"));
        DataColumn dc3 = new DataColumn("是否通过", System.Type.GetType("System.String"));
        dt.Columns.Add(dc1);
        dt.Columns.Add(dc2);
        dt.Columns.Add(dc3);
        foreach (ProjectJudge item in ls)
        {
            DataRow row = dt.NewRow();
            row["评审姓名"] = item.judge_name;
            row["备注"] = item.comment.Length == 0?"无":item.comment;
            row["是否通过"] = item.is_pass == 1?"是":"否";
            dt.Rows.Add(row);
        }
        ExcleHelper.ExportDataGrid(dt, "application/ms-excel", "评审意见列表.xlsx");
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