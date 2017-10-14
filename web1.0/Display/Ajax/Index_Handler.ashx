<%@ WebHandler Language="C#" Class="IndexNotice_Handler" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using System;
using System.Collections;

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
            //通知公告
            var activity = (from it in db.Activity
                            where it.Activity_isdeleted == 0
                            orderby it.Activity_time descending select it).ToList().Take(8).Select( it=>
                            new
                            {
                                noticeTitle = it.Activity_title,
                                noticeHref = it.Activity_id.ToString(),
                                noticeTime = it.Activity_time
                            });
            var sourse = (from it in db.EducateSource
                          where it.is_deleted == 0
                          orderby it.publish_time descending select it).ToList().Take(8).Select(
                          it=> new Notice
                          {
                              noticeTitle = it.title,
                              noticeHref =  it.id.ToString(),
                              noticeTime = Convert.ToDateTime( it.publish_time)
                          });
            var project = (from it in db.ProjectCategory
                           where it.is_deleted == 0
                           orderby it.publish_time descending select it).ToList().Take(8).Select(
                           it=> new Notice
                           {
                               noticeTitle = it.name,
                               noticeHref = it.id.ToString(),
                               noticeTime = Convert.ToDateTime( it.publish_time)
                           });
            List<Notice> notice = new List<Notice>();
            foreach(var i in activity)
            {
                Notice x = new Notice();
                x.noticeHref ="ActivityContent.aspx?id=" + i.noticeHref;
                x.noticeTime = i.noticeTime;
                x.noticeTitle = i.noticeTitle;
                notice.Add(x);
            }
            foreach(var i in sourse)
            {
                Notice x = new Notice();
                x.noticeHref ="EducationSourceContent.aspx?id=" + i.noticeHref;
                x.noticeTime = i.noticeTime;
                x.noticeTitle = i.noticeTitle;
                notice.Add(x);
            }
            foreach(var i in project)
            {
                Notice x = new Notice();
                x.noticeHref = "ProjectContent.aspx?id=" + i.noticeHref;
                x.noticeTime = i.noticeTime;
                x.noticeTitle = i.noticeTitle;
                notice.Add(x);
            }
            notice.Sort(SortList);


            //工作动态
            var asu = (from it in db.ActivitySummary
                       where it.ActivitySummary_isdeleted == 0
                       orderby it.ActivitySummary_time descending
                       select new
                       {
                           ActivitySummary_id = it.ActivitySummary_id,
                           ActivitySummary_cover = it.ActivitySummary_cover,
                           ActivitySummary_title = it.ActivitySummary_title,
                           ActivitySummary_href = "ActivitySummaryContent.aspx?id=" 
                       }).ToList().Take(3);
            //banner
            var intro = (from it in db.Picture orderby it.is_top descending select it).ToList().Take(4);
            //教学发展
            var dev = (from it in db.Develop
                       where it.Develop_deleted == 0
                       orderby it.Develop_time descending
                       select new
                       {
                           Develop_id = it.Develop_id,
                           Develop_title = it.Develop_title,
                           Develop_path = it.Develop_path,
                           Develop_href = it.Develop_link==""? "":it.Develop_link
                   }).ToList().Take(3);


        ArrayList all = new ArrayList();
        all.Add(intro);
        all.Add(dev);
        all.Add(asu);
        all.Add(notice.Take(8));
        string final = JsonConvert.SerializeObject(all);
        context.Response.Write(final);

    }
}
private int SortList(Notice a,Notice b)
{
    if (a.noticeTime < b.noticeTime)
        return 1;
    else if (a.noticeTime == b.noticeTime)
        return 0;
    else
        return -1;
}

public bool IsReusable {
    get {
        return false;
    }
}

}