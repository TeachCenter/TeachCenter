using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_ProCategoryContent : System.Web.UI.Page
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
                    Response.Redirect("ProjectList.aspx");
                content_id.Value = id.ToString();
                using (var db = new TeachingCenterEntities())
                {
                    var pro_category = db.ProjectCategory.SingleOrDefault(a => a.id == id);
                    lbName.Text = pro_category.name;
                    ltlContent.Text = Server.HtmlDecode(pro_category.project_content);
                    lbStage.Text = AdminHelper.judgeStage(pro_category.stage);
                    lbTime.Text = pro_category.end_time;
                    if (pro_category.stage == 0)
                        btnOpen.Text = "开放中期";
                    else if (pro_category.stage == 1)
                        btnOpen.Text = "开放结题";
                    else
                        btnOpen.Visible = false;
                }
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
        }
    }

    protected void btnOpen_Click(object sender, EventArgs e)
    {
        plOpen.Visible = true;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        using (var db = new TeachingCenterEntities())
        {
            var category = db.ProjectCategory.SingleOrDefault(a => a.id == id);
            category.stage += 1;
            category.end_time = txtTime.Text;
            category.judge_end_time = txtJudgeTime.Text;
            db.SaveChanges();
        }
        Response.Write("<script>alert('开放成功！');location.href='ProCategoryList.aspx';</script>");
    }
}