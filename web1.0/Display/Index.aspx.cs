using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string teacher = Session["TeacherNumber"].ToString();
            if (teacher != null)
                lbtLogin.Visible = false;
        }
        catch
        {
            //lbtLogin.Visible = false;
        }
    }


}