﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackStage_ActivitySummaryAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string teacher = Session["AdminID"].ToString();
        }
        catch
        {
            JSHelper.AlertThenRedirect("请先登录！", "Login.aspx");
        }
    }

    protected void btnSub_Click(object sender, EventArgs e)
    {
        string title = txtTitle.Text;
        string content = myEditor11.InnerHtml;
        string summary = TextBox1.Text;
        if (title.Length == 0 || content.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else if (summary.Length == 0)
            JSHelper.ShowAlert("输入不能为空！");
        else
        {
            try
            {
                if (fup.PostedFile.FileName == "")
                {
                    lblInfo.Text = "请选择文件！";
                }
                else
                {
                    if (!IsAllowedExtension(fup))
                    {
                        lblInfo.Text = "上传文件格式不正确！";
                    }
                    else
                    {
                        string filepath = fup.PostedFile.FileName;
                        string filename = filepath.Substring(filepath.LastIndexOf("\\") + 1);
                        string serverpath = Server.MapPath("picture/") + filename;
                        fup.PostedFile.SaveAs(serverpath);
                        serverpath = filename;
                        lblInfo.Text = "上传成功！";

                        using (var db = new TeachingCenterEntities())
                        {
                            ActivitySummary acsu = new ActivitySummary();
                            acsu.ActivitySummary_title = title;
                            acsu.ActivitySummary_content = content;
                            acsu.ActivitySummary_time = DateTime.Now;
                            acsu.ActivitySummary_summary = summary;
                            acsu.ActivitySummary_cover = serverpath;
                            if (dropAuthor.SelectedValue == "0")
                                acsu.ActivitySummary_author = AdminHelper.getNameByID(Session["AdminID"].ToString());
                            else if (dropAuthor.SelectedValue == "1")
                                acsu.ActivitySummary_author = "匿名";
                            else
                                acsu.ActivitySummary_author = "未知";
                            db.ActivitySummary.Add(acsu);
                            db.SaveChanges();
                            JSHelper.AlertThenRedirect("发布成功！", "ActivitySummaryManage.aspx");
                            //Server.Transfer("ActivitySummaryManage.aspx");
                        }
                    }
                }
                    
               
            }
            catch(Exception ex)
            {
                lblInfo.Text = "上传发生错误！原因是：" + ex.ToString();
            }
        }
    }

    private static bool IsAllowedExtension(FileUpload upfile)
    {
        string strOldFilePath = "";
        string strExtension = "";
        string[] arrExtension = { ".gif", ".jpg", ".bmp", ".png" };
        if (upfile.PostedFile.FileName != string.Empty)
        {
            strOldFilePath = upfile.PostedFile.FileName;//获得文件的完整路径名 
            strExtension = strOldFilePath.Substring(strOldFilePath.LastIndexOf(".")).ToLower();//获得文件的扩展名，如：.jpg 
            for (int i = 0; i < arrExtension.Length; i++)
            {
                if (strExtension.Equals(arrExtension[i]))
                {
                    return true;
                }
            }
        }
        return false;
    }
    

}