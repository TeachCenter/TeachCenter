<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActivityManage.aspx.cs" Inherits="BackStage_ActivityManage" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
    <script src="jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="manage.js" type="text/javascript"></script>


<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

<title>活动信息列表</title>
<style type="text/css">
    #page{
            width: 200px;
            float: left;
            margin-top: 20px;
            margin-left: 20px;
    }
</style>

<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 

</head>
<body><form id="form1" runat="server">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 活动信息管理 <span class="c-gray en">&gt;</span> 活动信息列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
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
        <asp:LinkButton ID="lbtSet" runat="server" CssClass="btn btn-primary radius" PostBackUrl="~/BackStage/ActivityAdd.aspx"><i class="Hui-iconfont">&#xe600;</i> 添加活动总结</asp:LinkButton></span> <span class="r">共有数据：<strong><asp:Literal ID="ltCount" runat="server"></asp:Literal></strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-responsive" style="table-layout: fixed;">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="60">序号</th>
                    <th width="170">标题</th>
					<th width="100">发布人</th>
					<th width="120">活动时间</th>
                    <th width="120">活动地点</th>
                    <th width="80">当前人数</th>
                    <th width="80">限制人数</th>
                    <th width="120">活动类型</th>
					<th >内容</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody>
                <asp:Repeater ID="rptActivity" runat="server" OnItemCommand="rptActivity_ItemCommand" OnItemDataBound="rptActivity_ItemDataBound">
                    <ItemTemplate>
                        <tr class="text-c">
                            
					        <td><asp:CheckBox ID="checkbox" runat="server" /></td>
					        <td><asp:Literal ID="ltNumber" runat="server"></asp:Literal></td>
					        
					        <td style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;"><a href='<%#"../Display/Activity.aspx?id="+ Eval("Activity_id") %>'><%# Eval("Activity_title") %></a></td>
					        <td><%# Eval("Activity_author") %></td>
					        <td><%# Eval("Activity_time") %></td>
                            <td><%# Eval("Activity_place") %></td>
                            <td><a href='<%# "ActivityTeacher.aspx?id="+ Eval("Activity_id")  %>'><%# Eval("Activity_nowcount") %></a></td>
                            <td><%# Eval("Activity_limitcount") %></td>
                            <td><asp:Literal ID="ltCategory" runat="server" Text='<%# Eval("Activity_categoryid") %>'></asp:Literal></td>
					        <td class="td-status"><a href='<%#"../Display/Activity.aspx?id="+ Eval("Activity_id") %>'><asp:Literal ID="ltContent" runat="server" Text=<%# Eval("Activity_content") %>></asp:Literal></a></td>
					        <td class="f-14 td-manage">
                                <asp:Label ID="lbID" Visible="false" runat="server" Text=<%# Eval("Activity_id") %>></asp:Label>
                                <a style="text-decoration:none" class="ml-5" href='<%#"ActivityEditor.aspx?id="+ Eval("Activity_id") %>' title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
                                <asp:LinkButton runat="server" CssClass="text-decoration:none" CommandName="Delete" CommandArgument='<%#Eval("Activity_id") %>' OnClientClick="del()"><i class="Hui-iconfont">&#xe6e2;</i></asp:LinkButton>
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
</script> </form>
</body>
</html>
