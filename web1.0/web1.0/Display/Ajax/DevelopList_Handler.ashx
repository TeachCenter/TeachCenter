<%@ WebHandler Language="C#" Class="Develop_Handler" %>

using System;
using System.Web;
using System.Linq;
using Newtonsoft.Json;
using System.Collections;
using System.Collections.Generic;

public class Develop_Handler : IHttpHandler {
    private class Dev
    {
        public int Develop_id;
        public string Develop_title;
        public string Develop_content;
        public string Develop_author;
        public int Develop_hit;
        public string Develop_link;
        public string Develop_href;
        public string Develop_time;
        public DateTime Devlop_times;
    }

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        int category = 0;
        try
        {
            category = Convert.ToInt32(context.Request.Form["category"]);
        }
        catch
        {

        }

        //int categoryid = 0,page = 1;
        int page = 1;
        try
        {
            page = Convert.ToInt32( context.Request.Form["page"]);
        }
        catch
        {

        }
        using (var db = new TeachingCenterEntities())
        {
            var categorys = from it in db.DevelopCategory
                            select new
                            {
                                DevelopCategory_id = it.DevelopCategory_id,
                                DevelopyCategory_name = it.DevelopCategory_name,
                                DevelopCategory_href = "DevelopList.aspx?type="
                            };
            category = categorys.Count() >= category ? category : 0;
            var dev = from it in db.Develop
                      where it.Develop_deleted == 0
                      orderby it.Develop_time descending
                      select new Dev
                      {
                          Develop_id = it.Develop_id,
                          Develop_title = it.Develop_title,
                          Develop_content = it.Develop_content,
                          Develop_author = it.Develop_author,
                          Develop_hit = it.Develop_hit,
                          Develop_link = it.Develop_link,
                          Develop_href = it.Develop_link=="" ? "DevelopContent.aspx?id=" : it.Develop_link,
                          Devlop_times = it.Develop_time
                      };
            if (category != 0)
            {
                dev = from it in db.Develop
                      where it.Develop_deleted == 0 && it.Develop_category == category
                      orderby it.Develop_time descending
                      select new Dev
                      {
                          Develop_id = it.Develop_id,
                          Develop_title = it.Develop_title,
                          Develop_content = it.Develop_content,
                          Develop_author = it.Develop_author,
                          Develop_hit = it.Develop_hit,
                          Develop_link = it.Develop_link,
                          Develop_href = it.Develop_link=="" ? "DevelopContent.aspx?id=" : it.Develop_link,
                          Devlop_times = it.Develop_time
                      };
            }
            int count = dev.Count();
            dev = dev.Skip((page-1) * 6).Take(6);
            List<Dev> list = new List<Dev>();
            foreach(var it in dev)
            {
                Dev d = new Dev();
                d.Develop_id = it.Develop_id;
                d.Develop_title = it.Develop_title;
                d.Develop_content = MyHtmlHelper.RemoveTags( context.Server.HtmlDecode( it.Develop_content));
                d.Develop_author = it.Develop_author;
                d.Develop_hit = it.Develop_hit;
                d.Develop_link = it.Develop_link;
                d.Develop_href = it.Develop_href;
                d.Develop_time = it.Devlop_times.ToShortDateString() + " " + it.Devlop_times.TimeOfDay.ToString().Substring(0,8);
                list.Add(d);
            }
            string name;
            if (category != 0)
                name = DevelopHelper.getCategoryName(category);
            else
                name = "全部教学发展";
            ArrayList all = new ArrayList();
            all.Add(categorys);
            all.Add(count);
            all.Add(list);
            all.Add(name);
            string final = JsonConvert.SerializeObject(all);
            context.Response.Write(final);
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}