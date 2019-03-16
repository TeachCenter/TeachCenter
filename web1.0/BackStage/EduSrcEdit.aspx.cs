using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_EduSrcEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"] == null)
            JSHelper.AlertThenRedirect("请先登录！", "Login.aspx");
        int id = 1;
        try
        {
            if (Request.QueryString["id"] == null)
            {
                JSHelper.AlertThenRedirect("地址栏有误！", "EduSrcList.aspx");
            }
            id = Convert.ToInt32(Request.QueryString["id"].ToString());
            if (!IsPostBack)
            {
                using (var db = new TeachingCenterEntities())
                {
                    var src = (from it in db.EducateSource where it.id == id select it).FirstOrDefault();
                    txtTitle.Text = src.title;
                    pushlishTime.Value = src.publish_time;
                    txtSummary.Text = src.summary;
                    myEditor11.InnerHtml = Server.HtmlDecode(src.body);
                }
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("地址栏有误！", "EduSrcList.aspx");
        }
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"].ToString());
        string title = txtTitle.Text;
        string summary = txtSummary.Text;
        string body = UeditorHelper.Change(myEditor11.InnerHtml);
        if (title.Length == 0)
            Response.Write("<script>alert('标题不能为空！');</script>");
        else if (summary.Length == 0)
            Response.Write("<script>alert('内容摘要不能为空！');</script>");
        else if (body.Length == 0)
            Response.Write("<script>alert('文章内容不能为空！');</script>");
        else
        {
            using (var db = new TeachingCenterEntities())
            {
                var src = (from it in db.EducateSource where it.id == id select it).FirstOrDefault();
                src.title = title;
                src.body = body;
                src.publish_time = pushlishTime.Value;
                src.summary = summary;
                db.SaveChanges();
                Response.Write("<script>alert('修改成功！');location.href='EduSrcList.aspx';</script>");
            }
        }
    }
}