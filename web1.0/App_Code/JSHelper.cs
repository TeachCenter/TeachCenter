﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;


/// <summary>
/// JSHelper 的摘要说明
/// </summary>
public static  class JSHelper
{

    #region 页面上下文中的对象们

    /// <summary>
    /// 当前正在执行的页面
    /// </summary>
    private static Page Page
    {
        get
        {
            return HttpContext.Current.CurrentHandler as Page ?? new Page();
        }
    }

    /// <summary>
    /// 获取当前 HTTP 请求的 HttpRequest 对象
    /// </summary>
    private static HttpRequest Request
    {
        get
        {
            return HttpContext.Current.Request;
        }
    }

    /// <summary>
    /// 获取当前 HTTP 响应的 HttpResponse 对象
    /// </summary>
    private static HttpResponse Response
    {
        get
        {
            return HttpContext.Current.Response;
        }
    }

    #endregion
    
    /// <summary>
    /// 显示带有一段消息和一个确认按钮的警告框
    /// </summary>
    /// <param name="message">弹出的对话框中显示的纯文本</param>
    public static void  ShowAlert(string message)
    {
        message = message.Replace("'", "\\'");
        //RegisterStartupScript(string.Format("alert('{0}')", message));
        Response.Write("<script type=\"text/javascript\">alert('"+message+"')</script>");
    }
    public static void ShowAlertAndBack(string message)
    {
        message = message.Replace("'", "\\'");
        //RegisterStartupScript(string.Format("alert('{0}')", message));
        Response.Write("<script type=\"text/javascript\">alert('" + message + "');history.back()</script>");
    }
    public static void js(string js)
    {
        Response.Write("<script type=\"text/javascript\">" + js + "</script>");
    }


    /// <summary>
    /// 将客户端重定向到新的 URL (首先将 URL 转换为在请求客户端可用的 URL)
    /// 然后显示带有一段消息和一个确认按钮的警告框
    /// </summary>
    /// <param name="url">目标位置</param>
    /// <param name="message">弹出的对话框中显示的纯文本</param>
    public static void AlertThenRedirect(string message, string url)
    {
        message = message.Replace("'", "\\'");
        Response.Write("<script type=\"text/javascript\">alert('" + message + "');location='" + url + "'</script>");
    }
}