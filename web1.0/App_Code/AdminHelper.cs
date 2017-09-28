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

    /*static public string getNameByID(string ID)
    {
        using (var db = new TeachingCenterEntities())
        {
            Admin ad = db.Admin.SingleOrDefault(a => a.Admin_id == ID);
            return ad.Admin_name;
        }
    }*/

    static public string judgeStage(int number)
    {
        Dictionary<int, string> stage = new Dictionary<int, string>();
        stage.Add(0, "初审");
        stage.Add(1, "中期");
        stage.Add(2, "结题");
        return stage[number];
    }
}