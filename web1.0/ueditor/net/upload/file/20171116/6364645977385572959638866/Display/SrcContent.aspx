﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SrcContent.aspx.cs" Inherits="Display_SrcContent" MasterPageFile="~/Display/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/intro.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<div class="main">
			<div class="center">
				<div class="brief-intro-box">
					<h1 class="brief-intro"></h1>
					<span class="brief-intro-line"></span>
					<h2 class="publish"></h2>
					<div class="p-box">
						
					</div>
				</div>
			</div>
            <ul class="mobileNavUl"><a class="mobileNavUlLi" href="main-index.aspx">首页</a><a class="mobileNavUlLi" href="Introduction.aspx">关于</a><a class="mobileNavUlLi" href="ProjectList.aspx?pageNumber=1">项目</a><a class="mobileNavUlLi" href="Service.aspx">服务</a><a class="mobileNavUlLi" href="SrcList.aspx?pageNumber=1">资源</a><a class="mobileNavUlLi" href="ActivityList.aspx?type=0&amp;&amp;page=1">活动</a><a class="mobileNavUlLi mobileNavUlLiLog">登陆</a></ul>

		</div>
	<script type="text/javascript"  src="./js/pop.js"></script>
	<script>
        $(document).ready(function () {
            var id = window.location.search.substr(4);
		$.ajax({   
          url: "./Ajax/SrcContentHandler.ashx",
          type: 'POST',
          dataType: "JSON",
          async: true,
           data: { "id": id },
    
          success: function(data) {
          	$(".brief-intro").text(data.title)
          	$(".publish").text("发布人："+data.publisher+"  发布时间："+data.publish_time+"  浏览次数："+data.view_times);
          	$(data.body).appendTo($(".p-box"))
                    
          }


      }); 
		$(".add").on(click,function(){
			$.ajax({ 
	             
	          url: "./Ajax/ActivityAdd_Handler.ashx",
	          dataType: "JSON",
	          async: true,
	          type: "POST", 
	           data: { "Activity_id": 1 },
	    
	          success: function(data) {
	          	alert("添加成功")
	                    
	          }


	      });

		})

	})
		
	</script>
</asp:Content>
