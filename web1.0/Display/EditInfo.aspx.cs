using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;

public partial class Display_EditInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["TeacherNumber"] = 1;
        if (!IsPostBack)
        {
            DataTable dt = DepartmentHelper.getDepartment();
            rptSelect.DataSource = dt;
            rptSelect.DataBind();

            int teacher_id = 1;
            if (Session["TeacherNumber"] != null)
                teacher_id = Convert.ToInt32(Session["TeacherNumber"].ToString());
            else
                Response.Redirect("main-index.aspx");
            using (var db = new TeachingCenterEntities())
            {
                var teacher = (from it in db.Teacher where it.id == teacher_id select it).FirstOrDefault();
                txtName.Text = teacher.name;
                txtNumber.Text = teacher.number;
                txtEmail.Text = teacher.email;
                txtPhone.Text = teacher.phone_number;
                txtRank.Text = teacher.rank;
                depart.Text = teacher.department;
                lbType.Text = teacher.is_judge == 0 ? "教师" : "评委";
                if (teacher.is_judge == 1)
                    applyJudge.Visible = false;
                ContentPlaceHolder ContentPlaceHolder1 = Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
                HtmlInputHidden gender = ContentPlaceHolder1.FindControl("gender") as HtmlInputHidden;
                gender.Value = teacher.gender.ToString();
            }
        }       
    }

    protected void applyJudge_Click(object sender, EventArgs e)
    {
        int teacher_id = Convert.ToInt32(Session["TeacherNumber"].ToString());
        using (var db = new TeachingCenterEntities())
        {
            var record = from it in db.JudgeApplication where it.teacher_id == teacher_id select it;
            if(record.Count() != 0)
                Response.Write("<script>alert('已提交过申请，请耐心等待管理员审核！');</script>");
            else
            {
                JudgeApplication apply = new JudgeApplication();
                apply.teacher_id = teacher_id;
                apply.submit_time = DateTime.Now.ToString("yyyy-MM-dd");
                db.JudgeApplication.Add(apply);
                db.SaveChanges();
                Response.Write("<script>alert('申请已提交至后台，请等待管理员审核！');location.href='EditInfo.aspx';</script>");
            }           
        }

    }

    protected void woman_Click(object sender, EventArgs e)
    {
        ContentPlaceHolder ContentPlaceHolder1 = Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
        HtmlInputHidden gender = ContentPlaceHolder1.FindControl("gender") as HtmlInputHidden;
        gender.Value = "0";
    }

    protected void man_Click(object sender, EventArgs e)
    {
        ContentPlaceHolder ContentPlaceHolder1 = Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
        HtmlInputHidden gender = ContentPlaceHolder1.FindControl("gender") as HtmlInputHidden;
        gender.Value = "1";
    }

    protected void lbtnSubmit_Click(object sender, EventArgs e)
    {
        string name = txtName.Text;
        ContentPlaceHolder ContentPlaceHolder1 = Master.FindControl("ContentPlaceHolder1") as ContentPlaceHolder;
        HtmlInputHidden gender = ContentPlaceHolder1.FindControl("gender") as HtmlInputHidden;
        HtmlInputHidden depart = ContentPlaceHolder1.FindControl("Selected") as HtmlInputHidden;
        string sex = gender.Value;
        string number = txtNumber.Text;
        string email = txtEmail.Text;
        string phone = txtPhone.Text;
        string rank = txtRank.Text;
        string department = depart.Value;
        using (var db = new TeachingCenterEntities())
        {
            int teacher_id = Convert.ToInt32(Session["TeacherNumber"].ToString());
            var teacher = (from it in db.Teacher where it.id == teacher_id select it).FirstOrDefault();
            teacher.name = name;
            teacher.gender = Convert.ToInt32(sex);
            teacher.email = email;
            teacher.number = number;
            teacher.phone_number = phone;
            teacher.department = department;
            teacher.rank = rank;
            db.SaveChanges();
            Response.Write("<script>alert('修改成功！');location.href='EditInfo.aspx';</script>");
        }
    }
}