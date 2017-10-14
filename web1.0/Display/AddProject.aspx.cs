using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.IO;

public partial class Display_AddProject : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["TeacherNumber"] = 1;
        this.FileUp.Attributes.Add("onchange", "javascript:return Check_FilePath();");
        if (!IsPostBack)
        {
            if (Session["TeacherNumber"] == null)
                Response.Redirect("Login.aspx");
            else
            {              
                if (!IsPostBack)
                {
                    using (var db = new TeachingCenterEntities())
                    {
                        var category = from it in db.ProjectCategory where it.is_deleted == 0 select it;
                        rptSelect.DataSource = category.ToList();
                        rptSelect.DataBind();
                    }
                }
            }
        }       
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string name = txtName.Text;
        int teacher_id = Convert.ToInt32(Session["TeacherNumber"].ToString());
        string submit_time = DateTime.Now.ToString("yyyy-MM-dd");
        string fund = txtMoney.Text;
        string filePath = FileUp.PostedFile.FileName;
        HtmlInputHidden category = FindControl("Selected") as HtmlInputHidden;
        if (category.Value == "")
            Response.Write("<script>alert('项目类型不能为空！');</script>");
        else if (name.Length == 0)
            Response.Write("<script>alert('项目名称不能为空！');</script>");
        else if (fund.Length == 0)
            Response.Write("<script>alert('资助金额不能为空！');</script>");
        else if (UpLoadFile() == false)
            Response.Write("<script>alert('请上传项目文件！');</script>");
        else
        {
            using (var db = new TeachingCenterEntities())
            {
                Project project = new Project();
                project.name = name;
                project.category = Convert.ToInt32(category.Value);
                project.teacher_id = Convert.ToInt32(Session["TeacherNumber"].ToString());
                project.submit_time = DateTime.Now.ToString("yyyy-MM-dd");
                project.fund = fund;
                project.is_deleted = 0;
                db.Project.Add(project);
                db.SaveChanges();

                ProjectStage project_stage = new ProjectStage();
                project_stage.project_id = project.project_id;
                project_stage.project_file = "file/" + FileUp.PostedFile.FileName;
                project_stage.project_content = UeditorHelper.Change(myEditor11.InnerHtml);
                project_stage.stage = 0;
                project_stage.time = DateTime.Now.ToString("yyyy-MM-dd");
                project_stage.is_pass = -2;
                db.ProjectStage.Add(project_stage);
                db.SaveChanges();

                Response.Write("<script>alert('新建项目成功！');</script>");
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
}