<%@ WebHandler Language="C#" Class="Search_Handler" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using System;
using System.Collections;

public class Search_Handler : IHttpHandler {

    private class Article
    {
        public string title;
        public string content;
        //public string author;
        public DateTime time;
        public string href;
        public int id;
        //public string type;
        public string times;
    }

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        try
        {
            //string key = context.Request.QueryString["key"].ToString();
            string key = context.Request.Form["key"];
            //string key = "ha";
            int page = 1;
            try
            {
                page = Convert.ToInt32(context.Request.Form["page"]);
            }
            catch
            {

            }
            using (var db = new TeachingCenterEntities())
            {
                var ac = from it in db.Activity
                         where (it.Activity_title.Contains(key) || it.Activity_content.Contains(key)) && it.Activity_isdeleted == 0
                            select new Article
                            {
                                id = it.Activity_id,
                                content = it.Activity_content,
                                href = "ActivityContent.aspx?id=",
                                time = it.Activity_time,
                                title = it.Activity_title,
                            };
                var asu = from it in db.ActivitySummary
                          where (it.ActivitySummary_title.Contains(key) || it.ActivitySummary_content.Contains(key)) && it.ActivitySummary_isdeleted == 0
                          select new Article
                          {
                              id = it.ActivitySummary_id,
                              content = it.ActivitySummary_content,
                              href = "ActivitySummaryContent.aspx?id=",
                              time = it.ActivitySummary_time,
                              title = it.ActivitySummary_title
                          };
                var de = from it in db.Develop
                         where (it.Develop_title.Contains( key) || it.Develop_content.Contains(key)) && it.Develop_deleted == 0
                         select new Article
                         {
                             id = it.Develop_id,
                             content = it.Develop_content,
                             href = "DevelopContent.aspx?id=",
                             time = it.Develop_time,
                             title = it.Develop_title
                         };
                var edu = from it in db.EducateSource
                          where (it.title.Contains(key) || it.body.Contains(key)) && it.is_deleted == 0
                          select new Article
                          {
                              id = it.id,
                              content = it.body,
                              href = "SrcContent.aspx?id=",
                              title = it.title,
                              times = it.publish_time
                          };
                List<Article> article = new List<Article>();
                //if(ac!=null)
                foreach(var i in ac)
                {
                    Article ar = new Article();
                    ar.id = i.id;
                    ar.time = i.time;
                    ar.title = i.title;
                    ar.content = MyHtmlHelper.RemoveTags( context.Server.HtmlDecode( i.content));
                    ar.href = i.href + i.id;
                    article.Add(ar);
                }
                //if(asu!=null)
                foreach (var i in asu)
                {
                    Article ar = new Article();
                    ar.id = i.id;
                    ar.time = i.time;
                    ar.title = i.title;
                    ar.content = MyHtmlHelper.RemoveTags( context.Server.HtmlDecode( i.content));
                    ar.href = i.href + i.id;
                    article.Add(ar);
                }
                //if(de!=null)
                foreach (var i in de)
                {
                    Article ar = new Article();
                    ar.id = i.id;
                    ar.time = i.time;
                    ar.title = i.title;
                    ar.content = MyHtmlHelper.RemoveTags(context.Server.HtmlDecode( i.content));
                    ar.href = i.href + i.id;
                    article.Add(ar);
                }
                //if(edu!=null)
                foreach (var i in edu)
                {
                    Article ar = new Article();
                    ar.id = i.id;
                    ar.time = Convert.ToDateTime(i.time);
                    ar.title = i.title;
                    ar.content = MyHtmlHelper.RemoveTags( context.Server.HtmlDecode( i.content));
                    ar.href = i.href + i.id;
                    article.Add(ar);
                }
                int count = article.Count;

                article.Sort(SortList);
                //article =(List<Article>) article.Skip((page - 1) * 10).Take(10);
                ArrayList all = new ArrayList();
                all.Add(count);
                all.Add(article.Skip((page - 1) * 6).Take(6));
                string final = JsonConvert.SerializeObject(all);
                context.Response.Write(final);
            }
        }
        catch
        {

        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

    private int SortList(Article a,Article b)
    {
        if (a.time < b.time)
            return 1;
        else if (a.time == b.time)
            return 0;
        else
            return -1;
    }

}