<%@ WebHandler Language="C#" Class="ProListHandler" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using System.Collections;
using System;

public class ProListHandler : IHttpHandler {

    private class Category {
        public int ProCatCategory_id;
        public string ProCatCategory_name;
        public string ProCatCategory_href;
    }
    private class Project {
        public int Project_id;
        public string Project_title;
        public string Project_summary;
        public string Project_time;
        public string Project_href;
    }
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        using (var db = new TeachingCenterEntities())
        {
            // 项目分类分类
            var catagorys = from it in db.ProCatCategory
                            select new
                            {
                                ProCateCategory_id = it.ProCatCategory_id,
                                ProCatCategory_name = it.ProCatCategory_name,
                                ProCatCategory_href = "ProjectList.aspx?type="
                            };

            List<Category> cat = new List<Category>();

            foreach(var i in catagorys)
            {
                Category x = new Category();
                x.ProCatCategory_href = i.ProCatCategory_href + i.ProCateCategory_id.ToString() + "&&page=1";
                x.ProCatCategory_name = i.ProCatCategory_name;
                x.ProCatCategory_id = i.ProCateCategory_id;
                cat.Add(x);
            }

            // 资源列表
            int categoryid = 0;
            try
            {
                categoryid = Convert.ToInt32(context.Request.Form["ProCatCategory_id"]);
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
            var  project = (from it in db.ProjectCategory
                            where it.is_deleted == 0
                            orderby it.publish_time descending
                            select new Project
                            {
                                Project_id = it.id,
                                Project_title = it.name,
                                Project_summary = it.summary,
                                Project_time = it.publish_time,
                                Project_href = "ProgectContent.aspx?id="
                            });
            if(categoryid != 0)
            {
                project = from it in db.ProjectCategory
                          where it.is_deleted == 0 && it.category == categoryid
                          orderby it.publish_time descending
                          select new Project
                          {
                              Project_id = it.id,
                              Project_title = it.name,
                              Project_summary = it.summary,
                              Project_time = it.publish_time,
                              Project_href = "ProgectContent.aspx?id="
                          };
            }
            int count = project.ToList().Count();
            string name;
            if (categoryid != 0)
                name = getCategoryName(categoryid);
            else
                name = "全部项目";
            project = project.Skip((page-1) * 6).Take(6);
            List<Project> list = new List<Project>();
            foreach(var i in project)
            {
                Project a = new Project();
                a.Project_id = i.Project_id;
                a.Project_title = i.Project_title;
                a.Project_summary = MyHtmlHelper.RemoveTags( context.Server.HtmlDecode( i.Project_summary));
                a.Project_time = i.Project_time;
                a.Project_href = i.Project_href;
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
            ProCatCategory pc = db.ProCatCategory.Single(a => a.ProCatCategory_id == id);
            return pc.ProCatCategory_name;
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}
