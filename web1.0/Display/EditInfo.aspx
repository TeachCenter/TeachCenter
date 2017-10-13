<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditInfo.aspx.cs" Inherits="Display_EditInfo" MasterPageFile="~/Display/Person.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/personal-center-changeInfo.css">
    <style type="text/css">
        #txtFileName{
            background:inherit;
        }
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none !important;
        }                
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    	<div class="right-content">
		<div class="clearfix">
			<h1>修改信息</h1>
		</div>
		<span class="cut"></span>
			<div class="clearfix">
				<h2 class="name-h2">姓名:</h2>
                <asp:TextBox ID="txtName" runat="server" class="same name"></asp:TextBox>
				<p class="error name-error"></p>
			</div>
			<div class="clearfix">
				<h2>性别:</h2>
                <%----%>
                <a  class="sex male">男<asp:LinkButton ID="man" runat="server" OnClick="man_Click"></asp:LinkButton></a>               
				<a  class="sex female">女<asp:LinkButton ID="woman" runat="server" OnClick="woman_Click"></asp:LinkButton></a>
                <input type="hidden" id="gender" runat="server"/>
				<p class="error sex-error"></p>
			</div>
			<div class="clearfix">
				<h2>工号:</h2>
                <asp:TextBox ID="txtNumber" runat="server" class="same num"></asp:TextBox>
				<p class="error num-error"></p>
			</div>
			<div class="clearfix">
				<h2>邮箱:</h2>
				<asp:TextBox ID="txtEmail" runat="server" class="same email"></asp:TextBox>
				<p class="error email-error"></p>
			</div>
			<div class="clearfix">
				<h2>手机:</h2>
				<asp:TextBox ID="txtPhone" runat="server" class="same tel"></asp:TextBox>
				<p class="error tel-error"></p>
			</div>
			<div class="clearfix">
				<h2>职称:</h2>
				<asp:TextBox ID="txtRank" runat="server" class="same position"></asp:TextBox>
				<p class="error position-error"></p>
			</div>
			<div class="clearfix" style="position:relative;">
				<h2>院系:</h2>
                 <div class="aA" style="width:30px;height:50px;position:absolute;left: 623px;top: 8px;background-color:#E6E6E6;z-index:10;"> <img src="./images/bottom.png" alt="Alternate Text" style="position:absolute;top:23px;" /></div>
				<ul class="down clearfix" style="width:500px;">                                   
                     <li class="select-true" style="position:relative">
                         <asp:Label id="depart" runat="server" Text="请选择院系"></asp:Label>
                         <input type="hidden" id="Selected" runat="server" class="Selected" />
                     </li>
                     <ul class="select-box clearfix">
                         <asp:Repeater ID="rptSelect" runat="server">
                            <ItemTemplate>
                                <li class="select select"><asp:Label ID="lbSelect" runat="server" Text='<%#Eval("department") %>'></asp:Label></li>
                            </ItemTemplate>
                        </asp:Repeater>
					 </ul>				
				</ul>
				<p class="error organization-error"></p>
			</div>
			<span class="cut"></span>
			<div  class="clearfix">
				<h2 class="userType">用户类型: <asp:Label ID="lbType" runat="server"></asp:Label></h2>
                <asp:LinkButton ID="applyJudge" runat="server" Text="申请成为评委>>" OnClick="applyJudge_Click" class="redA"></asp:LinkButton>
			</div>
            <asp:LinkButton ID="lbtnSubmit" runat="server" OnClick="lbtnSubmit_Click" Text="确认修改" class="submit"></asp:LinkButton>
	</div>
    <script type="text/javascript"  src="./js/personal-center-changeInfo.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

