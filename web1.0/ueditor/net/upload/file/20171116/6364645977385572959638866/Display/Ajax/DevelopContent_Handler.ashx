﻿<%@ WebHandler Language="C#" Class="DevelopContent_Handler" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using System.Collections;
using System;

public class DevelopContent_Handler : IHttpHandler {

    private class Dev
    {
        public int Develop_id;
        public string Develop_title;
        public string Develop_content;
        public string Develop_author;
        public int Develop_hit;
        public string Develop_link;
        public string Develop_category;
        public int Develop_categoryid;
        public DateTime Develop_times;
        public string Develop_time;
    }

    private class Category {
        public int DevelopCategory_id;
        public string DevelopCategory_name;
        public string DevelopCategory_href;
    }
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        int id;

        //int id = Convert.ToInt32( context.Request.Form["Develop_id"]);

        try
        {
            id =  Convert.ToInt32( context.Request.Form["Develop_id"]);
            if (!DevelopHelper.checkID(id))         //确认id是否存在
                id = 5;
        }
        catch
        {
            id = 5;
        }

        using (var db = new TeachingCenterEntities())
        {


            var dev = from it in db.Develop
                      where it.Develop_id == id
                      select new Dev
                      {
                          Develop_id = it.Develop_id,
                          Develop_title = it.Develop_title,
                          Develop_content = it.Develop_content,
                          Develop_author = it.Develop_author,
                          Develop_hit = it.Develop_hit,
                          Develop_link = it.Develop_link,
                          Develop_times = it.Develop_time,
                          Develop_categoryid = it.Develop_category
                      };
            List<Dev> develop = new List<Dev>();
            develop = dev.ToList();
            foreach (var i in develop)
            {
                i.Develop_category = DevelopHelper.getCategoryName(i.Develop_categoryid);
                i.Develop_hit = i.Develop_hit + 1;
                Develop deve = db.Develop.Single(a => a.Develop_id == id);
                deve.Develop_hit = i.Develop_hit;
                db.SaveChanges();
            }
            develop[0].Develop_time = develop[0].Develop_times.Date.ToString().Substring(0, 9) + " " + develop[0].Develop_times.TimeOfDay.ToString().Substring(0, 8);
            develop[0].Develop_content = context.Server.HtmlDecode(develop[0].Develop_content);
            string final = JsonConvert.SerializeObject(develop[0]);
            context.Response.Write(final);
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}