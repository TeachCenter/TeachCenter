using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_EduSrcAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["AdminID"].ToString() == null);
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登录！", "Login.aspx");
        }
           
        if (!IsPostBack)
        {
            using (var db = new TeachingCenterEntities())
            {
                var cate = from it in db.SourceCategory select it;

                dropCategory.DataSource = cate.ToList();

                dropCategory.DataTextField = "SourceCategory_name";

                dropCategory.DataBind();
            }
        }            
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        string title = txtTitle.Text;
        string summary = txtSummary.Text;
        string body = UeditorHelper.Change(myEditor11.InnerHtml);
        if(title.Length == 0)
            Response.Write("<script>alert('标题不能为空！');</script>");
        else if (summary.Length == 0)
            Response.Write("<script>alert('内容摘要不能为空！');</script>");
        else if(body.Length == 0)
            Response.Write("<script>alert('文章内容不能为空！');</script>");
        else
        {
            using (var db = new TeachingCenterEntities())
            {
                EducateSource src = new EducateSource();
                src.title = title;
                string cat = dropCategory.SelectedValue;
                src.category = getId(cat);
                src.body = body;
                src.publisher = "系统管理员";
                src.publish_time = DateTime.Now.ToString("yyyy-MM-dd");
                src.view_times = 0;
                src.is_deleted = 0;
                src.summary = summary;
                db.EducateSource.Add(src);
                db.SaveChanges();
                Server.Transfer("EduSrcList.aspx");
                //                Response.Write("<script>alert('提交成功！');location.href='EduSrcList.aspx';</script>");
            }
        }
    }

    public static int getId(string name)
    {
        using (var db = new TeachingCenterEntities())
        {
            SourceCategory sc = db.SourceCategory.Single(a => a.SourceCategory_name == name);
            return sc.SourceCategory_id;
        }
    }
}