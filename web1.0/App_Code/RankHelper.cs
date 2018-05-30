using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// RankHelper 的摘要说明
/// </summary>
public class RankHelper
{
    public RankHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public static DataTable getRank()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("rank");
        DataRow newRow1 = dt.NewRow();
        newRow1["rank"] = "教授";
        DataRow newRow2 = dt.NewRow();
        newRow2["rank"] = "副教授";
        DataRow newRow3 = dt.NewRow();
        newRow3["rank"] = "讲师";
        DataRow newRow4 = dt.NewRow();
        newRow4["rank"] = "助教";
        DataRow newRow5 = dt.NewRow();
        newRow5["rank"] = "其他";
        dt.Rows.Add(newRow1);
        dt.Rows.Add(newRow2);
        dt.Rows.Add(newRow3);
        dt.Rows.Add(newRow4);
        dt.Rows.Add(newRow5);
        return dt;
    }
}