using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_SrcContent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["id"] == null)
            Response.Redirect("main-index.aspx");
        else
        {
            using (var db = new TeachingCenterEntities())
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                var src = (from it in db.EducateSource where it.id == id select it).FirstOrDefault();
                src.view_times += 1;
                db.SaveChanges();
            }
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
}