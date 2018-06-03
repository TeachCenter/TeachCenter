<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="BackStage_Login" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="manage.js" type="text/javascript"></script>
    <script type="text/javascript">
        //点击切换验证码
        function f_refreshtype()
        {
            var Image1 = document.getElementById("img");
            if (Image1 != null)
            {
                Image1.src = Image1.src + "?";
            }
        }
        if (self.frameElement && self.frameElement.tagName == "IFRAME") {
            window.top.location = 'Login.aspx';
        }
    </script>
    <style type="text/css">
        #login{
            height: 500px;
            width: 500px;
            margin: 0 auto;
            margin-top: 200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="login">
        账号: <asp:TextBox ID="txtID" runat="server"></asp:TextBox><br /><br />
        密码: <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox><br /><br />

        请输入验证码：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <img src="png.aspx" id="img" onclick="f_refreshtype()" /><br /><br />
        <%--<asp:CheckBox ID="cbxRemeberUser" runat="server" Text="记住用户名" ForeColor="gray"/>--%>
<%--        <asp:Button ID="btnSub" Text="登陆" OnClick="btnSub_Click" runat="server"/>

    </div>
    </form>
</body>
</html>--%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>登录</title>
	<link rel="stylesheet" href="../Display/css/init.css">

	<script type="text/javascript"  src="jquery-3.2.1.min.js"></script>
        <script type="text/javascript">
        //点击切换验证码
        function f_refreshtype()
        {
            var Image1 = document.getElementById("img");
            if (Image1 != null)
            {
                Image1.src = Image1.src + "?";
            }
        }
        if (self.frameElement && self.frameElement.tagName == "IFRAME") {
            window.top.location = 'Login.aspx';
        }
    </script>
</head>
<body>
    <form runat="server">
	<div class="content" style="width:100%;margin-top:0">
		<div class="header" style="height: 50px;width: 100%;background-color: #000000;">
			<h1 style="color: #FFFFFF;margin-left: 32px;font-size:20px;line-height: 50px; ">教学支持中心后台</h1>
		</div>
		<div class="main" style="position: relative;margin-bottom: 0">
			<img src="./picture/log.png" style="display: block; width: 100%;height: 900px;" alt="">
			<div class="log-box" style="position: absolute; left: 50%;top: 50%;background-color: #FFFFFF;margin-left: -225px;margin-top: -335px;">
				<h1>登录</h1>
				<%--<input type="text" id="txtID" runat="server" placeholder="工号" class="number gray-box" style="margin-right: 32px;">--%>
                <asp:TextBox ID="txtID" runat="server" placeholder="工号" class="number gray-box" style="margin-right: 32px;"></asp:TextBox>
				<p class="number-error error"></p>
				<input type="text" placeholder="密码" class="show-password gray-box" style="display: block;" >
                <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"  class="hide-password gray-box"></asp:TextBox>
				<%--<input type="password" runat="server" id="txtPwd" class="hide-password gray-box" >--%>
				<p class="password-error error"></p>
				<%--<input type="text" id="TextBox1" runat="server" placeholder="验证码" class="gray-box code" style="width: 176px;float: left;" >
                --%>
                <asp:TextBox ID="TextBox1" runat="server" class="gray-box code" style="width: 176px;float: left;"></asp:TextBox>
                <img src="png.aspx" id="img" onclick="f_refreshtype()" style="float:left;margin-left:72px;display:block;width:80px;height:60px;"/>
				<p class="code-error error" ></p>
				<asp:LinkButton ID="btnSub" runat="server" OnClick="btnSub_Click" Text="立即登录" class="log-submit" style="background-color: #5A99DF;margin-bottom: 32px; margin-top: 170px;"></asp:LinkButton>
			</div>
		</div>
	</div>
	<script>
		function log(){
			var reg;
			var flag1=[false,false,true];
			$(".number").on({
				focus:function(){
					if(!flag1[0]){
						if($(".number").val()=="工号")
					    {
					    	 $(".number").val("");

					    }
				    
				    $(".number-error").text("");
					}
				},
				blur:function(){
				   reg=/^[A-Za-z0-9]{7,7}$/;
				   if(!reg.test($(".number").val())){
				    $(".number-error").text("*账号错误");
				    flag1[0]=false;
				   }
				   else{
				   	flag1[0]=true;
				   }
				}
			})
			$(".show-password").on({
				focus:function(){
					$(".show-password").css({"display":"none"})
					$(".hide-password").css({"display":"block"})
					if(!flag1[1]){	   
				    $(".password-error").text("");
					}
				}
			})
			$(".hide-password").on({
				focus:function(){
					if(!flag1[1]){	   
				    $(".password-error").text("");
					}
				},
				blur:function(){
				    reg=/^(?![0-9]+$)(?![a-zA-Z]+$)[A-Za-z0-9]{5,15}$/;
				   if(!reg.test($(".hide-password").val())){
				    $(".password-error").text("*用户名或密码错误");
				    flag1[1]=false;
				   }
				   else{
				   	flag1[1]=true;
				   }
				}
			})
			$(".show-password").on({
				focus:function(){
					$(".show-password").css({"display":"none"})
					$(".hide-password").css({"display":"block"})
					if(!flag1[1]){	   
				    $(".password-error").text("");
					}
				}
			})
			$(".hide-password").on({
				focus:function(){
					if(!flag1[1]){	   
				    $(".password-error").text("");
					}
				},
				blur:function(){
				    reg=/^(?![0-9]+$)(?![a-zA-Z]+$)[A-Za-z0-9]{5,15}$/;
				   if(!reg.test($(".hide-password").val())){
				    $(".password-error").text("*用户名或密码错误");
				    flag1[1]=false;
				   }
				   else{
				   	flag1[1]=true;
				   }
				}
			})
			$(".code").on({
				focus:function(){
					if(!flag1[2]){
						if($(".code").val()=="验证码")
					    {
					    	 $(".code").val("");

					    }
				    
				    $(".code-error").text("");
					}
				},
				blur:function(){
				   reg=/^[A-Za-z0-9]{7,7}$/;
				   if(!reg.test($(".code").val())){
				    //$(".code-error").text("验证码错误");
				    //flag1[2]=false;
				   }
				   else{
				   	flag1[2]=true;
				   }
				}
			})
			$(".log-submit").click(function(){
			if(flag1[0]==true&&flag1[1]==true&&flag1[2]==true)
			{
			} 
			else{
				
			}
			});
			$(".log-box-form").submit(function () {
			    if (flag1[0] == true && flag1[1] == true&&flag1[2]==true) {
			        return true;
			    }
			    else {
			        return false;
			    }
			});
		}
log()
	</script></form>
</body>
</html>
