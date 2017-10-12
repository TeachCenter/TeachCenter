using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_ImprovePro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int project_id = 5;
        int stage = 0;
        if (Request.QueryString["id"] != null && Request.QueryString["stage"] != null)
        {
            project_id = Convert.ToInt32(Request.QueryString["id"]);
            stage = Convert.ToInt32(Request.QueryString["stage"]);
        }
        else
            Response.Redirect("main-index.html");
        if (Session["TeacherNumber"] == null)
            Response.Redirect("Login.aspx");
        else
        {
            this.FileUp.Attributes.Add("onchange", "javascript:return Check_FilePath();");
            if (!IsPostBack)
            {
                using (var db = new TeachingCenterEntities())
                {
                    var projectinfo = (from it in db.ProjectInfo where it.project_id == project_id select it).FirstOrDefault();
                    txtName.Text = projectinfo.name;
                    txtCategory.Text = projectinfo.category_name;
                    txtDuty.Text = projectinfo.teacher_name;
                    DateTime time = Convert.ToDateTime(projectinfo.submit_time);
                    txtYear.Text = time.Year.ToString();
                    txtMonth.Text = time.Month.ToString();
                    txtDay.Text = time.Day.ToString();
                    var project = (from it in db.Project where it.project_id == project_id select it).FirstOrDefault();
                    txtMoney.Text = project.fund;
                    string department = (from it in db.Teacher where it.id == project.teacher_id select it).FirstOrDefault().department;
                    txtDepartment.Text = department;
                    var project_stage = (from it in db.ProjectStage where it.project_id == project_id select it).FirstOrDefault();
                }
            }
        }
    }

    protected void lbtnSubmit_Click(object sender, EventArgs e)
    {
        if (UpLoadFile() == false)
            Response.Write("<script>alert('请上传项目文件！');</script>");
        else
        {
            int project_id = Convert.ToInt32(Request.QueryString["id"]);
            int stage = Convert.ToInt32(Request.QueryString["stage"]);
            using (var db = new TeachingCenterEntities())
            {
                var project = (from it in db.ProjectStage where it.project_id == project_id && it.stage == stage select it).FirstOrDefault();
                ProjectStage newStage = new ProjectStage();
                newStage.project_id = project_id;
                newStage.project_content = UeditorHelper.Change(myEditor11.InnerHtml);
                newStage.project_file = "file/" + FileUp.PostedFile.FileName;
                newStage.stage = stage + 1;
                newStage.time = DateTime.Now.ToString("yyyy-MM-dd");
                newStage.is_pass = -2;
                db.ProjectStage.Add(newStage);
                db.SaveChanges();
                Response.Write("<script>alert('完善项目成功！');</script>");
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