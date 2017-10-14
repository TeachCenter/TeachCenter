<%@ WebHandler Language="C#" Class="ActivityContent" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using System.Collections;
using System;

public class ActivityContent : IHttpHandler {

    private class Ac
    {

        public int Activity_id;
        public string Activity_title;
        public string Activity_content;
        public string Activity_author;
        public DateTime Activity_times;
        public string Activity_time;
        public string Activity_place;
        public int Activity_nowcount;
        public int Activity_categoryid;
        public string Activity_category;
        public int Activity_limitcount;
        public int Activity_hit;
    }
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";

        int id = Convert.ToInt32( context.Request.Form["Activity_id"]);
        //int id = 3;
        using (var db = new TeachingCenterEntities())
        {
            var ac = from it in db.Activity
                     where it.Activity_id == id
                     select new Ac
                     {
                         Activity_id = it.Activity_id,
                         Activity_title = it.Activity_title,
                         Activity_content = it.Activity_content,
                         Activity_author = it.Activity_author,
                         Activity_times = it.Activity_time,
                         Activity_place = it.Activity_place,
                         Activity_nowcount = it.Activity_nowcount,
                         Activity_limitcount = it.Activity_limitcount,
                         Activity_hit = it.Activity_hit,
                         Activity_categoryid = it.Activity_categoryid
                     };
            List<Ac> acs = new List<Ac>();
            acs = ac.ToList();
            foreach(var i in acs)
            {
                i.Activity_category = ActivityHelper.getCategoryName(Convert.ToInt16( i.Activity_categoryid));
                i.Activity_hit = i.Activity_hit + 1;
                Activity activity = db.Activity.Single(a => a.Activity_id == id);
                activity.Activity_hit = i.Activity_hit;
                db.SaveChanges();
            }
            acs[0].Activity_time = acs[0].Activity_times.Date.ToString().Substring(0, 9) + " " + acs[0].Activity_times.TimeOfDay.ToString().Substring(0, 8);
            string final = JsonConvert.SerializeObject(acs);
            context.Response.Write(final);

        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}