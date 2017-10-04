<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RecycleEducationSourse.aspx.cs" Inherits="BackStage_RecycleEducationSourse" %>

<!DOCTYPE html>

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

<title>回收站--教学资源</title>
</head>
<body><form id="form1" runat="server">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 回收站 <span class="c-gray en">&gt;</span> 教学资源列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
	    日期范围：
		<asp:TextBox runat="server" Text="" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}'})" ID="logmin" class="input-text Wdate" style="width:120px;"></asp:TextBox>
        <asp:TextBox runat="server" Text="" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" ID="logmax" class="input-text Wdate" style="width:120px;"></asp:TextBox>
        <asp:TextBox ID="txtTitle" runat="server" placeholder=" 教学资源名称" style="width:250px" class="input-text"></asp:TextBox>
        <asp:LinkButton ID="lbtSearch" runat="server" class="btn btn-success" OnClick="lbtSearch_Click"><i class="Hui-iconfont">&#xe665;</i> 搜资讯</asp:LinkButton>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><asp:LinkButton ID="lbtDeleteMore" runat="server" class="btn btn-danger radius" OnClick="lbtDeleteMore_Click" OnClientClick="return confirm('确定删除?')"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</asp:LinkButton>
         <a class="btn btn-primary radius" data-title="添加教学资源">
             <i class="Hui-iconfont"> 批量恢复</i><asp:LinkButton runat="server" ID="lbtRecycle" OnClick="lbtRecycle_Click"></asp:LinkButton></a></span> 
        <span class="r">共有数据：<strong><asp:Literal ID="ltSum" runat="server"></asp:Literal></strong> 条</span> </div>
        <div class="mt-20">
		    <table class="table table-border table-bordered table-bg table-hover table-responsive">
			    <thead>
				    <tr class="text-c">
					    <th width="25"><input type="checkbox" runat="server" id="isDeleteMore"></th>
					    <th width="300">标题</th>
                        <th width="200">内容</th>					    
					    <th width="120">提交时间</th>
                        <th width="80">浏览数</th>
                        <th width="120">操作</th>
				    </tr>
			    </thead>
			    <tbody>
                    <asp:Repeater ID="rptSource" runat="server" OnItemCommand="rptSource_ItemCommand">
                        <ItemTemplate>
				            <tr class="text-c">
					            <td><input type="checkbox" runat="server" id="isDelete"></td>					
					            <td class="text-l"><u style="cursor:pointer" class="text-primary")" title="查看"><a href="EduSrcContent.aspx?id=<%# Eval("id")%>"><%# Eval("title") %></a></u></td>	
                                <td><%# UeditorHelper.NoHTML(Eval("body").ToString()) %></td>
					            <td><%# Eval("publish_time")%><input type="hidden" runat="server" id="id" value=<%# Eval("id")%> /></td>
					            <td><%# Eval("view_times") %></td>
                                <td class="f-14 td-manage">
                                     <asp:LinkButton  runat="server" CssClass="ml-5" CommandName="Recycle" CommandArgument='<%#Eval("id") %>' OnClientClick="return confirm('确定恢复?')">恢复</asp:LinkButton>
                                    <asp:LinkButton ID="lbtDelete" runat="server" CssClass="ml-5" CommandName="Delete" CommandArgument='<%#Eval("id") %>' OnClientClick="return confirm('确定彻底删除?')">删除</asp:LinkButton>

                                </td>
                               
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
