using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

/// <summary>
/// UeditorHelper 的摘要说明
/// </summary>
public class UeditorHelper
{
    public UeditorHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    public static string NoHTML(string strHtml)//把文本中的html标签全部去掉
    {
        Regex regex = new Regex(@"<.+?>", RegexOptions.IgnoreCase);
        string strOutput = regex.Replace(strHtml, "");//替换掉"<"和">"之间的内容
        strOutput = strOutput.Replace("<", "");
        strOutput = strOutput.Replace(">", "");
        strOutput = strOutput.Replace("&nbsp;", "");
        return strOutput;
    }

    public static string Change(string x)//对富文本编辑器中获取的内容 html标签进行处理，避免它存到数据库的时候被转义
    {
        x = x.Replace("&lt;", "<");//对一些特殊字符进行替换
        x = x.Replace("&gt;", ">");
        x = x.Replace("&quot;", "\"");
        //x = x.Replace("&#39;", """ );
        x = x.Replace("&nbsp;", " ");
        //  x = x.Replace("&ldquo;", """);
        //  x = x.Replace("&rdquo;", """);
        x = x.Replace("&amp;", "&");

        return x;
    }
}