<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActivityTeacher.aspx.cs" Inherits="BackStage_ActivityTeacher" %>


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

<style type="text/css">
        #table {
            width:auto;
            margin:0 auto;
        }
        #page{
            width: 200px;
            float: left;
            margin-top: 20px;
            margin-left: 20px;
        }
</style>
<title>活动分类管理</title>
</head>
<body><form id="form1" runat="server">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>活动信息管理<span class="c-gray en">&gt;</span>参加活动老师名单<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">

	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"></span>
    <span class="r">共有数据：<strong><asp:Literal ID="ltCount" runat="server"></asp:Literal></strong> 条</span> </div>
	<div class="mt-20">
		<table id="table" class="table table-border table-bordered table-bg table-hover table-responsive">
			<thead>
				<tr class="text-c">
					<th width="80">序号</th>
					<th width="200">教师工号</th>
                    <th width="200">教师名称</th>
                    <th width="300">电话号码</th>
                    <th width="300">联络邮箱</th>
				</tr>
			</thead>
			<tbody>
                <asp:Repeater ID="rptCategory" runat="server" OnItemDataBound="rptCategory_ItemDataBound" >
                    <ItemTemplate>
                        <tr class="text-c">
					        <td><asp:Literal runat="server" ID="ltNumber" Text=""></asp:Literal></td>
                            <td><%# Eval("number") %></td>
                            <td><%# Eval("name") %></td>
                            <td><%# Eval("phone_number") %></td>
                            <td><%# Eval("email") %></td>
				        </tr>
                    </ItemTemplate>
                </asp:Repeater>

			</tbody>
		</table>
        				
                <div id="page">
                    <asp:Button ID="btnLast" runat="server" Text="上一页" Enabled="false" OnClick="btnLast_Click" CssClass="btn btn-primary radius" />
                    <asp:Literal ID="ltNow" runat="server" Text="1"></asp:Literal>/
                    <asp:Literal ID="ltTotal" runat="server"></asp:Literal>
				    <asp:Button ID="btnNext" runat="server" Text="下一页" OnClick="btnNext_Click" CssClass="btn btn-primary radius" />
                    <p style="margin-top:20px"> <asp:Button ID="btnExcel" runat="server" Text="导出Excel" OnClick="btnExcel_Click" CssClass="btn btn-primary radius" />
                   </p>
                </div>
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
 </form>
</body>
</html>
