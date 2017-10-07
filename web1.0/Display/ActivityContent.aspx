﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActivityContent.aspx.cs" Inherits="Display_ActivityContent" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="css/init.css">
	<link rel="stylesheet" href="css/intro.css">
	<script type="text/javascript"  src="./js/jquery-3.1.1.min.js"></script>
</head>
<body><form runat="server">
	<div class="container">
		<div class="header">
			<div>
				<div class="enter">
					<div class="center">
						<a class="sign">
							立即注册
						</a>
						<span class="enter-line"></span>
						<a class="log">
							您好，请登陆
						</a>
					</div>					
				</div>
				<div class="goto">
					<div class="center">
						<a href="" class="logo"></a>
						<input value="请输入关键字" type="text" class="search">
						<a href="" class="search-button"></a>
					</div>
				</div>
				<div class="nav">
					<div class="center">
						<a href="">首页</a>
						<a href="">关于</a>
						<a href="">项目</a>
						<a href="">服务</a>
						<a href="">资源</a>
						<a href="">活动</a>
					</div>
				</div>
			</div>
		</div>
		<div class="main">
			<div class="center">
				<div class="brief-intro-box">
					<h1 class="brief-intro"></h1>
					<span class="brief-intro-line"></span>
					<h2 class="publish"></h2>
                    <asp:LinkButton ID="lbtAdd" runat="server" OnClick="lbtAdd_Click" Text="添加活动"></asp:LinkButton>
					<div class="p-box">
						
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="footer-infor-box">
				<p>校址：青岛市崂山区松岭路238号 ·邮编：266100 ·电话：0532-66782193 ·Email：jxdd@ouc.edu.cn </p>
				<p class="Copyright">Copyright © 2004-2008 Ocean University of China. All rights reserved.</p>
			</div>
		</div>
		<div class="mask"></div>
		<div class="log-box-form clearfix">
			<div class="log-box">
				<h1>登陆</h1>
				<input type="text" value="工号" class="number gray-box">
				<p class="number-error error"></p>
				<input type="text" value="密码" class="show-password gray-box">
				<input type="password" class="hide-password gray-box">
				<p class="password-error error"></p>
				<a href="" class="forget-password">忘记密码？</a>
				<a  class="turn-right">立即注册</a>
				<a class="log-submit">立即登录</a>
			</div>
		</div>
		<div  class="sign-box-form clearfix">
			<div class="sign-box">
				<h1>注册</h1>
				<div class="left-box">
					<input type="text" value="姓名" class="name gray-box">
					<p class="name-error error"></p>
					<input type="text" value="密码" class="show-sign-box-password gray-box">
					<input type="password" class="hide-sign-box-password gray-box">
					<p class="sign-box-password-error error"></p>
					<input type="text" value="确认密码" class="show-sign-box-verify-password gray-box">
					<input type="password"  class="hide-sign-box-verify-password gray-box">
					<p class="sign-box-verify-password-error error"></p>
				</div>
				<div class="right-box">
					<input type="text" value="工号" class="sign-box-number gray-box">
					<p class="sign-box-number-error error"></p>
					<input type="text" value="手机" class="sign-box-phone gray-box">
					<p class="sign-box-phone-error error"></p>
					<input type="text" value="电子邮箱" class="email gray-box">
					<p class="email-error error"></p>
				</div>
				<a  class="turn-left">登陆已有账号</a>
				<a class="sign-submit">立即注册</a>
			</div>
		</div>
	</div>
	<script type="text/javascript"  src="./js/pop.js"></script>
	<script>
        $(document).ready(function () {
            var id = window.location.search.substr(4);
            $.ajax({
                url: "./Ajax/ActivityContent_Handler.ashx",
                type: 'POST',
                dataType: "JSON",
                async: true,
                data: { "Activity_id": id },

                success: function (data) {
                    $(".brief-intro").text(data[0].Activity_title)
                    $(".publish").text("发布人：" + data[0].Activity_author + "  发布时间：" + data[0].Activity_time + "  举办地：" + data[0].Activity_place + "  活动人数：" + data[0].Activity_nowcount + "  限制人数：" + data[0].Activity_limitcount + "  浏览次数：" + data[0].Activity_hit);

                    //$("<a>").addClass("add").text("添加活动").appendTo($(".publish"));
                    $(data[0].Activity_content).appendTo($(".p-box"))
                    //$(".add").on("click", function () {
                    //    var id = window.location.search.substr(4);
                    //    console.log(id)
                    //    $.ajax({

                    //        url: "./Ajax/ActivityAdd_Handler.ashx",
                    //        dataType: "JSON",
                    //        async: true,
                    //        type: "POST",
                    //        data: { "Activity_id": id},

                    //        success: function (data) {
                    //            alert(data)

                    //        }


                    //    });

                    //})

                }


            });


        })

		
	</script></form>
</body>
</html>