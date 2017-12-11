using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// ExcleHelper 的摘要说明
/// </summary>
public class ExcleHelper
{
    public ExcleHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    static  public void ExportDataGrid(DataTable dt,string FileType, string FileName) //从DataGrid导出  
    {
        DataGrid dg = new DataGrid();

        //DataSet dg = new DataSet();

        dg.DataSource = dt;

        dg.DataBind();

        //定义文档类型、字符编码　　   
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(FileName, Encoding.UTF8).ToString());
        HttpContext.Current.Response.Charset = "UTF-8";
        HttpContext.Current.Response.ContentEncoding = Encoding.Default;
        HttpContext.Current.Response.ContentType = FileType;
        dg.EnableViewState = false;
        //定义一个输入流　　   
        StringWriter tw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(tw);
        //目标数据绑定到输入流输出　  
        dg.RenderControl(hw);
        HttpContext.Current.Response.Write(tw.ToString());
        HttpContext.Current.Response.End();
    }
}