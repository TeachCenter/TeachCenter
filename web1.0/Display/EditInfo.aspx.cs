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
        try
        {
            //判断是不是评审
            if (!TeacherHelper.isJudge(Session["TeacherNumber"].ToString()))
                liJudge.Visible = false;

            //Session["TeacherNumber"] = 1;
            if (!IsPostBack)
            {
                DataTable dt = DepartmentHelper.getDepartment();
                rptSelect.DataSource = dt;
                rptSelect.DataBind();

                int teacher_id = 1;
                if (Session["TeacherNumber"] != null)
                    teacher_id = Convert.ToInt32(TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString()));
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
                    HtmlInputHidden gender = FindControl("gender") as HtmlInputHidden;
                    gender.Value = teacher.gender.ToString();
                    HtmlInputHidden department = FindControl("lbSelected") as HtmlInputHidden;
                    department.Value = teacher.department;
                }
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登录！", "main-index.aspx");
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
        HtmlInputHidden gender = FindControl("gender") as HtmlInputHidden;
        gender.Value = "0";
    }

    protected void man_Click(object sender, EventArgs e)
    {
        HtmlInputHidden gender = FindControl("gender") as HtmlInputHidden;
        gender.Value = "1";
    }

    protected void lbtnSubmit_Click(object sender, EventArgs e)
    {
        string name = txtName.Text;
        HtmlInputHidden gender = FindControl("gender") as HtmlInputHidden;
        HtmlInputHidden depart = FindControl("lbSelected") as HtmlInputHidden;
        string sex = gender.Value;
        string number = txtNumber.Text;
        string email = txtEmail.Text;
        string phone = txtPhone.Text;
        string rank = txtRank.Text;
        string department = depart.Value;
        if(name.Length == 0)
            Response.Write("<script>alert('姓名不能为空！');</script>");
        else if(sex == "")
            Response.Write("<script>alert('请选择性别！');</script>");
        else if(number.Length == 0)
            Response.Write("<script>alert('工号不能为空！');</script>");
        else if (email.Length == 0)
            Response.Write("<script>alert('邮箱不能为空！');</script>");
        else if (phone.Length == 0)
            Response.Write("<script>alert('手机不能为空！');</script>");
        else if (rank.Length == 0)
            Response.Write("<script>alert('职称不能为空！');</script>");
        else if (department == "")
            Response.Write("<script>alert('院系不能为空！');</script>");
        else
        {
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
}