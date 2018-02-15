<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActivityCatagoryManage.aspx.cs" Inherits="BackStage_ActivityCatagoryManage" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
    <script src="jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="manage.js" type="text/javascript"></script>
<style type="text/css">
        #table {
            width:auto;
            margin:0 auto;
        }
        #page{
            width: 200px;
            float: left;
            margin-top: 20px;
            margin-left: 20px;
        }
</style>

<title>活动分类管理</title>
</head>
<body><form id="form1" runat="server">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>活动分类管理<span class="c-gray en">&gt;</span>活动分类管理<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">

	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
        <asp:LinkButton ID="btnDelete" runat="server" OnClick="btnDelete_Click" CssClass="btn btn-danger radius" OnClientClick="return confirm('确定删除?')"><i class="Hui-iconfont">&#xe6e2;</i>批量删除</asp:LinkButton>
        <asp:LinkButton ID="ltbAdd" runat="server" CssClass="btn btn-primary radius" OnClick="ltbAdd_Click" Text="添加分类"></asp:LinkButton></span> 
        <span class="r">共有数据：<strong><asp:Literal ID="ltCount" runat="server"></asp:Literal></strong> 条</span> </div>
	<div class="mt-20">
		<table id="table" class="table table-border table-bordered table-bg table-hover table-responsive">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">序号</th>
					<th width="300">活动分类名称</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody>
                <asp:Repeater ID="rptCategory" runat="server" OnItemDataBound="rptCategory_ItemDataBound" OnItemCommand="rptCategory_ItemCommand">
                    <ItemTemplate>
                        <tr class="text-c">
					        <td><asp:CheckBox  ID="chbCheck" runat="server" /></td>
					        <td><asp:Literal runat="server" ID="ltNumber" Text=""></asp:Literal></td>
                            <td><asp:Literal ID="ltName" runat="server" Text=<%# Eval("ActivityCategory_name") %>></asp:Literal></td>
					        <td class="f-14 td-manage"> 
                              <asp:LinkButton runat="server" CssClass="ml-5" CommandName="Editor" CommandArgument='<%# Eval("ActivityCategory_id") %>'><i class="Hui-iconfont">&#xe6df;</i></asp:LinkButton>
                              <asp:LinkButton runat="server" CssClass="text-decoration:none" CommandName="Delete" CommandArgument='<%#Eval("ActivityCategory_id") %>' OnClientClick="return confirm('确定删除?')"><i class="Hui-iconfont">&#xe6e2;</i></asp:LinkButton>
                            </td>
				        </tr>
                    </ItemTemplate>
                </asp:Repeater>

			</tbody>
		</table>
        				
                <div id="page">
                    <asp:Button ID="btnLast" runat="server" Text="上一页" Enabled="false" OnClick="btnLast_Click" CssClass="btn btn-primary radius" />
                    <asp:Literal ID="ltNow" runat="server" Text="1"></asp:Literal>/
                    <asp:Literal ID="ltTotal" runat="server"></asp:Literal>
				    <asp:Button ID="btnNext" runat="server" Text="下一页" OnClick="btnNext_Click" CssClass="btn btn-primary radius" />
                </div>
	</div>
    <br />
    <br />
    <div id="divAdd" runat="server" visible="false" style="width:500px;margin:0 auto;margin-top:70px">
        
            分类名称:  <asp:TextBox ID="txtCategory"  CssClass="input-text" Width="200" runat="server"></asp:TextBox>
            <asp:Button ID="btnSubAdd" runat="server" OnClick="btnSubAdd_Click"  CssClass="btn btn-primary radius" Text="添加分类" />
    </div>
    <br />
    <br />
    <div id="divEditor" runat="server" visible="false" style="width:500px;margin:0 auto;margin-top:70px">
            <asp:Label ID="lbID" runat="server" Visible="false"></asp:Label>
            分类名称:  <asp:TextBox ID="txtChange" runat="server" CssClass="input-text" Width="200"></asp:TextBox>
            <asp:Button ID="btnChange" runat="server" OnClick="btnChange_Click"  CssClass="btn btn-primary radius" Text="修改分类" />
    </div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

    function del() {
        return confirm('删除分类后改分类的文章也会删除,确认删除?');
    }


</script> </form>
</body>
</html>
