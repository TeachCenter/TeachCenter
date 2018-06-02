using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_ServiceManage : System.Web.UI.Page
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
            Label lb = (Label)e.Item.FindControl("lbCate");
            //绑定申请人
            try
            {
                literal = (Literal)e.Item.FindControl("ltTeacher");
                literal.Text = TeacherHelper.getTeacherNameByID(Convert.ToInt32(literal.Text));
            }
            catch
            {
                literal.Text = "";
            }
            try
            {
                lb.Text =ServiceHelper.getCategoryName(Convert.ToInt32(lb.Text));
            }
            catch
            {
                lb.Text = "";
            }
            LinkButton lbt = (LinkButton)e.Item.FindControl("lbtSet");
            if (lbt.Text.ToString() == "0")
                lbt.Enabled = true;
            else
                lbt.Enabled = false;
            lbt.Text = "处理";
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
                service.Service_deletedtime = DateTime.Now;
                db.SaveChanges();
                //JSHelper.AlertThenRedirect("删除成功！", "ServiceManage.aspx");
                Server.Transfer("ServiceManage.aspx");
            }
        }
        //修改分类
        if (e.CommandName == "Set")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            lbReplyID.Text = id.ToString();
            divReply.Visible = true;
            //using (var db = new TeachingCenterEntities())
            //{
            //    Service sc = db.Service.Single(a => a.Service_id == id);
            //    //sc.Service_isdeal = 1;
            //    db.SaveChanges();
            //    JSHelper.AlertThenRedirect("处理成功！", "ServiceManage.aspx");
            //    //.Text = sc.ServiceCategory_name;
            //}
        }
    }

    //列表绑定与分页
    void DataBindToRepeater(int currentPage)
    {

        using (var db = new TeachingCenterEntities())
        {
            List<Service> service;
            DateTime min = new DateTime(1900,1,1);
            DateTime max = new DateTime(2300, 12, 31);
            if (logmin.Value != "")
                min = Convert.ToDateTime(logmin.Value);
            if (logmax.Value != "")
                max = Convert.ToDateTime(logmax.Value).AddDays(1);
            if (dropCategory.SelectedValue != "全部分类")
            {
                 int category = ServiceHelper.getCategoryID(dropCategory.SelectedValue);
                service = db.Service.Where(a => a.Service_isdeleted == 0 && a.Service_category == category && a.Service_time >= min && a.Service_time < max).OrderBy(a => a.Service_isdeal).ThenByDescending(a => a.Service_time).ToList();
            }
            else
                 service = db.Service.Where(a => a.Service_isdeleted == 0 && a.Service_time >= min && a.Service_time < max).OrderBy(a => a.Service_isdeal).ThenByDescending(a => a.Service_time).ToList();

            //Session["service"] = service;


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
                        sc.Service_deletedtime = DateTime.Now;
                        db.SaveChanges();
                    }
                }
        }
        Server.Transfer("ServiceManage.aspx");
        //JSHelper.AlertThenRedirect("删除成功！", "ServiceManage.aspx");
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
        Server.Transfer("ServiceManage.aspx");
        //JSHelper.AlertThenRedirect("处理成功！", "ServiceManage.aspx");
    }

    protected void ltbSearch_Click(object sender, EventArgs e)
    {
        DataBindToRepeater(1);
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();

        using (var db = new TeachingCenterEntities())
        {
            List<Service> service;
            DateTime min = new DateTime(1900, 1, 1);
            DateTime max = new DateTime(2300, 12, 31);
            if (logmin.Value != "")
                min = Convert.ToDateTime(logmin.Value);
            if (logmax.Value != "")
                max = Convert.ToDateTime(logmax.Value).AddDays(1);
            if (dropCategory.SelectedValue != "全部分类")
            {
                int category = ServiceHelper.getCategoryID(dropCategory.SelectedValue);
                service = db.Service.Where(a => a.Service_isdeleted == 0 && a.Service_category == category && a.Service_time >= min && a.Service_time < max).OrderBy(a => a.Service_isdeal).ThenByDescending(a => a.Service_time).ToList();
            }
            else
                service = db.Service.Where(a => a.Service_isdeleted == 0 && a.Service_time >= min && a.Service_time < max).OrderBy(a => a.Service_isdeal).ThenByDescending(a => a.Service_time).ToList();

            DataColumn dc1 = new DataColumn("序号", System.Type.GetType("System.String"));
            DataColumn dc2 = new DataColumn("申请人", System.Type.GetType("System.String"));
            DataColumn dc3 = new DataColumn("申请时间", System.Type.GetType("System.DateTime"));
            DataColumn dc4 = new DataColumn("联系方式", System.Type.GetType("System.String"));
            DataColumn dc5 = new DataColumn("备注", System.Type.GetType("System.String"));
            DataColumn dc6 = new DataColumn("审核状态", System.Type.GetType("System.String"));

            dt.Columns.Add(dc1);
            dt.Columns.Add(dc2);
            dt.Columns.Add(dc3);
            dt.Columns.Add(dc4);
            dt.Columns.Add(dc5);
            dt.Columns.Add(dc6);
            int count = 1;
            foreach (var i in service)
            {
                DataRow row = dt.NewRow();

                row["序号"] = count.ToString();
                row["申请人"] = TeacherHelper.getTeacherNameByID( i.Service_teacher);
                row["申请时间"] = i.Service_time.ToString();
                row["联系方式"] = i.Service_phone.ToString();
                row["备注"] = i.Service_remarks.ToString();
                row["审核状态"] = i.Service_isdeal == 0 ? "未处理" : "已处理";
                dt.Rows.Add(row);
            }
        }

        ExcleHelper.ExportDataGrid(dt, "application/ms-excel", "教师服务申请.xls");



    }

    protected void btnChange_Click(object sender, EventArgs e)
    {

        int id = Convert.ToInt16(lbReplyID.Text);
        using(var db = new TeachingCenterEntities())
        {
            Service sc = db.Service.Single(a => a.Service_id == id);
            sc.Service_isdeal = 1;
            sc.Service_reply = txtReply.Text;
            db.SaveChanges();
            Server.Transfer("ServiceManage.aspx");
//            JSHelper.AlertThenRedirect("处理成功！", "ServiceManage.aspx");
        }
    }
}