<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectContent.aspx.cs" Inherits="Display_ProjectContent" %>

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
			<h1>项目信息</h1>
		</div>
		<span class="cut"></span>
		<form action="" runat="server">
			<div class="clearfix">
				<h2>项目名称:</h2>
                <asp:TextBox ID="txtName" runat="server" class="name" ReadOnly="true"></asp:TextBox>
			</div>
			<div class="clearfix">
				<h2>项目类型:</h2>
                <asp:TextBox ID="txtCategory" runat="server" class="type" ReadOnly="true"></asp:TextBox>
			</div>
            <div class="clearfix">
				<h2>当前阶段:</h2>
                <asp:TextBox ID="txtStage" runat="server" ReadOnly="true"></asp:TextBox>
			</div>
			<div class="clearfix">
				<h2>负责人:</h2>
                <asp:TextBox ID="txtDuty" runat="server" class="duty" ReadOnly="true"></asp:TextBox>
			</div>
			<div class="clearfix">
				<h2>单位:</h2>
                <asp:TextBox ID="txtDepartment" runat="server" class="organization" ReadOnly="true"></asp:TextBox>
			</div>
			<div class="clearfix">
				<h2>申报日期:</h2>
                <asp:TextBox ID="txtYear" runat="server" class="year" ReadOnly="true"></asp:TextBox>
				<h2 class="dif-h2">年</h2>
                <asp:TextBox ID="txtMonth" runat="server" class="month" ReadOnly="true"></asp:TextBox>
				<h2 class="dif-h2">月</h2>
                <asp:TextBox ID="txtDay" runat="server" class="day" ReadOnly="true"></asp:TextBox>
				<h2 class="dif-h2">日</h2>
			</div>
			<div class="clearfix">
				<h2>资助额度:</h2>
                <asp:TextBox ID="txtMoney" runat="server" class="money" ReadOnly="true"></asp:TextBox>
			</div>
			<div class="clearfix">
				<h2>项目内容:</h2>
                <asp:Literal ID="Content" runat="server"></asp:Literal>
			</div>
			<div class="clearfix">
				<h2>项目文件:</h2>
				<a class="redA" class="submit" href="../BackStage/<%= getFileName() %>"><asp:Label ID="lbFileName" runat="server"></asp:Label></a>
			</div>
            <div class="clearfix">
				<h2>是否通过当前阶段:</h2>
                <asp:TextBox ID="txtReslut" runat="server" ReadOnly="true"></asp:TextBox>
			</div>
		</form>
	</div>
	<script type="text/javascript"  src="./js/personal-center-init.js"></script>
	<script type="text/javascript"  src="./js/personal-center-creatProgect.js"></script>
</body>
</html>

