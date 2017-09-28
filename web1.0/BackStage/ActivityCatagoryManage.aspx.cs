using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_ActivityCatagoryManage : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                string teacher = Session["AdminID"].ToString();
                DataBindToRepeater(1);
            }

        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
        }
    }

    protected void rptCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Literal ltCount = (Literal)e.Item.FindControl("ltNumber");
            ltCount.Text = (e.Item.ItemIndex + 1).ToString();
        }
    }
    //添加分类
    protected void ltbAdd_Click(object sender, EventArgs e)
    {

    }

    //添加分类
    protected void btnSubAdd_Click(object sender, EventArgs e)
    {
        string category = txtCategory.Text;
        if (category.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (ActivityHelper.checkCategoryNameExit(category))
            JSHelper.ShowAlert("该分类已存在！");
        else
            using (var db = new TeachingCenterEntities())
            {
                var cate = new ActivityCategory();
                cate.ActivityCategory_name = category;
                db.ActivityCategory.Add(cate);
                db.SaveChanges();
                JSHelper.AlertThenRedirect("添加成功！", "ActivityCategoryManage.aspx");
            }
    }


    //修改分类
    protected void btnChange_Click(object sender, EventArgs e)
    {
        if (txtChange.Text.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (ActivityHelper.checkCategoryNameExit(txtChange.Text))
            JSHelper.ShowAlert("该分类已存在！");
        else
            using (var db = new TeachingCenterEntities())
            {
                int id = Convert.ToInt32(lbID.Text);
                ActivityCategory sc = db.ActivityCategory.Single(a => a.ActivityCategory_id == id);
                sc.ActivityCategory_name = txtChange.Text;
                db.SaveChanges();
                JSHelper.AlertThenRedirect("修改成功！", "ActivityCategoryManage.aspx");
            }
    }

    protected void rptCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //删除专题分类
        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new TeachingCenterEntities())
            {
                ActivityCategory sc = db.ActivityCategory.Single(a => a.ActivityCategory_id == id);
                db.ActivityCategory.Remove(sc);
                db.SaveChanges();
                JSHelper.AlertThenRedirect("删除成功！", "ActivityCategoryManage.aspx");
            }
        }
        //修改分类
        if (e.CommandName == "Editor")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            lbID.Text = id.ToString();
            using (var db = new TeachingCenterEntities())
            {
                ActivityCategory sc = db.ActivityCategory.Single(a => a.ActivityCategory_id == id);
                txtChange.Text = sc.ActivityCategory_name;
                
            }
        }
    }

    //批量删除
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < this.rptCategory.Items.Count; i++)
        {
            CheckBox cbx = (CheckBox)rptCategory.Items[i].FindControl("checkbox");
            string name = ((Literal)rptCategory.Items[i].FindControl("ltName")).Text;
            if (cbx != null)
                if (cbx.Checked == true)
                {
                    using (var db = new TeachingCenterEntities())
                    {

                        ActivityCategory sc = db.ActivityCategory.Single(a => a.ActivityCategory_name == name);
                        db.ActivityCategory.Remove(sc);
                        db.SaveChanges();
                     }
                }
        }
        JSHelper.AlertThenRedirect("删除成功！", "ActivityCategoryManage.aspx");
    }

    //分页
    void DataBindToRepeater(int currentPage)
    {

        string teacher = Session["AdminID"].ToString();

        using (var db = new TeachingCenterEntities())
        {
            var catagory = from it in db.ActivityCategory select it;

            rptCategory.DataSource = catagory.ToList();

            rptCategory.DataBind();

            ltCount.Text = catagory.Count().ToString();

            PagedDataSource pds = new PagedDataSource();

            pds.AllowPaging = true;

            pds.PageSize = 5;

            pds.DataSource = catagory.ToList();

            pds.CurrentPageIndex = currentPage - 1;

            rptCategory.DataSource = pds;

            rptCategory.DataBind();

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
}
