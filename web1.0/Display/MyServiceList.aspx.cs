using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Display_MyServiceList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //判断是不是评审
            if (!TeacherHelper.isJudge(Session["TeacherNumber"].ToString()))
                liJudge.Visible = false;
            int page = 1;
            try
            {
                page = Convert.ToInt16(Request.QueryString["page"].ToString());
            }
            catch
            {

            }
            int teacher = TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString());
            //int teacher = 2;
            using (var db = new TeachingCenterEntities())
            {
                var myService = from it in db.Service
                                where it.Service_teacher == teacher && it.Service_isdeleted == 0
                                orderby it.Service_time descending
                                select it;
                HtmlInputHidden count = FindControl("count") as HtmlInputHidden;
                count.Value = myService.Count().ToString();
                rptService.DataSource = myService.ToList().Skip((page-1)*9).Take(9);
                rptService.DataBind();
                
            }
            //判断是不是评审
            if (!TeacherHelper.isJudge(Session["TeacherNumber"].ToString()))
                liJudge.Visible = false;
             
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登录！", "main-index.aspx");
        }
    }

    protected void rptService_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            //绑定序号
            Literal literal = (Literal)e.Item.FindControl("ltCategory");
            literal.Text = ServiceHelper.getCategoryName(Convert.ToInt32(literal.Text));
            literal = (Literal)e.Item.FindControl("ltDeal");
            literal.Text = Convert.ToInt32(literal.Text) != 0 ? "已处理" : "未处理";
            LinkButton lbt = (LinkButton)e.Item.FindControl("ltEditor");
            lbt.Text = ServiceHelper.serviceChecked(Convert.ToInt32(lbt.Text)) ? "" : "编辑";
            Label lb = (Label)e.Item.FindControl("lbReply");
            Panel p = (Panel)e.Item.FindControl("panel");
            if (lb.Text.Length == 0)
                p.Visible = false;
        }
    }
    protected void lbtReturn_Click(object sender, EventArgs e)
    {
        Session.Remove("TeacherNumber");
        JSHelper.AlertThenRedirect("注销成功！", "main-index.aspx");
    }

    protected void lbtExport_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        int teacher = TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString());
        using (var db = new TeachingCenterEntities())
        {
            List<Service> service;
            DateTime now = DateTime.Now;
            DateTime last = now.AddYears(-1);

           service = db.Service.Where(a => a.Service_isdeleted == 0 && a.Service_teacher == teacher && a.Service_time >= last && a.Service_time < now).OrderBy(a => a.Service_isdeal).ThenByDescending(a => a.Service_time).ToList();

            DataColumn dc1 = new DataColumn("序号", System.Type.GetType("System.String"));
            DataColumn dc1_1 = new DataColumn("申请类型", System.Type.GetType("System.String"));
            DataColumn dc2 = new DataColumn("申请人", System.Type.GetType("System.String"));
            DataColumn dc3 = new DataColumn("申请时间", System.Type.GetType("System.DateTime"));
            DataColumn dc4 = new DataColumn("联系方式", System.Type.GetType("System.String"));
            DataColumn dc5 = new DataColumn("备注", System.Type.GetType("System.String"));
            DataColumn dc6 = new DataColumn("审核状态", System.Type.GetType("System.String"));
            DataColumn dc7 = new DataColumn("管理员回复", System.Type.GetType("System.String"));


            dt.Columns.Add(dc1);
            dt.Columns.Add(dc1_1);
            dt.Columns.Add(dc2);
            dt.Columns.Add(dc3);
            dt.Columns.Add(dc4);
            dt.Columns.Add(dc5);
            dt.Columns.Add(dc6);
            dt.Columns.Add(dc7);

            int count = 1;
            foreach (var i in service)
            {
                DataRow row = dt.NewRow();

                row["序号"] = count.ToString();
                row["申请人"] = TeacherHelper.getTeacherNameByID(i.Service_teacher);
                row["申请类型"] = ServiceHelper.getCategoryName(i.Service_category);
                row["申请时间"] = i.Service_time.ToString();
                row["联系方式"] = i.Service_phone.ToString();
                row["备注"] = i.Service_remarks.ToString();
                row["审核状态"] = i.Service_isdeal == 0 ? "未处理" : "已处理";
                row["管理员回复"] = i.Service_reply;
                dt.Rows.Add(row);
            }
        }

        ExcleHelper.ExportDataGrid(dt, "application/ms-excel", "我的服务.xls");



    }

}