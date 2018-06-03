using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class BackStage_BannerList : System.Web.UI.Page
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
                    // 绑定轮播图列表
                    var banner = from it in db.Picture orderby it.is_top descending select it;
                    ltSum.Text = banner.Count().ToString();
                    TotalPage.Text = Math.Ceiling(banner.Count() / 10.0).ToString();
                    currentPage.Text = "1";
                    rptBanner.DataSource = banner.ToList().Take(10);
                    rptBanner.DataBind();
                    Session["ds"] = banner.ToList();
                }
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登录！", "Login.aspx");
        }
    }

    protected void rptBanner_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        // 列表中删除一行
        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new TeachingCenterEntities())
            {
                var banner = db.Picture.SingleOrDefault(a => a.Picture_id == id);
                db.Picture.Remove(banner);
                db.SaveChanges();
                Server.Transfer("BannerList.aspx");
                //Response.Write("<script>alert('删除成功！');location.href='BannerList.aspx';</script>");
            }
        }

        // 将图片置顶
        if (e.CommandName == "OnTop")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new TeachingCenterEntities())
            {
                var banner = db.Picture.SingleOrDefault(a => a.Picture_id == id);
                int max = Convert.ToInt32((from it in db.Picture orderby it.is_top descending select it.is_top).FirstOrDefault());
                banner.is_top = max + 1;
                db.SaveChanges();
                Server.Transfer("BannerList.aspx");
                //Response.Write("<script>alert('置顶成功！');location.href='BannerList.aspx';</script>");
            }
        }
    }

    // 批量删除
    protected void lbtDeleteMore_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in rptBanner.Items)
        {
            HtmlInputCheckBox isDelete = item.FindControl("isDelete") as HtmlInputCheckBox;
            HtmlInputHidden id = item.FindControl("id") as HtmlInputHidden;
            int picture_id = Convert.ToInt32(id.Value);
            if (isDelete.Checked)
            {
                using (var db = new TeachingCenterEntities())
                {
                    var banner = db.Picture.SingleOrDefault(a => a.Picture_id == picture_id);
                    db.Picture.Remove(banner);
                    db.SaveChanges();
                }
            }
        }
        Server.Transfer("BannerList.aspx");
//        Response.Write("<script>alert('删除成功！');location.href='BannerList.aspx';</script>");
    }

    

    protected void Prev_Click(object sender, EventArgs e)
    {
        List<Picture> ls = new List<Picture>();
        if (Session["ds"] != null)
            ls = (List<Picture>)Session["ds"];
        int page = Convert.ToInt32(currentPage.Text) - 1;
        if (page < 1)
        {
            page = 1;
        }
        currentPage.Text = page.ToString();
        rptBanner.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptBanner.DataBind();
    }

    protected void First_Click(object sender, EventArgs e)
    {
        List<Picture> ls = new List<Picture>();
        if (Session["ds"] != null)
            ls = (List<Picture>)Session["ds"];
        currentPage.Text = "1";
        rptBanner.DataSource = ls.Skip(0).Take(10);
        rptBanner.DataBind();
    }

    protected void Last_Click(object sender, EventArgs e)
    {
        List<Picture> ls = new List<Picture>();
        if (Session["ds"] != null)
            ls = (List<Picture>)Session["ds"];
        int page = Convert.ToInt32(TotalPage.Text);
        currentPage.Text = page.ToString();
        rptBanner.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptBanner.DataBind();
    }

    protected void Next_Click(object sender, EventArgs e)
    {
        List<Picture> ls = new List<Picture>();
        if (Session["ds"] != null)
            ls = (List<Picture>)Session["ds"];
        int page = Convert.ToInt32(currentPage.Text) + 1;
        if (page > Convert.ToInt32(TotalPage.Text))
        {
            page = 1;
        }
        currentPage.Text = page.ToString();
        rptBanner.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptBanner.DataBind();
    }

    protected void Jump_Click(object sender, EventArgs e)
    {
        List<Picture> ls = new List<Picture>();
        if (Session["ds"] != null)
            ls = (List<Picture>)Session["ds"];
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
        rptBanner.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptBanner.DataBind();
    }

    public bool judgeDisplay(int id)
    {
        using (var db = new TeachingCenterEntities())
        {
            var banners = (from it in db.Picture orderby it.is_top descending select it).Take(4);
            for(int i = 0; i < banners.Count(); i++)
            {
                if (banners.ToList()[i].Picture_id == id)
                    return true;
            }
            return false;
        }
    }
}