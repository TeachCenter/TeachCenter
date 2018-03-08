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


    /// <summary>  
    /// DataTable导出到Excel  
    /// </summary>  
    /// <param name="table">DataTable类型的数据源</param>  
    /// <param name="file">需要导出的文件路径</param>  
    static public void ExportDataGrid(DataTable table,string type, string file)
    {
       Output(table,type,file);
    }



    //static public void ExportDataGrid(DataTable dt, string FileType, string FileName) //从DataGrid导出  
    //{
    //    DataGrid dg = new DataGrid();

    //    //DataSet dg = new DataSet();

    //    dg.DataSource = dt;

    //    dg.DataBind();

    //    //定义文档类型、字符编码　　   
    //    HttpContext.Current.Response.Clear();
    //    HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(FileName, Encoding.UTF8).ToString());
    //    HttpContext.Current.Response.Charset = "UTF-8";
    //    HttpContext.Current.Response.ContentEncoding = Encoding.Default;
    //    HttpContext.Current.Response.ContentType = FileType;
    //    dg.EnableViewState = false;
    //    //定义一个输入流　　   
    //    StringWriter tw = new StringWriter();
    //    HtmlTextWriter hw = new HtmlTextWriter(tw);
    //    //目标数据绑定到输入流输出　  
    //    dg.RenderControl(hw);
    //    HttpContext.Current.Response.Write(tw.ToString());
    //    HttpContext.Current.Response.End();
    //}


    static public void Output(DataTable dt,string type,string name)
    {
        org.in2bits.MyXls.XlsDocument doc = new org.in2bits.MyXls.XlsDocument();
        doc.FileName = DateTime.Now.Month.ToString()+ DateTime.Now.Day.ToString()+ DateTime.Now.Hour.ToString()+ DateTime.Now.Minute.ToString()+ DateTime.Now.Second.ToString();//excel文件名称
        //org.in2bits.MyXls.Worksheet sheet = doc.Workbook.Worksheets.AddNamed("sheet1");//Excel工作表名称
        org.in2bits.MyXls.Worksheet sheet = doc.Workbook.Worksheets.AddNamed("sheet1");
        org.in2bits.MyXls.Cells cells = sheet.Cells;
        int colnum = dt.Columns.Count;//获取DataTable列数

        for (int i = 0; i < colnum; i++)
        {
            cells.Add(1, (i + 1), dt.Columns[i].Caption.ToString());//导出DataTable列名
        }
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            for (int j = 0; j < colnum; j++)
            {
                cells.Add((i + 2), (j + 1), dt.Rows[i][j].ToString());
            }
        }
        doc.Save(HttpContext.Current.Server.MapPath("file/"));


        //try
        //{
        //    string strFilePath = HttpContext.Current.Server.MapPath("file/") + doc.FileName;//服务器文件路径
        //    FileInfo fileInfo = new FileInfo(strFilePath);
        //    HttpContext.Current.Response.Clear();
        //    HttpContext.Current.Response.Charset = "GB2312";
        //    HttpContext.Current.Response.ContentEncoding = System.Text.Encoding.UTF8;
        //    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + HttpContext.Current.Server.UrlEncode(name));
        //    HttpContext.Current.Response.AddHeader("Content-Length", fileInfo.Length.ToString());
        //    //HttpContext.Current.Response.ContentType = "application/x-bittorrent";
        //    HttpContext.Current.Response.ContentType = "application/octet-stream";
        //    HttpContext.Current.Response.WriteFile(fileInfo.FullName);
        //    HttpContext.Current.Response.End();
        //}
        //catch (System.Threading.ThreadAbortException ex)
        //{
        //    //不做处理
        //}
        //catch (Exception ex)
        //{
        //    //做处理
        //}
        string strFilePath = HttpContext.Current.Server.MapPath("file/") + doc.FileName;
        FileInfo fi = new FileInfo(strFilePath);//excelFile为文件在服务器上的地址
        HttpResponse contextResponse = HttpContext.Current.Response;
        contextResponse.Clear();
        contextResponse.Buffer = true;
        contextResponse.Charset = "GB2312"; //设置了类型为中文防止乱码的出现 
        contextResponse.AppendHeader("Content-Disposition", String.Format("attachment;filename={0}", name)); //定义输出文件和文件名 
        contextResponse.AppendHeader("Content-Length", fi.Length.ToString());
        contextResponse.ContentEncoding = Encoding.Default;
        contextResponse.ContentType = "application/ms-excel";//设置输出文件类型为excel文件。 

        contextResponse.WriteFile(fi.FullName);
        contextResponse.Flush();
        contextResponse.End();


    }
}