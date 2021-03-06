﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_ActivityEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = 1;
        if (!IsPostBack)
        {
            try
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                string teacher = Session["AdminID"].ToString();
                using (var db = new TeachingCenterEntities())
                {
                    Activity ac = db.Activity.Single(a => a.Activity_id == id);
                    txtTitle.Text = ac.Activity_title;
                    txtLimit.Text = ac.Activity_limitcount.ToString();
                    txtPlace.Text = ac.Activity_place;
                    TextBox1.Text = ac.Activity_summary;
                    myEditor11.InnerHtml = Server.HtmlDecode(ac.Activity_content);
                    logmin.Value = ac.Activity_hold_time.ToString();
                    pushlishTime.Value = ac.Activity_time.ToString();

                    var cate = from it in db.ActivityCategory select it;

                    dropCategory.DataSource = cate.ToList();

                    dropCategory.DataTextField = "ActivityCategory_name";

                    dropCategory.DataBind();
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
        string date = logmin.Value;
        string place = txtPlace.Text;
        string count = txtLimit.Text;
        string category = dropCategory.SelectedValue;
        string content = myEditor11.InnerHtml;
        string summary = TextBox1.Text;
        if (title.Length == 0 || date.Length == 0 || place.Length == 0 || count.Length == 0 || content.Length == 0 || pushlishTime.Value.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (summary.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else
        {
            try
            {
                int id = Convert.ToInt32(Request.QueryString["id"].ToString());
                using (var db = new TeachingCenterEntities())
                {



                    Activity ac = db.Activity.Single(a => a.Activity_id == id);

                    if (ac.Activity_nowcount > Convert.ToInt32(count))
                        JSHelper.ShowAlert("限制人数不可小于当前已参加人数！");
                    else
                    {
                        if (dropAuthor.SelectedValue == "0")
                            ac.Activity_author = AdminHelper.getNameByID(Session["AdminID"].ToString());
                        else if (dropAuthor.SelectedValue == "1")
                            ac.Activity_author = "匿名";
                        else
                            ac.Activity_author = "未知";

                        ac.Activity_title = title;
                        DateTime dt = Convert.ToDateTime(date);
                        ac.Activity_hold_time = dt;
                        ac.Activity_summary = summary;
                        ac.Activity_content = content;
                        ac.Activity_place = place;
                        ac.Activity_limitcount = Convert.ToInt32(count);
                        ac.Activity_categoryid = ActivityHelper.getCategoryId(category);
                        ac.Activity_time = Convert.ToDateTime( pushlishTime.Value.ToString());
                        db.SaveChanges();
                        //Server.Transfer("ActivityManage.aspx");
                        JSHelper.AlertThenRedirect("修改成功！", "ActivityManage.aspx");
                    }

                }
            }
            catch
            {
                JSHelper.ShowAlert("存在非法输入！");
            }
        }
    }
}