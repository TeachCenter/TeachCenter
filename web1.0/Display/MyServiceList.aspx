<%@ Page Title="" Language="C#" MasterPageFile="~/Display/Person.master" AutoEventWireup="true" CodeFile="MyServiceList.aspx.cs" Inherits="Display_MyServiceList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/personal-center-progect.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    	<div class="right-content">
		<div class="clearfix">
			<h1>我的服务</h1>
			<a href="" class="creat">+新建服务</a>
		</div>
        <asp:Repeater ID="rptService" runat="server" OnItemDataBound="rptService_ItemDataBound">
            <ItemTemplate>
                <span class="cut"></span>
		        <div class="clearfix">
			        <div class="clearfix">
				        <h2><asp:Literal ID="ltCategory" runat="server" Text='<%# Eval("Service_category") %>'></asp:Literal></h2>
			        </div>
			        <div class="clearfix">
				        <h3>申请日期：<%# Eval("Service_time") %></h3>
				        <h3>联系方式：<%# Eval("Service_phone") %></h3>
				        <h3>备注：<%# Eval("Service_remarks") %></h3>
                        <h3>处理状态：<asp:Literal ID="ltDeal" runat="server" Text='<%# Eval("Service_isdeal") %>'></asp:Literal></h3>
			            <h3><asp:LinkButton ID="ltEditor" runat="server" Text='<%# Eval("Service_id") %>' PostBackUrl='<%# "MyServiceEditor.aspx?id="+Eval("Service_id") %>' ></asp:LinkButton></h3>
                    </div>
		        </div>
            </ItemTemplate>
        </asp:Repeater>


	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

