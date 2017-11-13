using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_RecycleActivitySummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string teacher = Session["AdminID"].ToString();
            if (!IsPostBack)
            {
                DataBindToRepeater(1);
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
        }


    }

    protected void rptActivitySummary_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //删除活动总结
        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new TeachingCenterEntities())
            {
                ActivitySummary asu = db.ActivitySummary.Single(a => a.ActivitySummary_id == id);
                
                db.ActivitySummary.Remove(asu);
                db.SaveChanges();
                JSHelper.AlertThenRedirect("删除成功！", "RecycleActivitySummary.aspx");
            }
        }
        if (e.CommandName == "Recycle")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new TeachingCenterEntities())
            {
                ActivitySummary asu = db.ActivitySummary.Single(a => a.ActivitySummary_id == id);
                asu.ActivitySummary_isdeleted = 0;
                db.SaveChanges();
                JSHelper.AlertThenRedirect("恢复成功！", "ActivitySummaryManage.aspx");
            }
        }
    }

    protected void rptActivitySummary_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //绑定序号
            Literal literal = (Literal)e.Item.FindControl("ltNumber");
            literal.Text = (e.Item.ItemIndex + 1).ToString();
            //绑定内容
            literal = (Literal)e.Item.FindControl("ltContent");
            string content = MyHtmlHelper.RemoveTags(Server.HtmlDecode(literal.Text));
            literal.Text = content.Length > 40 ? content.Substring(0, 40) + "..." : content;
        }
    }

    protected void ltnDelete_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < this.rptActivitySummary.Items.Count; i++)
        {
            CheckBox cbx = (CheckBox)rptActivitySummary.Items[i].FindControl("checkbox");
            int id = Convert.ToInt32(((Label)rptActivitySummary.Items[i].FindControl("lbID")).Text);
            if (cbx != null)
                if (cbx.Checked == true)
                {
                    using (var db = new TeachingCenterEntities())
                    {
                        ActivitySummary sc = db.ActivitySummary.Single(a => a.ActivitySummary_id == id);
                        db.ActivitySummary.Remove(sc);
                        db.SaveChanges();
                    }
                }
        }
        JSHelper.AlertThenRedirect("删除成功！", "ActivitySummaryManage.aspx");
    }


    //分页
    void DataBindToRepeater(int currentPage)
    {

        using (var db = new TeachingCenterEntities())
        {

            List<ActivitySummary> acsu;
            DateTime min = new DateTime(1900, 1, 1);
            DateTime max = new DateTime(2300, 12, 31);
            if (logmin.Value != "")
                min = Convert.ToDateTime(logmin.Value);
            if (logmax.Value != "")
                max = Convert.ToDateTime(logmax.Value).AddDays(1);
            if (txtSearch.Text == "")
                acsu = db.ActivitySummary.Where(a => a.ActivitySummary_isdeleted == 1 && a.ActivitySummary_time < max && a.ActivitySummary_time >= min).OrderByDescending(a => a.ActivitySummary_time).ToList();
            else
                acsu = db.ActivitySummary.Where(a => a.ActivitySummary_isdeleted == 1 && a.ActivitySummary_time < max && a.ActivitySummary_time >= min && a.ActivitySummary_title.Contains(txtSearch.Text)).OrderByDescending(a => a.ActivitySummary_time).ToList();
            ltCount.Text = acsu.Count().ToString();

            PagedDataSource pds = new PagedDataSource();

            pds.AllowPaging = true;

            pds.PageSize = 10;

            pds.DataSource = acsu.ToList();

            pds.CurrentPageIndex = currentPage - 1;

            rptActivitySummary.DataSource = pds;

            rptActivitySummary.DataBind();

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

    protected void ltbSearch_Click(object sender, EventArgs e)
    {
        DataBindToRepeater(1);
    }

    protected void ltbRecycle_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < this.rptActivitySummary.Items.Count; i++)
        {
            CheckBox cbx = (CheckBox)rptActivitySummary.Items[i].FindControl("checkbox");
            int id = Convert.ToInt32(((Label)rptActivitySummary.Items[i].FindControl("lbID")).Text);
            if (cbx != null)
                if (cbx.Checked == true)
                {
                    using (var db = new TeachingCenterEntities())
                    {
                        ActivitySummary sc = db.ActivitySummary.Single(a => a.ActivitySummary_id == id);
                        sc.ActivitySummary_isdeleted = 0;
                        db.SaveChanges();
                    }
                }
        }
        JSHelper.AlertThenRedirect("恢复成功！", "RecycleActivitySummary.aspx");
    }
}