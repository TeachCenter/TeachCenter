<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SrcList.aspx.cs" Inherits="Display_SrcList" MasterPageFile="~/Display/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/progect.css">
    <style>
        .hhh{
            margin-top:32px;
	        display: block;
	        text-align: center;
	        width: 100%;
	        line-height: 60px;
	        height: 60px;
	        font-size: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<div class="main">
            <span class="leftLine"></span>
			<div class="center clearfix">
				<div class="content ">
					<h1 class="hhh">教学资源</h1>
					<div id="hhhs" class="passage-content1  " >
                        
					</div>					
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
	<script type="text/javascript"  src="./js/pop.js"></script>
	<script>
	    var page;
	    var str = window.location.search;
	    var pageSize = str.substr(str.indexOf("type") + 11, str.indexOf("&&") - 10);
	    var pageNumber = str.substr(str.indexOf("pageNumber") + 11);
		$.ajax({   
		    url: "./Ajax/EduSrcHandler.ashx",
          dataType: "JSON",
          type: "POST", 
          async: true,
          data: { "pageSize": 6, "pageNumber": pageNumber },

          // data: { "id": id },
    
          success: function(data) {
          	var i=0;
          	var j=0;
          	if (data[1] % 6 == 0) {
          	    page = data[1] / 6;
          	}
          	else {
          	    page = Math.floor(data[1] / 6 + 1);
          	}
          	if (page == 0) {
          	    page = 1;
          	}
          
          	for(i=0;i<page;i++)
          	{
          	    $("<a>").attr("href", "SrcList.aspx?pageSize=6" + "&&pageNumber=" + (i+1)).text(i + 1).appendTo($(".midButton"));
          	}
          	if (page < 6)
          	{
          	    $(".midButtonBox").css({ "width": page * 40 })
          	    $(".left-button").css({ "margin-left": (680 - 40 * (page + 2)) / 2 })
          	}
          	else {
          	    $(".midButtonBox").css({ "width": 6* 40 })
          	    $(".left-button").css({ "margin-left": (680 - 40 * (6 + 2)) / 2 })
          	}
          	
          	for (i = 0; i < data[0].length ; i++)
          	{
          	    var content = $("<a>").attr("href", "SrcContent.aspx?id=" + data[0][i].id).addClass("passage").addClass("clearfix").appendTo($("#hhhs"));
          	    $("<h2>").text(data[0][i].title).appendTo(content);
          		var pContent=$("<div>").appendTo(content);
          		$("<p>").text(data[0][i].body).appendTo(pContent);
          		$("<h3>").text("发布人：" + data[0][i].publisher + " 发布时间：" + data[0][i].publish_time.substr(0, 10)).appendTo(content);
          		$("<a>").attr("href", "SrcContent.aspx?id=" + data[0][i].id).text("查看文章").appendTo(content);
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
			    if (position != -40 * (Math.ceil(page/ 6) - 1))
				{
					position-=40;
					$(".midButton").css({"top":position})
					
				}
			        
			  	})
			$(".rright-button").on('click', function() {
			    position = -40 * (Math.ceil(page / 6) - 1);
				$(".midButton").css({"top":position})
			        
			  	})
		
		}
		turnPage();
	
	   
	</script>
     <script type="text/javascript"  src="./js/mobile.js"></script>
    </asp:Content>
