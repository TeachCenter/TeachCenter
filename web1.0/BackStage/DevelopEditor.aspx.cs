﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_DevelopEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
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
                txtLink.Text = dev.Develop_link;
                myEditor11.InnerHtml = Server.HtmlDecode(dev.Develop_content);
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
                dev.Develop_category = DevelopHelper.getCategoryId(dropCategory.SelectedValue);
                dev.Develop_hit = 0;
                dev.Develop_deleted = 0;
                db.Develop.Add(dev);
                db.SaveChanges();
                JSHelper.ShowAlert("修改成功！");
                //JSHelper.Redirect("DevelopManage.aspx");
                Server.Transfer("DevelopManage.aspx");
            }
    }
}