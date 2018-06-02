﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditProject.aspx.cs" Inherits="Display_EditProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>修改项目</title>
	<link rel="stylesheet" href="css/personal-center-init.css" />
    <link rel="stylesheet" href="css/centerMobile.css">
	<script type="text/javascript"  src="./js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript"  src="./js/personal-center-init.js"></script>
    <link rel="stylesheet" href="css/personal-center-creatProgect.css">
    <script src="jquery-3.2.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
    
    <style>
     #edui1_toolbarbox{
        position:relative!important;
        }
        #edui1 {
            left:155px;

        }
        #edui2 {
           left:-120px;
        }
        #edui1_bottombar {
            display;none;
        }
        #edui1_iframeholder {
            left: 6px;
            top: -20px;
            width:500px!important;
            height:260px!important;
           
        }
        .edui-dialog-caption {
             color: black!important;
            padding-left: 0px!important;
            display:inline!important;
            height:20px!important;
            background-color:transparent;
            margin-top:-1px;

        }
        #ContentPlaceHolder1_txtFileName {

             background: transparent;
        }

           
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="left-nav">
		<a class="aaa" href="./main-index.aspx"></a>
		<ul>
			<li><a href="Person-index.aspx">个人主页</a></li>
			<li><a href="EditInfo.aspx">修改信息</a></li>
			<li class="dif-li"><a href="MyProject.aspx?pageNumber=1">项目管理</a></li>
			<li><a href="MyServiceList.aspx">服务管理</a></li>
			<li><a href="MyActivityList.aspx">活动管理</a></li>
			<li id="liJudge" runat="server"><a href="MyJudgePro.aspx?pageNumber=1">评审服务</a></li>
            <li><asp:LinkButton ID="lbtReturn" OnClick="lbtReturn_Click" runat="server" Text="注销登录"></asp:LinkButton></li>
		</ul>
	</div>
           	<div class="right-content">
		<div class="clearfix">
			<h1>修改项目</h1>
		</div>
		<span class="cut"></span>
			<div class="clearfix">
				<h2 class="name-h2">项目名称:</h2>
                <asp:TextBox ID="txtName" runat="server" class="name" ></asp:TextBox>
                <h3 class="necessary-top">*必填</h3>
				<p class="name-error"></p>
                
			</div>
             <input type="hidden"  id="Selected" runat="server" class="Selected" value="" />
			<div class="clearfix">
				<h2>资助额度:</h2>
                <asp:TextBox ID="txtMoney" runat="server" class="money"></asp:TextBox>
                <h3 class="necessary">*必填</h3>
				<p class="money-error"></p>
			</div>
			<div class="clearfix">
				<h2>项目内容:</h2>
                <textarea id="myEditor11" name="myEditor11" runat="server" onblur="setUeditor()" style="width:100px;"></textarea>
                <script type="text/javascript">
                    var editor = new baidu.editor.ui.Editor();
                    editor.render("<%=myEditor11.ClientID%>");
                </script>
                <script type="text/javascript">
                     function setUeditor() {
                     var myEditor11 = document.getElementById("myEditor11");
                     myEditor11.value = editor.getContent();//把得到的值给textarea
                     }
                 </script>
				<p></p>
			</div>
            <div class="clearfix">
				<h2>项目文件:</h2>
				<a class="redA" class="submit" href="../BackStage/<%= getFileName() %>"><asp:Label ID="lbFileName" runat="server"></asp:Label></a>
			</div>
			<div class="clearfix">
				<h2>上传文件:</h2>				
                <asp:FileUpload ID="FileUp" runat="server" style="display:none" />  
                <asp:Button id="btnBrowse" runat="server" OnClientClick="return ShowBrowse()" Text="选择文件" class="choose"/>
                <h3 style="margin-top:0px;"><asp:TextBox ID="txtFileName" runat="server" value="支持pdf、doc、docx格式的文件"></asp:TextBox> </h3>
                 <h3 class="necessary">*必填</h3>
			</div>
            <asp:LinkButton ID="btnSubmit" runat="server" Text="确认修改" class="submit" OnClick="btnSubmit_Click" />
	</div>
    <script type="text/javascript"  src="./js/personal-center-init.js"></script>
    <script type="text/javascript"  src="./js/personal-center-creatProgect.js"></script>
    <script >
        function ShowBrowse()  
        {  
            var file1 = document.getElementById("FileUp");
            if(file1)  
            { 
                file1.click();  
                var isie = (document.all) ? true : false; //判断是IE内核还是Mozilla 
                return isie; //火狐浏览器加return false才会在选择文件后将文件名带回到textbox,IE如果返回false上传时要点击两次按钮才触发
            }  
        }   
     </script>
    <script>
	    $(document).ready(function() { 
	        timer = setTimeout(function () {
	                $("#edui1_bottombar").remove();
                    for(i=3;i<175;i++){$("#edui"+i).remove()};for(i=176;i<301;i++){$("#edui"+i).remove()}
                	    $("#edui1").css({"width":500,"height":300})
		      }, 100);
		
		
	    });
      </script>
    </div>
    </form>
    <script type="text/javascript"  src="./js/personal-center-creatProgect.js"></script>
     <script type="text/javascript"  src="./js/centerMobile.js"></script>
</body>
</html>