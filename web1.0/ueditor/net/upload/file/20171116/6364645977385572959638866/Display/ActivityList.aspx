﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="ActivityList.aspx.cs" Inherits="Display_ActivityList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/progect.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main">
			<div class="center clearfix">
				<div class="left-content">
					<a class="left-content-nav">活动</a>
					
				</div>
				<div class="right-content">
					<h1 class="title-name"></h1>
					<div class="passage-content" ></div>

					<div class="buttons clearfix">
						<a  class="lleft-button"></a>
						
						<a class="left-button"></a>
						<div class="midButtonBox" style="position: relative;height: 40px;float: left;overflow: hidden;">
							<ul class="midButton" style="position: absolute;	">
							</ul>
							

						</div>
						
						<a class="right-button"></a>
						<a class="rright-button" style="float: right;"></a>
					</div>
				</div>
			</div>
             <ul class="mobileNavUl"><a class="mobileNavUlLi" href="main-index.aspx">首页</a><a class="mobileNavUlLi" href="Introduction.aspx">关于</a><a class="mobileNavUlLi" href="ProjectList.aspx?pageNumber=1">项目</a><a class="mobileNavUlLi" href="Service.aspx">服务</a><a class="mobileNavUlLi" href="SrcList.aspx?pageNumber=1">资源</a><a class="mobileNavUlLi" href="ActivityList.aspx?type=0&amp;&amp;page=1">活动</a><a class="mobileNavUlLi mobileNavUlLiLog">登陆</a></ul>

		</div>

</asp:Content>
<asp:Content ID="Conten3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <script type="text/javascript">
        var str = window.location.search;
        var type = str.substr(str.indexOf("type") + 5, str.indexOf("&&") - 6);
        var page = str.substr(str.indexOf("page") + 5);
        $.ajax({

            url: "./Ajax/ActivityList_Handler.ashx",
            dataType: "JSON",
            async: true,
            type: "POST",
            data: { "ActivityCategory_id": type, "page": page },

            // data: { "id": id },

            success: function (data) {
                var i = 0;
                page = Math.floor(data[1] / 6 + 1);
                for (i = 0; i < data[0].length; i++) {
                    if (type == data[0][i].ActivityCategory_id) {
                        $("<a>").addClass("left-content-nav-content-select").attr("href", data[0][i].ActivityCategory_href).text(data[0][i].ActivityCategory_name).appendTo($(".left-content"));
                    }
                    else {

                        $("<a>").addClass("left-content-nav-content").attr("href", data[0][i].ActivityCategory_href).text(data[0][i].ActivityCategory_name).appendTo($(".left-content"));

                    }

                }
                for (i = 0; i < page; i++) {
                    $("<a>").attr("href", "ActivityList.aspx?type=" + type + "&&page=" + (i + 1)).text(i + 1).appendTo($(".midButton"));
                }
              
                if (page <= 6) {
                    $(".midButtonBox").css({ "width": page * 40 })
                    $(".left-button").css({ "margin-left": (400 - 40 * (page + 2)) / 2 })
                }
                else {
                    $(".midButtonBox").css({ "width": 6 * 40 })
                    $(".left-button").css({ "margin-left": (400 - 40 * (6 + 2)) / 2 })
                }
                for (i = 0; i < data[2].length; i++) {
                    var content = $("<a>").attr("href", (data[2][i].Activity_href + data[2][i].Activity_id)).addClass("passage").addClass("clearfix").appendTo($(".passage-content"));
                    $("<h2>").text(data[2][i].Activity_title).appendTo(content);
                    var pContent = $("<div>").appendTo(content);
                    $("<p>").text(data[2][i].Activity_content).appendTo(pContent);
                    $("<h3>").text("发布人：" + data[2][i].Activity_author + " 发布时间：" + data[2][i].Activity_time.substr(0, 10) + " 浏览次数：" + data[2][i].Activity_hit).appendTo(content);
                    $("<a>").attr("href", (data[2][i].Activity_href + data[2][i].Activity_id)).text("查看文章").appendTo(content);

                }
                $(".title-name").text(data[3])


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


    </script>
</asp:Content>
