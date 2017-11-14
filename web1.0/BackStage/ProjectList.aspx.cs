using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;

public partial class BackStage_ProjectList : System.Web.UI.Page
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
                    var project = from it in db.ProjectInfo where it.is_deleted == 0 orderby it.submit_time descending select it;
                    ltSum.Text = project.Count().ToString();
                    TotalPage.Text = Math.Ceiling(project.Count() / 10.0).ToString();
                    currentPage.Text = "1";
                    rptProject.DataSource = project.ToList().Take(10);
                    rptProject.DataBind();
                    Session["ds"] = project.ToList();

                    // 绑定项目分类下拉框
                    var category = from it in db.ProjectCategory where it.is_deleted == 0 select it;
                    this.DropDownList.DataSource = category.ToList();
                    this.DropDownList.DataValueField = "id";
                    this.DropDownList.DataTextField = "name";
                    this.DropDownList.DataBind();
                    ListItem item = new ListItem();
                    item.Text = "全部分类";
                    item.Value = "0";
                    this.DropDownList.Items.Insert(0, item);
                }
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
        }         
    }

    // 列表中删除一行
    protected void rptProject_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            using (var db = new TeachingCenterEntities())
            {
                var project = db.Project.SingleOrDefault(a => a.project_id == id);
                project.is_deleted = 1;
                project.deletedtime = DateTime.Now;
                db.SaveChanges();
                Response.Write("<script>alert('删除成功！');location.href='ProjectList.aspx';</script>");
            }
        }
    }

    // 批量删除
    protected void lbtDeleteMore_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in rptProject.Items)
        {
            HtmlInputCheckBox isDelete = item.FindControl("isDelete") as HtmlInputCheckBox;
            HtmlInputHidden id = item.FindControl("id") as HtmlInputHidden;
            int project_id = Convert.ToInt32(id.Value);
            if(isDelete.Checked)
            {
                using (var db = new TeachingCenterEntities())
                {
                    var project = db.Project.SingleOrDefault(a => a.project_id == project_id);
                    project.is_deleted = 1;
                    project.deletedtime = DateTime.Now;
                    db.SaveChanges();                    
                }
            }
        }
        Response.Write("<script>alert('删除成功！');location.href='ProjectList.aspx';</script>");
    }

    // 下拉选择分类切换列表内容
    protected void DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        int category = Convert.ToInt32(DropDownList.SelectedValue);
        using (var db = new TeachingCenterEntities())
        {
            var project = from it in db.ProjectInfo where it.category == category  && it.is_deleted == 0 orderby it.submit_time descending select it;
            if(category == 0)
                project = from it in db.ProjectInfo where it.is_deleted == 0 orderby it.submit_time descending select it;
            ltSum.Text = project.Count().ToString();
            currentPage.Text = "1";
            TotalPage.Text = Math.Ceiling(project.Count() / 10.0).ToString();
            rptProject.DataSource = project.ToList().Take(10);
            rptProject.DataBind();
            Session["ds"] = project.ToList();
        }
        Session["category"] = category;
    }

    protected void lbtSearch_Click(object sender, EventArgs e)
    {                
        if ((logmin.Text == "" && logmax.Text != "") || (logmin.Text != "" && logmax.Text == ""))
        {
            Response.Write("<script>alert('请选择完整的日期范围！');</script>");
        }
        else
        {
            int category = 0;
            if(Session["category"] != null)
                category = Convert.ToInt32(Session["category"].ToString());
            string project_name = "";
            if (txtName.Text.Length != 0)
                project_name = txtName.Text;
            List<ProjectInfo> result = new List<ProjectInfo>();           
            using (var db = new TeachingCenterEntities())
            {
                var project = from it in db.ProjectInfo where it.is_deleted == 0 orderby it.submit_time descending select it;
                if (category == 0 && project_name != "")
                {
                    project = from it in db.ProjectInfo where it.name.IndexOf(project_name) >= 0 && it.is_deleted == 0 orderby it.submit_time descending select it;
                }
                if (category != 0)
                {
                    project = from it in db.ProjectInfo where it.category == category && it.is_deleted == 0 orderby it.submit_time descending select it;
                    if (project_name != "")
                        project = from it in db.ProjectInfo where it.category == category && it.name.IndexOf(project_name) >= 0 && it.is_deleted == 0 orderby it.submit_time descending select it;
                }
                if (logmin.Text != "" && logmax.Text != "")
                {
                    DateTime min = Convert.ToDateTime(logmax.Text);
                    DateTime max = Convert.ToDateTime(logmin.Text);
                    foreach (ProjectInfo item in project)
                    {
                        DateTime time = Convert.ToDateTime(item.submit_time);
                        if (DateTime.Compare(time, min) < 0 && DateTime.Compare(time, max) > 0)
                            result.Add(item);
                    }
                }
                else if (logmin.Text == "" && logmax.Text == "")
                {
                    result = project.ToList();
                }
                if (result.Count != 0)
                {
                    currentPage.Text = "1";
                    TotalPage.Text = Math.Ceiling(result.Count() / 10.0).ToString();
                    rptProject.DataSource = result.ToList().Take(10);
                    rptProject.DataBind();
                    ltSum.Text = result.Count().ToString();
                    Session["ds"] = result.ToList();
                }
                else
                {
                    Response.Write("<script>alert('搜索无结果！');location.href='ProjectList.aspx';</script>");
                }
            }
        }       
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        List<ProjectInfo> ls = new List<ProjectInfo>();
        if (Session["ds"] != null)
            ls = (List<ProjectInfo>)Session["ds"];
        DataTable dt = new DataTable();
        DataColumn dc1 = new DataColumn("项目名称", System.Type.GetType("System.String"));
        DataColumn dc2 = new DataColumn("项目类型", System.Type.GetType("System.String"));
        DataColumn dc3 = new DataColumn("提交者", System.Type.GetType("System.String"));
        DataColumn dc4 = new DataColumn("提交时间", System.Type.GetType("System.String"));
        dt.Columns.Add(dc1);
        dt.Columns.Add(dc2);
        dt.Columns.Add(dc3);
        dt.Columns.Add(dc4);
        foreach(ProjectInfo item in ls)
        {
            DataRow row = dt.NewRow();
            row["项目名称"] = item.name;
            row["项目类型"] = item.category_name;
            row["提交者"] = item.teacher_name;
            row["提交时间"] = item.submit_time;
            dt.Rows.Add(row);
        }
        ExcleHelper.ExportDataGrid(dt, "application/ms-excel", "项目列表.xlsx");
    }

    protected void Prev_Click(object sender, EventArgs e)
    {
        List<ProjectInfo> ls = new List<ProjectInfo>();
        if(Session["ds"] != null)
            ls = (List<ProjectInfo>)Session["ds"];
        int page = Convert.ToInt32(currentPage.Text) - 1;
        if (page < 1)
        {
            page = 1;
        }
        currentPage.Text = page.ToString();
        rptProject.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptProject.DataBind();
    }

    protected void First_Click(object sender, EventArgs e)
    {
        List<ProjectInfo> ls = new List<ProjectInfo>();
        if (Session["ds"] != null)
            ls = (List<ProjectInfo>)Session["ds"];
        currentPage.Text = "1";
        rptProject.DataSource = ls.Skip(0).Take(10);
        rptProject.DataBind();
    }

    protected void Last_Click(object sender, EventArgs e)
    {
        List<ProjectInfo> ls = new List<ProjectInfo>();
        if (Session["ds"] != null)
            ls = (List<ProjectInfo>)Session["ds"];
        int page = Convert.ToInt32(TotalPage.Text);
        currentPage.Text = page.ToString();
        rptProject.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptProject.DataBind();
    }

    protected void Next_Click(object sender, EventArgs e)
    {
        List<ProjectInfo> ls = new List<ProjectInfo>();
        if (Session["ds"] != null)
            ls = (List<ProjectInfo>)Session["ds"];
        int page = Convert.ToInt32(currentPage.Text) + 1;
        if (page > Convert.ToInt32(TotalPage.Text))
        {
            page = 1;
        }
        currentPage.Text = page.ToString();
        rptProject.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptProject.DataBind();
    }

    protected void Jump_Click(object sender, EventArgs e)
    {
        List<ProjectInfo> ls = new List<ProjectInfo>();
        if (Session["ds"] != null)
            ls = (List<ProjectInfo>)Session["ds"];
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
        rptProject.DataSource = ls.Skip(10 * (page - 1)).Take(10);
        rptProject.DataBind();
    }

}