﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectList.aspx.cs" Inherits="BackStage_ProjectList" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

<title>项目列表</title>
</head>
<body><form id="form1" runat="server">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 项目管理 <span class="c-gray en">&gt;</span> 项目列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
	 <span class="select-box inline">
		<asp:DropDownList ID="DropDownList" runat="server" OnSelectedIndexChanged="DropDownList_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
		</span> 日期范围：
		<asp:TextBox runat="server" Text="" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}'})" ID="logmin" class="input-text Wdate" style="width:120px;"></asp:TextBox>
        <asp:TextBox runat="server" Text="" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" ID="logmax" class="input-text Wdate" style="width:120px;"></asp:TextBox>
        <asp:TextBox ID="txtName" runat="server" placeholder=" 项目名称" MaxLength="50" style="width:250px" class="input-text"></asp:TextBox>
        <asp:LinkButton ID="lbtSearch" runat="server" class="btn btn-success" OnClick="lbtSearch_Click"><i class="Hui-iconfont">&#xe665;</i> 搜资讯</asp:LinkButton>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><asp:LinkButton ID="lbtDeleteMore" runat="server" class="btn btn-danger radius" OnClick="lbtDeleteMore_Click" OnClientClick="return confirm('确定删除?')"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</asp:LinkButton> <span class="r">共有数据：<strong><asp:Literal ID="ltSum" runat="server"></asp:Literal></strong> 条</span> </div>
        <div class="mt-20">
		    <table class="table table-border table-bordered table-bg table-hover table-responsive">
			    <thead>
				    <tr class="text-c">
					    <th width="25"><input type="checkbox" runat="server" id="isDelete"></th>
                        <th width="50">序号</th>
					    <th width="300">项目名称</th>
                        <th width="200">项目类型</th>
					    <th width="80">提交者</th>
                        <th width="80">当前状态</th>
					    <th width="120">提交时间</th>
                        <th width="120">删除</th>
                        <th width="120">分配/通过</th>
				    </tr>
			    </thead>
			    <tbody>
                    <asp:Repeater ID="rptProject" runat="server" OnItemCommand="rptProject_ItemCommand" >
                        <ItemTemplate>
				            <tr class="text-c">
					            <td><input type="checkbox" runat="server" id="isDelete"></td>		
                                <td><%# Container.ItemIndex + 1 %></td>			
					            <td class="text-l"><u style="cursor:pointer" class="text-primary")" title="查看"><a href="ProjectContent.aspx?id=<%# Eval("project_id")%>"><%# Eval("name") %></a></u></td>	
                                <td><%# Eval("category_name") %></td>
					            <td><%# Eval("teacher_name")%><input type="hidden" runat="server" id="id" value=<%# Eval("project_id")%> /></td>
                                <td><%# getStage(Eval("project_id").ToString()) %></td>
					            <td><%# Eval("submit_time") %></td>
                                <td class="f-14 td-manage"><asp:LinkButton ID="lbtDelete" runat="server" CssClass="ml-5" CommandName="Delete" CommandArgument='<%#Eval("project_id") %>' OnClientClick="return confirm('确定删除?')">删除<i class="Hui-iconfont">&#xe6e2;</i></asp:LinkButton></td>
                                <td class="f-14 td-manage"><asp:LinkButton ID="lbtDiliver" runat="server" CssClass="ml-5" CommandName="Diliver" CommandArgument='<%#Eval("project_id") %>' >分配/通过</asp:LinkButton></td>
				            </tr>
                        </ItemTemplate>
                    </asp:Repeater>

			    </tbody>
		    </table>

            <div class="change-page" style="width:430px;margin:0 auto;margin-top: 12px;">
				<asp:LinkButton ID ="Prev" runat ="server" Text ="上一页" onclick="Prev_Click" CssClass="btn btn-primary radius"></asp:LinkButton>
				<asp:LinkButton ID ="First" runat ="server" Text ="首页" onclick="First_Click" CssClass="btn btn-primary radius"></asp:LinkButton>				
				<asp:LinkButton ID ="Last" runat ="server" Text ="尾页" onclick="Last_Click" CssClass="btn btn-primary radius"></asp:LinkButton>
				<asp:LinkButton ID ="Next" runat ="server" Text ="下一页" onclick="Next_Click" CssClass="btn btn-primary radius"></asp:LinkButton>   
                页次：<asp:Label ID="currentPage" runat="server" Text ="1" ></asp:Label>/<asp:Literal ID="TotalPage" runat="server"></asp:Literal>
				转 <asp:TextBox ID="turnTopage" runat ="server" MaxLength ="5" onkeyup="this.value=this.value.replace(/\D/g,'')" style="width:30px" class="input-text"></asp:TextBox>
                <asp:LinkButton ID ="Jump" runat ="server" Text ="Go" onclick="Jump_Click" CssClass="btn btn-primary radius"></asp:LinkButton>                                       
			</div>
            <asp:Button ID="btnExport" runat="server" Text="导出Excel" OnClick="btnExport_Click" CssClass="btn btn-primary radius" style="margin-top: 15px;"  />

            <asp:Panel ID="Judge" Visible ="false" runat="server" style="width:1200px;margin-top:50px">
            <input type="hidden" runat="server" id="pro_id" value="" />
            <table class="table table-border table-bordered table-bg table-hover table-responsive">
			    <thead>
				    <tr class="text-c">
					    <th width="25"> </th>
					    <th width="300">评委姓名</th>
				    </tr>
			    </thead>
			    <tbody>
                    <asp:Repeater ID="rptJudge" runat="server">
                        <ItemTemplate>
				            <tr class="text-c">
					            <td><input type="checkbox" runat="server" id="isDeleted" ></td>					
					            <td><%# Eval("name")%><input type="hidden" runat="server" id="id" value=<%# Eval("id")%> /></td>
				            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
			    </tbody>
		    </table>
            <asp:Button ID="btnCheck" runat="server" Text="确认分配" OnClientClick="return confirm('确定将该项目分配给选中的评审?')" OnClick="btnCheck_Click" CssClass="btn btn-primary radius" style="margin-top:15px;"/>
        </asp:Panel>
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
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"pading":false,
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,8]}// 不参与排序的列
	]
});

/*资讯-添加*/
function article_add(title,url,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*资讯-编辑*/
function article_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*资讯-删除*/
function article_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*资讯-审核*/
function article_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}
/*资讯-下架*/
function article_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
		$(obj).remove();
		layer.msg('已下架!',{icon: 5,time:1000});
	});
}

/*资讯-发布*/
function article_start(obj,id){
	layer.confirm('确认要发布吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布!',{icon: 6,time:1000});
	});
}
/*资讯-申请上线*/
function article_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}

</script> </form>
</body>
</html>
