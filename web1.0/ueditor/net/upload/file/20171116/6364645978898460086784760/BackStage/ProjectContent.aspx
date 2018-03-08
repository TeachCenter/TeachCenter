﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectContent.aspx.cs" Inherits="BackStage_ProjectContent" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<link rel="stylesheet" href="css/init.css">
<link rel="stylesheet" href="css/progect-pdf.css">

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
<title>项目内容</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form runat="server" class="form form-horizontal">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">项目名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
                <asp:Literal ID="lbName" runat="server" ></asp:Literal> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">项目类型：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
                <asp:Literal ID="lbCategory" runat="server" ></asp:Literal> 
			</div>
		</div>
        <div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">提交者：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
                <asp:Literal ID="lbTeacher" runat="server" ></asp:Literal> 
			</div>
		</div>
        <div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">资助额度：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
                <asp:Literal ID="lbFund" runat="server" ></asp:Literal> 
			</div>
		</div>
        <div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">所属阶段：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
                <asp:Literal ID="lbStage" runat="server" ></asp:Literal> 
			</div>
		</div>
        <div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">当前状态：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
                <asp:Literal ID="lbStatus" runat="server" ></asp:Literal> 
			</div>
		</div>
        <div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">项目文件：</label>
            <div id="divPdf" class="formControls col-xs-8 col-sm-9"> 
                <asp:Literal ID="Literal1" runat="server" ></asp:Literal> 
                <input type="hidden" runat="server" id="content_id" />
			</div>
        </div>
        <script>
            $(document).ready(function () {
                var id = window.location.search.substr(4);
                var content_id = $("#content_id").val();
                $("<iframe>").addClass("pdf").attr("src", "pdfJs/generic/web/viewer.html?id=" + content_id).appendTo("#divPdf");
            })       
        </script>
        <div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">项目内容：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
                <asp:Literal ID="lbContent" runat="server" ></asp:Literal> 
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <asp:Button ID="btnDeliver" runat="server" CssClass="btn btn-primary radius" OnClick="btnDeliver_Click" Text="分配评审" Visible="false" style="margin-bottom:15px;" />
                <asp:Button ID="btnJudge" runat="server" CssClass="btn btn-primary radius" OnClick="btnJudge_Click" Text="评判结果" Visible="false" style="margin-bottom:15px;" />			
			</div>
		</div>
        <asp:Panel ID="Judge" runat="server" Visible="false" style="width:1200px;">
            <table class="table table-border table-bordered table-bg table-hover table-responsive">
			    <thead>
				    <tr class="text-c">
					    <th width="25"><input type="checkbox" runat="server" id="isDelete"></th>
					    <th width="300">评委姓名</th>
				    </tr>
			    </thead>
			    <tbody>
                    <asp:Repeater ID="rptJudge" runat="server">
                        <ItemTemplate>
				            <tr class="text-c">
					            <td><input type="checkbox" runat="server" id="isDelete"></td>					
					            <td><%# Eval("name")%><input type="hidden" runat="server" id="id" value=<%# Eval("id")%> /></td>
				            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
			    </tbody>
		    </table>
            <asp:Button ID="btnCheck" runat="server" Text="确认分配" OnClientClick="return confirm('确定将该项目分配给选中的评审?')" OnClick="btnCheck_Click" CssClass="btn btn-primary radius" style="margin-top:15px;"/>
        </asp:Panel>
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
            //判断是否使用外部链接
            //$("#cbxLink").change(function () {
            //    var check = $("#cbxLink");
            //    alert("44");
            //    if (check.is(':checked'))
            //        alert("55");
            //    else
            //        alert("66");
            //});
            
                //
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
	
	//表单验证
	$("#form-article-add").validate({
		rules:{
			articletitle:{
				required:true,
			},
			articletitle2:{
				required:true,
			},
			articlecolumn:{
				required:true,
			},
			articletype:{
				required:true,
			},
			articlesort:{
				required:true,
			},
			keywords:{
				required:true,
			},
			abstract:{
				required:true,
			},
			author:{
				required:true,
			},
			sources:{
				required:true,
			},
			allowcomments:{
				required:true,
			},
			commentdatemin:{
				required:true,
			},
			commentdatemax:{
				required:true,
			},

		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			//$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			//parent.$('.btn-refresh').click();
			parent.layer.close(index);
		}
	});
	
	$list = $("#fileList"),
	$btn = $("#btn-star"),
	state = "pending",
	uploader;

	var uploader = WebUploader.create({
		auto: true,
		swf: 'lib/webuploader/0.1.5/Uploader.swf',
	
		// 文件接收服务端。
		server: 'fileupload.php',
	
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick: '#filePicker',
	
		// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize: false,
		// 只允许选择图片文件。
		accept: {
			title: 'Images',
			extensions: 'gif,jpg,jpeg,bmp,png',
			mimeTypes: 'image/*'
		}
	});
	uploader.on( 'fileQueued', function( file ) {
		var $li = $(
			'<div id="' + file.id + '" class="item">' +
				'<div class="pic-box"><img></div>'+
				'<div class="info">' + file.name + '</div>' +
				'<p class="state">等待上传...</p>'+
			'</div>'
		),
		$img = $li.find('img');
		$list.append( $li );
	
		// 创建缩略图
		// 如果为非图片文件，可以不用调用此方法。
		// thumbnailWidth x thumbnailHeight 为 100 x 100
		uploader.makeThumb( file, function( error, src ) {
			if ( error ) {
				$img.replaceWith('<span>不能预览</span>');
				return;
			}
	
			$img.attr( 'src', src );
		}, thumbnailWidth, thumbnailHeight );
	});
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
		var $li = $( '#'+file.id ),
			$percent = $li.find('.progress-box .sr-only');
	
		// 避免重复创建
		if ( !$percent.length ) {
			$percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
		}
		$li.find(".state").text("上传中");
		$percent.css( 'width', percentage * 100 + '%' );
	});
	
	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file ) {
		$( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
	});
	
	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
		$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
	});
	
	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
		$( '#'+file.id ).find('.progress-box').fadeOut();
	});
	uploader.on('all', function (type) {
        if (type === 'startUpload') {
            state = 'uploading';
        } else if (type === 'stopUpload') {
            state = 'paused';
        } else if (type === 'uploadFinished') {
            state = 'done';
        }

        if (state === 'uploading') {
            $btn.text('暂停上传');
        } else {
            $btn.text('开始上传');
        }
    });

    $btn.on('click', function () {
        if (state === 'uploading') {
            uploader.stop();
        } else {
            uploader.upload();
        }
    });
	
	var ue = UE.getEditor('editor');
	
});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>