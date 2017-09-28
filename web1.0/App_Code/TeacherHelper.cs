using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// TeacherHelper 的摘要说明
/// </summary>
public class TeacherHelper
{
    public TeacherHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    static public string getTeacherNameByNumber(string number)
    {
        using (var db = new TeachingCenterEntities())
        {
            Teacher teacher = db.Teacher.Single(a => a.number == number);
            return teacher.name;
        }
    }

    static public int getTeacherIDByNumber(string number)
    {
        using (var db = new TeachingCenterEntities())
        {
            Teacher teacher = db.Teacher.Single(a => a.number == number);
            return teacher.id;
        }
    }

    static public string getTeacherNameByID(int id)
    {
        using (var db = new TeachingCenterEntities())
        {
            Teacher teacher = db.Teacher.Single(a => a.id == id);
            return teacher.name;
        }
    }
}