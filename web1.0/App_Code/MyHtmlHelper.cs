using System.Text.RegularExpressions;

/// <summary>
/// HtmlHelper 的摘要说明
/// </summary>
public static class MyHtmlHelper
{
    /// <summary>
    /// 移除HTML中的所有标签
    /// </summary>
    /// <param name="html">HTML文档</param>
    /// <returns>移除标签后的纯文本</returns>
    public static  string RemoveTags(string html)
    {
        Regex re = new Regex("<[^>]+>");
        MatchCollection matchs = re.Matches(html);
        foreach (Match m in matchs)
        {
           html = html.Replace(m.Value, "");
        }
        char sign = '"';
        html = html.Replace("&lt;", "<");//对一些特殊字符进行替换
        html = html.Replace("&gt;", ">");
        html = html.Replace("&quot;", "\"");
        html = html.Replace("&#39;", sign.ToString());
        html = html.Replace("&nbsp;", "");
        html = html.Replace("&ldquo;", sign.ToString());
        html = html.Replace("&rdquo;", sign.ToString());
        html = html.Replace("&amp;", "&");
        return html;
       // html.Replace("","")
    }
    public static string GetImgUrl(string html)
    {
        //Regex re = new Regex(@"<img ");
        html = System.Web.HttpContext.Current.Server.HtmlDecode(html);
        int index = html.IndexOf("<img");
        if (index == -1) return "";//TODO: 现在返回的是整个img标签，要从img标签中取出src的值
        html = html.Substring(index, html.Substring(index).IndexOf(@"/>") + 2);
        Regex re = new Regex("src=\"[^\"]+\"");
        Match ma = re.Match(html);
        try
        {
        return ma.Value.Remove(ma.Value.Length - 1).Remove(0, 5);

        }
        catch
        {
            return "";
        }
    }


}