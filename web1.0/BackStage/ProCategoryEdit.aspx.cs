using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_ProCategoryEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"].ToString() == null)
            JSHelper.AlertThenRedirect("请先登录！", "Login.aspx");
        int id = 1;
        try
        {
            if (Request.QueryString["id"] == null)
            {
                JSHelper.AlertThenRedirect("地址栏有误！", "ProCategoryList.aspx");
            }
            id = Convert.ToInt32(Request.QueryString["id"].ToString());
            if (!IsPostBack)
            {
                using (var db = new TeachingCenterEntities())
                {
                    var pro = (from it in db.ProjectCategory where it.id == id select it).FirstOrDefault();
                    txtName.Text = pro.name;
                    txtSummary.Text = pro.summary;
                    myEditor11.InnerHtml = Server.HtmlDecode(pro.project_content);
                    txtTime.Text = pro.end_time;
                    txtJudgeTime.Text = pro.judge_end_time;
                }
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("地址栏有误！", "ProCategoryList.aspx");
        }
    }

    protected string UpLoadFile()
    {
        string FullName = myFileUpload.PostedFile.FileName;
        if (FullName == "")
            return "";
        else
        {
            FileInfo file = new FileInfo(FullName);
            string name = file.Name;
            string type = file.Extension;
            if (type == ".pdf" || type == ".doc" || type == ".docx")
            {
                string SavePath = Server.MapPath("~\\BackStage\\file");
                this.myFileUpload.PostedFile.SaveAs(SavePath + "\\" + name);
                return name;
            }
            else
                return "wrong";
        }
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"].ToString());
        string name = txtName.Text;
        string project_file = UpLoadFile();
        string project_content = UeditorHelper.Change(myEditor11.InnerHtml);
        string time = txtTime.Text;
        string judge_time = txtJudgeTime.Text;
        string summary = txtSummary.Text;
        if (name.Length == 0)
            Response.Write("<script>alert('项目类型名称不能为空！');</script>");
        else if (summary.Length == 0)
            Response.Write("<script>alert('内容摘要不能为空！');</script>");
        else if (UpLoadFile() == "wrong")
            Response.Write("<script>alert('请选择正确的文件！');</script>");
        else if (time == "" || judge_time == "")
            Response.Write("<script>alert('截止时间不能为空！');</script>");
        else
        {
            using (var db = new TeachingCenterEntities())
            {
                var pro_category = (from it in db.ProjectCategory where it.id == id select it).FirstOrDefault();
                pro_category.name = name;
                if(project_file != "")
                {
                    pro_category.project_file = "file/" + project_file;
                }
                pro_category.project_content = project_content;
                pro_category.end_time = time;
                pro_category.judge_end_time = judge_time;
                pro_category.summary = summary;
                db.SaveChanges();
                Server.Transfer("ProCategoryList.aspx");
                //Response.Write("<script>alert('修改成功！');location.href='ProCategoryList.aspx';</script>");
            }
        }
    }
}