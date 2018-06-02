using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_DevelopEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int id = 1;
            try
            {
                string teacher = Session["AdminID"].ToString();
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                using (var db = new TeachingCenterEntities())
                {
                    var cate = from it in db.DevelopCategory select it;

                    dropCategory.DataSource = cate.ToList();

                    dropCategory.DataTextField = "DevelopCategory_name";

                    dropCategory.DataBind();

                    Develop dev = db.Develop.Single(a => a.Develop_id == id);
                    txtTitle.Text = dev.Develop_title;
                    TextBox1.Text = dev.Develop_summary;
                    txtLink.Text = dev.Develop_link;
                    txtAuthor.Text = dev.Develop_author;
                    myEditor11.InnerHtml = Server.HtmlDecode(dev.Develop_content);
                }
            }
            catch
            {
                JSHelper.AlertThenRedirect("请先登录！", "Login.aspx");
            }


        }
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        string title = txtTitle.Text;
        string link = txtLink.Text;
        string content = myEditor11.InnerHtml;
        string summary = TextBox1.Text;
        string arthor = txtAuthor.Text;
        if (title.Length == 0 || arthor.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (cbxLink.Checked && link.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (!cbxLink.Checked && content.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (summary.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else
        {

            int id = 1;
            try
            {
                string teacher = Session["AdminID"].ToString();
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                //using (var db = new TeachingCenterEntities())
                //{
                //    var cate = from it in db.DevelopCategory select it;

                //    dropCategory.DataSource = cate.ToList();

                //    dropCategory.DataTextField = "DevelopCategory_name";

                //    dropCategory.DataBind();

                //    Develop dev = db.Develop.Single(a => a.Develop_id == id);
                //    txtTitle.Text = dev.Develop_title;
                //    TextBox1.Text = dev.Develop_summary;
                //    txtLink.Text = dev.Develop_link;
                //    txtAuthor.Text = dev.Develop_author;
                //    myEditor11.InnerHtml = Server.HtmlDecode(dev.Develop_content);
                //}


                using (var db = new TeachingCenterEntities())
                {
                    Develop dev = db.Develop.Single(a => a.Develop_id == id);

                    dev.Develop_title = title;
                    dev.Develop_author = arthor;
                    dev.Develop_time = DateTime.Now;
                    dev.Develop_content = content;
                    dev.Develop_link = link;
                    if (!cbxLink.Checked)
                        link = "";
                    dev.Develop_summary = summary;
                    dev.Develop_category = DevelopHelper.getCategoryId(dropCategory.SelectedValue);
                    dev.Develop_hit = 0;
                    dev.Develop_deleted = 0;
                    //db.Develop.Add(dev);
                    db.SaveChanges();
                    //JSHelper.ShowAlert("修改成功！");
                    //JSHelper.Redirect("DevelopManage.aspx");
                    Server.Transfer("DevelopManage.aspx");
                }
            }
            catch
            {

            }
        }
    }

    protected void btnFup_Click(object sender, EventArgs e)
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
                    serverpath = filename;
                    lblInfo.Text = "上传成功！";
                    using (var db = new TeachingCenterEntities())
                    {
                        int id = Convert.ToInt32(Request.QueryString["id"]);
                        Develop acsu = db.Develop.Single(a => a.Develop_id == id);
                        acsu.Develop_path = serverpath;
                        db.SaveChanges();
                    }
                    Server.Transfer("DevelopManage.aspx");
//                    JSHelper.AlertThenRedirect("修改成功！", "DevelopManage.aspx");
                }
            }
        }
        catch (Exception ex)
        {
            lblInfo.Text = "上传发生错误！原因是：" + ex.ToString();
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