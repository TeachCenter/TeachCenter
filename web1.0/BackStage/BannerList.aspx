<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BannerList.aspx.cs" Inherits="BackStage_BannerList" %>

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
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

<title>首页轮播图列表</title>
</head>
<body><form id="form1" runat="server">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 轮播图管理 <span class="c-gray en">&gt;</span> 轮播图列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><asp:LinkButton ID="lbtDeleteMore" runat="server" class="btn btn-danger radius" OnClick="lbtDeleteMore_Click" OnClientClick="return confirm('确定删除?')"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</asp:LinkButton> <asp:LinkButton ID="lbtAdd" runat="server" CssClass="btn btn-primary radius" PostBackUrl="~/BackStage/BannerAdd.aspx" ><i class="Hui-iconfont">&#xe6e2;</i> 添加轮播图</asp:LinkButton>  <span class="r">共有数据：<strong><asp:Literal ID="ltSum" runat="server"></asp:Literal></strong> 条</span> </div>
    <%--<asp:Panel id="panelUpload" runat="server" visible="false">
        <asp:FileUpload ID="myFileUpload" runat="server" CssClass="input-text" style="border:none;" />
        <asp:Button ID="btnSub" runat="server" CssClass="btn btn-primary radius" OnClick="btnSub_Click" Text="提交" />
    </asp:Panel>  --%>
    <div class="mt-20">
		    <table class="table table-border table-bordered table-bg table-hover table-responsive">
			    <thead>
				    <tr class="text-c">
					    <th width="25"><input type="checkbox" runat="server" id="isDelete"></th>
					    <th style="width:100px">图片</th>
                        <th width="200">标题</th>
                        <th width="120">摘要</th>
                        <th width="120">链接</th>
                        <th width="120">当前状态</th>
                        <th width="120">删除</th>
                        <th width="120">置顶</th>
				    </tr>
			    </thead>
			    <tbody>
                    <asp:Repeater ID="rptBanner" runat="server" OnItemCommand="rptBanner_ItemCommand">
                        <ItemTemplate>
				            <tr class="text-c">
					            <td><input type="checkbox" runat="server" id="isDelete"></td>					
					            <td style="width:100px"><a href="javascript:;" onClick="picture_edit('图库编辑','picture-show.html','10001')"><img width="100" class="picture-thumb" src=<%#Eval("Picture_path") %>></a></td>
                                <td><%# Eval("Picture_title") %></td>
                                <td><%# Eval("Picture_summary").ToString().Length > 35? Eval("Picture_summary").ToString().Substring(0,35):Eval("Picture_summary") %></td>
                                <td><%# Eval("Picture_link") %></td>
					            <td><%# judgeDisplay(Convert.ToInt32(Eval("Picture_id").ToString())) == true?"展示中":"未展示"%><input type="hidden" runat="server" id="id" value=<%# Eval("Picture_id")%> /></td>
                                <td class="f-14 td-manage"><asp:LinkButton ID="lbtDelete" runat="server" CssClass="ml-5" CommandName="Delete" CommandArgument='<%#Eval("Picture_id") %>' OnClientClick="return confirm('确定删除?')">删除<i class="Hui-iconfont">&#xe6e2;</i></asp:LinkButton></td>
                                <td class="f-14 td-manage"><asp:LinkButton ID="lbtOnTop" runat="server" CssClass="ml-5" CommandName="OnTop" CommandArgument='<%#Eval("Picture_id") %>' >置顶</asp:LinkButton></td>
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
