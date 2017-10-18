﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_ProCategoryContent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string teacher = Session["AdminID"].ToString();
            if (!IsPostBack)
            {
                int id = 0;
                if (Request.QueryString["id"] != null)
                    id = Convert.ToInt32(Request.QueryString["id"]);
                else
                    Response.Redirect("ProjectList.aspx");
                content_id.Value = id.ToString();
                using (var db = new TeachingCenterEntities())
                {
                    var pro_category = db.ProjectCategory.SingleOrDefault(a => a.id == id);
                    lbName.Text = pro_category.name;
                    ltlContent.Text = Server.HtmlDecode(pro_category.project_content);
                    lbStage.Text = AdminHelper.judgeStage(pro_category.stage);
                    lbTime.Text = pro_category.end_time;
                    if (pro_category.stage == 0)
                        btnOpen.Text = "开放中期";
                    else if (pro_category.stage == 1)
                        btnOpen.Text = "开放结题";
                    else
                        btnOpen.Visible = false;
                }
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
        }
    }

    protected void btnOpen_Click(object sender, EventArgs e)
    {
        plOpen.Visible = true;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request.QueryString["id"]);
        using (var db = new TeachingCenterEntities())
        {
            if(setIsPass())
            {
                var category = db.ProjectCategory.SingleOrDefault(a => a.id == id);
                category.stage += 1;
                category.end_time = txtTime.Text;
                category.judge_end_time = txtJudgeTime.Text;
                db.SaveChanges();
                Response.Write("<script>alert('开放成功！');location.href='ProCategoryList.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('开放失败！');location.href='ProCategoryList.aspx';</script>");
            }
        }
        
    }

    // 开启下一阶段前将尚未完善的项目和为评判结果的评审记录设置为超时
    protected bool setIsPass()
    {
        try
        {
            // 获取当前项目类型id
            int id = Convert.ToInt32(Request.QueryString["id"]);

            using (var db = new TeachingCenterEntities())
            {
                var category = (from it in db.ProjectCategory where it.id == id select it).FirstOrDefault(); // 当前项目类型
                DateTime end_time = Convert.ToDateTime(category.end_time); // 提交项目截止时间
                DateTime judge_end_time = Convert.ToDateTime(category.judge_end_time); // 评审评判截止时间

                // 遍历所有项目
                var project = from it in db.Project where it.is_deleted == 0 select it;
                foreach (var item in project)
                {
                    // 判断是否属于当前项目类型
                    if (item.category == id)
                    {
                        // 获取该项目当前的阶段
                        var pro = (from it in db.ProjectStage where it.project_id == item.project_id orderby it.stage descending select it).FirstOrDefault();
                        // 若该项目当前阶段落后于项目类型的阶段，则设置为超时
                        if (pro.stage < category.stage)
                            pro.is_pass = -100;

                        // 遍历该项目分配至评审的所有记录
                        var judge = from it in db.ProjectJudge where it.project_id == item.project_id select it;
                        if (judge.Count() != 0)
                        {
                            foreach (var record in judge)
                            {
                                // 若该记录当前阶段落后于项目类型的阶段，则设置为超时
                                if (record.stage < category.stage)
                                    record.is_pass = -100;
                            }
                        }
                        db.SaveChanges();                        
                    }
                }
            }
            return true;
        }
        catch
        {
            return false;
        }
            
    }
}