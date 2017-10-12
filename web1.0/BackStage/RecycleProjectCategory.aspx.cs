using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class BackStage_RecycleProjectCategory : System.Web.UI.Page
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
                    // 绑定项目列表
                    var pro_category = from it in db.ProjectCategory where it.is_deleted == 1 orderby it.end_time select it;
                    ltSum.Text = pro_category.Count().ToString();
                    TotalPage.Text = Math.Ceiling(pro_category.Count() / 10.0).ToString();
                    currentPage.Text = "1";
                    rptCategory.DataSource = pro_category.ToList().Take(10);
                    rptCategory.DataBind();
                    Session["ds"] = pro_category.ToList();
                }
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
        }
    }

    protected void rptCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Recycle")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new TeachingCenterEntities())
            {
                var pro_category = db.ProjectCategory.SingleOrDefault(a => a.id == id);
                pro_category.is_deleted = 0;
                db.SaveChanges();
                Response.Write("<script>alert('恢复成功！');location.href='RecycleProjectCategory.aspx';</script>");
            }
        }
        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new TeachingCenterEntities())
            {
                var pro_category = db.ProjectCategory.SingleOrDefault(a => a.id == id);
                db.ProjectCategory.Remove(pro_category);
                db.SaveChanges();
                Response.Write("<script>alert('删除成功！');location.href='RecycleProjectCategory.aspx';</script>");
            }
        }
    }

    protected void lbtDeleteMore_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in rptCategory.Items)
        {
            HtmlInputCheckBox isDelete = item.FindControl("isDelete") as HtmlInputCheckBox;
            HtmlInputHidden id = item.FindControl("id") as HtmlInputHidden;
            int project_id = Convert.ToInt32(id.Value);
            if (isDelete.Checked)
            {
                using (var db = new TeachingCenterEntities())
                {
                    var pro_category = db.ProjectCategory.SingleOrDefault(a => a.id == project_id);
                    db.ProjectCategory.Remove(pro_category);
                    db.SaveChanges();
                }
            }
        }
        Response.Write("<script>alert('删除成功！');location.href='RecycleProjectCategory.aspx';</script>");
    }

    protected void lbtSearch_Click(object sender, EventArgs e)
    {
        if ((logmin.Text == "" && logmax.Text != "") || (logmin.Text != "" && logmax.Text == ""))
        {
            Response.Write("<script>alert('请选择完整的日期范围！');</script>");
        }
        else
        {
            string project_name = "";
            if (txtName.Text.Length != 0)
                project_name = txtName.Text;
            List<ProjectCategory> result = new List<ProjectCategory>();
            using (var db = new TeachingCenterEntities())
            {
                var pro_category = from it in db.ProjectCategory where it.is_deleted == 1 orderby it.end_time select it;
                if (project_name != "")
                    pro_category = from it in db.ProjectCategory where it.name.IndexOf(project_name) >= 0 && it.is_deleted == 1 orderby it.end_time select it;
                if (logmin.Text != "" && logmax.Text != "")
                {
                    DateTime min = Convert.ToDateTime(logmax.Text);
                    DateTime max = Convert.ToDateTime(logmin.Text);
                    foreach (ProjectCategory item in pro_category)
                    {
                        DateTime time = Convert.ToDateTime(item.end_time);
                        if (DateTime.Compare(time, min) < 0 && DateTime.Compare(time, max) > 0)
                            result.Add(item);
                    }
                }
                else if (logmin.Text == "" && logmax.Text == "")
                    result = pro_category.ToList();
                if (result.Count != 0)
                {
                    currentPage.Text = "1";
                    TotalPage.Text = Math.Ceiling(result.Count() / 10.0).ToString();
                    rptCategory.DataSource = result.ToList().Take(10);
                    rptCategory.DataBind();
                    ltSum.Text = result.Count().ToString();
                    Session["ds"] = result.ToList();
                }
                else
                {
                    Response.Write("<script>alert('搜索无结果！');location.href='RecycleProjectCategory.aspx';</script>");
                }
            }
        }
    }

    protected void Prev_Click(object sender, EventArgs e)
    {
        List<ProjectCategory> ls = new List<ProjectCategory>();
        if (Session["ds"] != null)
            ls = (List<ProjectCategory>)Session["ds"];
        int page = Convert.ToInt32(currentPage.Text) - 1;
        if (page < 1)
        {
            page = 1;
        }
        currentPage.Text = page.ToString();
        rptCategory.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptCategory.DataBind();
    }

    protected void First_Click(object sender, EventArgs e)
    {
        List<ProjectCategory> ls = new List<ProjectCategory>();
        if (Session["ds"] != null)
            ls = (List<ProjectCategory>)Session["ds"];
        currentPage.Text = "1";
        rptCategory.DataSource = ls.Skip(0).Take(10);
        rptCategory.DataBind();
    }

    protected void Last_Click(object sender, EventArgs e)
    {
        List<ProjectCategory> ls = new List<ProjectCategory>();
        if (Session["ds"] != null)
            ls = (List<ProjectCategory>)Session["ds"];
        int page = Convert.ToInt32(TotalPage.Text);
        currentPage.Text = page.ToString();
        rptCategory.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptCategory.DataBind();
    }

    protected void Next_Click(object sender, EventArgs e)
    {
        List<ProjectCategory> ls = new List<ProjectCategory>();
        if (Session["ds"] != null)
            ls = (List<ProjectCategory>)Session["ds"];
        int page = Convert.ToInt32(currentPage.Text) + 1;
        if (page > Convert.ToInt32(TotalPage.Text))
        {
            page = 1;
        }
        currentPage.Text = page.ToString();
        rptCategory.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptCategory.DataBind();
    }

    protected void Jump_Click(object sender, EventArgs e)
    {
        List<ProjectCategory> ls = new List<ProjectCategory>();
        if (Session["ds"] != null)
            ls = (List<ProjectCategory>)Session["ds"];
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
        rptCategory.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptCategory.DataBind();
    }

    protected void lbtRecycle_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in rptCategory.Items)
        {
            HtmlInputCheckBox isDelete = item.FindControl("isDelete") as HtmlInputCheckBox;
            HtmlInputHidden id = item.FindControl("id") as HtmlInputHidden;
            int project_id = Convert.ToInt32(id.Value);
            if (isDelete.Checked)
            {
                using (var db = new TeachingCenterEntities())
                {
                    var pro_category = db.ProjectCategory.SingleOrDefault(a => a.id == project_id);
                    pro_category.is_deleted = 0;
                    db.SaveChanges();
                }
            }
        }
        Response.Write("<script>alert('恢复成功！');location.href='RecycleProjectCategory.aspx';</script>");
    }
}