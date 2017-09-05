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

    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        string title = txtTitle.Text;
        string link = txtLink.Text;
        string content = myEditor11.InnerHtml;
        if (title.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (cbxLink.Checked && link.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (!cbxLink.Checked && content.Length == 0) 
            JSHelper.ShowAlert("输入不能为空！");
        else
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
                dev.Develop_link = link;
                dev.Develop_hit = 0;
                dev.Develop_deleted = 0;
                db.Develop.Add(dev);
                db.SaveChanges();
                JSHelper.ShowAlert("发布成功！");
                JSHelper.Redirect("DevelopManage.aspx");
            }
    }
}