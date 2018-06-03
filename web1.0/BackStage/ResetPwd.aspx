<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPwd.aspx.cs" Inherits="BackStage_ResetPwd" %>

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
    <script src="jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="manage.js" type="text/javascript"></script>
<style type="text/css">
        .container{

        }

    </style>
<title>重置密码</title>
</head>
<body><form id="form1" runat="server">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>教师管理<span class="c-gray en">&gt;</span>服务分类列表<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container" style="width: 1000px;position: absolute;right:0;margin-top:115px;">
    <div>
        <span class="form-label col-xs-4 col-sm-2" style="width:180px;">请输入教师工号:</span>
        <asp:TextBox ID="txtNumber" CssClass="input-text" style="width:250px;" runat="server" MaxLength="10"></asp:TextBox>
        <asp:Button ID="btnSub" runat="server" Text="搜索" style="margin-left:20px;" CssClass="btn btn-primary radius" OnClick="btnSub_Click" />
    </div>
    
    <div id="divTeacher" style="margin-top: 30px;" runat="server">
        <span class="form-label col-xs-4 col-sm-2">教师姓名 :<asp:Literal ID="ltName" runat="server"></asp:Literal> </span>
        <br />
        <br />
        <span class="form-label col-xs-4 col-sm-2">工号 : <asp:Literal ID="ltNumber" runat="server"></asp:Literal> </span>
        <br />
        <br />
        <asp:Button ID="BtnReset" style="margin-left:16px;" runat="server" Text="重置" CssClass="btn btn-primary radius" OnClick="BtnReset_Click" />
    </div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

function del()
    {
        return confirm('确认重置?');
    }


</script> </form>
</body>
</html>
