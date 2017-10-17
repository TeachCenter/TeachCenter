<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="BackStage_Index" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
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
<title>教育支持中心后台</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body><form id="form1" runat="server">
<header class="navbar-wrapper">
	<div class="navbar navbar-fixed-top">
		<div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" data-href="Welcome.aspx">教育支持中心后台</a> <a class="logo navbar-logo-m f-l mr-10 visible-xs" href="/aboutHui.shtml">H-ui</a> 
			<span class="logo navbar-slogan f-l mr-10 hidden-xs"></span> 
			<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav">
				
            
		</nav>
<%--            <nav class="nav navbar-nav">
                <a href="Welcome.aspx">我的桌面</a>
            </nav>--%>
		<nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
			<ul class="cl">
				<li>管理员</li>
				<li class="dropDown dropDown_hover">
					<a href="#" class="dropDown_A">admin <i class="Hui-iconfont">&#xe6d5;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><asp:LinkButton ID="lbtChange" runat="server" OnClick="lbtChange_Click" OnClientClick="return confirm('确认退出?')">切换账户</asp:LinkButton></li>
						<li><asp:LinkButton ID="lbtExit" runat="server" OnClick="lbtExit_Click"  OnClientClick="return confirm('确认退出?')">退出</asp:LinkButton></li>
				</ul>
                
			</li>
				<li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
					<ul class="dropDown-menu menu radius box-shadow">
						<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
						<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
						<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
						<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
						<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</div>
</header>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
        <dl id="menu-add">
					<li class="dropDown dropDown_hover" style="width:100%;"><dt><i class="Hui-iconfont dropDown_A">&#xe600;</i> 新增 <i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
						
				
		
			
			<dd>
				<ul class="dropDown-menu menu radius box-shadow" style="width:100%; background-color:rgba(238,238,238,0.98);">
                            <li><a data-title="教学发展添加" data-href="DevelopAdd.aspx" href="javascript:void(0)"><i class="Hui-iconfont">&#xe600;</i> 教学发展添加</a></li>
                            <li><a data-title="添加活动" data-href="ActivityAdd.aspx" href="javascript:void(0)"><i class="Hui-iconfont">&#xe600;</i> 添加活动</a></li>
                            <li><a data-title="添加活动总结" data-href="ActivitySummaryAdd.aspx"  href="javascript:void(0)"><i class="Hui-iconfont">&#xe600;</i> 添加活动总结</a></li>
                            <li><a data-title="添加教学资源" data-href="EduSrcAdd.aspx" href="javascript:void(0)"><i class="Hui-iconfont">&#xe600;</i> 添加教学资源</a></li>
			</ul>
		</dd>
            </li>
	</dl>
        
		<dl id="menu-picture">
			<dt><i class="Hui-iconfont">&#xe613;</i>滚动图片管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="BannerList.aspx" data-title="滚动图片管理" href="javascript:void(0)">滚动图片管理</a></li>
			</ul>
		</dd>
	</dl>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe616;</i> 中心简介管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="Introduction.aspx" data-title="中心简介管理" href="javascript:void(0)">中心简介管理</a></li>
			</ul>
		</dd>
	</dl>
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe616;</i> 教学发展管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="DevelopManage.aspx" data-title="教学发展管理" href="javascript:void(0)">教学发展管理</a></li>
                    <li><a data-href="DevelopAdd.aspx" data-title="教学发展添加" href="javascript:void(0)">教学发展添加</a></li>
			        <li><a data-href="DevelopCategoryManage.aspx" data-title="教学发展分类管理" href="javascript:void(0)">教学发展分类管理</a></li>
                </ul>
		</dd>
	</dl>
        <dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe616;</i> 服务管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="ServiceManage.aspx" data-title="服务管理" href="javascript:void(0)">服务管理</a></li>
                    <li><a data-href="ServiceCategoryManage.aspx" data-title="服务分类管理" href="javascript:void(0)">服务分类管理</a></li>
                </ul>
		</dd>
	</dl>
		<dl id="menu-product">
			<dt><i class="Hui-iconfont">&#xe620;</i> 项目管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="ProCategoryList.aspx" data-title="项目分类管理" href="javascript:void(0)">项目分类管理</a></li>
                    <li><a data-href="ProCategoryAdd.aspx" data-title="添加项目分类" href="javascript:void(0)">添加项目分类</a></li>
                    <li><a data-href="ProjectList.aspx" data-title="项目管理" href="javascript:void(0)">项目管理</a></li>
                   <%-- <li><a data-href="ProjectJudge.aspx" data-title="评审结果" href="javascript:void(0)">评审结果</a></li>
                    --%>
                
                </ul>
		</dd>
	</dl>
		<dl id="menu-comments">
			<dt><i class="Hui-iconfont">&#xe622;</i> 活动管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="ActivityCatagoryManage.aspx" data-title="活动分类管理" href="javascript:;">活动分类管理</a></li>
					<li><a data-href="ActivityManage.aspx" data-title="活动信息管理" href="javascript:void(0)">活动信息管理</a></li>
                    <li><a data-href="ActivityAdd.aspx" data-title="添加活动" href="javascript:;">添加活动</a></li>
					<li><a data-href="ActivitySummaryManage.aspx" data-title="活动总结管理" href="javascript:void(0)">活动总结管理</a></li>
                    <li><a data-href="ActivitySummaryAdd.aspx" data-title="添加活动总结" href="javascript:;">添加活动总结</a></li>
			</ul>
		</dd>
	</dl>
		<dl id="menu-member">
			<dt><i class="Hui-iconfont">&#xe616;</i> 教学资源管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="EduSrcList.aspx" data-title="教学资源管理" href="javascript:;">教学资源管理</a></li>
					<li><a data-href="EduSrcAdd.aspx" data-title="添加教学资源" href="javascript:;">添加教学资源</a></li>
					
			</ul>
		</dd>
           
	</dl>
		<dl id="menu-admin">
			<dt><i class="Hui-iconfont">&#xe62d;</i> 教师管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="JudgeApplyList.aspx" data-title="评审申请管理" href="javascript:void(0)">评审申请管理</a></li>
			        <li><a data-href="ResetPwd.aspx" data-title="重置教师密码" href="javascript:void(0)">重置教师密码</a></li>
                </ul>
		</dd>
	</dl>



    <dl id="menu-admin">
			<dt><i class="Hui-iconfont"> &#xe6e2;</i> 回收站<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="RecycleDevelop.aspx" data-title="教学发展" href="javascript:void(0)">教学发展</a></li>
					<li><a data-href="RecycleService.aspx" data-title="服务申请" href="javascript:void(0)">服务申请</a></li>
                    <li><a data-href="RecycleActivity.aspx" data-title="活动信息" href="javascript:void(0)">活动信息</a></li>
					<li><a data-href="RecycleActivitySummary.aspx" data-title="活动总结" href="javascript:void(0)">活动总结</a></li>
                    <li><a data-href="RecycleProjectCategory.aspx" data-title="项目信息" href="javascript:void(0)">项目信息</a></li>
                    <li><a data-href="RecycleProject.aspx" data-title="项目" href="javascript:void(0)">项目</a></li>
                    <li><a data-href="RecycleEducationSourse.aspx" data-title="教学资源" href="javascript:void(0)">教学资源</a></li>
			</ul>
		</dd>
	</dl>
    
		<dl id="menu-system">
			<dt><i class="Hui-iconfont">&#xe62e;</i> 个人信息管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a data-href="AdminInformation.aspx" data-title="修改个人信息" href="javascript:void(0)">个人信息管理</a></li>
				</ul>
			</dd>
		</dl>
</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active">
					<span title="我的桌面" data-href="welcome.aspx">我的桌面</span>
					<em></em></li>
		</ul>
	</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i></a><a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a></div>
</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="display:none" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="welcome.aspx"></iframe>
	</div>
</div>
</section>

<div class="contextMenu" id="Huiadminmenu">
	<ul>
		<li id="closethis">关闭当前 </li>
		<li id="closeall">关闭全部 </li>
</ul>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<script>
    function del() {
        return confirm('确认彻底删除?');
    }
    function recycle() {
        return confirm('确认恢复?');
    }
</script>
</form>
</body>
</html>
