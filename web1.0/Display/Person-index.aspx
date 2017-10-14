<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Person-index.aspx.cs" Inherits="Display_Person_index" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="css/personal-center-init.css">
	<link rel="stylesheet" href="css/personal-center-index.css">
	<script type="text/javascript"  src="./js/jquery-3.1.1.min.js"></script>
</head>
<body><form runat="server">
	<div class="left-nav">
		<img src="./images/logo-big.png" alt="">
		<ul>
			<li><a class="dif-li" href="Person-index.aspx">个人主页</a></li>
			<li><a href="EditInfo.aspx">修改信息</a></li>
			<li><a href="MyProject.aspx">项目管理</a></li>
			<li><a href="MyServiceList.aspx">服务管理</a></li>
			<li><a href="MyActivityList.aspx">活动管理</a></li>
			<li><a href="MyJudgePro.aspx">评审服务</a></li>
		</ul>
	</div>
    <div class="right-content">
		<div class="clearfix">
			<h1>你好，<asp:Literal ID="ltName" runat="server"></asp:Literal></h1>
		</div>
		
		<div class="clearfix">
			<h2>用户类型：<asp:Literal ID="ltType" runat="server"></asp:Literal></h2>
		</div>
		
		<span class="cut"></span>
		<div runat="server" id="divInformation" class="clearfix">
			<h2>您的个人信息尚未填写完整，</h2>
			<a href="">前去完善个人信息>></a>
		</div>
		
		<span class="cut"></span>
		<div class="clearfix">
			<h2>您的《项目名称项目名称项目名称》第二阶段尚未提交，</h2>
			<a href="">前去提交>></a>
		</div>
		<div class="clearfix">
			<h2>您的<span>32</span>个项目信息等待评审，</h2>
			<a href="">前去评审>></a>
		</div>
	</div>
	<script type="text/javascript"  src="./js/personal-center-init.js"></script></form>
</body>
</html>