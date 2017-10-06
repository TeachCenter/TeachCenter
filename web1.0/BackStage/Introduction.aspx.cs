using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_Introduction : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string teacher = Session["AdminID"].ToString();
            if (!IsPostBack)
            {
                using (var db = new TeachingCenterEntities())
                {
                    Introduction intro = db.Introduction.First();
                    lbContent.Text = intro.Introduction_content;
                    myEditor11.InnerText = intro.Introduction_content;
                    myEditor11.Visible = false;
                    btnSub.Visible = false;
                }
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
        }


    }



    protected void btnSub_Click(object sender, EventArgs e)
    {
        //string content = myEditor11.InnerText;
        string content = Server.HtmlDecode(myEditor11.InnerHtml);
        if (content.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else
        {
            using (var db = new TeachingCenterEntities())
            {
                Introduction intro = db.Introduction.First();
                intro.Introduction_content = content;
                db.SaveChanges();
            }
            lbContent.Visible = true;
            btnChange.Visible = true;
            myEditor11.Visible = false;
            btnSub.Visible = false;
        }
    }

    protected void btnChange_Click(object sender, EventArgs e)
    {
        lbContent.Visible = false;
        btnChange.Visible = false;
        myEditor11.Visible = true;
        btnSub.Visible = true;
    }
}