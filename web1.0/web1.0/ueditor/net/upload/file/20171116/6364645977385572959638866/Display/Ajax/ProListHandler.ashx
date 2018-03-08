<%@ WebHandler Language="C#" Class="ProListHandler" %>

using System;
using System.Web;
using System.Linq;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Data;
using System.Collections;

public class ProListHandler : IHttpHandler {

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
                var pro_category = from it in db.ProjectCategory
                                   where it.is_deleted == 0
                                   orderby it.publish_time descending
                                   select new
                                   {
                                       id = it.id,
                                       title = it.name,
                                       project_content = it.project_content,
                                       publisher = "系统管理员",
                                       publish_time = it.publish_time,
                                   };
                int count = pro_category.Count();
                pro_category = pro_category.Take(size * index).Skip(size * (index - 1));
                DataTable dt = new DataTable();
                dt.Columns.Add("id");
                dt.Columns.Add("title");
                dt.Columns.Add("content");
                dt.Columns.Add("publisher");
                dt.Columns.Add("publish_time");
                foreach(var item in pro_category)
                {
                    DataRow newRow = dt.NewRow();
                    newRow["id"] = item.id;
                    newRow["title"] = item.title;
                    newRow["content"] = UeditorHelper.NoHTML(item.project_content);
                    newRow["publisher"] = item.publisher;
                    newRow["publish_time"] = item.publish_time;
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



