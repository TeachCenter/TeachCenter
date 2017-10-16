<%@ WebHandler Language="C#" Class="Notice_Handler" %>
using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using System;
using System.Collections;


public class Notice
{
    public string noticeTitle;
    public string noticeHref;
    public DateTime noticeTime;
}

public class Notice_Handler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World      
        int page;
        try
        {
            page = Convert.ToInt32( context.Request.Form["page"]);
        }
        catch
        {
            page = 1;
        }
        using (var db = new TeachingCenterEntities())
        {
            //通知公告
            var activity = (from it in db.Activity
                            where it.Activity_isdeleted == 0
                            orderby it.Activity_time descending
                            select it).ToList().Take(6).Select(it =>
                            new
                            {
                                noticeTitle = it.Activity_title,
                                noticeHref = it.Activity_id.ToString(),
                                noticeTime = it.Activity_time
                            });
            var sourse = (from it in db.EducateSource
                          where it.is_deleted == 0
                          orderby it.publish_time descending
                          select it).ToList().Take(6).Select(
            it => new Notice
            {
                noticeTitle = it.title,
                noticeHref = it.id.ToString(),
                noticeTime = Convert.ToDateTime(it.publish_time)
            });
            var project = (from it in db.ProjectCategory
                           where it.is_deleted == 0
                           orderby it.publish_time descending
                           select it).ToList().Take(6).Select(
                           it => new Notice
                           {
                               noticeTitle = it.name,
                               noticeHref = it.id.ToString(),
                               noticeTime = Convert.ToDateTime(it.publish_time)
                           });
            List<Notice> notice = new List<Notice>();
            foreach (var i in activity)
            {
                Notice x = new Notice();
                x.noticeHref = "ActivityContent.aspx?id=" + i.noticeHref;
                x.noticeTime = i.noticeTime;
                x.noticeTitle = i.noticeTitle;
                notice.Add(x);
            }
            foreach (var i in sourse)
            {
                Notice x = new Notice();
                x.noticeHref = "EducationSourceContent.aspx?id=" + i.noticeHref;
                x.noticeTime = i.noticeTime;
                x.noticeTitle = i.noticeTitle;
                notice.Add(x);
            }
            foreach (var i in project)
            {
                Notice x = new Notice();
                x.noticeHref = "ProgectContent.aspx?id=" + i.noticeHref;
                x.noticeTime = i.noticeTime;
                x.noticeTitle = i.noticeTitle;
                notice.Add(x);
            }
            notice.Sort(SortList);
            int count = notice.Count;
            notice =  notice.Skip((page - 1) * 6).Take(6).ToList();

            ArrayList all = new ArrayList();
            all.Add(count);
            all.Add(notice);
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