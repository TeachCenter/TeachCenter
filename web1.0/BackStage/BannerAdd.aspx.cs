using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_BannerAdd : System.Web.UI.Page
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
            string type = file.Extension.ToLower();
            if (type == ".jpg" || type == ".png" || type == ".bmp")
            {
                string SavePath = Server.MapPath("~\\BackStage\\picture");
                this.myFileUpload.PostedFile.SaveAs(SavePath + "\\" + name);
                return true;
            }
            else
                return false;
        }
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        string picture_path = myFileUpload.PostedFile.FileName;
        if (UpLoadFile() == false)
            Response.Write("<script>alert('请选择正确的文件！');</script>");
        else
        {
            using (var db = new TeachingCenterEntities())
            {
                String title = txtTitle.Text;
                String link = txtLink.Text;
                String summary = txtSummary.Text;
                if (link.Length == 0)
                    link = "";
                if (title.Length == 0 || summary.Length == 0)
                    Response.Write("<script>alert('输入不能为空！');</script>");               
                else
                {
                    Picture picture = new Picture();
                    picture.Picture_title = title;
                    picture.Picture_link = link;
                    picture.Picture_path = "picture/" + picture_path;
                    picture.is_top = 0;
                    picture.Picture_summary = summary;
                    db.Picture.Add(picture);
                    db.SaveChanges();
                    var banner = db.Picture.SingleOrDefault(a => a.Picture_id == picture.Picture_id);
                    int max = Convert.ToInt32((from it in db.Picture orderby it.is_top descending select it.is_top).FirstOrDefault());
                    banner.is_top = max + 1;
                    db.SaveChanges();
                    Response.Write("<script>alert('添加成功！');location.href='BannerList.aspx';</script>");
                }               
            }
        }
    }
}