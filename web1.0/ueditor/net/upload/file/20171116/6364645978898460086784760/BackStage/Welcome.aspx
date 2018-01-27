<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="BackStage_Welcome" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
    <style type="text/css">
        .style-admin p{
            font-size:20px;
            margin-top:10px;
        }
        .style-admin span,a{
            color:brown;
        }
        .style-admin div{
            width:85%;
            height:2px;
            background-color:rgb(229, 229, 229);

        }
    </style>

<title>我的桌面</title>
</head>
<body><form runat="server">
<div class="page-container style-admin">
    <p class="f-20 text-success" style="font-size:30px">欢迎登陆， <span class="f-14"></span><asp:Literal ID="ltName" runat="server"></asp:Literal></p>
    <div></div>
    <p>用户类型：管理员</p>
    <p id="email" runat="server">您的邮箱尚未验证！<a href="AdminInformation.aspx">前去验证>></a></p>
    <div></div>
    <p id="services" runat="server">当前有<asp:Label ID="ltServese" runat="server"></asp:Label>条<span>服务申请</span>尚未处理<a href="ServiceManage.aspx">前去处理>></a></p>
    <p id="applys" runat="server">当前有<asp:Label ID="ltApply" runat="server"></asp:Label>条<span>评审申请</span>尚未处理<a href="JudgeApplyList.aspx">前去处理>></a></p>
</div>

<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
    </form>
</body>
</html>