<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Service.aspx.cs" Inherits="Display_Server" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Repeater ID="rptCategory" runat="server">
        <ItemTemplate>
            <a href='<%#"Service.aspx?id="+Eval("ServiceCategory_id") %>'> <%# Eval("ServiceCategory_name") %></a>
        </ItemTemplate>
    </asp:Repeater>
        <br />
        <br />
        <br />
    <div>
        申请人:<asp:Literal ID="ltTeacher" runat="server"></asp:Literal>
        <br />
        <br />
        申请服务类型:<asp:Literal ID="ltType" runat="server"></asp:Literal>
        <br />
        <br />
        联系方式(手机):<asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
        <br />
        <br />
        备注:<asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Height="97px" Width="323px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnSub" runat="server" Text="提交" OnClick="btnSub_Click" />
    </div>
    </form>
</body>
</html>
