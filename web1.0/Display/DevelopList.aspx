<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="DevelopList.aspx.cs" Inherits="Display_DevelopList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/progect.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main">
        <span class="leftLine"></span>
			<div class="center clearfix">
				<div class="left-content">
					<a class="left-content-nav">教学发展</a>
					
				</div>
				<div class="right-content">
					<h1 class="title-name"></h1>
					<div class="passage-content" ></div>
					<!-- <div class="passage">
						<h2>这里是文章标题</h2>
						<div>
						<p>这里是缩略内容校长助理李巍然主持研讨会并讲话。他指出，跨学科教育在近些年受到极大关注，但以“跨学科”为专题进行研究的并不多见。海洋学本身就是跨不同学科的综合性学科，与会人员在交流的基础上相互借鉴、加深理解，并在一定程度上达成共识，这将有助于海洋学科的发展，有助于</p>
						</div>
						<h3>发布人：系统管理员 发布时间：2013-05-31 浏览次数：999</h3>
						<a href="">查看文章</a>
					</div>
					<div class="passage">
						<h2>这里是文章标题</h2>
						<div>
						<p>这里是缩略内容校长助理李巍然主持研讨会并讲话。他指出，跨学科教育在近些年受到极大关注，但以“跨学科”为专题进行研究的并不多见。海洋学本身就是跨不同学科的综合性学科，与会人员在交流的基础上相互借鉴、加深理解，并在一定程度上达成共识，这将有助于海洋学科的发展，有助于</p>
						</div>
						<h3>发布人：系统管理员 发布时间：2013-05-31 浏览次数：999</h3>
						<a href="">查看文章</a>
					</div>
					<div class="passage">
						<h2>这里是文章标题</h2>
						<div>
						<p>这里是缩略内容校长助理李巍然主持研讨会并讲话。他指出，跨学科教育在近些年受到极大关注，但以“跨学科”为专题进行研究的并不多见。海洋学本身就是跨不同学科的综合性学科，与会人员在交流的基础上相互借鉴、加深理解，并在一定程度上达成共识，这将有助于海洋学科的发展，有助于</p>
						</div>
						<h3>发布人：系统管理员 发布时间：2013-05-31 浏览次数：999</h3>
						<a href="">查看文章</a>
					</div>
					<div class="passage">
						<h2>这里是文章标题</h2>
						<div>
						<p>这里是缩略内容校长助理李巍然主持研讨会并讲话。他指出，跨学科教育在近些年受到极大关注，但以“跨学科”为专题进行研究的并不多见。海洋学本身就是跨不同学科的综合性学科，与会人员在交流的基础上相互借鉴、加深理解，并在一定程度上达成共识，这将有助于海洋学科的发展，有助于</p>
						</div>
						<h3>发布人：系统管理员 发布时间：2013-05-31 浏览次数：999</h3>
						<a href="">查看文章</a>
					</div>
					<div class="passage">
						<h2>这里是文章标题</h2>
						<div>
						<p>这里是缩略内容校长助理李巍然主持研讨会并讲话。他指出，跨学科教育在近些年受到极大关注，但以“跨学科”为专题进行研究的并不多见。海洋学本身就是跨不同学科的综合性学科，与会人员在交流的基础上相互借鉴、加深理解，并在一定程度上达成共识，这将有助于海洋学科的发展，有助于</p>
						</div>
						<h3>发布人：系统管理员 发布时间：2013-05-31 浏览次数：999</h3>
						<a href="">查看文章</a>
					</div> -->
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
                <ul class="mobileNavUl"><a class="mobileNavUlLi" href="main-index.aspx">首页</a><a class="mobileNavUlLi" href="Introduction.aspx">关于</a><a class="mobileNavUlLi" href="ProjectList.aspx?pageNumber=1">项目</a><a class="mobileNavUlLi" href="Service.aspx">服务</a><a class="mobileNavUlLi" href="SrcList.aspx?pageNumber=1">资源</a><a class="mobileNavUlLi" href="ActivityList.aspx?type=0&amp;&amp;page=1">活动</a><a id="mobilePerson" runat="server" class="mobileNavUlLi" href="Person-index.aspx">个人中心</a><a id="mobileLogin" runat="server" class="mobileNavUlLi mobileNavUlLiLog">登陆</a></ul>

		</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script>
        var str=window.location.search;
        var type=str.substr(str.indexOf("type")+5,str.indexOf("&&")-6);
        var page=str.substr(str.indexOf("page")+5);
		$.ajax({ 
          
          url: "./Ajax/DevelopList_Handler.ashx",
          dataType: "JSON",
          async: true,
          type: "POST", 
          data: { "category": type, "page": page },

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
          	for(i=0;i<data[0].length;i++)
          	{
          	    if (type == data[0][i].DevelopyCategory_id) {
          	        $("<a>").addClass("left-content-nav-content-select").attr("href", (data[0][i].DevelopCategory_href + data[0][i].DevelopCategory_id + "&&page=1")).text(data[0][i].DevelopyCategory_name).appendTo($(".left-content"));
          	    }
          	    else {

          	        $("<a>").addClass("left-content-nav-content").attr("href", (data[0][i].DevelopCategory_href + data[0][i].DevelopCategory_id + "&&page=1")).text(data[0][i].DevelopyCategory_name).appendTo($(".left-content"));

          	    }
          	    //console.log(data[0][i].DevelopyCategory_href);
          	}
          	for(i=0;i<page;i++)
          	{
          	    $("<a>").attr("href", "DevelopList.aspx?type=" + type + "&&page=" + (i + 1)).text(i + 1).appendTo($(".midButton"));

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
          	    var content = $("<a>").addClass("passage").addClass("clearfix").attr("href", (data[2][i].Develop_link == "" ? data[2][i].Develop_href + data[2][i].Develop_id : data[2][i].Develop_link)).appendTo($(".passage-content"));
          		$("<h2>").text(data[2][i].Develop_title).appendTo(content);
          		var pContent=$("<div>").appendTo(content);
          		$("<p>").text(data[2][i].Develop_content).appendTo(pContent);
          		$("<h3>").text("发布人："+data[2][i].Develop_author+" 发布时间："+data[2][i].Develop_time+" 浏览次数："+data[2][i].Develop_hit).appendTo(content);
          		$("<a>").attr("href", (data[2][i].Develop_link == "" ? data[2][i].Develop_href + data[2][i].Develop_id : data[2][i].Develop_link)).text("查看文章").appendTo(content);
          		
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

