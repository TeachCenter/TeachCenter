using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// ActivityHelper 的摘要说明
/// </summary>
public class ActivityHelper
{
    public ActivityHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    static public bool checkCategoryNameExit(string name)
    {
        using (var db = new TeachingCenterEntities())
        {
            var sc = from it in db.ActivityCategory where it.ActivityCategory_name == name select it;
            if (sc.Count() == 0)
                return false;
            else
                return true;
        }
    }
}