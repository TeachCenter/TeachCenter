using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string teacher = Session["AdminID"].ToString();
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登录！", "Login.aspx");
        }
    }

    protected void lbtChange_Click(object sender, EventArgs e)
    {
        Session.Clear();
        JSHelper.js("window.top.location='Login.aspx';");
    }

    protected void lbtExit_Click(object sender, EventArgs e)
    {
        Session.Clear();
    }
}