<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="Introduction.aspx.cs" Inherits="Display_Introduction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/intro.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main">
			<div class="center">
				<div class="brief-intro-box">
					<h1 class="brief-intro">教学支持中心简介</h1>
					<span class="brief-intro-line"></span>
					<div class="p-box">

					</div>
				</div>
			</div>
        <ul class="mobileNavUl"><a class="mobileNavUlLi" href="main-index.aspx">首页</a><a class="mobileNavUlLi" href="Introduction.aspx">关于</a><a class="mobileNavUlLi" href="ProjectList.aspx?pageNumber=1">项目</a><a class="mobileNavUlLi" href="Service.aspx">服务</a><a class="mobileNavUlLi" href="SrcList.aspx?pageNumber=1">资源</a><a class="mobileNavUlLi" href="ActivityList.aspx?type=0&amp;&amp;page=1">活动</a><a class="mobileNavUlLi mobileNavUlLiLog">登陆</a></ul>

		</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   <script>
	$(document).ready(function(){
		$.ajax({ 
          type: "GET",    
          url: "./Ajax/Introduction_Handler.ashx",
          dataType: "JSON",
          async: true,
          // data: { "id": id },
    
          success: function(data) {
          	$(data.Introduction_content).appendTo($(".p-box"))       
          }
      }); 

	})
		
	</script>
</asp:Content>

