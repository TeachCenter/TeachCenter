<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActivitySummary.aspx.cs" Inherits="Display_ActivitySummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Literal ID="txtTitle" runat="server"></asp:Literal>
        <br />
        <asp:Literal ID="txtTime" runat="server"></asp:Literal>
        <br />
        <asp:Literal ID="txtAuthor" runat="server"></asp:Literal>
        <br />
        <asp:Literal ID="txtContent" runat="server"></asp:Literal>
        
    </div>
    </form>
</body>
</html>
