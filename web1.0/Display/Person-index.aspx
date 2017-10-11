<%@ Page Title="" Language="C#" MasterPageFile="~/Display/Person.master" AutoEventWireup="true" CodeFile="Person-index.aspx.cs" Inherits="Display_Person_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/personal-center-index.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="right-content">
		<div class="clearfix">
			<h1>你好，用户名</h1>
		</div>
		
		<div class="clearfix">
			<h2>用户类型：教师</h2>
		</div>
		
		<span class="cut"></span>
		<div class="clearfix">
			<h2>您的个人信息尚未填写完整，</h2>
			<a href="">前去完善个人信息>></a>
		</div>
		
		<span class="cut"></span>
		<div class="clearfix">
			<h2>您的《项目名称项目名称项目名称》第二阶段尚未提交，</h2>
			<a href="">前去提交>></a>
		</div>
		<div class="clearfix">
			<h2>您的<span>32</span>个项目信息等待评审，</h2>
			<a href="">前去评审>></a>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

