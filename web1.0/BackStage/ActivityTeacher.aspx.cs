using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_ActivityTeacher : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string teacher = Session["AdminID"].ToString();
            int id = Convert.ToInt16(Request.QueryString["id"]);
            DataBindToRepeater(1);
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
        }

    }

    //分页
    void DataBindToRepeater(int currentPage)
    {

        int id = Convert.ToInt16(Request.QueryString["id"]);
        using (var db = new TeachingCenterEntities())
        {
            //var catagory = from it in db.ActivityTeacher where it.activity_id == id select it;
            List<ActivityTeacher> at = db.ActivityTeacher.Where(a => a.activity_id == id).ToList();
            List<Teacher> teacher = new List<Teacher>();
            foreach (ActivityTeacher i in at)
            {
                Teacher t = db.Teacher.SingleOrDefault(a => a.id == i.teacher_id);
                teacher.Add(t);
            }


            rptCategory.DataSource = teacher.ToList();

            rptCategory.DataBind();

            ltCount.Text = teacher.Count().ToString();

            PagedDataSource pds = new PagedDataSource();

            pds.AllowPaging = true;

            pds.PageSize = 5;

            pds.DataSource = teacher.ToList();

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

    protected void rptCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Literal ltCount = (Literal)e.Item.FindControl("ltNumber");
            ltCount.Text = (e.Item.ItemIndex + 1).ToString();
            //ltCount = (Literal)e.Item.FindControl("ltName");
            //ltCount.Text = TeacherHelper.getTeacherNameByID(Convert.ToInt16(ltCount.Text));
        }
    }

    protected void btnExcel_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        int id = Convert.ToInt16(Request.QueryString["id"]);
        using (var db  = new TeachingCenterEntities())
        {
            List<ActivityTeacher> at = db.ActivityTeacher.Where(a => a.activity_id == id).ToList();
            List<Teacher> teacher = new List<Teacher>();
            foreach (ActivityTeacher i in at)
            {
                Teacher t = db.Teacher.SingleOrDefault(a => a.id == i.teacher_id);
                teacher.Add(t);
            }
            DataColumn dc1 = new DataColumn("序号", System.Type.GetType("System.String"));
            DataColumn dc2 = new DataColumn("教师工号", System.Type.GetType("System.String"));
            DataColumn dc3 = new DataColumn("教师姓名", System.Type.GetType("System.String"));
            DataColumn dc4 = new DataColumn("教师电话号码", System.Type.GetType("System.String"));
            DataColumn dc5 = new DataColumn("教师邮箱", System.Type.GetType("System.String"));

            dt.Columns.Add(dc1);
            dt.Columns.Add(dc2);
            dt.Columns.Add(dc3);
            dt.Columns.Add(dc4);
            dt.Columns.Add(dc5);

            int count = 1;
            foreach (var i in teacher)
            {
                DataRow row = dt.NewRow();

                row["序号"] = count.ToString();
                row["教师工号"] = i.number;
                row["教师姓名"] = i.name;
                row["教师电话号码"] = i.phone_number;
                row["教师邮箱"] = i.email;

                count++;
                dt.Rows.Add(row);
            }
            ExcleHelper.ExportDataGrid(dt, "application/ms-excel", "活动名单.xls");
        }
    }
}