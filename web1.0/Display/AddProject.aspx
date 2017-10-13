<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddProject.aspx.cs" Inherits="Display_AddProject" MasterPageFile="~/Display/Person.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/personal-center-creatProgect.css">
    <script src="jquery-3.2.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript"  src="./js/personal-center-creatProgect.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    	<div class="right-content">
		<div class="clearfix">
			<h1>新建项目</h1>
		</div>
		<span class="cut"></span>
			<div class="clearfix">
				<h2 class="name-h2">项目名称:</h2>
                <asp:TextBox ID="txtName" runat="server" class="name" ></asp:TextBox>
				<p class="name-error"></p>
			</div>
			<div class="clearfix">
				<h2>项目类型:</h2>
				<ul class="down clearfix">
					<li class="select-true1">
                        <asp:Label ID="lbSelected" runat="server" Text="请选择项目类型"></asp:Label>	
					</li>
					<ul class="select-box clearfix">
                        <asp:Repeater ID="rptSelect1" runat="server" OnItemCommand="rptSelect1_ItemCommand">
                            <ItemTemplate>
                                <li class="select select1"><asp:LinkButton ID="lbtnSelect" runat="server" Text=<%#Eval("name") %> CommandName="selected"></asp:LinkButton></li>
                                <input type="hidden" id="Category" value=<%#Eval("id") %> runat="server" />
                            </ItemTemplate>
                        </asp:Repeater>
					</ul>
				</ul>
				<p class="error organization-error"></p>
			</div>
			<div class="clearfix">
				<h2>资助额度:</h2>
                <asp:TextBox ID="txtMoney" runat="server" class="money"></asp:TextBox>
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
				<h2>上传文件:</h2>				
                <asp:FileUpload ID="FileUp" runat="server" style="display:none" />  
                <asp:Button id="btnBrowse" runat="server" OnClientClick="return ShowBrowse()" Text="选择文件" class="choose"/>
                <h3 style="margin-top:0px;"><asp:TextBox ID="txtFileName" runat="server" value="支持pdf、doc、docx格式的文件"></asp:TextBox> </h3>
                 
			</div>
            <asp:LinkButton ID="btnSubmit" runat="server" Text="提交项目" class="submit" OnClick="btnSubmit_Click" />
	</div>
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
    <script>
	    $(document).ready(function() { 
		      timer = setTimeout(function () {
                    for(i=3;i<175;i++){$("#edui"+i).remove()};for(i=176;i<301;i++){$("#edui"+i).remove()}
                	    $("#edui1").css({"width":500,"height":300})
                     },100);
		
	    });
      </script>
</asp:Content>

