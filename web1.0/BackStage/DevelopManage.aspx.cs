using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_DevelopManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (var db = new TeachingCenterEntities())
        {
            var dev = from it in db.Develop where it.Develop_deleted == 0 orderby it.Develop_id descending select it;
            ltSum.Text = dev.Count().ToString();
            rptDev.DataSource = dev.ToList().Take(10);
            rptDev.DataBind();
        }
    }

    protected void rptDev_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            LinkButton lbt = (LinkButton)FindControl("lbtDelete");
            string a = lbt.OnClientClick = "return confirm('您确认提交该记录吗?');";
            JSHelper.ShowAlert(a);
            /*using (var db = new TeachingCenterEntities())
            {
                Develop dev = db.Develop.SingleOrDefault(a => a.Develop_id == id);
                //db.Develop.Remove(dev);
                dev.Develop_deleted = 1;
                db.SaveChanges();
                //rptDev.DataBind();
                JSHelper.ShowAlert("删除成功！");
                JSHelper.Redirect("DevelopManage.aspx");
            }*/
        }

    }
}