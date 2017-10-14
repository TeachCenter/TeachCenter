<%@ Page Title="" Language="C#" MasterPageFile="~/Display/Person.master" AutoEventWireup="true" CodeFile="MyServiceEditor.aspx.cs" Inherits="Display_MyServiceEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/personal-center-creatProgect.css" />
    <script type="text/javascript"  src="./js/personal-center-creatProgect.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    	<div class="right-content">
		<div class="clearfix">
			<h1>修改服务</h1>
		</div>
		<span class="cut"></span>
		<div runat="server" action="" class="form">
			<div class="clearfix">
				<h2 class="name-h2">服务类型:</h2>
				<%--<input class="name" type="text" value="项目名称">--%>
                <span style="margin-top: 32px"><asp:Literal ID="ltType" runat="server"></asp:Literal></span>
				<p class="name-error"></p>
			</div>
			<div class="clearfix">
				<h2>申请人:</h2>
				<%--<input class="duty" type="text" value="小明">--%>
				
                <span><asp:Literal ID="ltTeacher" runat="server"></asp:Literal></span>
                <p class="duty-error"></p>
			</div>
			<div class="clearfix">
				<h2>联系方式:</h2>
				<input id="txtPhone" runat="server" class="same position" type="text" value="副教授">
				<p class="error position-error"></p>
			</div>

			<div class="clearfix">
				<h2>备注:</h2>
				<textarea id="txtIntroduction" runat="server" name="txtIntroduction" type="text" class="content"></textarea>
				<p></p>
			</div>
            <asp:LinkButton ID="ltbChange" runat="server" OnClick="ltbChange_Click" CssClass="submit" Text="修改服务"></asp:LinkButton>
			<%--<a href="" class="">修改服务
			</a>--%>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

