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
                      select new
                      {
                          ActivitySummary_id = it.ActivitySummary_id,
                          ActivitySummary_title = it.ActivitySummary_title,
                          ActivitySummary_content = it.ActivitySummary_content,
                          ActivitySummary_author = it.ActivitySummary_author,
                          ActivitySummary_time = it.ActivitySummary_time,
                          ActivitySummary_hit = it.ActivitySummary_hit,
                          ActivitySummary_href = "ActivitySummaryContent.aspx?id="
                      };
            int count = asu.Count();
            asu = asu.Skip((page-1) * 5).Take(5);
            ArrayList all = new ArrayList();
            all.Add(cat);
            all.Add(count);
            all.Add(asu);
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