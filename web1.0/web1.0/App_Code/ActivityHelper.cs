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

    static public int getCategoryId(string name)
    {
        using (var db = new TeachingCenterEntities())
        {
            ActivityCategory ac = db.ActivityCategory.Single(a => a.ActivityCategory_name == name);
            return ac.ActivityCategory_id;
        }
    }

    static public string getCategoryName(int id)
    {
        using (var db = new TeachingCenterEntities())
        {
            ActivityCategory ac = db.ActivityCategory.Single(a => a.ActivityCategory_id == id);
            return ac.ActivityCategory_name;
        }
    }

    static public string getTeacherList(int id)
    {
        using (var db = new TeachingCenterEntities())
        {
            string list = "";
            var at = from it in db.ActivityTeacher where it.activity_id == id select it;
            foreach(var i in at)
            {
                list += TeacherHelper.getTeacherNameByID(i.teacher_id) + " , ";
            }
            return list.Substring(0, list.Length - 2);
        }
    }
}