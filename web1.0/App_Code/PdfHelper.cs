using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Word;

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
    /// 调用WPS将Word转换为Pdf
    /// </summary>
    public static string WordToPdfWithWPS(string pWordFile, string localPath)
    {
        // 生成同名pdf文件名称
        int index = pWordFile.LastIndexOf(".");
        string pSavePdf = pWordFile.Substring(0, index) + ".pdf";
        string result = pSavePdf;

        // 若pdf文件已存在则返回pdf文件名
        if (File.Exists(System.Web.HttpContext.Current.Server.MapPath("~/BackStage/"+ pSavePdf)))
            return result;

        // 获取word文件和pdf文件的物理路径
        pWordFile = localPath + "/BackStage/" + pWordFile;
        pSavePdf = localPath + "/BackStage/" + pSavePdf;
        
        // 将word文件转换为pdf文件
        Word.ApplicationClass mWord = new Word.ApplicationClass();
        object mMissing = Type.Missing;
        try
        {
            object mFileName = pWordFile;
            mWord.Visible = false;
            Word.Document mDoc = mWord.Documents.Open(ref mFileName, ref mMissing, ref mMissing, ref mMissing, ref mMissing, ref mMissing, ref mMissing, ref mMissing, ref mMissing, ref mMissing);
            mDoc.ExportAsFixedFormat(pSavePdf, Word.WdExportFormat.wdExportFormatPDF, false, Word.WdExportOptimizeFor.wdExportOptimizeForPrint, Word.WdExportRange.wdExportAllDocument, 0, 0, Word.WdExportItem.wdExportDocumentWithMarkup, false, false, Word.WdExportCreateBookmarks.wdExportCreateHeadingBookmarks, false, false, false, ref mMissing);
            mDoc.Close(ref mMissing, ref mMissing, ref mMissing);
            return result;
        }
        catch (Exception)
        {
            throw;
        }
        finally
        {
            mWord.Quit(ref mMissing, ref mMissing, ref mMissing);
            GC.Collect();
            GC.WaitForPendingFinalizers();
            GC.Collect();
            GC.WaitForPendingFinalizers();
        }
    }
}