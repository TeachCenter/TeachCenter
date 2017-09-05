using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// AdminHelper 的摘要说明
/// </summary>
public class AdminHelper
{
    public AdminHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    static public string getNameByID(string ID)
    {
        using (var db = new TeachingCenterEntities())
        {
            Admin ad = db.Admin.SingleOrDefault(a => a.Admin_id == ID);
            return ad.Admin_name;
        }
    }
}