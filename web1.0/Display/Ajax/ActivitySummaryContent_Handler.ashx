<%@ WebHandler Language="C#" Class="ActivitySummaryContent_Handler" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using System.Collections;
using System;

public class ActivitySummaryContent_Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        int id = Convert.ToInt32( context.Request.Form["Activity_id"]);
        //int id = 1;
        using (var db = new TeachingCenterEntities())
        {
            ActivitySummary asu = db.ActivitySummary.SingleOrDefault(a => a.ActivitySummary_id == id);
            asu.ActivitySummary_hit = asu.ActivitySummary_hit + 1;
            db.SaveChanges();
            
            string final = JsonConvert.SerializeObject(asu);
            context.Response.Write(final);
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}