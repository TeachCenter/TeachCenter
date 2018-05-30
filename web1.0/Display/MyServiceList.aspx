<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyServiceList.aspx.cs" Inherits="Display_MyServiceList" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人中心</title>
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
			<li><a class="dif-li" href="MyServiceList.aspx">服务管理</a></li>
			<li><a href="MyActivityList.aspx">活动管理</a></li>
			<li id="liJudge" runat="server"><a href="MyJudgePro.aspx?pageNumber=1">评审服务</a></li>
            <li><asp:LinkButton ID="lbtReturn" OnClick="lbtReturn_Click" runat="server" Text="注销登录"></asp:LinkButton></li>
		</ul>
	</div>
    	<div class="right-content">
            <div class="progect-content">
		<div class="clearfix">
			<h1>我的服务</h1>
            <asp:LinkButton ID="lbtExport" runat="server" OnClick="lbtExport_Click" CssClass="creat" Text="导出服务"></asp:LinkButton>
			<a href="Service.aspx" class="creat">+新建服务</a>
            

		</div>
                <span class="cut"></span>
        <asp:Repeater ID="rptService" runat="server" OnItemDataBound="rptService_ItemDataBound">
            <ItemTemplate>
                
		        <div class="clearfix">
			        <div class="clearfix">
				        <h2><asp:Literal ID="ltCategory" runat="server" Text='<%# Eval("Service_category") %>'></asp:Literal></h2>
			        </div>
			        <div class="clearfix">
				        <h3>申请日期：<%# Eval("Service_time") %></h3>
				        <h3>联系方式：<%# Eval("Service_phone") %></h3>
				        <h3>备注：<%# Eval("Service_remarks") %></h3>
                        <h3>处理状态：<asp:Literal ID="ltDeal" runat="server" Text='<%# Eval("Service_isdeal") %>'></asp:Literal></h3>
                        <h3><asp:Panel ID="panel" runat="server">管理员回复：<asp:Label ID="lbReply" runat="server" Text=<%# Eval("Service_reply") %>></asp:Label></asp:Panel></h3>
			            <h3><asp:LinkButton ID="ltEditor" runat="server" Text='<%# Eval("Service_id") %>' PostBackUrl='<%# "MyServiceEditor.aspx?id="+Eval("Service_id") %>' ></asp:LinkButton></h3>
                        
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

            <input type="hidden" id="count" runat="server" value=""/>

	</div>
    </form>
	<script type="text/javascript"  src="./js/personal-center-init.js"></script>
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
        console.log(page)
        for (i = 0; i < page; i++) {
            $("<a>").attr("href", "MyServiceList.aspx?page=" + (i + 1)).text(i + 1).appendTo($(".midButton"));

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
