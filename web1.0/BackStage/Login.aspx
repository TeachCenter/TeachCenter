<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="BackStage_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="jquery-3.2.1.min.js" type="text/javascript"></script>
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
        <script type="text/javascript">
            $("#txtID").focusout(function () {
                var txtID = $("#txtID");
                if (txtID.val().length == 0) {
                    txtID.val("输入不能为空");
                    txtID.css("color", "red");
                    $("#btnSub").attr("disabled", true);
                }
                else {
                    txtID.css("color", "#333");
                    $("#btnSub").attr("disabled", false);
                }
            });
        </script>
        请输入验证码：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <img src="png.aspx" id="img" onclick="f_refreshtype()" /><br /><br />
        <asp:CheckBox ID="cbxRemeberUser" runat="server" Text="记住用户名" ForeColor="gray"/>
        <asp:Button ID="btnSub" Text="登陆" OnClick="btnSub_Click" runat="server" />
        
    </div>
    </form>
</body>
</html>
