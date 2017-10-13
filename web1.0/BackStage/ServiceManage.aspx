<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ServiceManage.aspx.cs" Inherits="BackStage_ServiceManage" %>

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
    #page{
            width: 200px;
            float: left;
            margin-top: 20px;
            margin-left: 20px;
    }
</style>

<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="manage.js"></script> 
<title>服务列表</title>
</head>
<body><form id="form1" runat="server">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 服务管理 <span class="c-gray en">&gt;</span> 服务列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
	 <span class="select-box inline">

         <asp:DropDownList ID="dropCategory" CssClass="select" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dropCategory_SelectedIndexChanged">
             <asp:ListItem>全部分类</asp:ListItem>
         </asp:DropDownList>

		</span> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;" runat="server">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;" runat="server">
        <asp:LinkButton ID="ltbSearch" runat="server" OnClick="ltbSearch_Click" CssClass="btn btn-success"><i class="Hui-iconfont">&#xe665;</i> 搜索</asp:LinkButton>
		
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><asp:LinkButton ID="ltnDelete" runat="server" CssClass="btn btn-danger radius" OnClick="ltnDelete_Click" OnClientClick="return confirm('确定删除?')"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</asp:LinkButton>
        <asp:LinkButton ID="lbtSet" runat="server" CssClass="btn btn-primary radius" OnClick="lbtSet_Click" OnClientClick="return confirm('确定处理?')"><i class="Hui-iconfont">&#xe600;</i> 批量处理</asp:LinkButton></span> <span class="r">共有数据：<strong><asp:Literal ID="ltCount" runat="server"></asp:Literal></strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-responsive">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">序号</th>
					<th width="80">申请人</th>
					<th width="120">申请时间</th>
					<th width="100">联系方式</th>
					<th >备注</th>
                    <th width="75">审核状态</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody>
                <asp:Repeater ID="rptService" runat="server" OnItemDataBound="rptService_ItemDataBound" OnItemCommand="rptService_ItemCommand">
                    <ItemTemplate>
                        <tr class="text-c">
					        <td><asp:CheckBox ID="checkbox" runat="server" /></td>
					        <td><asp:Literal ID="ltNumber" runat="server"></asp:Literal></td>
					        <td><asp:Literal ID="ltTeacher" runat="server" Text=<%# Eval("Service_teacher") %>></asp:Literal></td>
					        <td><%# Eval("Service_time") %></td>
					        <td><%# Eval("Service_phone") %></td>
					        <td><%# Eval("Service_remarks") %></td>
					        <td class="td-status"><span class='<%# Eval("Service_isdeal").ToString()=="0"?"label label-danger radius":"label label-success radius" %>'><%# Eval("Service_isdeal").ToString()=="0"?"未处理":"已处理" %></span></td>
					        <td class="f-14 td-manage">
                                <asp:Label ID="lbID" Visible="false" runat="server" Text=<%# Eval("Service_id") %>></asp:Label>
                                <asp:LinkButton runat="server" CommandName="Set" CommandArgument='<%# Eval("Service_id") %>' Text="处理"></asp:LinkButton>
                                <asp:LinkButton runat="server" CssClass="text-decoration:none" CommandName="Delete" CommandArgument='<%#Eval("Service_id") %>' OnClientClick="return confirm('确定删除?')"><i class="Hui-iconfont">&#xe6e2;</i></asp:LinkButton>
                            </tr>
                    </ItemTemplate>
                </asp:Repeater>

			</tbody>
		</table>
        		<div id="page">
                    <asp:Button ID="btnLast" runat="server" Text="上一页" Enabled="false" OnClick="btnLast_Click" CssClass="btn btn-primary radius" />
                    <%--<div class="btn btn-primary radius"">--%>
                    <asp:Literal ID="ltNow" runat="server" Text="1"></asp:Literal>/
                    <asp:Literal ID="ltTotal" runat="server"></asp:Literal><%--</div>--%>
				    <asp:Button ID="btnNext" runat="server" Text="下一页" OnClick="btnNext_Click" CssClass="btn btn-primary radius" />
                    <asp:Button ID="btnExport" runat="server" Text="导出Excel" OnClick="btnExport_Click" CssClass="btn btn-primary radius" style="margin-top: 15px;"  />
                </div>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->

<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    function del() {
        return confirm('确认删除?');
    }
    function set() {
        return confirm('确认处理?');
    }
</script> </form>
</body>
</html>