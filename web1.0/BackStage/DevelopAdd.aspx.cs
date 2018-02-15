using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_DevelopAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string teacher = Session["AdminID"].ToString();
            using (var db = new TeachingCenterEntities())
            {
                var cate = from it in db.DevelopCategory select it;

                dropCategory.DataSource = cate.ToList();

                dropCategory.DataTextField = "DevelopCategory_name";

                dropCategory.DataBind();
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
        }

    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        string title = txtTitle.Text;
        string link = txtLink.Text;
        string content = myEditor11.InnerHtml;
        string summary = TextBox1.Text;
        if (title.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (cbxLink.Checked && link.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (!cbxLink.Checked && content.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (summary.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else
        {
            try
            {
                if (fup.PostedFile.FileName == "")
                {
                    lblInfo.Text = "请选择文件！";
                }
                else
                {
                    if (!IsAllowedExtension(fup))
                    {
                        lblInfo.Text = "上传文件格式不正确！";
                    }
                    else
                    {
                        string filepath = fup.PostedFile.FileName;
                        string filename = filepath.Substring(filepath.LastIndexOf("\\") + 1);
                        string serverpath = Server.MapPath("picture/") + filename;
                        fup.PostedFile.SaveAs(serverpath);
                        serverpath = "picture/" + filename;
                        lblInfo.Text = "上传成功！";
                        using (var db = new TeachingCenterEntities())
                        {
                            if (!cbxLink.Checked)
                                link = "";
                            Develop dev = new Develop();
                            dev.Develop_title = title;
                            if (dropAuthor.SelectedValue == "0")
                                dev.Develop_author = AdminHelper.getNameByID(Session["AdminID"].ToString());
                            else if (dropAuthor.SelectedValue == "1")
                                dev.Develop_author = "匿名";
                            else
                                dev.Develop_author = "未知";
                            dev.Develop_time = DateTime.Now;
                            dev.Develop_content = content;
                            dev.Develop_summary = summary;
                            dev.Develop_link = link;
                            dev.Develop_category = DevelopHelper.getCategoryId(dropCategory.SelectedValue);
                            dev.Develop_hit = 0;
                            dev.Develop_path = filepath;
                            dev.Develop_deleted = 0;
                            db.Develop.Add(dev);
                            db.SaveChanges();
                            JSHelper.ShowAlert("发布成功！");
                            //JSHelper.Redirect("DevelopManage.aspx");
                            Server.Transfer("DevelopManage.aspx");
                        }

                    }
                }
            }
            catch
            {

            }
        }
    }
    private static bool IsAllowedExtension(FileUpload upfile)
    {
        string strOldFilePath = "";
        string strExtension = "";
        string[] arrExtension = { ".gif", ".jpg", ".bmp", ".png" };
        if (upfile.PostedFile.FileName != string.Empty)
        {
            strOldFilePath = upfile.PostedFile.FileName;//获得文件的完整路径名 
            strExtension = strOldFilePath.Substring(strOldFilePath.LastIndexOf("."));//获得文件的扩展名，如：.jpg 
            for (int i = 0; i < arrExtension.Length; i++)
            {
                if (strExtension.Equals(arrExtension[i]))
                {
                    return true;
                }
            }
        }
        return false;
    }
}