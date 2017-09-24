using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_ActivitySummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"].ToString());
        using (var db = new TeachingCenterEntities())
        {
            ActivitySummary asu = db.ActivitySummary.Single(a => a.ActivitySummary_id == id);
            txtAuthor.Text = asu.ActivitySummary_author;
            txtTime.Text = asu.ActivitySummary_time.ToString();
            txtTitle.Text = asu.ActivitySummary_title;
            txtContent.Text =Server.HtmlDecode( asu.ActivitySummary_content);
        }
    }
}