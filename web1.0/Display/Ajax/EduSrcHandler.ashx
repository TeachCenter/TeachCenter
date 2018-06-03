<%@ WebHandler Language="C#" Class="EduSrcHandler" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using System.Collections;
using System;

public class EduSrcHandler : IHttpHandler {

    private class Category {
        public int SourceCategory_id;
        public string SourceCategory_name;
        public string SourceCategory_href;
    }
    private class Source {
        public int Source_id;
        public string Source_title;
        public string Source_summary;
        public string Source_publisher;
        public string Source_time;
        public int Source_views;
        public string Source_href;
    }
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        using (var db = new TeachingCenterEntities())
        {
            // 资源分类
            var catagorys = from it in db.SourceCategory
                            select new
                            {
                                SourceCategory_id = it.SourceCategory_id,
                                SourceCategory_name = it.SourceCategory_name,
                                SourceCategory_href = "SrcList.aspx?type="
                            };

            List<Category> cat = new List<Category>();

            foreach(var i in catagorys)
            {
                Category x = new Category();
                x.SourceCategory_href = i.SourceCategory_href + i.SourceCategory_id.ToString() + "&&page=1";
                x.SourceCategory_name = i.SourceCategory_name;
                x.SourceCategory_id = i.SourceCategory_id;
                cat.Add(x);
            }

            // 资源列表
            int categoryid = 0;
            try
            {
                categoryid = Convert.ToInt32(context.Request.Form["type"]);
            }
            catch
            {

            }
            int page = 1;
            try
            {
                page = Convert.ToInt32(context.Request.Form["page"]);
            }
            catch
            {

            }
            var  source = (from it in db.EducateSource
                           where it.is_deleted == 0
                           orderby it.publish_time descending
                           select new Source
                           {
                               Source_id = it.id,
                               Source_title = it.title,
                               Source_summary = it.summary,
                               Source_publisher = it.publisher,
                               Source_time = it.publish_time,
                               Source_views = it.view_times,
                               Source_href = "SrcContent.aspx?id="
                           });
            if(categoryid != 0)
            {
                source = from it in db.EducateSource
                         where it.is_deleted == 0 && it.category == categoryid
                         orderby it.publish_time descending
                         select new Source
                         {
                             Source_id = it.id,
                             Source_title = it.title,
                             Source_summary = it.summary,
                             Source_publisher = it.publisher,
                             Source_time = it.publish_time,
                             Source_views = it.view_times,
                             Source_href = "SrcContent.aspx?id="
                         };
            }
            int count = source.ToList().Count();
            string name;
            if (categoryid != 0)
                name = getCategoryName(categoryid);
            else
                name = "全部资源";
            source = source.Skip((page-1) * 6).Take(6);
            List<Source> list = new List<Source>();
            foreach(var i in source)
            {
                Source a = new Source();
                a.Source_id = i.Source_id;
                a.Source_title = i.Source_title;
                a.Source_summary = MyHtmlHelper.RemoveTags( context.Server.HtmlDecode( i.Source_summary));
                a.Source_publisher = i.Source_publisher;
                a.Source_views = i.Source_views;
                a.Source_time = i.Source_time;
                a.Source_href = i.Source_href;
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

    static public string getCategoryName(int id)
    {
        using (var db = new TeachingCenterEntities())
        {
            SourceCategory sc = db.SourceCategory.Single(a => a.SourceCategory_id == id);
            return sc.SourceCategory_name;
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}