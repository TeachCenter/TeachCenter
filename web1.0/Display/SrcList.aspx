<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SrcList.aspx.cs" Inherits="Display_SrcList" MasterPageFile="~/Display/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/progect.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<div class="main">
			<div class="center clearfix">
				<div class="content">
					<h1>教学资源</h1>
					<div class="passage-content" style="height: 1140px;"></div>					
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
		</div>
	<script type="text/javascript"  src="./js/pop.js"></script>
	<script>
	 var page;
		$.ajax({   
		    url: "./Ajax/EduSrcHandler.ashx",
          dataType: "JSON",
          type: "POST", 
          async: true,
          data: { "pageSize":6,"pageNumber":1},

          // data: { "id": id },
    
          success: function(data) {
          	var i=0;
          	var j=0;
          	page = Math.floor(data.length / 6 + 1);
          
          	for(i=0;i<page;i++)
          	{
          		$("<a>").attr("href","ActivityList.html?type="+window.location.search.substr(6)+"&&page="+(i+1)).text(i+1).appendTo($(".midButton"));
          	}
          	$(".midButtonBox").css({"width":page*40})
          	$(".left-button").css({"margin-left":(680-40*(page+2))/2})
          	for(i=0;i<data.length ;i++)
          	{
          	    var content = $("<a>").attr("href", "SrcContent.aspx?id=" + data[i].id).addClass("passage").appendTo($(".passage-content"));
          		$("<h2>").text(data[i].title).appendTo(content);
          		var pContent=$("<div>").appendTo(content);
          		$("<p>").text(data[i].body).appendTo(pContent);
          		$("<h3>").text("发布人：" + data[i].publisher + " 发布时间：" + data[i].publish_time.substr(0, 10)).appendTo(content);
          		$("<a>").attr( "href", "SrcContent.aspx?id=" + data[i].id).text("查看文章").appendTo(content);
          	}

                    
          }


      });
		function turnPage(){

	     	var position=0;
	      	$(".lleft-button").on('click', function() {
	      		position=0;
				$(".midButton").css({"top":position})
			        
			  	})
			$(".left-button").on('click', function() {
				if(position!=0)
				{
					position+=40;
					$(".midButton").css({"top":position})
					
				}
			        
			  	})
			$(".right-button").on('click', function() {
				if(position!=-40*(page-1))
				{
					position-=40;
					$(".midButton").css({"top":position})
					
				}
			        
			  	})
			$(".rright-button").on('click', function() {
				position=-40*(page-1);
				$(".midButton").css({"top":position})
			        
			  	})
		
		}
		turnPage();
	
	   
	</script>
    </asp:Content>
