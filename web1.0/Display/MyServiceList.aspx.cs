using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_MyServiceList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int teacher = TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString());
            //int teacher = 2;
            using (var db = new TeachingCenterEntities())
            {
                var myService = from it in db.Service
                                where it.Service_teacher == teacher && it.Service_isdeleted == 0
                                orderby it.Service_time descending
                                select it;
                rptService.DataSource = myService.ToList();
                rptService.DataBind();
            }
            //判断是不是评审
            if (!TeacherHelper.isJudge(Session["TeacherNumber"].ToString()))
                liJudge.Visible = false;
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "main-index.aspx");
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
        }
    }
}