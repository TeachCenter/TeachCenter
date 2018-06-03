using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_DevelopCategoryManage : System.Web.UI.Page
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
            JSHelper.AlertThenRedirect("请先登录！", "Login.aspx");
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
        divAdd.Visible = true;
    }

    //添加分类
    protected void btnSubAdd_Click(object sender, EventArgs e)
    {
        string category = txtCategory.Text;
        if (category.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (DevelopHelper.checkCategoryNameExit(category))
            JSHelper.ShowAlert("该分类已存在！");
        else
            using (var db = new TeachingCenterEntities())
            {
                var cate = new DevelopCategory();
                cate.DevelopCategory_name = category;
                db.DevelopCategory.Add(cate);
                db.SaveChanges();
                Server.Transfer("DevelopCategoryManage.aspx");
                //                JSHelper.AlertThenRedirect("添加成功！", "DevelopCategoryManage.aspx");
            }
    }


    //修改分类
    protected void btnChange_Click(object sender, EventArgs e)
    {
        if (txtChange.Text.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (DevelopHelper.checkCategoryNameExit(txtChange.Text))
            JSHelper.ShowAlert("该分类已存在！");
        else
            using (var db = new TeachingCenterEntities())
            {
                int id = Convert.ToInt32(lbID.Text);
                DevelopCategory sc = db.DevelopCategory.Single(a => a.DevelopCategory_id == id);
                sc.DevelopCategory_name = txtChange.Text;
                db.SaveChanges();
                //JSHelper.AlertThenRedirect("修改成功！", "DevelopCategoryManage.aspx");
                Server.Transfer("DevelopCategoryManage.aspx");
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
                var list = from it in db.DevelopCategory select it;
                if(list.Count() == 1)
                    JSHelper.ShowAlert("已经是最后一个分类了！");
                else
                {
                    DevelopCategory sc = db.DevelopCategory.Single(a => a.DevelopCategory_id == id);
                    db.DevelopCategory.Remove(sc);
                    db.SaveChanges();
                    Server.Transfer("DevelopCategoryManage.aspx");
//                    JSHelper.AlertThenRedirect("删除成功！", "DevelopCategoryManage.aspx");
                }

            }
        }
        //修改分类
        if (e.CommandName == "Editor")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            lbID.Text = id.ToString();
            using (var db = new TeachingCenterEntities())
            {
                DevelopCategory sc = db.DevelopCategory.Single(a => a.DevelopCategory_id == id);
                txtChange.Text = sc.DevelopCategory_name;

            }
            divEditor.Visible = true;
        }
    }

    //批量删除
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        using (var db = new TeachingCenterEntities())
        {
            int count = 0;
            for (int i = 0; i < this.rptCategory.Items.Count; i++)
            {
                CheckBox cbx = (CheckBox)rptCategory.Items[i].FindControl("chbCheck");
                if (cbx != null)
                    if (cbx.Checked == true)
                        count++;
            }

            var list = from it in db.DevelopCategory select it;
            if (list.Count() == count)
                JSHelper.ShowAlert("请至少留有一个分类！");
            else
            {
                for (int i = 0; i < this.rptCategory.Items.Count; i++)
                {
                    CheckBox cbx = (CheckBox)rptCategory.Items[i].FindControl("chbCheck");
                    string name = ((Literal)rptCategory.Items[i].FindControl("ltName")).Text;
                    if (cbx != null)
                        if (cbx.Checked == true)
                        {

                            DevelopCategory sc = db.DevelopCategory.Single(a => a.DevelopCategory_name == name);
                            db.DevelopCategory.Remove(sc);
                            db.SaveChanges();

                        }
                }
                // JSHelper.AlertThenRedirect("删除成功！", "DevelopCategoryManage.aspx");
                Server.Transfer("DevelopCategoryManage.aspx");
            }

        }
    }

    //分页
    void DataBindToRepeater(int currentPage)
    {

        string teacher = Session["AdminID"].ToString();

        using (var db = new TeachingCenterEntities())
        {
            var catagory = from it in db.DevelopCategory select it;

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