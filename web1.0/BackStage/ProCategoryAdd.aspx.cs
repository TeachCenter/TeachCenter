﻿using System;
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
        if(Session["AdminID"].ToString() == null)
            JSHelper.AlertThenRedirect("请先登录！", "Login.aspx");
        if (!IsPostBack)
        {
            try
            {
                string teacher = Session["AdminID"].ToString();
                using (var db = new TeachingCenterEntities())
                {
                    var cate = from it in db.ProCatCategory select it;

                    dropCategory.DataSource = cate.ToList();

                    dropCategory.DataTextField = "ProCatCategory_name";

                    dropCategory.DataBind();
                }
            }
            catch
            {
                JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
            }
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
                return "";
        }
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
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
        else if (UpLoadFile() == "")
            Response.Write("<script>alert('请选择正确的文件！');</script>");
        else if(time == "" || judge_time == "")
            Response.Write("<script>alert('截止时间不能为空！');</script>");
        else
        {
            using (var db = new TeachingCenterEntities())
            {
                ProjectCategory pro_category = new ProjectCategory();
                pro_category.name = name;
                pro_category.category = getId(dropCategory.SelectedValue);
                pro_category.project_file = "file/" + project_file;
                pro_category.project_content = project_content;
                pro_category.stage = 0;
                pro_category.end_time = time;
                pro_category.judge_end_time = judge_time;
                pro_category.is_deleted = 0;
                pro_category.publish_time = DateTime.Now.ToString("yyyy-MM-dd");
                pro_category.summary = summary;
                db.ProjectCategory.Add(pro_category);
                db.SaveChanges();
                //Response.Write("<script>alert('提交成功！');location.href='ProCategoryList.aspx';</script>");
                Server.Transfer("ProCategoryList.aspx");
            }
        }
    }

    public static int getId(string name)
    {
        using (var db = new TeachingCenterEntities())
        {
            ProCatCategory pc = db.ProCatCategory.Single(a => a.ProCatCategory_name == name);
            return pc.ProCatCategory_id;
        }
    }
}