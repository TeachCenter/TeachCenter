﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditInfo.aspx.cs" Inherits="Display_EditInfo" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>修改信息</title>
	<link rel="stylesheet" href="css/personal-center-init.css" />
	<script type="text/javascript"  src="./js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript"  src="./js/personal-center-init.js"></script>
    <link rel="stylesheet" href="css/personal-center-changeInfo.css">
    <link rel="stylesheet" href="css/centerMobile.css">
    <style type="text/css">
        #txtFileName{
            background:inherit;
        }
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none !important;
        }                
    </style>
</head>
<body class="clearfix">

    <form runat="server">

	<div class="left-nav" style="height:937px">
		<a class="aaa" href="./main-index.aspx"></a>
		<ul>
			<li><a href="Person-index.aspx">个人主页</a></li>
			<li class="dif-li"><a href="EditInfo.aspx">修改信息</a></li>
			<li><a href="MyProject.aspx?pageNumber=1">项目管理</a></li>
			<li><a href="MyServiceList.aspx">服务管理</a></li>
			<li><a href="MyActivityList.aspx">活动管理</a></li>
			<li id="liJudge" runat="server"><a href="MyJudgePro.aspx?pageNumber=1">评审服务</a></li>
            <li><asp:LinkButton ID="lbtReturn" OnClick="lbtReturn_Click" runat="server" Text="注销登录"></asp:LinkButton></li>
		</ul>
	</div>
	<div class="right-content">

		<div class="clearfix">
			<h1>修改信息</h1>
		</div>
		<span class="cut"></span>
			<div class="clearfix">
				<h2 class="name-h2">姓名:</h2>
                <asp:TextBox MaxLength="6" ID="txtName" runat="server" class="same name"></asp:TextBox>
				<p class="error name-error"></p>
                <h3 class="necessary-top">*必填</h3>
			</div>
			<div class="clearfix">
				<h2>性别:</h2>
                <%----%>
                <a  class="sex male">男<asp:LinkButton ID="man" runat="server" OnClick="man_Click"></asp:LinkButton></a>               
				<a  class="sex female">女<asp:LinkButton ID="woman" runat="server" OnClick="woman_Click"></asp:LinkButton></a>
                <input type="hidden" id="gender" runat="server" value=""/>
				<p class="error sex-error"></p>
                <h3 class="necessary">*必填</h3>
			</div>
			<div class="clearfix">
				<h2>工号:</h2>
                <asp:TextBox ID="txtNumber" runat="server" class="same num" MaxLength="7" ReadOnly="true"></asp:TextBox>
				<p class="error num-error"></p>
                <h3 class="necessary">*必填</h3>
			</div>
			<div class="clearfix">
				<h2>邮箱:</h2>
				<asp:TextBox MaxLength="30" ID="txtEmail" runat="server" class="same email"></asp:TextBox>
				<p class="error email-error"></p>
                <h3 class="necessary">*必填</h3>
			</div>
			<div class="clearfix">
				<h2>手机:</h2>
				<asp:TextBox ID="txtPhone" MaxLength="11" runat="server" class="same tel"></asp:TextBox>
				<p class="error tel-error"></p>
                <h3 class="necessary">*必填</h3>
			</div>
            <input type="hidden" id="lbSelectedRank" runat="server"/>
			<div class="clearfix" style="position:relative;">
				<h2>职称:</h2>
				<div class="aA1" style="width:30px;height:50px;position:absolute;left: 623px;top: 8px;background-color:#E6E6E6;z-index:10;"> <img src="./images/bottom.png" alt="Alternate Text" style="position:absolute;top:23px;" /></div>
				<ul class="down1 clearfix" style="width:500px;">                                    
                     <li class="select-true1" style="position:relative">
                         <asp:Label ID="rank" runat="server"></asp:Label>
                     </li>
                     <ul class="select-box ohaha1 clearfix">
                         <asp:Repeater ID="rptRank" runat="server">
                            <ItemTemplate>
                                <li class="select1  select1 ixixi"><asp:Label ID="lbSelectRank" runat="server" Text='<%#Eval("rank") %>'></asp:Label></li>
                            </ItemTemplate>
                        </asp:Repeater>
					 </ul>				
				</ul>
				<p class="error organization-error"></p>
                <h3 class="necessary">*必填</h3>

			</div>
             <input type="hidden" id="lbSelected" runat="server"/>
			<div class="clearfix" style="position:relative;">
				<h2>院系:</h2>
                 <div class="aA" style="width:30px;height:50px;position:absolute;left: 623px;top: 8px;background-color:#E6E6E6;z-index:10;"> <img src="./images/bottom.png" alt="Alternate Text" style="position:absolute;top:23px;" /></div>
				<ul class="down clearfix" style="width:500px;">
                   
                   
                     <li class="select-true" style="position:relative">
                         <asp:Label ID="depart" runat="server"></asp:Label>
                     </li>
                     <ul class="select-box ohaha clearfix">
                         <asp:Repeater ID="rptSelect" runat="server">
                            <ItemTemplate>
                                <li class="select select"><asp:Label ID="lbSelect" runat="server" Text='<%#Eval("department") %>'></asp:Label></li>
                            </ItemTemplate>
                        </asp:Repeater>
					 </ul>				
				</ul>
				<p class="error organization-error"></p>
                <h3 class="necessary">*必填</h3>
			</div>
			<span class="cut"></span>
			<div  class="clearfix">
				<h2 class="userType">用户类型: <asp:Label ID="lbType" runat="server"></asp:Label></h2>
                <asp:LinkButton ID="applyJudge" runat="server" Text="申请成为评委>>" OnClick="applyJudge_Click" class="redA"></asp:LinkButton>
                <asp:LinkButton ID="EditPwd" runat="server" Text="修改密码>>" PostBackUrl="EditPwd.aspx" class="redA"></asp:LinkButton>
			</div>
            <asp:LinkButton ID="lbtnSubmit" runat="server" OnClick="lbtnSubmit_Click" Text="确认修改" class="submit"></asp:LinkButton>

  </div>  
        </form>

	<script type="text/javascript"  src="./js/personal-center-changeInfo.js"></script>
     <script>
         $(document).ready(function () {
             if ($("#gender").val() == 1) {
                 $(".male").css({ "background-color": "#FFFFFF" })
             }
             else {
                 $(".female").css({ "background-color": "#FFFFFF" })
             }
            

             });
         if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
             $(".error").css({
                 "margin-top": 0.2 + "rem",
                 "font-size": 0.24 + "rem"
                 $(".name-error").css({
                     "margin-top": 0.40 + "rem",
                     "font-size": 0.24 + "rem"

                 });
             }
         })
    </script>	
      <script type="text/javascript"  src="./js/centerMobile.js"></script>
	<script type="text/javascript"  src="./js/personal-center-init.js"></script>
	<script type="text/javascript"  src="./js/personal-center-changeInfo.js"></script>
</body>
</html>

