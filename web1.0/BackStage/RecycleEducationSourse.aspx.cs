using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class BackStage_RecycleEducationSourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var db = new TeachingCenterEntities())
            {
                // 绑定教学资源列表
                var src = from it in db.EducateSource where it.is_deleted == 1 orderby it.publish_time descending select it;
                ltSum.Text = src.Count().ToString();
                TotalPage.Text = Math.Ceiling(src.Count() / 10.0).ToString();
                currentPage.Text = "1";
                rptSource.DataSource = src.ToList().Take(10);
                rptSource.DataBind();
                Session["ds"] = src.ToList();
            }
        }
    }

    // 列表中删除一行
    protected void rptSource_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new TeachingCenterEntities())
            {
                var src = db.EducateSource.SingleOrDefault(a => a.id == id);
                db.EducateSource.Remove(src);
                db.SaveChanges();
                Response.Write("<script>alert('删除成功！');location.href='RecycleEducationSourse.aspx';</script>");
            }
        }
        if (e.CommandName == "Recycle")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new TeachingCenterEntities())
            {
                var src = db.EducateSource.SingleOrDefault(a => a.id == id);
                src.is_deleted = 0;
                db.SaveChanges();
                Response.Write("<script>alert('删除成功！');location.href='RecycleEducationSourse.aspx';</script>");
            }
        }
    }

    // 批量删除
    protected void lbtDeleteMore_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in rptSource.Items)
        {
            HtmlInputCheckBox isDelete = item.FindControl("isDelete") as HtmlInputCheckBox;
            HtmlInputHidden id = item.FindControl("id") as HtmlInputHidden;
            int src_id = Convert.ToInt32(id.Value);
            if (isDelete.Checked)
            {
                using (var db = new TeachingCenterEntities())
                {
                    var src = db.EducateSource.SingleOrDefault(a => a.id == src_id);
                    db.EducateSource.Remove(src);
                    db.SaveChanges();
                }
            }
        }
        Response.Write("<script>alert('删除成功！');location.href='RecycleEducationSourse.aspx';</script>");
    }

    protected void lbtSearch_Click(object sender, EventArgs e)
    {
        if ((logmin.Text == "" && logmax.Text != "") || (logmin.Text != "" && logmax.Text == ""))
        {
            Response.Write("<script>alert('请选择完整的日期范围！');</script>");
        }
        else
        {
            string title = "";
            if (txtTitle.Text.Length != 0)
                title = txtTitle.Text;
            List<EducateSource> result = new List<EducateSource>();
            using (var db = new TeachingCenterEntities())
            {
                var src = from it in db.EducateSource where it.is_deleted == 1 orderby it.publish_time descending select it;
                if (title != "")
                {
                    src = from it in db.EducateSource where it.title.IndexOf(title) >= 0 && it.is_deleted == 1 orderby it.publish_time descending select it;
                }
                if (logmin.Text != "" && logmax.Text != "")
                {
                    DateTime min = Convert.ToDateTime(logmax.Text);
                    DateTime max = Convert.ToDateTime(logmin.Text);
                    foreach (EducateSource item in src)
                    {
                        DateTime time = Convert.ToDateTime(item.publish_time);
                        if (DateTime.Compare(time, min) < 0 && DateTime.Compare(time, max) > 0)
                            result.Add(item);
                    }
                }
                else if (logmin.Text == "" && logmax.Text == "")
                {
                    result = src.ToList();
                }
                if (result.Count != 0)
                {
                    currentPage.Text = "1";
                    TotalPage.Text = Math.Ceiling(result.Count() / 10.0).ToString();
                    rptSource.DataSource = result.ToList().Take(10);
                    rptSource.DataBind();
                    ltSum.Text = result.Count().ToString();
                    Session["ds"] = result.ToList();
                }
                else
                {
                    Response.Write("<script>alert('搜索无结果！');location.href='RecycleEducationSourse.aspx';</script>");
                }
            }
        }
    }

    protected void Prev_Click(object sender, EventArgs e)
    {
        List<EducateSource> ls = new List<EducateSource>();
        if (Session["ds"] != null)
            ls = (List<EducateSource>)Session["ds"];
        int page = Convert.ToInt32(currentPage.Text) - 1;
        if (page < 1)
        {
            page = 1;
        }
        currentPage.Text = page.ToString();
        rptSource.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptSource.DataBind();
    }

    protected void First_Click(object sender, EventArgs e)
    {
        List<EducateSource> ls = new List<EducateSource>();
        if (Session["ds"] != null)
            ls = (List<EducateSource>)Session["ds"];
        currentPage.Text = "1";
        rptSource.DataSource = ls.Skip(0).Take(10);
        rptSource.DataBind();
    }

    protected void Last_Click(object sender, EventArgs e)
    {
        List<EducateSource> ls = new List<EducateSource>();
        if (Session["ds"] != null)
            ls = (List<EducateSource>)Session["ds"];
        int page = Convert.ToInt32(TotalPage.Text);
        currentPage.Text = page.ToString();
        rptSource.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptSource.DataBind();
    }

    protected void Next_Click(object sender, EventArgs e)
    {
        List<EducateSource> ls = new List<EducateSource>();
        if (Session["ds"] != null)
            ls = (List<EducateSource>)Session["ds"];
        int page = Convert.ToInt32(currentPage.Text) + 1;
        if (page > Convert.ToInt32(TotalPage.Text))
        {
            page = 1;
        }
        currentPage.Text = page.ToString();
        rptSource.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptSource.DataBind();
    }

    protected void Jump_Click(object sender, EventArgs e)
    {
        List<EducateSource> ls = new List<EducateSource>();
        if (Session["ds"] != null)
            ls = (List<EducateSource>)Session["ds"];
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
        rptSource.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptSource.DataBind();
    }

    protected void lbtRecycle_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in rptSource.Items)
        {
            HtmlInputCheckBox isDelete = item.FindControl("isDelete") as HtmlInputCheckBox;
            HtmlInputHidden id = item.FindControl("id") as HtmlInputHidden;
            int src_id = Convert.ToInt32(id.Value);
            if (isDelete.Checked)
            {
                using (var db = new TeachingCenterEntities())
                {
                    var src = db.EducateSource.SingleOrDefault(a => a.id == src_id);
                    src.is_deleted = 0;
                    db.SaveChanges();
                }
            }
        }
        Response.Write("<script>alert('恢复成功！');location.href='RecycleEducationSourse.aspx';</script>");

    }
}