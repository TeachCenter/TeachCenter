using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Display_MyActivityList : System.Web.UI.Page
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
            using (var db = new TeachingCenterEntities())
            {
                int teacher = TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString());
                //int teacher = 1;
                var at = from it in db.ActivityTeacher where it.teacher_id == teacher select it;
                List<Activity> ac = new List<Activity>();
                foreach (var i in at)
                {
                    Activity activity = db.Activity.Single(a => a.Activity_id == i.activity_id);
                    if(activity.Activity_isdeleted == 0)
                        ac.Add(activity);
                }
                HtmlInputHidden count = FindControl("count") as HtmlInputHidden;
                count.Value = ac.Count().ToString();
                rptActivity.DataSource = ac.Skip((page-1)*9).Take(9);
                rptActivity.DataBind();
                //判断是不是评审
                if (!TeacherHelper.isJudge(Session["TeacherNumber"].ToString()))
                    liJudge.Visible = false;
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登录！", "main-index.aspx");
        }
    }
    protected void lbtReturn_Click(object sender, EventArgs e)
    {
        Session.Remove("TeacherNumber");
        JSHelper.AlertThenRedirect("注销成功！", "main-index.aspx");
    }
    protected void rptActivity_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            //int teacher = TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString());
            int teacher = 1;
            using (var db = new TeachingCenterEntities())
            {
                ActivityTeacher at = db.ActivityTeacher.Single(a => a.activity_id == id && a.teacher_id == teacher);
                db.ActivityTeacher.Remove(at);
                Activity ac = db.Activity.Single(a => a.Activity_id == id);

                ac.Activity_nowcount--;
                db.SaveChanges();
                JSHelper.ShowAlert("取消成功！");
                JSHelper.js("window.location.reload();");
            }
        }
    }

    protected void rptActivity_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            LinkButton linkbuttom = (LinkButton)e.Item.FindControl("lbtDelete");
            int id = Convert.ToInt32(linkbuttom.Text);
            using (var db = new TeachingCenterEntities())
            {
                Activity ac = db.Activity.Single(a => a.Activity_id == id);
                linkbuttom.Text = ac.Activity_time < DateTime.Now ? "" : "取消参与该活动";
            }

        }
    }



    protected void lbtExport_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        
        using (var db = new TeachingCenterEntities())
        {
            DateTime now = DateTime.Now;
            DateTime last = now.AddYears(-1);

            int teacher = TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString());
            //int teacher = 1;
            var at = from it in db.ActivityTeacher where it.teacher_id == teacher select it;
            List<Activity> ac = new List<Activity>();
            foreach (var i in at)
            {
                Activity activity = db.Activity.Single(a => a.Activity_id == i.activity_id && a.Activity_hold_time >= last && a.Activity_hold_time <= now);
                if (activity.Activity_isdeleted == 0)
                    ac.Add(activity);
            }

            
            DataColumn dc1 = new DataColumn("序号", System.Type.GetType("System.String"));
            DataColumn dc5 = new DataColumn("活动类型", System.Type.GetType("System.String"));
            DataColumn dc2 = new DataColumn("活动名称", System.Type.GetType("System.String"));
            DataColumn dc3 = new DataColumn("活动地点", System.Type.GetType("System.String"));
            DataColumn dc4 = new DataColumn("活动时间", System.Type.GetType("System.DateTime"));


            dt.Columns.Add(dc1);
            dt.Columns.Add(dc5);
            dt.Columns.Add(dc2);
            dt.Columns.Add(dc3);
            dt.Columns.Add(dc4);


            int count = 1;
            foreach (var i in ac)
            {
                DataRow row = dt.NewRow();

                row["序号"] = count.ToString();
                row["活动类型"] = ActivityHelper.getCategoryName(i.Activity_categoryid);
                row["活动名称"] = i.Activity_title;
                row["活动地点"] = i.Activity_place;
                row["活动时间"] = i.Activity_hold_time;
                dt.Rows.Add(row);
            }
        }

        ExcleHelper.ExportDataGrid(dt, "application/ms-excel", "我的活动.xls");



    }
}