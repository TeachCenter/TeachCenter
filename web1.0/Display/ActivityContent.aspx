<%@ Page Title="" Language="C#" MasterPageFile="~/Display/MasterPage.master" AutoEventWireup="true" CodeFile="ActivityContent.aspx.cs" Inherits="Display_js_ActivityContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="css/intro.css" />
    <link rel="stylesheet" href="css/progect.css" />
    <script type="text/javascript" src="./js/jquery-3.1.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main">
        <span class="leftLine"></span>
        <div class="center">
            <div class="brief-intro-box">
                <h1 class="brief-intro"></h1>
                <span class="brief-intro-line"></span>
                <h2 class="publish"></h2>
                <asp:LinkButton ID="lbtAdd" runat="server" OnClick="lbtAdd_Click" Text="添加活动" Class="add"></asp:LinkButton>
                <div class="p-box">
                </div>
            </div>
        </div>
        <ul class="mobileNavUl"><a class="mobileNavUlLi" href="main-index.aspx">首页</a><a class="mobileNavUlLi" href="Introduction.aspx">关于</a><a class="mobileNavUlLi" href="ProjectList.aspx?pageNumber=1">项目</a><a class="mobileNavUlLi" href="Service.aspx">服务</a><a class="mobileNavUlLi" href="SrcList.aspx?pageNumber=1">资源</a><a class="mobileNavUlLi" href="ActivityList.aspx?type=0&amp;&amp;page=1">活动</a><a id="mobilePerson" runat="server" class="mobileNavUlLi" href="Person-index.aspx">个人中心</a><a id="mobileLogin" runat="server" class="mobileNavUlLi mobileNavUlLiLog">登陆</a></ul>

    </div>

</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
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
                    $(".publish").text("发布人：" + data[0].Activity_author + "  举办时间：" + data[0].Activity_time + "  举办地：" + data[0].Activity_place + "  活动人数：" + data[0].Activity_nowcount + "  限制人数：" + data[0].Activity_limitcount + "  浏览次数：" + data[0].Activity_hit);

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


    </script>
    <script type="text/javascript" src="js/download.js"></script>
</asp:Content>

