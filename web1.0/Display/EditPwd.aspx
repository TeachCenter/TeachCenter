<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditPwd.aspx.cs" Inherits="Display_EditPwd" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
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
			<h1>修改密码</h1>
		</div>
		<span class="cut"></span>
			<div class="clearfix">
				<h2 class="name-h2">原密码:</h2>
                <asp:TextBox ID="txtOld" runat="server" class="same name" TextMode="Password"></asp:TextBox>
                <h3 class="necessary-top">*必填</h3>
			</div>
			<div class="clearfix">
				<h2>新密码:</h2>
                <asp:TextBox ID="txtNew" runat="server" class="same num" TextMode="Password"></asp:TextBox>
                <h3 class="necessary">*必填</h3>
			</div>
			<div class="clearfix">
				<h2>确认密码:</h2>
				<asp:TextBox ID="txtCheck" runat="server" class="same email" TextMode="Password"></asp:TextBox>
                <h3 class="necessary">*必填</h3>
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
