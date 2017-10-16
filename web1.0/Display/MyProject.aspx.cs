﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_MyProject : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //判断是不是评审
            if (!TeacherHelper.isJudge(Session["TeacherNumber"].ToString()))
                liJudge.Visible = false;
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登录！", "main-index.aspx");
        }
    }
}