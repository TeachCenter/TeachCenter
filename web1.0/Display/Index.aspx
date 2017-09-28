<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Display_Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <asp:LinkButton runat="server" Text="服务" PostBackUrl="~/Display/Service.aspx?Type=1"></asp:LinkButton>
        <asp:LinkButton ID="lbtLogin" runat="server" PostBackUrl="~/Display/Login.aspx" Text="用户登陆"></asp:LinkButton>
    </div>
    </form>
</body>
</html>
