using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_ActivityManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var db = new TeachingCenterEntities())
            {

                //绑定下拉框
                var category = from it in db.ActivityCategory select it;

                List<ActivityCategory> cate = category.ToList();

                ActivityCategory all = new ActivityCategory();

                cate.Insert(0, all);

                all.ActivityCategory_id = 0;

                all.ActivityCategory_name = "全部分类";

                dropCategory.DataSource = cate;

                dropCategory.DataTextField = "ActivityCategory_name";

                dropCategory.DataBind();

                //绑定列表信息
                DataBindToRepeater(1);
            }
        }
    }

    protected void dropCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataBindToRepeater(1);
    }

    protected void rptActivity_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //删除专题分类
        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new TeachingCenterEntities())
            {
                Activity service = db.Activity.Single(a => a.Activity_id == id);
                service.Activity_isdeleted = 1;
                db.SaveChanges();
                JSHelper.AlertThenRedirect("删除成功！", "ServiceManage.aspx");
            }
        }
    }

    protected void rptActivity_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //绑定序号
            Literal literal = (Literal)e.Item.FindControl("ltNumber");
            literal.Text = (e.Item.ItemIndex + 1).ToString();

        }
    }

    //分页
    void DataBindToRepeater(int currentPage)
    {

        using (var db = new TeachingCenterEntities())
        {

            List<Activity> acsu;
            if (dropCategory.SelectedValue != "全部分类")
            {
                int category = ActivityHelper.getCategoryId(dropCategory.SelectedValue);
                acsu = db.Activity.Where(a => a.Activity_isdeleted == 0 && a.Activity_categoryid== category).OrderByDescending(a => a.Activity_time).ToList();
            }
            else
                acsu = db.Activity.Where(a => a.Activity_isdeleted == 0).OrderByDescending(a => a.Activity_time).ToList();

            ltCount.Text = acsu.Count().ToString();

            PagedDataSource pds = new PagedDataSource();

            pds.AllowPaging = true;

            pds.PageSize = 10;

            pds.DataSource = acsu.ToList();

            pds.CurrentPageIndex = currentPage - 1;

            rptActivity.DataSource = pds;

            rptActivity.DataBind();

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
        for (int i = 0; i < this.rptActivity.Items.Count; i++)
        {
            CheckBox cbx = (CheckBox)rptActivity.Items[i].FindControl("checkbox");
            int id = Convert.ToInt32(((Label)rptActivity.Items[i].FindControl("lbID")).Text);
            if (cbx != null)
                if (cbx.Checked == true)
                {
                    using (var db = new TeachingCenterEntities())
                    {
                        Activity sc = db.Activity.Single(a => a.Activity_id == id);
                        sc.Activity_isdeleted = 1;
                        db.SaveChanges();
                    }
                }
        }
        JSHelper.AlertThenRedirect("删除成功！", "ActivityManage.aspx");
    }
}