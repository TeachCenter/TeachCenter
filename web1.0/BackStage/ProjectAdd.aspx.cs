using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_ProjectAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string admin = Session["AdminID"].ToString();
            if (!IsPostBack)
            {
                using (var db = new TeachingCenterEntities())
                {
                    // 绑定项目分类下拉框
                    var category = from it in db.ProjectCategory select it;
                    this.ddlCategory.DataSource = category.ToList();
                    this.ddlCategory.DataValueField = "id";
                    this.ddlCategory.DataTextField = "name";
                    this.ddlCategory.DataBind();
                    ListItem category_item = new ListItem();
                    category_item.Text = "请选择项目分类";
                    category_item.Value = "0";
                    this.ddlCategory.Items.Insert(0, category_item);

                    // 绑定提交者下拉框
                    var teacher = from it in db.Teacher select it;
                    this.ddlTeacher.DataSource = teacher.ToList();
                    this.ddlTeacher.DataValueField = "id";
                    this.ddlTeacher.DataTextField = "name";
                    this.ddlTeacher.DataBind();
                    ListItem teacher_item = new ListItem();
                    teacher_item.Text = "请选择提交者";
                    teacher_item.Value = "0";
                    this.ddlTeacher.Items.Insert(0, teacher_item);
                }
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
        }
    }

    protected bool UpLoadFile()
    {
        string FullName = myFileUpload.PostedFile.FileName;
        if (FullName == "")
            return false;
        else
        {
            FileInfo file = new FileInfo(FullName);
            string name = file.Name;
            string type = file.Extension;
            if (type == ".pdf" || type == ".doc")
            {
                string SavePath = Server.MapPath("~\\BackStage\\file");
                this.myFileUpload.PostedFile.SaveAs(SavePath + "\\" + name);
                return true;
            }
            else
                return false;
        }
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        string project_name = txtName.Text;
        int category = Convert.ToInt32(ddlCategory.SelectedValue);
        int teacher = Convert.ToInt32(ddlTeacher.SelectedValue);
        int stage = Convert.ToInt32(ddlStage.SelectedValue);
        string project_file = myFileUpload.PostedFile.FileName;
        string project_content = UeditorHelper.Change(myEditor11.InnerHtml);
        if (project_name.Length == 0)
            Response.Write("<script>alert('项目名称不能为空！');</script>");
        else if (category == 0)
            Response.Write("<script>alert('请选择项目类型！');</script>");
        else if (teacher == 0)
            Response.Write("<script>alert('请选择提交者！');</script>");
        else if (UpLoadFile() == false)
            Response.Write("<script>alert('请选择正确的文件！');</script>");
        else
        {
            using (var db = new TeachingCenterEntities())
            {
                Project project = new Project();
                project.name = project_name;
                project.category = category;
                project.teacher_id = teacher;
                project.submit_time = DateTime.Now.ToString("yyyy-MM-dd");
                project.is_deleted = 0;
                db.Project.Add(project);
                db.SaveChanges();
                ProjectStage project_stage = new ProjectStage();
                project_stage.project_id = project.project_id;
                project_stage.project_file = "file/" + project_file;
                project_stage.project_content = project_content;
                project_stage.stage = stage;
                project_stage.time = DateTime.Now.ToString("yyyy-MM-dd");
                project_stage.is_pass = -2;
                db.ProjectStage.Add(project_stage);
                db.SaveChanges();
                Response.Write("<script>alert('提交成功！');location.href='ProjectList.aspx';</script>");
            }
        }

    }

}