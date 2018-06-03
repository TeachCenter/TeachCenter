using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_RecycleDevelop : System.Web.UI.Page
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

                    //绑定下拉框
                    var category = from it in db.DevelopCategory select it;

                    List<DevelopCategory> cate = category.ToList();

                    DevelopCategory all = new DevelopCategory();

                    cate.Insert(0, all);

                    all.DevelopCategory_id = 0;

                    all.DevelopCategory_name = "全部分类";

                    dropCategory.DataSource = cate;

                    dropCategory.DataTextField = "DevelopCategory_name";

                    dropCategory.DataBind();

                    //绑定列表信息
                    DataBindToRepeater(1);
                }
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登录！", "Login.aspx");
        }

    }

    protected void dropCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataBindToRepeater(1);
    }
    protected void rptService_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //绑定序号
            Literal literal = (Literal)e.Item.FindControl("ltNumber");
            literal.Text = (e.Item.ItemIndex + 1).ToString();
            //绑定分类
            try
            {
                literal = (Literal)e.Item.FindControl("ltCategory");
                literal.Text = DevelopHelper.getCategoryName(Convert.ToInt32(literal.Text));
            }
            catch
            {
                literal.Text = "";
            }
            //绑定内容
            literal = (Literal)e.Item.FindControl("ltContent");
            string content = MyHtmlHelper.RemoveTags(Server.HtmlDecode(literal.Text));
            literal.Text = content.Length > 40 ? content.Substring(0, 40) + "..." : content;
        }
    }

    protected void rptService_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //删除专题分类
        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new TeachingCenterEntities())
            {
                Develop service = db.Develop.Single(a => a.Develop_id == id);
                db.Develop.Remove(service);
                db.SaveChanges();
                //JSHelper.AlertThenRedirect("删除成功！", "RecycleDevelop.aspx");
                Server.Transfer("RecycleDevelop.aspx");
            }
        }
        if (e.CommandName == "Recycle")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new TeachingCenterEntities())
            {
                Develop service = db.Develop.Single(a => a.Develop_id == id);
                service.Develop_deleted = 0;
                db.SaveChanges();
                //JSHelper.AlertThenRedirect("恢复成功！", "RecycleDevelop.aspx");
                Server.Transfer("RecycleDevelop.aspx");
            }
        }
    }

    //分页
    void DataBindToRepeater(int currentPage)
    {

        using (var db = new TeachingCenterEntities())
        {
            List<Develop> service;
            DateTime min = new DateTime(1900, 1, 1);
            DateTime max = new DateTime(2300, 12, 31);
            if (logmin.Value != "")
                min = Convert.ToDateTime(logmin.Value);
            if (logmax.Value != "")
                max = Convert.ToDateTime(logmax.Value).AddDays(1);

            if (txtSearch.Text == "")
            {
                if (dropCategory.SelectedValue != "全部分类")
                {
                    int category = DevelopHelper.getCategoryId(dropCategory.SelectedValue);
                    service = db.Develop.Where(a => a.Develop_deleted == 1 && a.Develop_category == category && a.Develop_time >= min && a.Develop_time < max).OrderByDescending(a => a.Develop_time).ToList();
                }
                else
                    service = db.Develop.Where(a => a.Develop_deleted == 1 && a.Develop_time >= min && a.Develop_time < max).OrderByDescending(a => a.Develop_time).ToList();
            }
            else
            {
                if (dropCategory.SelectedValue != "全部分类")
                {
                    int category = DevelopHelper.getCategoryId(dropCategory.SelectedValue);
                    service = db.Develop.Where(a => a.Develop_deleted == 1 && a.Develop_category == category && a.Develop_time >= min && a.Develop_time < max && a.Develop_title.Contains(txtSearch.Text)).OrderByDescending(a => a.Develop_time).ToList();
                }
                else
                    service = db.Develop.Where(a => a.Develop_deleted == 1 && a.Develop_time >= min && a.Develop_time < max && a.Develop_title.Contains(txtSearch.Text)).OrderByDescending(a => a.Develop_time).ToList();


            }

            ltCount.Text = service.Count().ToString();

            PagedDataSource pds = new PagedDataSource();

            pds.AllowPaging = true;

            pds.PageSize = 10;

            pds.DataSource = service.ToList();

            pds.CurrentPageIndex = currentPage - 1;

            rptService.DataSource = pds;

            rptService.DataBind();

            ltTotal.Text = pds.PageCount.ToString();

            if (Convert.ToInt32(ltNow.Text) == 1)
                btnLast.Enabled = false;
            else
                btnLast.Enabled = true;

            if (Convert.ToInt32(ltNow.Text) == pds.PageCount)
                btnNext.Enabled = false;
            else
                btnNext.Enabled = true;
        }

    }

    //跳页--上一页
    protected void btnLast_Click(object sender, EventArgs e)
    {
        ltNow.Text = Convert.ToString(Convert.ToInt32(ltNow.Text) - 1);
        DataBindToRepeater(Convert.ToInt32(ltNow.Text));
    }

    //跳页--下一页
    protected void btnNext_Click(object sender, EventArgs e)
    {
        ltNow.Text = Convert.ToString(Convert.ToInt32(ltNow.Text) + 1);
        DataBindToRepeater(Convert.ToInt32(ltNow.Text));
    }

    //批量删除
    protected void ltnDelete_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < this.rptService.Items.Count; i++)
        {
            CheckBox cbx = (CheckBox)rptService.Items[i].FindControl("checkbox");
            int id = Convert.ToInt32(((Label)rptService.Items[i].FindControl("lbID")).Text);
            if (cbx != null)
                if (cbx.Checked == true)
                {
                    using (var db = new TeachingCenterEntities())
                    {
                        Develop sc = db.Develop.Single(a => a.Develop_id == id);
                        db.Develop.Remove(sc);
                        db.SaveChanges();
                    }
                }
        }
        Server.Transfer("RecycleDevelop.aspx");
        //JSHelper.AlertThenRedirect("删除成功！", "RecycleDevelop.aspx");
    }

    protected void ltbSearch_Click(object sender, EventArgs e)
    {
        DataBindToRepeater(1);
    }

    protected void ltbRecycle_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < this.rptService.Items.Count; i++)
        {
            CheckBox cbx = (CheckBox)rptService.Items[i].FindControl("checkbox");
            int id = Convert.ToInt32(((Label)rptService.Items[i].FindControl("lbID")).Text);
            if (cbx != null)
                if (cbx.Checked == true)
                {
                    using (var db = new TeachingCenterEntities())
                    {
                        Develop sc = db.Develop.Single(a => a.Develop_id == id);
                        sc.Develop_deleted = 0;
                        db.SaveChanges();
                    }
                }
        }
        Server.Transfer("RecycleDevelop.aspx");
        //JSHelper.AlertThenRedirect("恢复成功！", "RecycleDevelop.aspx");
    }
}