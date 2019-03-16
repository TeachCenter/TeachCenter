using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class Display_EditProject : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //判断是不是评审
            if (!TeacherHelper.isJudge(Session["TeacherNumber"].ToString()))
                liJudge.Visible = false;
            this.FileUp.Attributes.Add("onchange", "javascript:return Check_FilePath();");
            if (!IsPostBack)
            {
                int project_id = 1;
                if (Request.QueryString["id"] != null)
                {
                    project_id = Convert.ToInt32(Request.QueryString["id"]);
                }
                else
                    Response.Redirect("main-index.aspx");
                using (var db = new TeachingCenterEntities())
                {
                    // 获取当前项目
                    var projectinfo = (from it in db.ProjectInfo where it.project_id == project_id select it).FirstOrDefault();
                    txtName.Text = projectinfo.name; // 项目名称
                    var project = (from it in db.Project where it.project_id == project_id select it).FirstOrDefault();
                    txtMoney.Text = project.fund; // 资助金额
                    var project_stage = (from it in db.ProjectStage where it.project_id == project_id orderby it.stage descending select it).FirstOrDefault();
                    myEditor11.InnerText = Server.HtmlDecode(project_stage.project_content); // 项目内容
                    int index = project_stage.project_file.IndexOf("/");
                    lbFileName.Text = project_stage.project_file.Substring(index + 1); // 项目文件
                }
            }            
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "main-index.aspx");
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string name = txtName.Text;
        int teacher_id = TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString());
        string fund = txtMoney.Text;
        Regex numRegex = new Regex(@"^\d+$");
        string filePath = FileUp.PostedFile.FileName;
        if (name.Length == 0)
            Response.Write("<script>alert('项目名称不能为空！');</script>");
        else if (fund.Length == 0)
            Response.Write("<script>alert('资助金额不能为空！');</script>");
        else if (!numRegex.IsMatch(fund))
            Response.Write("<script>alert('请输入正确的资助金额！');</script>");
        //else if (UpLoadFile() == false)
        //Response.Write("<script>alert('请上传项目文件！');</script>");
        else
        {
            using (var db = new TeachingCenterEntities())
            {
                int project_id = Convert.ToInt32(Request.QueryString["id"]);
                Project project = (from it in db.Project where it.project_id == project_id select it).FirstOrDefault();
                project.name = name;
                project.fund = fund;
                db.SaveChanges();

                ProjectStage project_stage = (from it in db.ProjectStage where it.project_id == project_id orderby it.stage descending select it).FirstOrDefault();                
                project_stage.project_content = UeditorHelper.Change(myEditor11.InnerHtml);
                if (UpLoadFile() == true)
                {
                    project_stage.project_file = "file/" + FileUp.PostedFile.FileName;
                }
                db.SaveChanges();
                Response.Redirect("MyProject.aspx?pageNumber=1");                
            }
        }

    }

    protected bool UpLoadFile()
    {
        string FullName = FileUp.PostedFile.FileName;
        if (FullName == "")
            return false;
        else
        {
            FileInfo file = new FileInfo(FullName);
            string name = file.Name;
            string type = file.Extension;
            if (type == ".docx" || type == ".doc" || type == ".pdf")
            {
                string SavePath = Server.MapPath("~\\BackStage\\file");
                this.FileUp.PostedFile.SaveAs(SavePath + "\\" + name);
                return true;
            }
            else
                return false;
        }
    }

    public string getFileName()
    {
        try
        {
            int project_id = Convert.ToInt32(Request.QueryString["id"]);
            using (var db = new TeachingCenterEntities())
            {
                var project_stage = (from it in db.ProjectStage where it.project_id == project_id select it).FirstOrDefault();
                return project_stage.project_file;
            }
        }
        catch
        {
            return "";
        }
    }

    protected void lbtReturn_Click(object sender, EventArgs e)
    {
        Session.Remove("TeacherNumber");
        JSHelper.AlertThenRedirect("注销成功！", "main-index.aspx");
    }
}