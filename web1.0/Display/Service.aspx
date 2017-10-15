<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="Service.aspx.cs" Inherits="Display_Service" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    	<link rel="stylesheet" href="css/progect.css" />
	<link rel="stylesheet" href="css/service.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cover" style="left:0;top:0;position:absolute; width:100%;height:1400px;;background-color:#FFFFFF;z-index:20;"></div>
    <div class="main">
			<div class="center clearfix">
				<div class="left-content">
					<a class="left-content-nav">服务</a>
                    <asp:Repeater ID="rptCategory" runat="server">
                        <ItemTemplate>
                            <a class="left-content-nav-content" href='<%#"Service.aspx?id="+Eval("ServiceCategory_id") %>'><%# Eval("ServiceCategory_name") %></a>
                        </ItemTemplate>
                    </asp:Repeater>
				</div>
				<div class="right-content">
					<h1 class="title-name">申请服务</h1>
					<div class="passage-content" style="height: 1140px;">
						<div class="clearfix unchangeable">
							<h2>申请人:</h2>
							<input class="duty" runat="server" id="ltTeacher" type="text" readonly="readonly" />
							<p class="duty-error"></p>
						</div>
						<div class="clearfix unchangeable">
							<h2>服务类型:</h2>
							<input class="same position" type="text" runat="server" id="ltType" readonly="readonly" />
							<p class="error position-error"></p>
						</div>
						<div class="clearfix changeable">
							<h2>联系方式:</h2>
							<input class="same position" type="text" id="txtPhone" runat="server" />
							<p class="error position-error"></p>
						</div>
						<div class="clearfix changeable" >
							<h2>备注:</h2>
							<textarea name="txtIntroduction" type="text" class="" id="txtRemarks" runat="server"></textarea>
							<p></p>
						</div>
						<%--<a href="" class="submit">提交项目</a>--%>
                        <asp:LinkButton ID="btnSub" runat="server" Text="提交服务" CssClass="submit" OnClick="btnSub_Click" />
					</div>

				</div>
			</div>
		</div>
    
    <script>
        
        var timer = setTimeout(function () {
            $(".cover").css({ "display": "none" })
        }, 500);
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

