﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="ActivitySummaryList.aspx.cs" Inherits="Display_ActivitySummaryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/progect.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main">
			<div class="center clearfix">
				<div class="left-content">
					<a class="left-content-nav">活动</a>
					
				</div>
				<div class="right-content">
					<h1>活动总结</h1>
					<div class="passage-content " ></div>
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
		</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script>
        var str=window.location.search;
        var type=str.substr(str.indexOf("type")+5,str.indexOf("&&")-6)
        var page=str.substr(str.indexOf("page")+5)
		$.ajax({ 
             
          url: "./Ajax/ActivitySummaryList_Handler.ashx",
          dataType: "JSON",
          async: true,
          type: "POST", 
          data: { "ActivityCategory_id":type,"page":page},

          // data: { "id": id },
    
          success: function(data) {
          	var i=0;
          	var j=0;
          	page=Math.floor(data[1]/6+1);
          	
          	//for(i=0;i<data[0].length;i++)
          	//{
          	//	$("<a>").addClass("left-content-nav-content").attr("href",data[0][i].ActivityCategory_href).text(data[0][i].ActivityCategory_name).appendTo($(".left-content"));
          		
              //}
          	for (i = 0; i < data[0].length; i++) {
          	    if (type == data[0][i].ActivityCategory_id) {
          	        $("<a>").addClass("left-content-nav-content-select").attr("href", data[0][i].ActivityCategory_href).text(data[0][i].ActivityCategory_name).appendTo($(".left-content"));
          	    }
          	    else {

          	        $("<a>").addClass("left-content-nav-content").attr("href", data[0][i].ActivityCategory_href).text(data[0][i].ActivityCategory_name).appendTo($(".left-content"));

          	    }
          	}
          	for(i=0;i<page;i++)
          	{
          		$("<a>").attr("href", "ActivitySummaryList.aspx?type=" + type + "&&page=" + (i + 1)).text(i + 1).appendTo($(".midButton"));
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
          	    var content = $("<a>").addClass("passage").addClass("clearfix").attr("href", (data[2][i].ActivitySummary_href + data[2][i].ActivitySummary_id)).appendTo($(".passage-content"));
          		$("<h2>").text(data[2][i].ActivitySummary_title).appendTo(content);
          		var pContent=$("<div>").appendTo(content);
          		$("<p>").text(data[2][i].ActivitySummary_content).appendTo(pContent);
          		$("<h3>").text("发布人："+data[2][i].ActivitySummary_author+" 发布时间："+data[2][i].ActivitySummary_time+" 浏览次数："+data[2][i].ActivitySummary_hit).appendTo(content);
          		$("<a>").attr("href", (data[2][i].ActivitySummary_href + data[2][i].ActivitySummary_id)).text("查看文章").appendTo(content);
          		
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
	
	   
	</script>
</asp:Content>

