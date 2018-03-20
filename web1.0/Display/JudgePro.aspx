<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JudgePro.aspx.cs" Inherits="Display_JudgePro" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="css/personal-center-init.css">
	<link rel="stylesheet" href="css/personal-center-checkProgect.css">
	<script type="text/javascript"  src="./js/jquery-3.1.1.min.js"></script>
    <style>
        .Content {
                font-size: 20px;
                color: #808080;
                padding-left: 27px;
                padding-right: 27px;
                height: 300px;
                overflow:scroll;
                width:600px;
                margin-top: 20px;
                margin-left: 28px;
                float: left;
                border: 1px solid #E6E6E6;
                overflow-x:hidden;
        }
        .choice {
                display: block;
                width: 140px;
                height: 50px;
                float: left;
                text-align: center;
                line-height: 50px;
                background-color: #E6E6E6;
                margin-left: 28px;
                color: #808080;
                border: 1px solid #E6E6E6;
                margin-top:20px;
        }   

    </style>
</head>

<body> <form runat="server">

	<div class="left-nav">
		<a class="aaa" href="./main-index.aspx"></a>
		<ul>
			<li><a href="Person-index.aspx">个人主页</a></li>
			<li><a href="EditInfo.aspx">修改信息</a></li>
			<li><a href="MyProject.aspx?pageNumber=1">项目管理</a></li>
			<li><a href="MyServiceList.aspx">服务管理</a></li>
			<li><a href="MyActivityList.aspx">活动管理</a></li>
			<li class="dif-li" id="liJudge" runat="server"><a href="MyJudgePro.aspx?pageNumber=1">评审服务</a></li>
            <li><asp:LinkButton ID="lbtReturn" OnClick="lbtReturn_Click" runat="server" Text="注销登录"></asp:LinkButton></li>
		</ul>
	</div>
	<div class="right-content">

		<div class="clearfix">
			<h1>项目信息</h1>
		</div>
		<span class="cut"></span>
			<div class="clearfix">
				<h2>项目名称:</h2>
                <asp:TextBox ID="txtName" runat="server" class="name" ReadOnly="true"></asp:TextBox>
			</div>
			<div class="clearfix">
				<h2>项目类型:</h2>
                <asp:TextBox ID="txtCategory" runat="server" class="type" ReadOnly="true"></asp:TextBox>
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
                <div class="Content">
                    <asp:Literal ID="Content" runat="server"></asp:Literal>
                </div>
			</div>
			<div class="clearfix">
				<h2>项目文件:</h2>
				<a class="redA" class="submit" href="../BackStage/<%= getFileName() %>"><asp:Label ID="lbFileName" runat="server"></asp:Label></a>
			</div>
			<div class="clearfix">
				<h2>评审意见:</h2>
                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" class="content"></asp:TextBox>
			</div>
            <div class="clearfix">
				<h2>是否通过:</h2>
                <a  class="choice yes">是<asp:LinkButton ID="yes" runat="server"></asp:LinkButton></a>               
				<a  class="choice no">否<asp:LinkButton ID="no" runat="server"></asp:LinkButton></a>
                <input type="hidden" id="result" runat="server" value=""/>
			</div>
			<asp:LinkButton ID="lbtnSubmit" runat="server" OnClick="lbtnSubmit_Click" class="submit" Text="提交评审结果"></asp:LinkButton>
	</div>
	<script>
        var w = $(window).width();
        $(".Content").css({ "width": w - 520 })

        $(window).resize(function () {
            w = $(window).width();
            $(".Content").css({ "width": w - 520 })
        })
        $(".yes").click(function () {
            $(this).css({ "background-color": "#FFFFFF" })
            $(".no").css({ "background-color": "#E6E6E6" })
            $("#result").val("1");
        })
        $(".no").click(function () {
            $(this).css({ "background-color": "#FFFFFF" })
            $(".yes").css({ "background-color": "#E6E6E6" })
            $("#result").val("0");
        })
    </script>
      <script type="text/javascript"  src="./js/centerMobile.js"></script>
	<script type="text/javascript"  src="./js/personal-center-init.js"></script>
	<script type="text/javascript"  src="./js/personal-center-creatProgect.js"></script>   </form>

</body>
</html>
