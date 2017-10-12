using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_ActivityContent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lbtAdd_Click(object sender, EventArgs e)
    {

        try
        {
            string alert;
            //int teacher = TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString());
            int teacher = 1;
            int id = Convert.ToInt32(Request.QueryString["id"].ToString());
            //int teacher = 1, id = 3;
            using (var db = new TeachingCenterEntities())
            {
                Activity ac = db.Activity.Single(a => a.Activity_id == id);
                if (ac.Activity_nowcount >= ac.Activity_limitcount)
                    alert = "操作失败，人数已达到上限。";
                else if (ac.Activity_time < DateTime.Now)
                    alert = "该活动已结束！";
                else
                {
                    var acs = from it in db.ActivityTeacher where it.teacher_id == teacher && it.activity_id == id select it;

                    if (acs.Count() > 0)
                        alert = "您已参加了该项目！";
                    else
                    {
                        ac.Activity_nowcount++;
                        //db.SaveChanges();
                        ActivityTeacher at = new ActivityTeacher();
                        at.activity_id = id;
                        at.teacher_id = teacher;
                        db.ActivityTeacher.Add(at);
                        db.SaveChanges();
                        alert = "参与成功！";
                    }

                }
            }
            JSHelper.ShowAlert(alert);
        }
        catch (Exception ex)
        {
            JSHelper.AlertThenRedirect("请先登陆！" + ex.Message, "Login.aspx");
        }
    }
}