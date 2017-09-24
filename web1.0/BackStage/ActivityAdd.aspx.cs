using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_ActivityAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var db = new TeachingCenterEntities())
        {
            var cate = from it in db.ActivityCategory select it;

            dropCategory.DataSource = cate.ToList();

            dropCategory.DataTextField = "ActivityCategory_name";

            dropCategory.DataBind();
        }
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        string title = txtTitle.Text;
        string date = logmin.Value;
        string hour = txtHour.Text;
        string minute = txtMinute.Text;
        string place = txtPlace.Text;
        string count = txtLimit.Text;
        string category = dropCategory.SelectedValue;
        string content = myEditor11.InnerHtml;
        if (title.Length == 0 || date.Length == 0 || hour.Length == 0 || minute.Length == 0 || place.Length == 0 || count.Length == 0 || content.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else
        {
            try
            {
                using (var db = new TeachingCenterEntities())
                {
                    Activity ac = new Activity();
                    ac.Activity_title = title;
                    DateTime dt = Convert.ToDateTime(date);
                    dt.AddHours(Convert.ToInt16(hour));
                    dt.AddMinutes(Convert.ToInt16(minute));
                    ac.Activity_time = dt;
                    ac.Activity_content = content;
                    ac.Activity_place = place;
                    ac.Activity_limitcount = Convert.ToInt32(count);
                    ac.Activity_categoryid = ActivityHelper.getCategoryId(category);
                    db.Activity.Add(ac);
                    db.SaveChanges();
                    JSHelper.AlertThenRedirect("发布成功！", "ActivityManage.aspx");
                }
            }
            catch
            {
                JSHelper.ShowAlert("存在非法输入！");
            }
        }
    }
}