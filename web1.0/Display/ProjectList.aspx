<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectList.aspx.cs" Inherits="Display_ProjectList" MasterPageFile="~/Display/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/progect.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main">
        <span class="leftLine"></span>
			<div class="center clearfix">
				<div class="left-content">
					<a class="left-content-nav">项目类型</a>
			
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
                <ul class="mobileNavUl"><a class="mobileNavUlLi" href="main-index.aspx">首页</a><a class="mobileNavUlLi" href="Introduction.aspx">关于</a><a class="mobileNavUlLi" href="ProjectList.aspx?pageNumber=1">项目</a><a class="mobileNavUlLi" href="Service.aspx">服务</a><a class="mobileNavUlLi" href="SrcList.aspx?pageNumber=1">资源</a><a class="mobileNavUlLi" href="ActivityList.aspx?type=0&amp;&amp;page=1">活动</a><a id="mobilePerson" runat="server" class="mobileNavUlLi" href="Person-index.aspx">个人中心</a><a id="mobileLogin" runat="server" class="mobileNavUlLi mobileNavUlLiLog">登录</a></ul>

		</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script>
        var str=window.location.search;
        var type=str.substr(str.indexOf("type")+5,str.indexOf("&&")-6);
        var page=str.substr(str.indexOf("page")+5);
		$.ajax({ 
          
          url: "./Ajax/ProListHandler.ashx",
          dataType: "JSON",
          async: true,
          type: "POST", 
          data: { "type": type, "page": page },
    
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
          	for(i=0;i<data[0].length;i++)
          	{
          	    if (type == data[0][i].ProCatCategory_id) {
          	        $("<a>").addClass("left-content-nav-content-select").attr("href", (data[0][i].ProCatCategory_href )).text(data[0][i].ProCatCategory_name).appendTo($(".left-content"));
          	    }
          	    else {

          	        $("<a>").addClass("left-content-nav-content").attr("href", (data[0][i].ProCatCategory_href  )).text(data[0][i].ProCatCategory_name).appendTo($(".left-content"));

          	    }
          	    //console.log(data[0][i].DevelopyCategory_href);
          	}
          	for(i=0;i<page;i++)
          	{
          	    $("<a>").attr("href", "SrcList.aspx?type=" + type + "&&page=" + (i + 1)).text(i + 1).appendTo($(".midButton"));

          	}
          	if (page < 6) {
          	    $(".midButtonBox").css({ "width": page * 40 })
          	    $(".left-button").css({ "margin-left": (400 - 40 * (page + 2)) / 2 })
          	}
          	else {
          	    $(".midButtonBox").css({ "width": 6 * 40 })
          	    $(".left-button").css({ "margin-left": (400 - 40 * (6 + 2)) / 2 })
          	}
          	for(i=0;i<data[2].length;i++)
          	{
          	    var content = $("<a>").addClass("passage").addClass("clearfix").attr("href", ( data[2][i].Project_href + data[2][i].Project_id)).appendTo($(".passage-content"));
          		$("<h2>").text(data[2][i].Project_title).appendTo(content);
          		var pContent=$("<div>").appendTo(content);
          		$("<p>").text(data[2][i].Project_summary).appendTo(pContent);
          		$("<h3>").text(" 发布时间："+data[2][i].Project_time).appendTo(content);
          		$("<a>").attr("href", (data[2][i].Project_href + data[2][i].Project_id)).text("查看文章").appendTo(content);
          		
          	}
          	$(".title-name").text(data[3]);

                    
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
     <script type="text/javascript"  src="./js/mobile.js"></script>
</asp:Content>