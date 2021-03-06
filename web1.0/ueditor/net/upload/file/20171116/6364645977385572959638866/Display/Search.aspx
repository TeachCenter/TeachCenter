﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Display_Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    	<link rel="stylesheet" href="css/intro.css" />
	<link rel="stylesheet" href="css/progect.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main">

			<div class="center content" style="background-color: #FFFFFF;margin-bottom: 32px;">
				<input class="Search search1" value="搜索结果"></input>
                <a  class="search-button1" style="background-image:url(./images/search1.png);top: 14px;right: 18px;display: block;position: absolute;width: 30px; height: 30px;background-repeat: no-repeat;"></a>
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
	var page;
	var i=0;
	$(document).ready(function () {
	    var str = window.location.search;
	    var hhhpage = str.substr(str.indexOf("page") + 5, str.indexOf("&&") - 6);

	    $(".Search").val(decodeURI(window.location.search.substr(13)))
	    var searchwords = decodeURI(window.location.search.substr(13));
		$.ajax({   
          url: "./Ajax/Search_Handler.ashx",
          type: 'POST',
          dataType: "JSON",
          async: true,
          data: { "page":hhhpage,"key": searchwords },
          success: function(data) {
          	page = Math.floor(data[0] / 6 + 1);
          	for(i=0;i<page;i++)
          	{
          	    $("<a>").attr("href", "Search_Handler.ashx?page=" + (i + 1) + "&&key=" + searchwords).text(i + 1).appendTo($(".midButton"));
          		
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
          	    var content = $("<a>").addClass("passage clearfix").attr("href", data[1][i].href).appendTo($(".passage-content1"));
          	    var replacetext = "<span style='color:" + "#D6000F" + ";'>" + searchwords + "</span>"
          	    var objects = data[1][i].title.replace(searchwords, replacetext);
          	    $("<h2>").html(objects).appendTo(content);
          		var pContent=$("<div>").appendTo(content);
          		$("<p>").text(data[1][i].content).appendTo(pContent);
          		$("<h3>").text(" 发布时间："+data[1][i].time.substr(0,10)).appendTo(content);
          		$("<a>").attr("href",data[1][i].href).text("查看文章").appendTo(content);
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
		
		$(".Search").on({
		    focus: function () {
		        $(".Search").val("");
		    },
		    blur: function () {

		    }
		})

		$(".search-button1").click(function () {
		    console.log('66');
		    window.location.href = 'Search.aspx?page=1&&key=' + encodeURI($(".Search").val());

		})
	})
		
	</script>
</asp:Content>

