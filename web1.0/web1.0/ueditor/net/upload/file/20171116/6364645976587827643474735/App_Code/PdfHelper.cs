using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Aspose.Words;

/// <summary>
/// PdfHelper 的摘要说明
/// </summary>
public class PdfHelper
{
    public PdfHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    /// <summary>
    /// 将Word转换为Pdf
    /// </summary>
    public static string WordToPdf(string pWordFile, string localPath)
    {
        try
        {
            // 生成同名pdf文件
            string result = pWordFile.Substring(0, pWordFile.LastIndexOf(".")) + ".pdf";

            // 若pdf文件已存在则返回pdf文件名
            if (File.Exists(System.Web.HttpContext.Current.Server.MapPath("~/BackStage/" + result)))
                return result;

            // 获取word文档物理路径
            pWordFile = pWordFile.Replace("/", @"\");
            pWordFile = localPath + @"\BackStage\" + pWordFile;

            //读取doc文档
            Document doc = new Document(pWordFile);
            int index = pWordFile.LastIndexOf(".");
            string pSavePdf = pWordFile.Substring(0, index) + ".pdf";
            //保存为PDF文件，此处的SaveFormat支持很多种格式，如图片，epub,rtf 等等
            doc.Save(pSavePdf, SaveFormat.Pdf);

            return result;
        }
        catch
        {
            return "";
        }
        
    }
}