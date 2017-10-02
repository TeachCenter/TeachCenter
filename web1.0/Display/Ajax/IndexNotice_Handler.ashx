<%@ WebHandler Language="C#" Class="IndexNotice_Handler" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using System;


public class IndexNotice_Handler : IHttpHandler {
    public class Notice
    {
        public string noticeTitle;
        public string noticeHref;
        public DateTime noticeTime;
    }
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        using (var db = new TeachingCenterEntities())
        {
            var service = (from it in db.Activity
                           where it.Activity_isdeleted == 0
                           orderby it.Activity_time descending
                           select new
                           {
                               noticeTitle = it.Activity_title,
                               noticeHref = it.Activity_id.ToString(),
                               noticeTime = it.Activity_time
                           }).ToList().Take(8);
            var sourse = (from it in db.EducateSource
                          where it.is_deleted == 0
                          orderby it.publish_time descending
                          select new Notice
                          {
                              noticeTitle = it.title,
                              noticeHref =  it.id.ToString(),
                              noticeTime = Convert.ToDateTime( it.publish_time)
                          }).ToList().Take(8);
            var project = (from it in db.ProjectCategory
                           where it.is_deleted == 0
                           orderby it.publish_time descending
                           select new Notice
                           {
                               noticeTitle = it.name,
                               noticeHref = "Project.html?id=" + it.id.ToString(),
                               noticeTime = Convert.ToDateTime( it.publish_time)
                           }).ToList().Take(8);
            List<Notice> notice = new List<Notice>();
            foreach(var i in service)
            {
                Notice x = new Notice();
                x.noticeHref = i.noticeHref;
                x.noticeTime = i.noticeTime;
                x.noticeTitle = i.noticeTitle;
                notice.Add(x);
            }
            foreach(var i in sourse)
            {
                Notice x = new Notice();
                x.noticeHref = i.noticeHref;
                x.noticeTime = i.noticeTime;
                x.noticeTitle = i.noticeTitle;
                notice.Add(x);
            }
            foreach(var i in project)
            {
                Notice x = new Notice();
                x.noticeHref = i.noticeHref;
                x.noticeTime = i.noticeTime;
                x.noticeTitle = i.noticeTitle;
                notice.Add(x);
            }
            string final = JsonConvert.SerializeObject(notice);
            context.Response.Write(final);

        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}