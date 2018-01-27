<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Person-index.aspx.cs" Inherits="Display_Person_index" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="css/personal-center-init.css">
	<link rel="stylesheet" href="css/personal-center-index.css">
  <link rel="stylesheet" href="css/centerMobile.css">
	<script type="text/javascript"  src="./js/jquery-3.1.1.min.js"></script>
</head>
<body><form runat="server">
	<div class="left-nav">
		<img src="./images/logo-big.png" alt="">
		<ul>
			<li class="dif-li"><a href="Person-index.aspx">个人主页</a></li>
			<li><a href="EditInfo.aspx">修改信息</a></li>
			<li><a href="MyProject.aspx?pageNumber=1">项目管理</a></li>
			<li><a href="MyServiceList.aspx">服务管理</a></li>
			<li><a href="MyActivityList.aspx">活动管理</a></li>
			<li id="liJudge" runat="server"><a href="MyJudgePro.aspx?pageNumber=1">评审服务</a></li>
    		<li><asp:LinkButton ID="lbtReturn" OnClick="lbtReturn_Click" runat="server" Text="注销登录"></asp:LinkButton></li>
        </ul>
	</div>
	<div class="right-content">
		<div class="clearfix">
			<h1>你好，<asp:Label ID="lbName" runat="server"></asp:Label></h1>
		</div>
		
		<div class="clearfix">
			<h2>用户类型：<asp:Label ID="lbType" runat="server"></asp:Label></h2>
		</div>
		
		<span class="cut completed"></span>
		<div class="clearfix completed">
			<h2>您的个人信息尚未填写完整，</h2>
			<a href="EditInfo.aspx">前去完善个人信息>></a>
		</div>
		<input type="hidden" id="isCompleted" runat="server" />
		<span class="cut"></span>
		<div class="clearfix">
            <asp:Repeater ID="rptProject" runat="server">
                <ItemTemplate>
                    <h2>您的《<%#Eval("name") %>》第<%# getNumber(getStage(Convert.ToInt32(Eval("project_id").ToString()))) %>阶段尚未提交，</h2>
			        <a href="ImprovePro.aspx?id=<%#Eval("project_id") %>&&stage=<%# getStage(Convert.ToInt32(Eval("project_id").ToString())) %>">前去提交>></a>
                </ItemTemplate>
            </asp:Repeater>			
		</div>
		<div class="clearfix" id="divJudge" runat="server">
			<h2>您的<span><%= getJudgeNumber() %></span>个项目信息等待评审，</h2>
			<a href="MyJudgePro.aspx?pageNumber=1">前去评审>></a>
		</div>
	</div>
	<script type="text/javascript"  src="./js/personal-center-init.js"></script>
    <script>
        if($("#isCompleted").val()==1)
        {
            $(".completed").css({ "display": "none" });
        }
    </script>
     <script type="text/javascript"  src="./js/centerMobile.js"></script>
      </form>
</body>
</html>
