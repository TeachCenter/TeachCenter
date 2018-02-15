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
                                ActivityCategory_href = "ActivityList.html?type="
                            };

            List<Category> cat = new List<Category>();

            foreach(var i in catacorys)
            {
                Category x = new Category();
                x.ActivityCategory_href = i.ActivityCategory_href;
                x.ActivityCategory_name = i.ActivityCategory_name;
                x.ActivityCategory_id = i.ActivityCategory_id;
                cat.Add(x);
            }
            Category category = new Category();
            category.ActivityCategory_id = 0;
            category.ActivityCategory_name = "活动总结";
            category.ActivityCategory_href = "ActivitySummaryList.html";
            cat.Add(category);


            //活动列表
            //int categoryid =Convert.ToInt32( context.Request.Form["Activity_categoryid"]);
            int categoryid = 0,page = 1;
            //int page = Convert.ToInt32( context.Request.Form["page"]);
            var  ac = (from it in db.Activity
                       where it.Activity_isdeleted == 0
                       orderby it.Activity_time descending
                       select new
                       {
                           Activity_id = it.Activity_id,
                           Activity_title = it.Activity_title,
                           Activity_content = it.Activity_content,
                           Activity_author = it.Activity_author,
                           Activity_hit = it.Activity_hit,
                           Activity_time = it.Activity_time,
                           Activity_href = "Activity?id="
                       });
            if(categoryid!=0)
            {
                ac = from it in db.Activity
                     where it.Activity_isdeleted == 0 && it.Activity_categoryid == categoryid
                     orderby it.Activity_time descending
                     select new
                     {
                         Activity_id = it.Activity_id,
                         Activity_title = it.Activity_title,
                         Activity_content = it.Activity_content,
                         Activity_author = it.Activity_author,
                         Activity_hit = it.Activity_hit,
                         Activity_time = it.Activity_time,
                         Activity_href = "Activity?id="
                     };
            }
            int count = ac.Count();
            ac = ac.Skip((page-1) * 5).Take(5);

            ArrayList all = new ArrayList();
            all.Add(cat);
            all.Add(count);
            all.Add(ac);
            
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