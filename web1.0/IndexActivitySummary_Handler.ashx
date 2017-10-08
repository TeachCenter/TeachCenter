<%@ WebHandler Language="C#" Class="IndexActivitySummary_Handler" %>

using System.Web;
using System.Collections.Generic;
using System.Linq;
using Newtonsoft.Json;

public class IndexActivitySummary_Handler : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        using (var db = new TeachingCenterEntities())
        {
            var asu = (from it in db.ActivitySummary
                       where it.ActivitySummary_isdeleted == 0
                       orderby it.ActivitySummary_time descending
                       select new
                       {
                           ActivitySummary_id = it.ActivitySummary_id,
                           ActivitySummary_cover = it.ActivitySummary_cover,
                           ActivitySummary_title = it.ActivitySummary_title
                       }).ToList().Take(3);
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