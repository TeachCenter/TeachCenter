using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_Welcome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string teacher = Session["AdminID"].ToString();
            ltName.Text = AdminHelper.getNameByID(teacher);
            using (var db = new TeachingCenterEntities())
            {
                var service = from it in db.Service where it.Service_isdeal == 0 && it.Service_isdeleted == 0 select it;
                ltServese.Text = service.ToList().Count().ToString();
                var apply = from it in db.JudgeApplication select it;
                ltApply.Text = apply.Count().ToString();
            }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登陆！", "Login.aspx");
        }
    }
}