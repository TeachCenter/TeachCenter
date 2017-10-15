<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="main-index.aspx.cs" Inherits="Display_main_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/index.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="main clearfix">
			<div id="mySlide1" style="width: 1200px; height: 380px; margin-left: auto; margin-right: auto;"></div>
			<div class="center clearfix">
			<div class="teach ">
			 	<div class="teach-header clearfix">
			 		<h1>教学发展</h1>
			 		<a class="more" href="DevelopList.aspx?type=0&&page=1">MORE >></a>
			 	</div>
				<div id="mySlide2" style="width: 378px; height: 395px; "></div>
			</div>
			<div class="work">
				<div class="work-header clearfix">
			 		<h1>工作动态</h1>
			 		<a class="more" href="ActivitySummaryList.aspx?page=1">MORE >></a>
			 	</div>
				<div id="mySlide3" style="width: 378px; height: 395px; "></div>

			</div>
			<div class="inform clearfix">
				<div class="inform-header clearfix">
			 		<h1>通知公告</h1>
			 		<a class="more" href="NoticeList.aspx?page=1">MORE >></a>
			 	</div>
		 		<ul class="notice">
		 			

		 		</ul>
			 </div>	
			</div>
			
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
    	for(i=0;i<data[0].length;i++)
          	{
          		
          		alert(topArr[i].imgurl)
          	}
        
    })
    $(function(){
        
    })
    $(function(){
        $("#mySlide3").mySlide(arr1,3000);
    })
</script>
	<script type="text/javascript"  src="./js/index.js"></script>
</asp:Content>

