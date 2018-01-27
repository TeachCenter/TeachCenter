<%@ WebHandler Language="C#" Class="ActivityList" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using System.Collections;
using System;

public class ActivityList : IHttpHandler {

    private class Category {
        public int ActivityCategory_id;
        public string ActivityCategory_name;
        public string ActivityCategory_href;
    }
    private class Ac {
        public int Activity_id;
        public string Activity_title;
        public string Activity_content;
        public string Activity_author;
        public int Activity_hit;
        public DateTime Activity_times;
        public string Activity_time;
        public string Activity_href;
    }
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
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

            foreach(var i in catacorys)
            {
                Category x = new Category();
                x.ActivityCategory_href = i.ActivityCategory_href + i.ActivityCategory_id.ToString() + "&&page=1";
                x.ActivityCategory_name = i.ActivityCategory_name;
                x.ActivityCategory_id = i.ActivityCategory_id;
                cat.Add(x);
            }
            Category category = new Category();
            category.ActivityCategory_id = -1;
            category.ActivityCategory_name = "活动总结";
            category.ActivityCategory_href = "ActivitySummaryList.aspx?page=1";
            cat.Add(category);


            //活动列表
            int categoryid = 0;
            try
            {
                categoryid = Convert.ToInt32(context.Request.Form["ActivityCategory_id"]);
            }
            catch
            {
                
            }
            categoryid = catacorys.Count() >= categoryid ? categoryid : 0;
            //int categoryid = 0,page = 1;
            int page = 1;
            try
            {
                page = Convert.ToInt32( context.Request.Form["page"]);
            }
            catch
            {

            }
            var  ac = (from it in db.Activity
                       where it.Activity_isdeleted == 0
                       orderby it.Activity_time descending
                       select new Ac
                       {
                           Activity_id = it.Activity_id,
                           Activity_title = it.Activity_title,
                           Activity_content = it.Activity_content,
                           Activity_author = it.Activity_author,
                           Activity_hit = it.Activity_hit,
                           Activity_times = it.Activity_time,
                           Activity_href = "ActivityContent.aspx?id="
                       });
            if(categoryid!=0)
            {
                ac = from it in db.Activity
                     where it.Activity_isdeleted == 0 && it.Activity_categoryid == categoryid
                     orderby it.Activity_time descending
                     select new Ac
                     {
                         Activity_id = it.Activity_id,
                         Activity_title = it.Activity_title,
                         Activity_content = it.Activity_content,
                         Activity_author = it.Activity_author,
                         Activity_hit = it.Activity_hit,
                         Activity_times = it.Activity_time,
                         Activity_href = "ActivityContent.aspx?id="
                     };
            }
            int count = ac.ToList().Count();
            string name;
            if (categoryid != 0)
                name = ActivityHelper.getCategoryName(categoryid);
            else
                name = "全部活动";
            ac = ac.Skip((page-1) * 6).Take(6);
            List<Ac> list = new List<Ac>();
            foreach(var i in ac)
            {
                Ac a = new Ac();
                a.Activity_id = i.Activity_id;
                a.Activity_title = i.Activity_title;
                a.Activity_content = MyHtmlHelper.RemoveTags( context.Server.HtmlDecode( i.Activity_content));
                a.Activity_author = i.Activity_author;
                a.Activity_hit = i.Activity_hit;
                a.Activity_time = i.Activity_times.Date.ToShortDateString() + " " + i.Activity_times.TimeOfDay;
                a.Activity_href = i.Activity_href;
                list.Add(a);
            }
            ArrayList all = new ArrayList();
            all.Add(cat);
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