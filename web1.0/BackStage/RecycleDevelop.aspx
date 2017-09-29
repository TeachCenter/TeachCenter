<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecycleDevelop.aspx.cs" Inherits="BackStage_RecycleDevelop" %>



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

<title>资讯列表</title>
</head>
<body><form id="form1" runat="server">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 教学发展管理 <span class="c-gray en">&gt;</span> 教学发展列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
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
		<asp:TextBox ID="txtSearch" runat="server"  style="width:250px" class="input-text"></asp:TextBox>
        <asp:LinkButton ID="ltbSearch" runat="server" OnClick="ltbSearch_Click" CssClass="btn btn-success"><i class="Hui-iconfont">&#xe665;</i> 搜索</asp:LinkButton>
    </div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><asp:LinkButton ID="ltnDelete" runat="server" CssClass="btn btn-danger radius" OnClick="ltnDelete_Click" OnClientClick="del()"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</asp:LinkButton>
    <asp:LinkButton ID="ltbRecycle" runat="server" CssClass="btn radius btn-default" OnClick="ltbRecycle_Click" OnClientClick="recycle()">批量恢复</asp:LinkButton>    
    </span> <span class="r">共有数据：<strong><asp:Literal ID="ltCount" runat="server"></asp:Literal></strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-responsive">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">序号</th>
                    <th width="120">标题</th>
					<th width="80">发布人</th>
					<th width="120">发布时间</th>
					<th >内容</th>
                    <th width="120">分类</th>
                    <th width="75">发布状态</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody>
                <asp:Repeater ID="rptService" runat="server" OnItemDataBound="rptService_ItemDataBound" OnItemCommand="rptService_ItemCommand">
                    <ItemTemplate>
                        <tr class="text-c">
					        <td><asp:CheckBox ID="checkbox" runat="server" /></td>
					        <td><asp:Literal ID="ltNumber" runat="server"></asp:Literal></td>
                            <td><%# Eval("Develop_title") %></td>
					        <td><asp:Literal ID="ltTeacher" runat="server" Text=<%# Eval("Develop_author") %>></asp:Literal></td>
					        <td><%# Eval("Develop_time") %></td>
					        <td class="td-status"><a href='<%#"../Display/Develop.aspx?id="+ Eval("Develop_id") %>'><asp:Literal ID="ltContent" runat="server" Text=<%# Eval("Develop_content") %>></asp:Literal></a></td>
                            <td><asp:Literal ID="ltCategory" runat="server" Text='<%# Eval("Develop_category") %>'></asp:Literal></td>
					        <td class="td-status"><span class="label label-danger radius">已删除</span></td>
					        <td class="f-14 td-manage">
                                <asp:Label ID="lbID" Visible="false" runat="server" Text=<%# Eval("Develop_id") %>></asp:Label>
                                <asp:LinkButton runat="server" CssClass="text-decoration:none" CommandName="Recycle" CommandArgument='<%#Eval("Develop_id") %>' OnClientClick="recycle()">恢复</asp:LinkButton>
                                <asp:LinkButton runat="server" CssClass="text-decoration:none" CommandName="Delete" CommandArgument='<%#Eval("Develop_id") %>' OnClientClick="del()"><i class="Hui-iconfont">&#xe6e2;</i></asp:LinkButton>
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
        return confirm('确认彻底删除?');
    }
    function recycle() {
        return confirm('确认恢复?');
    }
</script> </form>
</body>
</html>
