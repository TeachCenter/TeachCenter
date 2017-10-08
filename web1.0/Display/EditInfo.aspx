<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditInfo.aspx.cs" Inherits="Display_EditInfo" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="css/personal-center-init.css">
	<link rel="stylesheet" href="css/personal-center-changeInfo.css">
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
			<h1>修改信息</h1>
		</div>
		<span class="cut"></span>

		<form action="" class="form" runat="server">
			<div class="clearfix">
				<h2>上传照片:</h2>
			</div>
			<div class="clearfix">
                <asp:FileUpload ID="myFileUpload" runat="server" style="display:none" />  
                <input id="btnBrowse" type="button" value="选择文件" onclick="File1.click();fileLocation.value=File1.value" />             
                <input type="text" name="fileLocation" id="fileLocation" value="支持jpg、jpeg、png、bmp格式的图片"/>                
			</div>
			<span class="cut"></span>
			<div class="clearfix">
				<h2 class="name-h2">姓名:</h2>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
				<p class="error name-error"></p>
			</div>
			<div class="clearfix">
				<h2>性别:</h2>
				<a  class="sex male">男</a>
				<a  class="sex female">女</a>
				<p class="error sex-error"></p>
			</div>
			<div class="clearfix">
				<h2>工号:</h2>
                <asp:TextBox ID="txtNumber" runat="server"></asp:TextBox>
				<p class="error num-error"></p>
			</div>
			<div class="clearfix">
				<h2>邮箱:</h2>
				<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
				<p class="error email-error"></p>
			</div>
			<div class="clearfix">
				<h2>手机:</h2>
				<asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
				<p class="error tel-error"></p>
			</div>
			<div class="clearfix">
				<h2>职称:</h2>
				<asp:TextBox ID="txtRank" runat="server"></asp:TextBox>
				<p class="error position-error"></p>
			</div>
			<div class="clearfix">
				<h2>院系:</h2>
				<ul class="down clearfix">
                    <asp:DropDownList runat="server" ID="ddlResult">					
                        <asp:ListItem Value="0" >院系1</asp:ListItem>
                        <asp:ListItem Value="1">院系2</asp:ListItem>
                        <asp:ListItem Value="2">院系3</asp:ListItem>
                     </asp:DropDownList>
				
				</ul>
				<p class="error organization-error"></p>
			</div>
			<span class="cut"></span>
			<div  class="clearfix">
				<h2 class="userType">用户类型: 教师</h2>
                <asp:LinkButton ID="applyJudge" runat="server" Text="申请成为评委" OnClick="applyJudge_Click"></asp:LinkButton>
			</div>
		</form>
	</div>
	<script type="text/javascript"  src="./js/personal-center-init.js"></script>
	<script type="text/javascript"  src="./js/personal-center-changeInfo.js"></script>
</body>
</html>
