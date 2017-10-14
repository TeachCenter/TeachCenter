<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyActivityList.aspx.cs" Inherits="Display_MyActivityList" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="css/personal-center-init.css">
	<link rel="stylesheet" href="css/personal-center-progect.css">
	<script type="text/javascript"  src="./js/jquery-3.1.1.min.js"></script>
</head>
<body><form runat="server">
	<div class="left-nav">
		<img src="./images/logo-big.png" alt="">
		<ul>
			<li><a href="Person-index.aspx">个人主页</a></li>
			<li><a href="EditInfo.aspx">修改信息</a></li>
			<li><a href="MyProject.aspx">项目管理</a></li>
			<li><a href="MyServiceList.aspx">服务管理</a></li>
			<li class="dif-li"><a href="MyActivityList.aspx">活动管理</a></li>
			<li id="liJudge" runat="server"><a href="MyJudgePro.aspx">评审服务</a></li>
		</ul>
	</div>
    	<div class="right-content">
		<div class="clearfix">
			<h1>我的活动</h1>
			<a href="" class="creat" style="background-color:rgba(0, 0, 0, 0);"></a>
		</div>
        <asp:Repeater ID="rptActivity" runat="server" OnItemCommand="rptActivity_ItemCommand" OnItemDataBound="rptActivity_ItemDataBound">
            <ItemTemplate>
                <span class="cut"></span>
		        <div class="clearfix">
			        <div class="clearfix">
				        <h2><%# Eval("Activity_title") %></h2>
			        </div>
			        <div class="clearfix">
				        <h3>活动日期：<%# Eval("Activity_time") %></h3>
				        <h3>活动地点：<asp:Literal ID="ltDeal" runat="server" Text='<%# Eval("Activity_place") %>'></asp:Literal></h3>
                        <h3><asp:LinkButton ID="lbtDelete" runat="server" CssClass="text-decoration:none" CommandName="Delete" CommandArgument='<%#Eval("Activity_id") %>' OnClientClick="return confirm('确定取消?')" Text='<%# Eval("Activity_id") %>'></asp:LinkButton>
                            </h3>
				        <h3><a href='<%#"ActivityContent.aspx?id="+ Eval("Activity_id") %>'>查看活动详情 >></a></h3>
			        </div>
		       </div>
            </ItemTemplate>
        </asp:Repeater>


	</div>
	<script type="text/javascript"  src="./js/personal-center-init.js"></script></form>
</body>
</html>