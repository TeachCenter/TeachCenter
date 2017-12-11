﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="NoticeList.aspx.cs" Inherits="Display_NoticeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        	<link rel="stylesheet" href="css/intro.css" />
	<link rel="stylesheet" href="css/progect.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="main">

			<div class="center content" style="background-color: #FFFFFF;margin-bottom: 32px;">
                <h1 style="margin-top:32px; display: block;text-align: center;width: 100%;line-height: 60px; height: 60px;font-size: 28px;">通知公告</h1>
				<div class="passage-content1 "  ></div>
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
          <ul class="mobileNavUl"><a class="mobileNavUlLi" href="main-index.aspx">首页</a><a class="mobileNavUlLi" href="Introduction.aspx">关于</a><a class="mobileNavUlLi" href="ProjectList.aspx?pageNumber=1">项目</a><a class="mobileNavUlLi" href="Service.aspx">服务</a><a class="mobileNavUlLi" href="SrcList.aspx?pageNumber=1">资源</a><a class="mobileNavUlLi" href="ActivityList.aspx?type=0&amp;&amp;page=1">活动</a><a class="mobileNavUlLi mobileNavUlLiLog">登陆</a></ul>

		</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
        <script>
    var a = window.location.href;
    var s = a.indexOf("?");
    var t = a.substring(s + 1);// t就是?后面的东西了 
    var page = t.substr(5, t.length - 5);
    //console.log(page)
	var i=0;
	$(document).ready(function () {
		$.ajax({   
		    url: "./Ajax/Notice_Handler.ashx",
          type: 'POST',
          dataType: "JSON",
          async: true,
          data: {  "page": page },
    
          success: function(data) {
          	page = Math.floor(data[0] / 6 + 1);
          	for(i=0;i<page;i++)
          	{
          	    $("<a>").attr("href", "NoticeList.aspx?page=" + (i + 1)).text(i + 1).appendTo($(".midButton"));
          		
          	}
          	if(page<=6)
          	{
          		$(".midButtonBox").css({"width":page*40})
          		$(".left-button").css({"margin-left":(700-40*(page+2))/2})
          	}
          	else{
          		$(".midButtonBox").css({"width":6*40})
          		$(".left-button").css({"margin-left":(700-40*(6+2))/2})
          	}
          	
          	for(i=0;i<data[1].length;i++)
          	{
          	    var content = $("<a>").attr("href", data[1][i].noticeHref).addClass("passage clearfix").appendTo($(".passage-content1"));
          		$("<h2>").text(data[1][i].noticeTitle).appendTo(content);
          		var pContent=$("<div>").appendTo(content);
          		$("<p>").text(data[1][i].noticeContent).appendTo(pContent);
          		$("<h3>").text(" 发布时间：" + data[1][i].noticeTime.substr(0, 10)).appendTo(content);
          		$("<a>").attr("href", data[1][i].noticeHref).text("查看通知").appendTo(content);
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
		

	})
    </script>
</asp:Content>

