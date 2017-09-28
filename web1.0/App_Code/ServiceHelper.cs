using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Server 的摘要说明
/// </summary>
public class ServiceHelper
{
    public ServiceHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    static public string getCategoryName(int id)
    {
        using (var db = new TeachingCenterEntities())
        {
            ServiceCategory sc = db.ServiceCategory.SingleOrDefault(a => a.ServiceCategory_id == id);
            return sc.ServiceCategory_name;
        }
    }

    static public int getCategoryID(string name)
    {
        using (var db = new TeachingCenterEntities())
        {
            ServiceCategory sc = db.ServiceCategory.SingleOrDefault(a => a.ServiceCategory_name == name);
            return sc.ServiceCategory_id;
        }
    }

    static public bool checkCategoryNameExit(string name)
    {
        using (var db = new TeachingCenterEntities())
        {
            var sc = from it in db.ServiceCategory where it.ServiceCategory_name == name select it;
            if (sc.Count() == 0)
                return false;
            else
                return true;
        }
    }
}