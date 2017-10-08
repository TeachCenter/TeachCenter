﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectContent.aspx.cs" Inherits="Display_ProjectContent" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="css/personal-center-init.css">
	<link rel="stylesheet" href="css/personal-center-checkProgect.css">
	<script type="text/javascript"  src="./js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<div class="left-nav">
		<img src="./images/logo-big.png" alt="">
		<ul>
			<li class="dif-li"><a href="	">个人主页</a></li>
			<li><a href="	">修改信息</a></li>
			<li><a href="	">项目管理</a></li>
			<li><a href="	">服务管理</a></li>
			<li><a href="	">活动管理</a></li>
			<li><a href="	">评审服务</a></li>
		</ul>
	</div>
	<div class="right-content">
		<div class="clearfix">
			<h1>< 项目名称项目名称</h1>
		</div>
		<span class="cut"></span>
		<form action="" runat ="server">
			<div class="clearfix">
				<h2>项目名称:</h2>
				<input class="name" type="text" value="项目名称" readonly="readonly">
			</div>
			<div class="clearfix">
				<h2>项目类型:</h2>
				<input class="type" type="text" value="项目类型" readonly="readonly">
			</div>
			<div class="clearfix">
				<h2>负责人:</h2>
				<input class="duty" type="text" value="王小明" readonly="readonly">
			</div>
			<div class="clearfix">
				<h2>单位:</h2>
				<input class="organization" type="text" value="信息科学与工程学院" readonly="readonly">
			</div>
			<div class="clearfix">
				<h2>申报日期:</h2>
				<input class="year" type="text" value="2017" readonly="readonly">
				<h2 class="dif-h2">年</h2>
				<input class="month" type="text" value="9" readonly="readonly">
				<h2 class="dif-h2">月</h2>
				<input class="day" type="text" value="23" readonly="readonly">
				<h2 class="dif-h2">日</h2>
			</div>
			<div class="clearfix">
				<h2>资助额度:</h2>
				<input class="money" type="text" value="200000" readonly="readonly">
			</div>
			<div class="clearfix">
				<h2>项目内容:</h2>
				<textarea name="txtIntroduction" type="text" class="content" readonly="readonly" >项目内容</textarea>
			</div>
			<div class="clearfix">
				<h2>项目文件:</h2>
				<a class="redA" href="" class="submit" >项目附件文件名项目附件文件名.pdf</a>
			</div>
			<div class="clearfix">
				<h2>评审意见:</h2>
				<textarea name="txtIntroduction" type="text" class="content" readonly="readonly" >评审意见</textarea>
			</div>
			<div class="clearfix">
				<h2>上传文件:</h2>
                <asp:FileUpload ID="myFileUpload" runat="server" CssClass="input-text" style="border:none;" />
				<%--<a class="choose" href="	">选择文件</a>
				
				<h3>仅支持.pdf .doc 格式文件</h3>--%>
			</div>
			<a href="" class="submit">提交项目</a>
		</form>
	</div>
	<script type="text/javascript"  src="./js/personal-center-init.js"></script>
	<script type="text/javascript"  src="./js/personal-center-creatProgect.js"></script>
</body>
</html>
