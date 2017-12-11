<%@ WebHandler Language="C#" Class="EduSrcHandler" %>

using System;
using System.Web;
using System.Linq;
using Newtonsoft.Json;
using System.Data;
using System.Collections;

public class EduSrcHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        string pageSize = context.Request["pageSize"];
        string pageIndex = context.Request["pageNumber"];
        if (string.IsNullOrEmpty(pageSize) || string.IsNullOrEmpty(pageIndex))
        {
            context.Response.Write("");
        }
        else
        {
            int index = Convert.ToInt32(pageIndex);
            int size = Convert.ToInt32(pageSize);
            using (var db = new TeachingCenterEntities())
            {
                var src = from it in db.EducateSource
                          where it.is_deleted == 0
                          orderby it.publish_time descending
                          select new
                          {
                              it.id,
                              it.title,
                              it.body,
                              it.publisher,
                              it.publish_time,
                              it.view_times,
                              it.is_deleted
                          };
                int count = src.Count();
                src = src.Take(size * index).Skip(size * (index - 1));
                DataTable dt = new DataTable();
                dt.Columns.Add("id");
                dt.Columns.Add("title");
                dt.Columns.Add("body");
                dt.Columns.Add("publisher");
                dt.Columns.Add("publish_time");
                dt.Columns.Add("view_times");
                dt.Columns.Add("is_deleted");
                foreach(var item in src)
                {
                    DataRow newRow = dt.NewRow();
                    newRow["id"] = item.id;
                    newRow["title"] = item.title;
                    newRow["body"] = UeditorHelper.NoHTML(item.body);
                    newRow["publisher"] = item.publisher;
                    newRow["publish_time"] = item.publish_time;
                    newRow["view_times"] = item.view_times;
                    newRow["is_deleted"] = item.is_deleted;
                    dt.Rows.Add(newRow);
                }
                ArrayList all = new ArrayList();
                all.Add(dt);
                all.Add(count);
                string json = JsonConvert.SerializeObject(all);
                context.Response.Write(json);
            }
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}