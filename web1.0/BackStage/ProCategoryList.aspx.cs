using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class BackStage_ProCategoryList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string teacher = Session["AdminID"].ToString();
            if (!IsPostBack)
            {
                using (var db = new TeachingCenterEntities())
                {
                    // 绑定项目列表
                    var pro_category = from it in db.ProjectCategory where it.is_deleted == 0 orderby it.end_time descending select it;
                    ltSum.Text = pro_category.Count().ToString();
                    TotalPage.Text = Math.Ceiling(pro_category.Count() / 10.0).ToString();
                    currentPage.Text = "1";
                    rptCategory.DataSource = pro_category.ToList().Take(10);
                    rptCategory.DataBind();
                    Session["ds"] = pro_category.ToList();
                }
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登录！", "Login.aspx");
        }
    }

    protected void rptCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new TeachingCenterEntities())
            {
                var pro_category = db.ProjectCategory.SingleOrDefault(a => a.id == id);
                pro_category.is_deleted = 1;
                pro_category.deletedtime = DateTime.Now;
                db.SaveChanges();
                Server.Transfer("ProCategoryList.aspx");
                //Response.Write("<script>alert('删除成功！');location.href='ProCategoryList.aspx';</script>");
            }
        }
        else if(e.CommandName == "open")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new TeachingCenterEntities())
            {
                var category = db.ProjectCategory.SingleOrDefault(a => a.id == id);
                if(category.stage < 2)
                {
                    plOpen.Visible = true;
                    pro_id.Value = id.ToString();
                }
            }            
        }
    }

    protected void lbtDeleteMore_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in rptCategory.Items)
        {
            HtmlInputCheckBox isDelete = item.FindControl("isDelete") as HtmlInputCheckBox;
            HtmlInputHidden id = item.FindControl("id") as HtmlInputHidden;
            int project_id = Convert.ToInt32(id.Value);
            if (isDelete.Checked)
            {
                using (var db = new TeachingCenterEntities())
                {
                    var pro_category = db.ProjectCategory.SingleOrDefault(a => a.id == project_id);
                    pro_category.is_deleted = 1;
                    pro_category.deletedtime = DateTime.Now;
                    db.SaveChanges();
                }
            }
        }
        Server.Transfer("ProCategoryList.aspx");
        //Response.Write("<script>alert('删除成功！');location.href='ProCategoryList.aspx';</script>");
    }

    protected void lbtSearch_Click(object sender, EventArgs e)
    {
        if ((logmin.Text == "" && logmax.Text != "") || (logmin.Text != "" && logmax.Text == ""))
        {
            Response.Write("<script>alert('请选择完整的日期范围！');</script>");
        }
        else
        {
            string project_name = "";
            if (txtName.Text.Length != 0)
                project_name = txtName.Text;
            List<ProjectCategory> result = new List<ProjectCategory>();
            using (var db = new TeachingCenterEntities())
            {
                var pro_category = from it in db.ProjectCategory where it.is_deleted == 0 orderby it.end_time select it;
                if (project_name != "")
                    pro_category = from it in db.ProjectCategory where it.name.IndexOf(project_name) >= 0 && it.is_deleted == 0 orderby it.end_time select it;
                if (logmin.Text != "" && logmax.Text != "")
                {
                    DateTime min = Convert.ToDateTime(logmax.Text);
                    DateTime max = Convert.ToDateTime(logmin.Text);
                    foreach (ProjectCategory item in pro_category)
                    {
                        DateTime time = Convert.ToDateTime(item.end_time);
                        if (DateTime.Compare(time, min) < 0 && DateTime.Compare(time, max) > 0)
                            result.Add(item);
                    }
                }
                else if (logmin.Text == "" && logmax.Text == "")
                    result = pro_category.ToList();
                if (result.Count != 0)
                {
                    currentPage.Text = "1";
                    TotalPage.Text = Math.Ceiling(result.Count() / 10.0).ToString();
                    rptCategory.DataSource = result.ToList().Take(10);
                    rptCategory.DataBind();
                    ltSum.Text = result.Count().ToString();
                    Session["ds"] = result.ToList();
                }
                else
                {
                    Response.Write("<script>alert('搜索无结果！');location.href='ProCategoryList.aspx';</script>");
                }
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(pro_id.Value.ToString());
        using (var db = new TeachingCenterEntities())
        {
            if (setIsPass())
            {
                var category = db.ProjectCategory.SingleOrDefault(a => a.id == id);
                DateTime now = DateTime.Now;
                if (DateTime.Compare(now, Convert.ToDateTime(category.end_time)) < 0)
                    Response.Write("<script>alert('项目提交尚未结束，暂时无法开启下一阶段！');</script>");
                else if (DateTime.Compare(now, Convert.ToDateTime(category.judge_end_time)) < 0)
                    Response.Write("<script>alert('评审工作尚未结束，暂时无法开启下一阶段！');</script>");
                else
                {
                    category.stage += 1;
                    category.end_time = txtTime.Text;
                    category.judge_end_time = txtJudgeTime.Text;
                    db.SaveChanges();
                    //Response.Write("<script>alert('开放成功！');location.href='ProCategoryList.aspx';</script>");
                    Server.Transfer("ProCategoryList.aspx");
                }
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
            int id = Convert.ToInt32(pro_id.Value.ToString());

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
                        if (pro.stage < category.stage || pro.is_pass < 0)
                        {
                            pro.is_pass = -100;
                        }

                        // 遍历该项目分配至评审的所有记录
                        var judge = from it in db.ProjectJudge where it.project_id == item.project_id select it;
                        if (judge.Count() != 0)
                        {
                            foreach (var record in judge)
                            {
                                // 若该记录当前阶段落后于项目类型的阶段，则设置为超时
                                if (record.is_pass == -1)
                                {
                                    record.is_pass = -100;
                                }
                            }
                        }
                    }

                }
                db.SaveChanges();
            }
            return true;
        }
        catch
        {
            return false;
        }

    }

    protected void Prev_Click(object sender, EventArgs e)
    {
        List<ProjectCategory> ls = new List<ProjectCategory>();
        if (Session["ds"] != null)
            ls = (List<ProjectCategory>)Session["ds"];
        int page = Convert.ToInt32(currentPage.Text) - 1;
        if (page < 1)
        {
            page = 1;
        }
        currentPage.Text = page.ToString();
        rptCategory.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptCategory.DataBind();
    }

    protected void First_Click(object sender, EventArgs e)
    {
        List<ProjectCategory> ls = new List<ProjectCategory>();
        if (Session["ds"] != null)
            ls = (List<ProjectCategory>)Session["ds"];
        currentPage.Text = "1";
        rptCategory.DataSource = ls.Skip(0).Take(10);
        rptCategory.DataBind();
    }

    protected void Last_Click(object sender, EventArgs e)
    {
        List<ProjectCategory> ls = new List<ProjectCategory>();
        if (Session["ds"] != null)
            ls = (List<ProjectCategory>)Session["ds"];
        int page = Convert.ToInt32(TotalPage.Text);
        currentPage.Text = page.ToString();
        rptCategory.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptCategory.DataBind();
    }

    protected void Next_Click(object sender, EventArgs e)
    {
        List<ProjectCategory> ls = new List<ProjectCategory>();
        if (Session["ds"] != null)
            ls = (List<ProjectCategory>)Session["ds"];
        int page = Convert.ToInt32(currentPage.Text) + 1;
        if (page > Convert.ToInt32(TotalPage.Text))
        {
            page = 1;
        }
        currentPage.Text = page.ToString();
        rptCategory.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptCategory.DataBind();
    }

    protected void Jump_Click(object sender, EventArgs e)
    {
        List<ProjectCategory> ls = new List<ProjectCategory>();
        if (Session["ds"] != null)
            ls = (List<ProjectCategory>)Session["ds"];
        int page = 1;
        if (turnTopage.Text.Length != 0)
        {
            page = Convert.ToInt32(turnTopage.Text);
        }
        if (page > Convert.ToInt32(TotalPage.Text) || page <= 0)
        {
            page = 1;
        }
        currentPage.Text = page.ToString();
        rptCategory.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptCategory.DataBind();
    }

    public static string getCategoryName(int id)
    {
        using (var db = new TeachingCenterEntities())
        {
            ProCatCategory pc = db.ProCatCategory.Single(a => a.ProCatCategory_id == id);
            return pc.ProCatCategory_name;
        }
    }
}