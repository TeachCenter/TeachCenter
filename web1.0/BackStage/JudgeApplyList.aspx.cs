using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class BackStage_JudgeApplyList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var db = new TeachingCenterEntities())
            {
                // 绑定项目列表
                var teacher = from it in db.ApplicationInfo orderby it.submit_time descending select it;
                ltSum.Text = teacher.Count().ToString();
                TotalPage.Text = Math.Ceiling(teacher.Count() / 10.0).ToString();
                currentPage.Text = "1";
                rptApplication.DataSource = teacher.ToList().Take(10);
                rptApplication.DataBind();
                Session["ds"] = teacher.ToList();
            }
        }
    }

    protected void rptApplication_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Pass")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new TeachingCenterEntities())
            {
                var teacher = db.Teacher.SingleOrDefault(a => a.id == id);
                teacher.is_judge = 1;
                var application = db.JudgeApplication.SingleOrDefault(a => a.teacher_id == id);
                db.JudgeApplication.Remove(application);
                db.SaveChanges();
                Response.Write("<script>alert('操作成功！');location.href='JudgeApplyList.aspx';</script>");
            }
        }
    }

    protected void lbtPassMore_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in rptApplication.Items)
        {
            HtmlInputCheckBox isPass = item.FindControl("isPass") as HtmlInputCheckBox;
            HtmlInputHidden id = item.FindControl("id") as HtmlInputHidden;
            int teacher_id = Convert.ToInt32(id.Value);
            if (isPass.Checked)
            {
                using (var db = new TeachingCenterEntities())
                {
                    var teacher = db.Teacher.SingleOrDefault(a => a.id == teacher_id);
                    teacher.is_judge = 1;
                    var application = db.JudgeApplication.SingleOrDefault(a => a.teacher_id == teacher_id);
                    db.JudgeApplication.Remove(application);
                    db.SaveChanges();
                }
            }
        }
        Response.Write("<script>alert('操作成功！');location.href='JudgeApplyList.aspx';</script>");
    }

    protected void Prev_Click(object sender, EventArgs e)
    {
        List<ApplicationInfo> ls = new List<ApplicationInfo>();
        if (Session["ds"] != null)
            ls = (List<ApplicationInfo>)Session["ds"];
        int page = Convert.ToInt32(currentPage.Text) - 1;
        if (page < 1)
        {
            page = 1;
        }
        currentPage.Text = page.ToString();
        rptApplication.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptApplication.DataBind();
    }

    protected void First_Click(object sender, EventArgs e)
    {
        List<ApplicationInfo> ls = new List<ApplicationInfo>();
        if (Session["ds"] != null)
            ls = (List<ApplicationInfo>)Session["ds"];
        currentPage.Text = "1";
        rptApplication.DataSource = ls.Skip(0).Take(10);
        rptApplication.DataBind();
    }

    protected void Last_Click(object sender, EventArgs e)
    {
        List<ApplicationInfo> ls = new List<ApplicationInfo>();
        if (Session["ds"] != null)
            ls = (List<ApplicationInfo>)Session["ds"];
        int page = Convert.ToInt32(TotalPage.Text);
        currentPage.Text = page.ToString();
        rptApplication.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptApplication.DataBind();
    }

    protected void Next_Click(object sender, EventArgs e)
    {
        List<ApplicationInfo> ls = new List<ApplicationInfo>();
        if (Session["ds"] != null)
            ls = (List<ApplicationInfo>)Session["ds"];
        int page = Convert.ToInt32(currentPage.Text) + 1;
        if (page > Convert.ToInt32(TotalPage.Text))
        {
            page = 1;
        }
        currentPage.Text = page.ToString();
        rptApplication.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptApplication.DataBind();
    }

    protected void Jump_Click(object sender, EventArgs e)
    {
        List<ApplicationInfo> ls = new List<ApplicationInfo>();
        if (Session["ds"] != null)
            ls = (List<ApplicationInfo>)Session["ds"];
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
        rptApplication.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptApplication.DataBind();
    }
}