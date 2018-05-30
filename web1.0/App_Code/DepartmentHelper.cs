using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// DepartmentHelper 的摘要说明
/// </summary>
public class DepartmentHelper
{
    public DepartmentHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public static DataTable getDepartment()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("department");
        DataRow newRow1 = dt.NewRow();
        newRow1["department"] = "海洋与大气学院";
        DataRow newRow2 = dt.NewRow();
        newRow2["department"] = "物理海洋教育部重点实验室";
        DataRow newRow3 = dt.NewRow();
        newRow3["department"] = "信息科学与工程学院";
        DataRow newRow4 = dt.NewRow();
        newRow4["department"] = "化学化工学院";
        DataRow newRow5 = dt.NewRow();
        newRow5["department"] = "海洋化学理论与工程技术教育部重点实验室";
        DataRow newRow6 = dt.NewRow();
        newRow6["department"] = "海洋地球科学学院";
        DataRow newRow7 = dt.NewRow();
        newRow7["department"] = "海洋生物多样性与进化研究所";
        DataRow newRow8 = dt.NewRow();
        newRow8["department"] = "水产学院";
        DataRow newRow9 = dt.NewRow();
        newRow9["department"] = "食品科学与工程学院";
        DataRow newRow10 = dt.NewRow();
        newRow10["department"] = "医药学院";
        DataRow newRow11 = dt.NewRow();
        newRow11["department"] = "工程学院";
        DataRow newRow12 = dt.NewRow();
        newRow12["department"] = "环境科学与工程学院";
        DataRow newRow13 = dt.NewRow();
        newRow13["department"] = "管理学院";
        DataRow newRow14 = dt.NewRow();
        newRow14["department"] = "经济学院";
        DataRow newRow15 = dt.NewRow();
        newRow15["department"] = "外国语学院";
        DataRow newRow16 = dt.NewRow();
        newRow16["department"] = "文学与新闻传播学院";
        DataRow newRow17 = dt.NewRow();
        newRow17["department"] = "法政学院";
        DataRow newRow18 = dt.NewRow();
        newRow18["department"] = "教学科学学院";
        DataRow newRow19 = dt.NewRow();
        newRow19["department"] = "材料科学与工程学院";
        DataRow newRow20 = dt.NewRow();
        newRow20["department"] = "基础教学中心";
        DataRow newRow21 = dt.NewRow();
        newRow21["department"] = "马克思主义学院";
        DataRow newRow22 = dt.NewRow();
        newRow22["department"] = "机关部处";
        DataRow newRow23 = dt.NewRow();
        newRow23["department"] = "其他";
        dt.Rows.Add(newRow1);
        dt.Rows.Add(newRow2);
        dt.Rows.Add(newRow3);
        dt.Rows.Add(newRow4);
        dt.Rows.Add(newRow5);
        dt.Rows.Add(newRow6);
        dt.Rows.Add(newRow7);
        dt.Rows.Add(newRow8);
        dt.Rows.Add(newRow9);
        dt.Rows.Add(newRow10);
        dt.Rows.Add(newRow11);
        dt.Rows.Add(newRow12);
        dt.Rows.Add(newRow13);
        dt.Rows.Add(newRow14);
        dt.Rows.Add(newRow15);
        dt.Rows.Add(newRow16);
        dt.Rows.Add(newRow17);
        dt.Rows.Add(newRow18);
        dt.Rows.Add(newRow19);
        dt.Rows.Add(newRow20);
        dt.Rows.Add(newRow21);
        dt.Rows.Add(newRow22);
        dt.Rows.Add(newRow23);
        return dt;
    }
}