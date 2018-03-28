using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;

/// <summary>
/// MailHelper 的摘要说明
/// </summary>
public class MailHelper
{
    public MailHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    static private bool Sendemails(string MessageFrom, string MessageTo, string MessageSubject, string MessageBody)
    {
        MailMessage message = new MailMessage();
        MailAddress from = new MailAddress(MessageFrom);
        message.From = from;
        MailAddress messageto = new MailAddress(MessageTo);
        message.To.Add(messageto);              //收件人邮箱地址可以是多个以实现群发 
        message.Subject = MessageSubject;
        message.Body = MessageBody;
        message.IsBodyHtml = true;              //是否为html格式 
        message.Priority = MailPriority.High;   //发送邮件的优先等级

        //指定发送邮件的服务器地址或IP 
        //指定发送邮件端口
        SmtpClient sc = new SmtpClient("smtp.163.com", 25);
        sc.Credentials = new System.Net.NetworkCredential("m18039746604_1@163.com", "18960660325gxy1"); //指定登录服务器的用户名和密码  


        sc.Send(message);       //发送邮件                              
        return true;
    }

    static public string Random_check(string email)
    {
        string Massage = "m18039746604_1@163.com";
        Int16 x = 1000;
        Random Random = new System.Random();
        string rad = Convert.ToString(Random.Next(x, x * 10));
        string massage = "您的随机验证码是" + rad + "。";
        Sendemails(Massage, email, "找回密码", massage);
        return rad;      
    }
}