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
}