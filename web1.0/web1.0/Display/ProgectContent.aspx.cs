using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_ProgectContent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
            Response.Redirect("main-index.aspx");
        if (Session["TeacherNumber"] == null)
        {
            mobileLogin.Visible = true;
            mobilePerson.Visible = false;
        }
        else
        {
            mobileLogin.Visible = false;
            mobilePerson.Visible = true;
        }
    }
}