using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Text;
using System.Web.UI.WebControls;

public partial class BackStage_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnBeigin_Click(object sender, EventArgs e)
    {
        Read(Server.MapPath(".")+ "\\data\\ac.txt");
    }
    public void Read(string path)
    {
        StreamReader sr = new StreamReader(path, System.Text.Encoding.GetEncoding("utf-8"));
        string line = sr.ReadLine();
        while (line != null)
        {
            string title = line.ToString().Length > 40 ?line.ToString().Substring(0,40): line.ToString();
            string time = sr.ReadLine().ToString() + " 20:26:50.557";
            sr.ReadLine();
            string img = sr.ReadLine();
            if (img == "" || img.TrimStart() == "")
                img = ".\\dataimg\\6367117527503186294767178.jpg";
            //sr.ReadLine();
            string content = sr.ReadLine().ToString().TrimStart();
            line = sr.ReadLine();
            //line = sr.ReadLine().TrimStart();
            //while (line != null && line[0] == '<')
            //{
            //    content += line;
            //    line = sr.ReadLine();
            //}
            //line = sr.ReadLine();

            using (var db = new TeachingCenterEntities())
            {
                ActivitySummary acsu = new ActivitySummary();
                acsu.ActivitySummary_title = title;
                acsu.ActivitySummary_content = content;
                acsu.ActivitySummary_time = Convert.ToDateTime(time);
                acsu.ActivitySummary_summary = title;
                acsu.ActivitySummary_cover = img.TrimStart();
                acsu.ActivitySummary_author = "系统管理员";
                db.ActivitySummary.Add(acsu);
                db.SaveChanges();
                JSHelper.AlertThenRedirect("发布成功！", "ActivitySummaryManage.aspx");
                //Server.Transfer("ActivitySummaryManage.aspx");
            }




        }
    }
}