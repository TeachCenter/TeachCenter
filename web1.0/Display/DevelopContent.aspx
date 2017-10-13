<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="DevelopContent.aspx.cs" Inherits="Display_DevelopContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/intro.css" />
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
		</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script>
	$(document).ready(function(){
		$.ajax({    
		    url: "./Ajax/DevelopContent_Handler.ashx",
          dataType: "JSON",
          type: "POST",
          async: true,
          //data: { "Develop_id": 1},
    
          success: function(data) {
          	$(".brief-intro").text(data.Develop_title)
          	$(".publish").text("发布人："+data.Develop_author+"  发布时间："+data.Develop_time+" 类型："+data.Develop_category+"  浏览次数："+data.Develop_hit);
          	$(data.Develop_content).appendTo($(".p-box"))
                    
          }


      }); 

	})
		
	</script>
</asp:Content>

