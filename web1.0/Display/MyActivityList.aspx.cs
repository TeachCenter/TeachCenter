using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Display_MyActivityList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var db = new TeachingCenterEntities())
        {
            //int teacher = TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString());
            int teacher = 1;
            var at = from it in db.ActivityTeacher where it.teacher_id == teacher select it;
            List<Activity> ac = new List<Activity>();
            foreach (var i in at)
            {
                Activity activity = db.Activity.Single(a => a.Activity_id == i.activity_id);
                ac.Add(activity);
            }
            rptActivity.DataSource = ac;
            rptActivity.DataBind();
        }
    }

    protected void rptActivity_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            //int teacher = TeacherHelper.getTeacherIDByNumber(Session["TeacherNumber"].ToString());
            int teacher = 1;
            using (var db = new TeachingCenterEntities())
            {
                ActivityTeacher at = db.ActivityTeacher.Single(a => a.activity_id == id && a.teacher_id == teacher);
                db.ActivityTeacher.Remove(at);
                Activity ac = db.Activity.Single(a => a.Activity_id == id);
                
                ac.Activity_nowcount--;
                db.SaveChanges();
                JSHelper.ShowAlert("取消成功！");
                JSHelper.js("window.location.reload();");
            }
        }
    }

    protected void rptActivity_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            LinkButton linkbuttom = (LinkButton)e.Item.FindControl("lbtDelete");
            int id = Convert.ToInt32(linkbuttom.Text);
            using (var db = new TeachingCenterEntities())
            {
                Activity ac = db.Activity.Single(a => a.Activity_id == id);
                linkbuttom.Text = ac.Activity_time < DateTime.Now ? "" : "取消参与该活动";
            }
            
        }
     }
}