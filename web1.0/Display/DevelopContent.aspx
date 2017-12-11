<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="DevelopContent.aspx.cs" Inherits="Display_DevelopContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/intro.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main">
			<div class="center hei">
				<div class="brief-intro-box">
					<h1 class="brief-intro"></h1>
					<span class="brief-intro-line"></span>
					<h2 class="publish"></h2>
					<div class="p-box">

					</div>
				</div>
			</div>
                <ul class="mobileNavUl"><a class="mobileNavUlLi" href="main-index.aspx">首页</a><a class="mobileNavUlLi" href="Introduction.aspx">关于</a><a class="mobileNavUlLi" href="ProjectList.aspx?pageNumber=1">项目</a><a class="mobileNavUlLi" href="Service.aspx">服务</a><a class="mobileNavUlLi" href="SrcList.aspx?pageNumber=1">资源</a><a class="mobileNavUlLi" href="ActivityList.aspx?type=0&amp;&amp;page=1">活动</a><a id="mobilePerson" runat="server" class="mobileNavUlLi" href="Person-index.aspx">个人中心</a><a id="mobileLogin" runat="server" class="mobileNavUlLi mobileNavUlLiLog">登陆</a></ul>

		</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script>
        $(document).ready(function () {
        var id = window.location.search.substr(4);
		$.ajax({    
		    url: "./Ajax/DevelopContent_Handler.ashx",
          dataType: "JSON",
          type: "POST",
          async: true,
          data: { "Develop_id": id},
    
          success: function(data) {
          	$(".brief-intro").text(data.Develop_title)
          	$(".publish").text("发布人：" + data.Develop_author + "  发布时间：" + data.Develop_time+ " 类型：" + data.Develop_category + "  浏览次数：" + data.Develop_hit);
          	$(data.Develop_content).appendTo($(".p-box"))
                    
          }


      }); 

	})
		
	</script>
     <script type="text/javascript"  src="./js/mobile.js"></script>
</asp:Content>

