using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_ProCategoryAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
        string name = txtName.Text;
        string project_file = myFileUpload.PostedFile.FileName;
        string project_content = UeditorHelper.Change(myEditor11.InnerHtml);
        string time = txtTime.Text;
        string judge_time = txtJudgeTime.Text;
        if (name.Length == 0)
            Response.Write("<script>alert('项目类型名称不能为空！');</script>");
        else if (UpLoadFile() == false)
            Response.Write("<script>alert('请选择正确的文件！');</script>");
        else if(time == "" || judge_time == "")
            Response.Write("<script>alert('截止时间不能为空！');</script>");
        else
        {
            using (var db = new TeachingCenterEntities())
            {
                ProjectCategory pro_category = new ProjectCategory();
                pro_category.name = name;
                pro_category.project_file = "file/" + project_file;
                pro_category.project_content = project_content;
                pro_category.stage = 0;
                pro_category.end_time = time;
                pro_category.judge_end_time = judge_time;
                pro_category.is_deleted = 0;
                db.ProjectCategory.Add(pro_category);
                db.SaveChanges();
                Response.Write("<script>alert('提交成功！');location.href='ProCategoryList.aspx';</script>");
            }
        }
    }
}