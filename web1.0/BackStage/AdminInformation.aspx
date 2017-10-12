<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminInformation.aspx.cs" Inherits="BackStage_AdminInformation" %>

<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

    <script src="jquery-3.2.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>


    <script src="manage.js" type="text/javascript"></script>
    
    <style type="text/css">
        .lbCheck{
            color:brown;
        }
        #lbID,#lbName,#lbEmail,#lbCheck,#lbPwd{
            text-align: left;
            width: 250px;
            font-size: 20px;
        }
        #size{
            font-size:20px;
        }
        #btnCheck,#txtPwd,#btnNewPwd{
            margin-top:5px;
        }
    </style>
<title>管理员个人信息</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form runat="server" class="form form-horizontal">
		<div class="row cl">
			<label id="size" class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>账号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				
                <asp:Label ID="lbID" runat="server" CssClass="form-label col-xs-4 col-sm-2 left"></asp:Label>
			    <asp:LinkButton ID="lbPwd" runat="server" CssClass="form-label col-xs-4 col-sm-2" OnClick="lbPwd_Click"> 修改密码 >></asp:LinkButton>
            </div>
		</div>
            <div runat="server" id="divPwd" class="row cl" visible="false">
			<label id="size" class="form-label col-xs-4 col-sm-2" style="width:250px"><span class="c-red"></span>验证码已发送至邮箱,请输入验证码</label>
			<div class="formControls col-xs-8 col-sm-9">
				<asp:TextBox ID="txtCheckPwd" runat="server" CssClass="input-text"></asp:TextBox>
                <asp:Button ID="txtPwd" runat="server" CssClass="btn btn-primary radius" Text="验证" OnClick="txtPwd_Click" />
            </div>
		</div>
           <div runat="server" id="divEditor" class="row cl" visible="false">
			<label id="size" class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>请输入新密码</label>
			<div class="formControls col-xs-8 col-sm-9">
				<asp:TextBox ID="txtNewPwd" TextMode="Password" runat="server" CssClass="input-text"></asp:TextBox>
                <asp:Button ID="btnNewPwd" runat="server" CssClass="btn btn-primary radius" Text="提交" OnClick="btnNewPwd_Click"  />
            </div>
		</div>

                <div class="row cl">
			<label id="size" class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>名字：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<asp:TextBox ID="txtName" runat="server" CssClass="input-text" Visible="false"></asp:TextBox>
                <asp:Label ID="lbName" runat="server" CssClass="form-label col-xs-4 col-sm-2 left"></asp:Label>
               
			</div>
		</div>
        <div class="row cl">
			<label id="size" class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<asp:TextBox ID="txtEmail" runat="server" CssClass="input-text" Visible="false"></asp:TextBox>
                <asp:Label ID="lbEmail" runat="server" CssClass="form-label col-xs-4 col-sm-2 left"></asp:Label>
			    <asp:LinkButton ID="lbCheck" runat="server" CssClass="form-label col-xs-4 col-sm-2" Enabled="false" OnClick="lbCheck_Click"></asp:LinkButton>
            </div>
		</div>
        <div runat="server" id="divCheck" class="row cl" visible="false">
			<label id="size" class="form-label col-xs-4 col-sm-2" style="width:250px"><span class="c-red"></span>验证码已发送至邮箱,请输入验证码</label>
			<div class="formControls col-xs-8 col-sm-9">
				<asp:TextBox ID="txtCheck" runat="server" CssClass="input-text"></asp:TextBox>
                <asp:Button ID="btnCheck" runat="server" CssClass="btn btn-primary radius" Text="验证" OnClick="btnCheck_Click" />
            </div>
		</div>

		<div class="row cl" style="margin-top:20px;">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <asp:Button ID="btnSub" runat="server" CssClass="btn btn-primary radius" OnClick="btnSub_Click" Visible="false" Text="提交" />
                <asp:Button ID="btnEditor" runat="server" CssClass="btn btn-primary radius" OnClick="btnEditor_Click" Text="修改" />
				
			</div>
		</div>
        <script type="text/javascript">
            //判断标题不能为空
            $("#txtTitle").focusout(function () {
                var txtTitle = $("#txtTitle");
                if (txtTitle.val().length == 0) {
                    txtTitle.val("输入不能为空");
                    txtTitle.css("color", "red");
                    $("#btnSub").attr("disabled", true);
                }
                else {
                    txtTitle.css("color", "#333");
                    $("#btnSub").attr("disabled", false);
                }
            });
        </script>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.config.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>

<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>

