using System;
using System.Collections.Generic;
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
            var catagory = from it in db.ActivityTeacher where it.activity_id == id select it;

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

    protected void rptCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Literal ltCount = (Literal)e.Item.FindControl("ltNumber");
            ltCount.Text = (e.Item.ItemIndex + 1).ToString();
            ltCount = (Literal)e.Item.FindControl("ltName");
            ltCount.Text = TeacherHelper.getTeacherNameByID(Convert.ToInt16(ltCount.Text));
        }
    }
}