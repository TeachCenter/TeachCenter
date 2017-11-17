<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="main-index.aspx.cs" Inherits="Display_main_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/index.css" />
    <link rel="stylesheet" href="css/mobile.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main clearfix">
        <span class="leftLine"></span>
			<div id="mySlide1" style="width: 1200px; height: 380px; margin-left: auto; margin-right: auto;"></div>
			<div class="center clearfix indexCenter">
			<div class="teach ">
			 	<div class="teach-header clearfix">
			 		<h1>教学发展</h1>
			 		<a class="more" href="DevelopList.aspx?type=0&&page=1">MORE >></a>
                     <span class="bottomLine"></span>
			 	</div>
				<div id="mySlide2" style="width: 358px; height: 395px; "></div>
			</div>
			<div class="work">
				<div class="work-header clearfix">
			 		<h1>工作动态</h1>
			 		<a class="more" href="ActivitySummaryList.aspx?page=1">MORE >></a>
                    <span class="bottomLine"></span>
			 	</div>
				<div id="mySlide3" style="width: 358px; height: 395px; "></div>

			</div>
			<div class="inform clearfix">
				<div class="inform-header clearfix">
			 		<h1>通知公告</h1>
			 		<a class="more" href="NoticeList.aspx?page=1">MORE >></a>
                    <span class="bottomLine"></span>
			 	</div>
		 		<ul class="notice">
		 			

		 		</ul>
			 </div>	
			</div>
			<ul class="mobileNavUl"><a class="mobileNavUlLi" href="main-index.aspx">首页</a><a class="mobileNavUlLi" href="Introduction.aspx">关于</a><a class="mobileNavUlLi" href="ProjectList.aspx?pageNumber=1">项目</a><a class="mobileNavUlLi" href="Service.aspx">服务</a><a class="mobileNavUlLi" href="SrcList.aspx?pageNumber=1">资源</a><a class="mobileNavUlLi" href="ActivityList.aspx?type=0&amp;&amp;page=1">活动</a><a class="mobileNavUlLi mobileNavUlLiLog">登陆</a></ul>
		</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    	<script>
	var topArr=[];
	var developArr=[];
	var activityArr=[];
	$.ajax({ 
          type: "GET",    
          url: "./Ajax/Index_Handler.ashx",
          dataType: "JSON",
          async: true,
          // data: { "id": id },
    
          success: function(data) {
          	var i=0;
          	
          	for(i=0;i<data[0].length;i++)
          	{
          	    topArr.push({"imgurl":("../Backstage/" +data[0][i].Picture_path),href:"#"})
          		
          	}
          	$("#mySlide1").mySlide(topArr,3000);
          	for(i=0;i<data[1].length;i++)
          	{
          	    developArr.push({ "imgurl":("../Backstage/picture/" + data[1][i].Develop_path), "href": data[1][i].Develop_href == "" ? "DevelopContent.aspx?id=" + data[1][i].Develop_id : data[1][i].Develop_href, "text": data[1][i].Develop_title })
          		
          	}
          	$("#mySlide2").mySlide(developArr,3000);
          	for(i=0;i<data[2].length;i++)
          	{
          	    activityArr.push({ "imgurl": "../Backstage/picture/" + data[2][i].ActivitySummary_cover, "href": (data[2][i].ActivitySummary_href + data[2][i].ActivitySummary_id), "text": data[2][i].ActivitySummary_title })
          	    
          		
          	}
          	$("#mySlide3").mySlide(activityArr,3000);
          	for(i=0;i<data[3].length;i++)
          	{
          		 var row = $("<li>").appendTo($(".notice"));
          		 $("<a>").attr("href",data[3][i].noticeHref).text(data[3][i].noticeTitle).appendTo(row);
          		
          	}

                    
          }


      }); 
   
  
   var arr1=[//模拟ajax请求的数据
        {imgurl:"images/1.png",href:"#",text:"这里大概文章标题长度50字符这里大概文章 标题长度50"},
        {imgurl:"images/1.png",href:"#",text:"这里大概文章标题长度50字符这里大概文章 标题长度50"},
        {imgurl:"images/1.png",href:"#",text:"这里大概文章标题长度50字符这里大概文章 标题长度50"}
    ];
  
   
    $(function(){
        $("#mySlide3").mySlide(arr1,3000);
    })
    
</script>

    
	<script type="text/javascript"  src="./js/index.js"></script>
     <script type="text/javascript"  src="./js/mobile.js"></script>
   
</asp:Content>

