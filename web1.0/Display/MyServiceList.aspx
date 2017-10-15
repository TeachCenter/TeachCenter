<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyServiceList.aspx.cs" Inherits="Display_MyServiceList" %>

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
			<li><a class="dif-li" href="MyServiceList.aspx">服务管理</a></li>
			<li><a href="MyActivityList.aspx">活动管理</a></li>
			<li id="liJudge" runat="server"><a href="MyJudgePro.aspx">评审服务</a></li>
		</ul>
	</div>
    	<div class="right-content">
		<div class="clearfix">
			<h1>我的服务</h1>
			<a href="Service.aspx" class="creat">+新建服务</a>
		</div>
        <asp:Repeater ID="rptService" runat="server" OnItemDataBound="rptService_ItemDataBound">
            <ItemTemplate>
                <span class="cut"></span>
		        <div class="clearfix">
			        <div class="clearfix">
				        <h2><asp:Literal ID="ltCategory" runat="server" Text='<%# Eval("Service_category") %>'></asp:Literal></h2>
			        </div>
			        <div class="clearfix">
				        <h3>申请日期：<%# Eval("Service_time") %></h3>
				        <h3>联系方式：<%# Eval("Service_phone") %></h3>
				        <h3>备注：<%# Eval("Service_remarks") %></h3>
                        <h3>处理状态：<asp:Literal ID="ltDeal" runat="server" Text='<%# Eval("Service_isdeal") %>'></asp:Literal></h3>
			            <h3><asp:LinkButton ID="ltEditor" runat="server" Text='<%# Eval("Service_id") %>' PostBackUrl='<%# "MyServiceEditor.aspx?id="+Eval("Service_id") %>' ></asp:LinkButton></h3>
                    </div>
		        </div>
            </ItemTemplate>
        </asp:Repeater>
         <div class="buttons clearfix">
            <a class="lleft-button"></a>

            <a class="left-button"></a>
            <div class="midButtonBox" style="position: relative;height: 40px;float: left;overflow: hidden;">
                <ul class="midButton" style="position: absolute;	"></ul>


            </div>

            <a class="right-button"></a>
            <a class="rright-button" style="float: right;"></a>
        </div>
            <input type="hidden" id="count" runat="server" value=""/>

	</div>
	<script type="text/javascript"  src="./js/personal-center-init.js"></script></form>
    <script>
        var i = 0;
        var page = Math.floor($("#count").val() / 6 + 1);;
        for (i = 0; i < page; i++) {
            $("<a>").attr("href", "MyService.aspx?page=" + page).text(i + 1).appendTo($(".midButton"));

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
    </script>
</body>
</html>
