using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_BannerEdit : System.Web.UI.Page
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
                JSHelper.AlertThenRedirect("地址栏有误！", "BannerList.aspx");
            }
            id = Convert.ToInt32(Request.QueryString["id"].ToString());
            if (!IsPostBack)
            {
                using (var db = new TeachingCenterEntities())
                {
                    var banner = (from it in db.Picture where it.Picture_id == id select it).FirstOrDefault();
                    txtTitle.Text = banner.Picture_title;
                    txtSummary.Text = banner.Picture_summary;
                    txxtLink.Text = banner.Picture_link;
                    imgBanner.ImageUrl = banner.Picture_path;
                }
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("地址栏有误！", "BannerList.aspx");
        }        
    }

    protected int UpLoadFile()
    {
        string FullName = myFileUpload.PostedFile.FileName;
        if (FullName == "")
            return -1;
        else
        {
            FileInfo file = new FileInfo(FullName);
            string name = file.Name;
            string type = file.Extension.ToLower();
            if (type == ".jpg" || type == ".png" || type == ".bmp")
            {
                string SavePath = Server.MapPath("~\\BackStage\\picture");
                this.myFileUpload.PostedFile.SaveAs(SavePath + "\\" + name);
                return 1;
            }
            else
                return 0;
        }
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        string picture_path = myFileUpload.PostedFile.FileName;
        int id = Convert.ToInt32(Request.QueryString["id"].ToString());
        if (UpLoadFile() == 0)
            Response.Write("<script>alert('请选择正确的文件！');</script>");
        else
        {
            using (var db = new TeachingCenterEntities())
            {
                String title = txtTitle.Text;
                String link = txxtLink.Text;
                String summary = txtSummary.Text;
                if (link.Length == 0)
                    link = "";
                if (title.Length == 0 || summary.Length == 0)
                    Response.Write("<script>alert('输入不能为空！');</script>");
                else
                {
                    var picture = (from it in db.Picture where it.Picture_id == id select it).FirstOrDefault();
                    picture.Picture_title = title;
                    picture.Picture_link = link;
                    if(picture_path != "")
                    {
                        picture.Picture_path = "picture/" + picture_path;
                    }
                    picture.Picture_summary = summary;
                    db.SaveChanges();
                    //var banner = db.Picture.SingleOrDefault(a => a.Picture_id == picture.Picture_id);
                    //int max = Convert.ToInt32((from it in db.Picture orderby it.is_top descending select it.is_top).FirstOrDefault());
                    //banner.is_top = max + 1;
                    db.SaveChanges();
                    Server.Transfer("BannerList.aspx");
                    //Response.Write("<script>alert('修改成功！');location.href='BannerList.aspx';</script>");
                }
            }
        }
    }
}