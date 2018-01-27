<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Introduction.aspx.cs" ValidateRequest="false" Inherits="BackStage_Introduction" %>

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
    <link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        #lbContent{
            display: block;
            margin: 15px 10%;
        }
        #btnChange{
            display:block;
            margin-left: 10%;
        }
        .divCenter{
            width:1030px;
            margin: 0 auto;
        }
        #myEditor11{
            margin-top:20px;
            margin-bottom:35px;
        }
    </style>
<title>中心管理简介</title>
</head>
<body><form runat="server">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 中心简介管理 <span class="c-gray en">&gt;</span> 中心简介管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <asp:Label ID="lbContent" runat="server"></asp:Label>

    <asp:Button ID="btnChange" runat="server" Text="修改中心简介" OnClick="btnChange_Click" CssClass="btn btn-primary radius" />
    <div class="divCenter">
        <textarea id="myEditor11" name="myEditor11" runat="server" onblur="setUeditor()" style="width: 1030px; height: 250px;"></textarea>
        <%-- 上面这个style这里是实例化的时候给实例化的这个容器设置宽和高，不设置的话，或默认为auto可能会造成部分显示的情况--%>
    
        <script type="text/javascript">
            var editor = new baidu.editor.ui.Editor();
            editor.render("<%=myEditor11.ClientID%>");
            // alert(editor);
         </script>
     
        <script type="text/javascript">
             function setUeditor() {
             var myEditor11 = document.getElementById("myEditor11");
             myEditor11.value = editor.getContent();//把得到的值给textarea
             }
         </script>
        <asp:Button ID="btnSub" runat="server" Text="提交" OnClick="btnSub_Click" CssClass="btn btn-primary radius" />
     </div>
</div>

</form></body>
</html>
