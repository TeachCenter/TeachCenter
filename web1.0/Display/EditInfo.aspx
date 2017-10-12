<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditInfo.aspx.cs" Inherits="Display_EditInfo" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="css/personal-center-init.css">
	<link rel="stylesheet" href="css/personal-center-changeInfo.css">
	<script type="text/javascript"  src="./js/jquery-3.1.1.min.js"></script>
    <style type="text/css">
        #txtFileName{
            background:inherit;
        }
    </style>
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
			<h1>修改信息</h1>
		</div>
		<span class="cut"></span>

		<form action="" class="form" runat="server">
			<div class="clearfix">
				<h2 class="name-h2">姓名:</h2>
                <asp:TextBox ID="txtName" runat="server" class="same name"></asp:TextBox>
				<p class="error name-error"></p>
			</div>
			<div class="clearfix">
				<h2>性别:</h2>
                <%----%>
                <a  class="sex male">男<asp:LinkButton ID="man" runat="server" OnClick="man_Click"></asp:LinkButton></a>               
				<a  class="sex female">女<asp:LinkButton ID="woman" runat="server" OnClick="woman_Click"></asp:LinkButton></a>
                <input type="hidden" id="gender" runat="server" value="0"/>
				<p class="error sex-error"></p>
			</div>
			<div class="clearfix">
				<h2>工号:</h2>
                <asp:TextBox ID="txtNumber" runat="server" class="same num"></asp:TextBox>
				<p class="error num-error"></p>
			</div>
			<div class="clearfix">
				<h2>邮箱:</h2>
				<asp:TextBox ID="txtEmail" runat="server" class="same email"></asp:TextBox>
				<p class="error email-error"></p>
			</div>
			<div class="clearfix">
				<h2>手机:</h2>
				<asp:TextBox ID="txtPhone" runat="server" class="same tel"></asp:TextBox>
				<p class="error tel-error"></p>
			</div>
			<div class="clearfix">
				<h2>职称:</h2>
				<asp:TextBox ID="txtRank" runat="server" class="same position"></asp:TextBox>
				<p class="error position-error"></p>
			</div>
			<div class="clearfix">
				<h2>院系:</h2>
				<ul class="down clearfix">
                     <li class="select-true">
                         <asp:Label ID="lbSelected" runat="server" Text="请选择院系"></asp:Label>
                     </li>
                     <ul class="select-box clearfix">
                         <asp:Repeater ID="rptSelect" runat="server" OnItemCommand="rptSelect_ItemCommand">
                            <ItemTemplate>
                                <li class="select select"><asp:LinkButton ID="lbtnSelect" runat="server" Text=<%#Eval("department") %> CommandName="selected"></asp:LinkButton></li>
                            </ItemTemplate>
                        </asp:Repeater>
					 </ul>				
				</ul>
				<p class="error organization-error"></p>
			</div>
			<span class="cut"></span>
			<div  class="clearfix">
				<h2 class="userType">用户类型: <asp:Label ID="lbType" runat="server"></asp:Label></h2>
                <asp:LinkButton ID="applyJudge" runat="server" Text="申请成为评委>>" OnClick="applyJudge_Click" class="redA"></asp:LinkButton>
			</div>
            <a class="submit">提交项目<asp:LinkButton ID="lbtnSubmit" runat="server" OnClick="lbtnSubmit_Click"></asp:LinkButton></a>
		</form>
	</div>
	<script type="text/javascript"  src="./js/personal-center-init.js"></script>
	<script type="text/javascript"  src="./js/personal-center-changeInfo.js"></script>
</body>
</html>
