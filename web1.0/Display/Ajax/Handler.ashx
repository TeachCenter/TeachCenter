<%@ WebHandler Language="C#" Class="Handler" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;
using System;
using System.Collections;

public class Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        //友情链接
        using(var db = new TeachingCenterEntities())
        {
            var link1 = (from it in db.FriendsLink where it.orders == 1 select it).ToList();
            var link2 = (from it in db.FriendsLink where it.orders == 2 select it).ToList();
            var link3 = (from it in db.FriendsLink where it.orders == 3 select it).ToList();
            var link4 = (from it in db.FriendsLink where it.orders == 4 select it).ToList();

            ArrayList link = new ArrayList();
            link.Add(link1);
            link.Add(link2);
            link.Add(link3);
            link.Add(link4);

            string final = JsonConvert.SerializeObject(link);
            context.Response.Write(final);
        }
        
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}