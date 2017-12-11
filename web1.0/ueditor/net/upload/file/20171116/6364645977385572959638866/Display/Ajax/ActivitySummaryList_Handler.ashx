<%@ WebHandler Language="C#" Class="ActivitySummaryList" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using System.Collections;
using System;

public class ActivitySummaryList : IHttpHandler {

    private class Category {
        public int ActivityCategory_id;
        public string ActivityCategory_name;
        public string ActivityCategory_href;
    }
    private class Asu
    {
        public int ActivitySummary_id;
        public string ActivitySummary_title;
        public string ActivitySummary_content;
        public string ActivitySummary_author;
        public string ActivitySummary_time;
        public DateTime ActivitySummary_times;
        public int ActivitySummary_hit;
        public string ActivitySummary_href;
    }
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        using (var db = new TeachingCenterEntities())
        {
            //活动分类
            var catacorys = from it in db.ActivityCategory
                            select new
                            {
                                ActivityCategory_id = it.ActivityCategory_id,
                                ActivityCategory_name = it.ActivityCategory_name,
                                ActivityCategory_href = "ActivityList.aspx?type="
                            };

            List<Category> cat = new List<Category>();

            foreach (var i in catacorys)
            {
                Category x = new Category();
                x.ActivityCategory_href = i.ActivityCategory_href + i.ActivityCategory_id.ToString() + "&&page=1";
                x.ActivityCategory_name = i.ActivityCategory_name;
                x.ActivityCategory_id = i.ActivityCategory_id;
                cat.Add(x);
            }
            Category category = new Category();
            category.ActivityCategory_id = 0;
            category.ActivityCategory_name = "活动总结";
            category.ActivityCategory_href = "ActivitySummaryList.aspx?page=1";
            cat.Add(category);

            //活动总结列表
            int page = Convert.ToInt32( context.Request.Form["page"]);
            var asu = from it in db.ActivitySummary
                      where it.ActivitySummary_isdeleted == 0
                      orderby it.ActivitySummary_time descending
                      select new  Asu
                      {
                          ActivitySummary_id = it.ActivitySummary_id,
                          ActivitySummary_title = it.ActivitySummary_title,
                          ActivitySummary_content = it.ActivitySummary_content,
                          ActivitySummary_author = it.ActivitySummary_author,
                          ActivitySummary_times = it.ActivitySummary_time,
                          ActivitySummary_hit = it.ActivitySummary_hit,
                          ActivitySummary_href = "ActivitySummaryContent.aspx?id="
                      };
            int count = asu.Count();
            asu = asu.Skip((page-1) * 6).Take(6);
            List<Asu> list = new List<Asu>();
            foreach(var it in asu)
            {
                Asu a = new Asu();
                a.ActivitySummary_id = it.ActivitySummary_id;
                a.ActivitySummary_title = it.ActivitySummary_title;
                a.ActivitySummary_content = MyHtmlHelper.RemoveTags( context.Server.HtmlDecode( it.ActivitySummary_content));
                a.ActivitySummary_author = it.ActivitySummary_author;
                a.ActivitySummary_time = it.ActivitySummary_times.Date.ToString().Substring(0,9) + " " + it.ActivitySummary_times.TimeOfDay.ToString().Substring(0, 8);
                a.ActivitySummary_hit = it.ActivitySummary_hit;
                a.ActivitySummary_href = it.ActivitySummary_href;
                list.Add(a);
            }
            ArrayList all = new ArrayList();
            all.Add(cat);
            all.Add(count);
            all.Add(list);
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