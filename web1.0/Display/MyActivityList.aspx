<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyActivityList.aspx.cs" Inherits="Display_MyActivityList" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="css/personal-center-init.css">
	<link rel="stylesheet" href="css/personal-center-progect.css">
     <link rel="stylesheet" href="css/centerMobile.css">
	<script type="text/javascript"  src="./js/jquery-3.1.1.min.js"></script>
</head>
<body><form runat="server">
	<div class="left-nav">
        <a class="aaa" href="./main-index.aspx"></a>
		<ul>
			<li><a href="Person-index.aspx">个人主页</a></li>
			<li><a href="EditInfo.aspx">修改信息</a></li>
			<li><a href="MyProject.aspx?pageNumber=1">项目管理</a></li>
			<li><a href="MyServiceList.aspx">服务管理</a></li>
			<li class="dif-li"><a href="MyActivityList.aspx">活动管理</a></li>
			<li id="liJudge" runat="server"><a href="MyJudgePro.aspx?pageNumber=1">评审服务</a></li>
            <li><asp:LinkButton ID="lbtReturn" OnClick="lbtReturn_Click" runat="server" Text="注销登录"></asp:LinkButton></li>
		</ul>
	</div>
    	<div class="right-content">
            <div class="progect-content">
		<div class="clearfix">
			<h1>我的活动</h1>
			<a href="" class="creat" style="background-color:rgba(0, 0, 0, 0);"></a>
            
		</div>
                <span class="cut"></span>
        <asp:Repeater ID="rptActivity" runat="server" OnItemCommand="rptActivity_ItemCommand" OnItemDataBound="rptActivity_ItemDataBound">
            <ItemTemplate>
                
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
                <span class="cut"></span>
            </ItemTemplate>
        </asp:Repeater>
    </div>
        <div class="buttons clearfix">
            <a class="lleft-button"></a>

            <a class="left-button"></a>
            <div class="midButtonBox" style="position: relative;height: 40px;float: left;overflow: hidden;">
                <ul class="midButton" style="position: absolute;	"></ul>


            </div>

            <a class="right-button"></a>
            <a class="rright-button" style="float: right;"></a>
        </div>

            <input type="hidden" id="count" runat="server"  value=""/>

	</div>
	<script type="text/javascript"  src="./js/personal-center-init.js"></script></form>
    <script>
        var i = 0;
        if ($("#count").val() % 9 == 0) {
            page = $("#count").val() / 9;
        }
        else {
            page = Math.floor($("#count").val() / 9 + 1);
        }
        if ($("#count").val() == 0) {
            page = 1;

        }
        for (i = 0; i < page; i++) {
            $("<a>").attr("href", "MyActivityList.aspx?page=" + page).text(i + 1).appendTo($(".midButton"));

        }
        if (page <= 6) {
            $(".midButtonBox").css({ "width": page * 40 })
            $(".left-button").css({ "margin-left": (w - 760 - 40 * (page + 2)) / 2 })
        }
        else {
            $(".midButtonBox").css({ "width": 6 * 40 })
            $(".left-button").css({ "margin-left": (w - 760 - 40 * (6 + 2)) / 2 })
        }
        function turnPage() {

            var position = 0;
            $(".lleft-button").on('click', function () {
                position = 0;
                $(".midButton").css({ "top": position })

            })
            $(".left-button").on('click', function () {
                if (position != 0) {
                    position += 40;
                    $(".midButton").css({ "top": position })

                }

            })
            $(".right-button").on('click', function () {
                if (position != -40 * (Math.ceil(page / 6) - 1)) {
                    position -= 40;
                    $(".midButton").css({ "top": position })

                }

            })
            $(".rright-button").on('click', function () {
                position = -40 * (Math.ceil(page / 6) - 1);
                $(".midButton").css({ "top": position })

            })

        }
        turnPage();
        $(window).resize(function () {
            if (w > 1200) {
                w = $(window).width();
            }
            else {
                w = 1200;
            }
            $(".left-button").css({ "margin-left": (w - 760 - 40 * (page + 2)) / 2 })
        })
    </script>
      <script type="text/javascript"  src="./js/centerMobile.js"></script>
</body>
</html>