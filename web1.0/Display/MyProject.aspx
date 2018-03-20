﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyProject.aspx.cs" Inherits="Display_MyProject" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="css/personal-center-init.css">
	<link rel="stylesheet" href="css/personal-center-progect.css">
    <link rel="stylesheet" href="css/centerMobile.css">
	<script type="text/javascript"  src="./js/jquery-3.1.1.min.js"></script>
    <style>
        .buttons a{
	        display: block;
	        line-height: 40px;
	        font-size: 20px;
	        text-align: center;
	        width: 38px;
	        height: 38px;
	        float: left;
	        border: 1px solid #808080;
	        color: #808080;
        }
        .buttons{
	        margin-top: 32px;
	        margin-bottom: 64px;
        }
        .lleft-button{
	        border-width: 0px!important;
	        width: 40px!important;
	        height: 40px!important;
	        background-image: url(./images/lleft-button.png);
	        margin-left: 220px;
        }
        .left-button{

	        border-width: 0px!important;
	        width: 40px!important;
	        height: 40px!important;
	        background-image: url(./images/left-button.png);
	        margin-left: 30px;
        }
        .right-button{

	        border-width: 0px!important;
	        width: 40px!important;
	        height: 40px!important;
	        background-image: url(./images/right-button.png);
        }
        .rright-button
        {	

	        border-width: 0px!important;
	        width: 40px!important;
	        height: 40px!important;
	        background-image: url(./images/rright-button.png);
	        margin-left: 30px;
	        float: right!important;
	        margin-right: 220px;
        }
        .project-box:hover .red {
            color:rgb(214, 0, 15);
        }
    </style>
</head>
<body><form runat="server">
	<div class="left-nav">
		<a class="aaa" href="./main-index.aspx"></a>
		<ul>
			<li><a href="Person-index.aspx">个人主页</a></li>
			<li><a href="EditInfo.aspx">修改信息</a></li>
			<li class="dif-li"><a href="MyProject.aspx?pageNumber=1">项目管理</a></li>
			<li><a href="MyServiceList.aspx">服务管理</a></li>
			<li><a href="MyActivityList.aspx">活动管理</a></li>
			<li id="liJudge" runat="server"><a href="MyJudgePro.aspx?pageNumber=1">评审服务</a></li>
            <li><asp:LinkButton ID="lbtReturn" OnClick="lbtReturn_Click" runat="server" Text="注销登录"></asp:LinkButton></li>
		</ul>
	</div>
	<div class="right-content">
		
        <div class="progect-content"  >
            <div class="clearfix">
                <h1>我的项目</h1>
                <a href="AddProject.aspx" class="creat creatl">+新建项目</a>
            </div>
            <span class="cut"></span>
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
	</div>   
	<script type="text/javascript"  src="./js/personal-center-init.js"></script>
    <script>
        var i = 0;
        var str = window.location.search;
        var pageSize = str.substr(str.indexOf("type") + 11, str.indexOf("&&") - 10);
        var pageNumber = str.substr(str.indexOf("pageNumber") + 11);
        var page;
        var w;
        if (w > 1200) {
            w = $(window).width();
        }
        else {
            w = 1200;
        }
      
        $.ajax({
            type: "GET",
            url: "./Ajax/MyProject.ashx",
            dataType: "JSON",
            async: false,
            data: { "pageSize": 9, "pageNumber": pageNumber },

            success: function (data) {
                if (data[1] % 9 == 0)
                {
                    page = data[1] / 9;
                }
                else {
                    page = Math.floor(data[1] / 9 + 1);
                }
                if (data[1] == 0)
                {
                    page = 1;
                
                }
                for (i = 0; i < data[0].length; i++)
                {
                   
                    var projectBox = $("<a>").attr("href", "ProjectContent.aspx?id=" + data[0][i].id).addClass("project-box").addClass("clearfix").css({ "display": "block", "cursor": "pointer" }).appendTo($(".progect-content"));
                    var content = $("<div>").addClass("clearfix").appendTo(projectBox);
                    var h2Box = $("<div>").addClass("clearfix").appendTo(content);
                    $("<h2>").addClass("red").text(data[0][i].title).appendTo(h2Box);
                    var h3Box = $("<div>").addClass("clearfix").appendTo(content);
                    $("<h3>").text("申报日期：" + data[0][i].submit_time).appendTo(h3Box);
                    $("<h3>").text("负责人" + data[0][i].teacher_name).appendTo(h3Box);
                    $("<h3>").text("申报单位：" + data[0][i].department).appendTo(h3Box);
                    $("<span>").addClass("cut").appendTo($(".progect-content"));

                }
                for (i = 0; i < page; i++) {
                    $("<a>").attr("href", "MyProject.aspx?pageSize=" + 10 + "&&pageNumber=" + (i + 1)).text(i + 1).appendTo($(".midButton"));

                }
                if (page <= 6) {
                    $(".midButtonBox").css({ "width": page * 40 })
                    $(".left-button").css({ "margin-left": (w - 760 - 40 * (page + 2)) / 2 })
                }
                else {
                    $(".midButtonBox").css({ "width": 6 * 40 })
                    $(".left-button").css({ "margin-left": (w - 760 - 40 * (6 + 2)) / 2 })
                }

            }
          


        });
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

     <script type="text/javascript"  src="./js/centerMobile.js"></script></form>
</body>
</html>
