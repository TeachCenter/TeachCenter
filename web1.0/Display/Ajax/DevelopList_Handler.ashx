<%@ WebHandler Language="C#" Class="Develop_Handler" %>

using System;
using System.Web;
using System.Linq;
using Newtonsoft.Json;
using System.Collections;
using System.Collections.Generic;

public class Develop_Handler : IHttpHandler {


    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        int page = Convert.ToInt32( context.Request.Form["page"]);
        //int page = 1, category = 0;
        int category = Convert.ToInt32( context.Request.Form["category"]);
        using (var db = new TeachingCenterEntities())
        {
            var categorys = from it in db.DevelopCategory
                            select new
                            {
                                DevelopCategory_id = it.DevelopCategory_id,
                                DevelopyCategory_name = it.DevelopCategory_name,
                                DevelopCategory_href = "DevelopList.html?type="
                            };

            var dev = from it in db.Develop
                      where it.Develop_deleted == 0
                      orderby it.Develop_time descending
                      select new
                      {
                          Develop_id = it.Develop_id,
                          Develop_title = it.Develop_title,
                          Develop_content = it.Develop_content,
                          Develop_author = it.Develop_author,
                          Develop_hit = it.Develop_hit,
                          Develop_link = it.Develop_link,
                          Develop_href = it.Develop_link=="" ? "DevelopContent.html?id=" : it.Develop_link,
                          Develop_time = it.Develop_time
                      };
            if (category != 0)
            {
                dev = from it in db.Develop
                      where it.Develop_deleted == 0 && it.Develop_category == category
                      orderby it.Develop_time descending
                      select new
                      {
                          Develop_id = it.Develop_id,
                          Develop_title = it.Develop_title,
                          Develop_content = it.Develop_content,
                          Develop_author = it.Develop_author,
                          Develop_hit = it.Develop_hit,
                          Develop_link = it.Develop_link,
                          Develop_href = it.Develop_link=="" ? "DevelopContent.html?id=" : it.Develop_link,
                          Develop_time = it.Develop_time
                      };
            }
            int count = dev.Count();
            dev = dev.Skip((page-1) * 5).Take(5);
            string name;
            if (category != 0)
                name = DevelopHelper.getCategoryName(category);
            else
                name = "全部教学发展";
            ArrayList all = new ArrayList();
            all.Add(categorys);
            all.Add(count);
            all.Add(dev);
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