<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImprovePro.aspx.cs" Inherits="Display_ImprovePro" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="css/personal-center-init.css">
	<link rel="stylesheet" href="css/personal-center-checkProgect.css">
	<script type="text/javascript"  src="./js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
    <style>
        #txtFileName {
            border:none;
        }
         #edui1_toolbarbox{
        position:relative!important;
        }
        #edui1 {
            top: 30px;
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

    </style>
</head>
<body>
	<div class="left-nav">
		<img src="./images/logo-big.png" alt="">
		<ul>
			<li class="dif-li"><a href="	">个人主页</a></li>
			<li><a href="	">修改信息</a></li>
			<li><a href="	">项目管理</a></li>
			<li><a href="	">服务管理</a></li>
			<li><a href="	">活动管理</a></li>
			<li><a href="	">评审服务</a></li>
		</ul>
	</div>
	<div class="right-content">
		<div class="clearfix">
			<h1>完善项目</h1>
		</div>
		<span class="cut"></span>
		<form action="" runat="server">
			<div class="clearfix">
				<h2>项目名称:</h2>
                <asp:TextBox ID="txtName" runat="server" class="name" ReadOnly="true"></asp:TextBox>
			</div>
			<div class="clearfix">
				<h2>项目类型:</h2>
                <asp:TextBox ID="txtCategory" runat="server" class="type" ReadOnly="true"></asp:TextBox>
			</div>
			<div class="clearfix">
				<h2>负责人:</h2>
                <asp:TextBox ID="txtDuty" runat="server" class="duty" ReadOnly="true"></asp:TextBox>
			</div>
			<div class="clearfix">
				<h2>单位:</h2>
                <asp:TextBox ID="txtDepartment" runat="server" class="organization" ReadOnly="true"></asp:TextBox>
			</div>
			<div class="clearfix">
				<h2>申报日期:</h2>
                <asp:TextBox ID="txtYear" runat="server" class="year" ReadOnly="true"></asp:TextBox>
				<h2 class="dif-h2">年</h2>
                <asp:TextBox ID="txtMonth" runat="server" class="month" ReadOnly="true"></asp:TextBox>
				<h2 class="dif-h2">月</h2>
                <asp:TextBox ID="txtDay" runat="server" class="day" ReadOnly="true"></asp:TextBox>
				<h2 class="dif-h2">日</h2>
			</div>
			<div class="clearfix">
				<h2>资助额度:</h2>
                <asp:TextBox ID="txtMoney" runat="server" class="money" ReadOnly="true"></asp:TextBox>
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
			</div>
            <div class="clearfix" style="margin-top:50px;">
				<h2>上传文件:</h2>				
                <asp:FileUpload ID="FileUp" runat="server" style="display:none" />  
                <asp:Button id="btnBrowse" runat="server" OnClientClick="return ShowBrowse()" Text="选择文件" class="choose"/>
                <h3 style="margin-top:0px;"><asp:TextBox ID="txtFileName" runat="server" value="支持pdf、doc、docx格式的文件"></asp:TextBox> </h3>                
			</div>
			<a href="" class="submit">完善项目<asp:LinkButton ID="lbtnSubmit" runat="server" OnClick="lbtnSubmit_Click"></asp:LinkButton></a>
		</form>
	</div>
    <script>
	    $(document).ready(function() { 
		      timer = setTimeout(function () {
                    for(i=3;i<175;i++){$("#edui"+i).remove()};for(i=176;i<301;i++){$("#edui"+i).remove()}
                	    $("#edui1").css({"width":500,"height":300})
                     },100);
		
	    });
    </script>
    <script language="javascript" type="text/javascript">
        function ShowBrowse()  
        {  
            var file1=document.getElementById("FileUp");  
            if(file1)  
            { 
                file1.click();  
                var isie = (document.all) ? true : false; //判断是IE内核还是Mozilla 
                return isie; //火狐浏览器加return false才会在选择文件后将文件名带回到textbox,IE如果返回false上传时要点击两次按钮才触发
            }  
        }   
     </script>
	<script type="text/javascript"  src="./js/personal-center-init.js"></script>
	<script type="text/javascript"  src="./js/personal-center-creatProgect.js"></script>
     <script>
         $(document).ready(function () {
             timer = setTimeout(function () {
                 $("#edui1_bottombar").remove();
                 for (i = 3; i < 175; i++) { $("#edui" + i).remove() }; for (i = 176; i < 301; i++) { $("#edui" + i).remove() }
                 $("#edui1").css({ "width": 500, "height": 300 })
             }, 100);


         });
      </script>
</body>
</html>
