using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// PwdHelper 的摘要说明
/// </summary>
public class PwdHelper
{
    public PwdHelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    static public string MD5(string pwd)
    {
        MD5CryptoServiceProvider md5Encrypter = new MD5CryptoServiceProvider();
        byte[] theSrc = Encoding.UTF8.GetBytes(pwd);
        byte[] theResBytes = md5Encrypter.ComputeHash(theSrc);
        string[] theResStrings = BitConverter.ToString(theResBytes).Split('-');
        string Pwd = string.Concat(theResStrings);
        Pwd = Hash(Pwd);
        return Pwd;
    }


    static private string Hash(string pwd)
    {

        HashAlgorithm hashEncrypter = new SHA1Managed();
        byte[] theSrc = Encoding.UTF8.GetBytes(pwd);
        byte[] theResBytes = hashEncrypter.ComputeHash(theSrc);
        string[] theResStrings = BitConverter.ToString(theResBytes).Split('-');
        pwd = string.Concat(theResStrings);
        return pwd;
    }
}