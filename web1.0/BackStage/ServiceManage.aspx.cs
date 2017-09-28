using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_ServiceManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (var db = new TeachingCenterEntities())
            {

                //绑定下拉框
                var category = from it in db.ServiceCategory select it;

                List<ServiceCategory> cate = category.ToList();

                ServiceCategory all = new ServiceCategory();

                cate.Insert(0, all);

                all.ServiceCategory_id = 0;

                all.ServiceCategory_name = "全部分类";

                dropCategory.DataSource = cate;

                dropCategory.DataTextField = "ServiceCategory_name";

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
    protected void rptService_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //绑定序号
            Literal literal = (Literal)e.Item.FindControl("ltNumber");
            literal.Text = (e.Item.ItemIndex + 1).ToString();
            //绑定申请人
            literal = (Literal)e.Item.FindControl("ltTeacher");
            literal.Text =TeacherHelper.getTeacherNameByID(Convert.ToInt32(literal.Text));
            //绑定是否审核
            //if()
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
                Service service = db.Service.Single(a => a.Service_id == id);
                service.Service_isdeleted = 1;
                db.SaveChanges();
                JSHelper.AlertThenRedirect("删除成功！", "ServiceManage.aspx");
            }
        }
        //修改分类
        if (e.CommandName == "Set")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new TeachingCenterEntities())
            {
                Service sc = db.Service.Single(a => a.Service_id == id);
                sc.Service_isdeal = 1;
                db.SaveChanges();
                JSHelper.AlertThenRedirect("处理成功！", "ServiceManage.aspx");
                //.Text = sc.ServiceCategory_name;
            }
        }
    }

    //分页
    void DataBindToRepeater(int currentPage)
    {

        using (var db = new TeachingCenterEntities())
        {
            List<Service> service;
            if (dropCategory.SelectedValue != "全部分类")
            {
                int category = ServiceHelper.getCategoryID(dropCategory.SelectedValue);
                service = db.Service.Where(a => a.Service_isdeleted == 0 && a.Service_category == category).OrderBy(a => a.Service_isdeal).ThenByDescending(a => a.Service_time).ToList(); 
            }
            else
                service = db.Service.Where(a => a.Service_isdeleted == 0).OrderBy(a => a.Service_isdeal).ThenByDescending(a => a.Service_time).ToList();

            

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
                        Service sc = db.Service.Single(a => a.Service_id == id);
                        sc.Service_isdeleted = 1;
                        db.SaveChanges();
                    }
                }
        }
        JSHelper.AlertThenRedirect("删除成功！", "ServiceManage.aspx");
    }
    //批量处理
    protected void lbtSet_Click(object sender, EventArgs e)
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
                        Service sc = db.Service.Single(a => a.Service_id == id);
                        sc.Service_isdeal = 1;
                        db.SaveChanges();
                    }
                }
        }
        JSHelper.AlertThenRedirect("处理成功！", "ServiceManage.aspx");
    }
}