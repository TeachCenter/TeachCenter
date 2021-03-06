﻿using System;
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
                if (service.Count() == 0)
                    services.Visible = false;

                int number = 0;
                var apply = from it in db.JudgeApplication select it;
                //foreach(var a in apply)
                //{
                //    var record = (from b in db.ProjectStage where b.project_id == a orderby b.stage descending select b).FirstOrDefault();
                //    if (record.is_pass == -2)
                //        number++;
                //}
                number = apply.Count();
                if (number == 0)
                    applys.Visible = false;
                ltApply.Text = number.ToString();

                int p_number = 0;
                var project = from it in db.Project where it.is_deleted == 0 select it;
                foreach(var item in project)
                {
                    var project_stage = (from it in db.ProjectStage where it.project_id == item.project_id orderby it.stage descending select it).FirstOrDefault();
                    if (project_stage.is_pass == -1 || project_stage.is_pass == -2)
                        p_number++;
                }
                if (p_number == 0)
                    projects.Visible = false;
                ltProject.Text = p_number.ToString();
                Admin admin = db.Admin.Single(a => a.Admin_id == teacher);
                if (admin.Admin_emai_check == 0)
                    email.Visible = true;
             }
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登录！", "Login.aspx");
        }
    }
}