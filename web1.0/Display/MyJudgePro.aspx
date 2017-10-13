<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyJudgePro.aspx.cs" Inherits="Display_MyJudgePro" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="css/personal-center-init.css">
	<link rel="stylesheet" href="css/personal-center-progect.css">
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
			<h1>我的项目</h1>
			
		</div>
        <div class="progect-content"></div>
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
        var id = window.location.search.substr(4);
        var i = 0;
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
            url: "./Ajax/MyJudgePro.ashx",
            dataType: "JSON",
            async: false,
            data: { "pageSize":6 ,"pageNumber":1 },

            success: function (data) {
                page = Math.floor(data.length / 6 + 1);
                for (i = 0; i < data.length; i++)
                {
                    $("<span>").addClass("cut").appendTo($(".progect-content"));
                    var projectBox = $("<a>").attr("href", "JudgePro.aspx?id=" + data[i].id + "&&stage=" + data[i].stage).addClass("project-box").addClass("clearfix").css({ "display": "block", "cursor": "pointer" }).appendTo($(".progect-content"));
                    var content = $("<div>").addClass("clearfix").appendTo(projectBox);
                    var h2Box = $("<div>").addClass("clearfix").appendTo(content);
                    $("<h2>").text(data[i].title).appendTo(h2Box);
                    var h3Box = $("<div>").addClass("clearfix").appendTo(content);
                    $("<h3>").text("申报日期：" + data[i].submit_time).appendTo(h3Box);
                    $("<h3>").text("负责人" + data[i].teacher_name).appendTo(h3Box);
                    $("<h3>").text("申报单位：" + data[i].department).appendTo(h3Box);
                }
                for (i = 0; i < page; i++) {
                    $("<a>").attr("href", "MyJudgePro.html?pageSize=" + 10 + "&&pageNumber=" + (i + 1)).text(i + 1).appendTo($(".midButton"));

                }
                $(".midButtonBox").css({ "width": page * 40 })
                $(".left-button").css({ "margin-left": (w - 760 - 40 * (page + 2)) / 2 })
                

            }


        });
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
</body>
</html>
