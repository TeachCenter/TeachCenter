<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectList.aspx.cs" Inherits="Display_ProjectList" MasterPageFile="~/Display/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/progect.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<div class="main">
			<div class="center clearfix">
				<div class="content">
					<h1 class="title">项目列表</h1>
					<div class="passage-content" style="height: 1340px;"></div>
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
	<script type="text/javascript"  src="./js/pop.js"></script>
	<script>
	    var page;
	    var str = window.location.search;
	    var pageSize = str.substr(str.indexOf("type") + 11, str.indexOf("&&") - 10);
	    var pageNumber = str.substr(str.indexOf("pageNumber") + 11);
		$.ajax({   
          url: "./Ajax/ProListHandler.ashx",
          dataType: "JSON",
          type: "POST", 
          async: true,
          data: { "pageSize": 6, "pageNumber": pageNumber },

          // data: { "id": id },
    
          success: function(data) {
          	var i=0;
          	var j=0;
          	page = Math.floor(data[1]/ 6 + 1);
          
          	for (i = 0; i < page; i++) {
          	    $("<a>").attr("href", "ProjectList.aspx?pageSize=6" + "&&pageNumber=" + (i + 1)).text(i + 1).appendTo($(".midButton"));
          	}
          	if (page < 6) {
          	    $(".midButtonBox").css({ "width": page * 40 })
          	    $(".left-button").css({ "margin-left": (680 - 40 * (page + 2)) / 2 })
          	}
          	else {
          	    $(".midButtonBox").css({ "width": 6 * 40 })
          	    $(".left-button").css({ "margin-left": (680 - 40 * (6 + 2)) / 2 })
          	}
          	for(i=0;i<data[0].length ;i++)
          	{
          	    var content = $("<a>").attr("href", "ProgectContent.aspx?id=" + data[0][i].id).addClass("passage").addClass("clearfix").appendTo($(".passage-content"));
          	    $("<h2>").text(data[0][i].title).appendTo(content);
          		var pContent=$("<div>").appendTo(content);
          		$("<p>").text(data[0][i].content).appendTo(pContent);
          		$("<h3>").text("发布人：" + data[0][i].publisher + " 发布时间：" + data[0][i].publish_time).appendTo(content);
          		$("<a>").attr("href", "ProgectContent.aspx?id=" + data[0][i].id).text("查看项目").appendTo(content);
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
