using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_EduSrcContent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string teacher = Session["AdminID"].ToString();
            if (!IsPostBack)
            {
                int id = 0;
                if (Request.QueryString["id"] != null)
                    id = Convert.ToInt32(Request.QueryString["id"]);
                else
                    Response.Redirect("EduSrcList.aspx");
                using (var db = new TeachingCenterEntities())
                {
                    var src = db.EducateSource.SingleOrDefault(a => a.id == id);
                    lbTitle.Text = src.title;
                    lbPublisher.Text = src.publisher;
                    lbTime.Text = src.publish_time;
                    lbViewTimes.Text = src.view_times.ToString();
                    lbBody.Text = Server.HtmlDecode(src.body);
                }
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登录！", "Login.aspx");
        }
    }
}