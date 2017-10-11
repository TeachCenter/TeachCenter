<%@ Page Title="" Language="C#" MasterPageFile="~/Display/Person.master" AutoEventWireup="true" CodeFile="MyActivityList.aspx.cs" Inherits="Display_MyActivityList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/personal-center-progect.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    	<div class="right-content">
		<div class="clearfix">
			<h1>我的活动</h1>
			<a href="" class="creat" style="background-color:rgba(0, 0, 0, 0);"></a>
		</div>
        <asp:Repeater ID="rptActivity" runat="server" OnItemCommand="rptActivity_ItemCommand" OnItemDataBound="rptActivity_ItemDataBound">
            <ItemTemplate>
                <span class="cut"></span>
		        <div class="clearfix">
			        <div class="clearfix">
				        <h2><%# Eval("Activity_title") %></h2>
			        </div>
			        <div class="clearfix">
				        <h3>活动日期：<%# Eval("Activity_time") %></h3>
				        <h3>活动地点：<asp:Literal ID="ltDeal" runat="server" Text='<%# Eval("Activity_place") %>'></asp:Literal></h3>
                        <h3><asp:LinkButton ID="lbtDelete" runat="server" CssClass="text-decoration:none" CommandName="Delete" CommandArgument='<%#Eval("Activity_id") %>' OnClientClick="return confirm('确定取消?')" Text='<%# Eval("Activity_id") %>'></asp:LinkButton>
                            </h3>
				        <h3><a href='<%#"ActivityContent.aspx?id="+ Eval("Activity_id") %>'>查看活动详情 >></a></h3>
			        </div>
		       </div>
            </ItemTemplate>
        </asp:Repeater>


	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

