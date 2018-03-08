<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyServiceEditor.aspx.cs" Inherits="Display_MyServiceEditor" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="css/personal-center-init.css">
	<link rel="stylesheet" href="css/personal-center-creatProgect.css">
	<script type="text/javascript"  src="./js/jquery-3.1.1.min.js"></script>

</head>
<body><form runat="server">
	<div class="left-nav">
		<img src="./images/logo-big.png" alt="">
		<ul>
			<li><a href="Person-index.aspx">个人主页</a></li>
			<li><a href="EditInfo.aspx">修改信息</a></li>
			<li><a href="MyProject.aspx?pageNumber=1">项目管理</a></li>
			<li class="dif-li"><a href="MyServiceList.aspx">服务管理</a></li>
			<li><a href="MyActivityList.aspx">活动管理</a></li>
			<li id="liJudge" runat="server"><a href="MyJudgePro.aspx?pageNumber=1">评审服务</a></li>
		</ul>
	</div>
    	<div class="right-content">
		<div class="clearfix">
			<h1>修改服务</h1>
		</div>
		<span class="cut"></span>
		<div runat="server" action="" class="form">
			<div class="clearfix">
				<h2 class="name-h2">服务类型:</h2>
				<%--<input class="name" type="text" value="项目名称">--%>
                <span style="margin-top: 32px"><asp:Literal ID="ltType" runat="server"></asp:Literal></span>
				<p class="name-error"></p>
			</div>
			<div class="clearfix">
				<h2>申请人:</h2>
				<%--<input class="duty" type="text" value="小明">--%>
				
                <span><asp:Literal ID="ltTeacher" runat="server"></asp:Literal></span>
                <p class="duty-error"></p>
			</div>
			<div class="clearfix">
				<h2>联系方式:</h2>
				<input id="txtPhone" runat="server" class="same position" type="text" value="副教授">
				<p class="error position-error"></p>
			</div>

			<div class="clearfix">
				<h2>备注:</h2>
				<textarea id="txtIntroduction" runat="server" name="txtIntroduction" type="text" class="content"></textarea>
				<p></p>
			</div>
            <asp:LinkButton ID="ltbChange" runat="server" OnClick="ltbChange_Click" CssClass="submit" Text="修改服务"></asp:LinkButton>
			<%--<a href="" class="">修改服务
			</a>--%>
		</div>
	</div>
	<script type="text/javascript"  src="./js/personal-center-init.js"></script>
	<script type="text/javascript"  src="./js/personal-center-creatProgect.js"></script></form>
     <script type="text/javascript"  src="./js/centerMobile.js"></script>
</body>
</html>