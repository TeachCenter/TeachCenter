using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// DevelopHelper 的摘要说明
/// </summary>
public class DevelopHelper
{
    public DevelopHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    static public bool checkCategoryNameExit(string name)
    {
        using (var db = new TeachingCenterEntities())
        {
            var sc = from it in db.DevelopCategory where it.DevelopCategory_name == name select it;
            if (sc.Count() == 0)
                return false;
            else
                return true;
        }
    }

    static public int getCategoryId(string name)
    {
        using (var db = new TeachingCenterEntities())
        {
            DevelopCategory ac = db.DevelopCategory.Single(a => a.DevelopCategory_name == name);
            return ac.DevelopCategory_id;
        }
    }

    static public string getCategoryName(int id)
    {
        using (var db = new TeachingCenterEntities())
        {
            DevelopCategory ac = db.DevelopCategory.Single(a => a.DevelopCategory_id == id);
            return ac.DevelopCategory_name;
        }
    }
}