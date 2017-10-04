<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActivitySummaryEditor.aspx.cs" Inherits="BackStage_ActivitySummaryEditor" %>

<!DOCTYPE HTML>
<html>
<head>
<!--_meta 作为公共模版分离出去-->
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

    <script src="jquery-3.2.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>


    <script type="text/javascript">
        $(document).ready(function () {
            //$("#link").css("display", "none");
            //if ($("#checkbox-moban").is(':checked'))
            //    alert("666");
        });
    </script>
<title>活动总结编辑</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form runat="server" class="form form-horizontal">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>活动总结标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<asp:TextBox ID="txtTitle" runat="server" CssClass="input-text"></asp:TextBox>
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章内容：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<textarea id="myEditor11" name="myEditor11" runat="server" onblur="setUeditor()" style="width: 1030px; height: 250px;"></textarea>
                <script type="text/javascript">
                    var editor = new baidu.editor.ui.Editor();
                    editor.render("<%=myEditor11.ClientID%>");
                </script>
                <script type="text/javascript">
                     function setUeditor() {
                     var myEditor11 = document.getElementById("myEditor11");
                     myEditor11.value = editor.getContent();//把得到的值给textarea
                     }
                 </script>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>发布者：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
                <asp:DropDownList runat="server" ID="dropAuthor" CssClass="select">
                    <asp:ListItem Value="0" >本人</asp:ListItem>
                    <asp:ListItem Value="1">匿名</asp:ListItem>
                    <asp:ListItem Value="2">未知</asp:ListItem>
                </asp:DropDownList></span>
				</div>
		</div>

		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <asp:Button ID="btnSub" runat="server" CssClass="btn btn-primary radius" OnClick="btnSub_Click" Text="修改" />
				
			</div>
		</div>

        <div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <asp:FileUpload ID="fup" runat="server" />
                <asp:Label ID="lblInfo" runat="server"></asp:Label>
			</div>
		</div>

        <div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <asp:Button ID="btnFup" runat="server" CssClass="btn btn-primary radius" OnClick="btnFup_Click" Text="修改封面" />
				
			</div>
		</div>
        <script type="text/javascript">
            //判断标题不能为空
            $("#txtTitle").focusout(function () {
                var txtTitle = $("#txtTitle");
                if (txtTitle.val().length == 0) {
                    txtTitle.val("输入不能为空");
                    txtTitle.css("color", "red");
                    $("#btnSub").attr("disabled", true);
                }
                else {
                    txtTitle.css("color", "#333");
                    $("#btnSub").attr("disabled", false);
                }
            });
        </script>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.config.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    
    $(function(){
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });
	
    })
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
