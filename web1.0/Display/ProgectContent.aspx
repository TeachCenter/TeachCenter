<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProgectContent.aspx.cs" Inherits="Display_ProgectContent" MasterPageFile="~/Display/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/progect-pdf.css">
    <link rel="stylesheet" href="css/intro.css">
    
    <script>
        $(document).ready(function () {
            var id = window.location.search.substr(4);
            $("<iframe>").addClass("pdf").attr("src", "pdfJs/generic/web/viewer.html?id=" + id).appendTo($(".brief-intro-box"));
           
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="main">
            <span class="leftLine"></span>
            <div class="center clearfix ">
               
                    <div class="brief-intro-box brief-intro-boxl">

                        <h1 class="brief-intro"></h1>
                        <span class="brief-intro-line"></span>
                        <h2 class="publish"></h2>
                        <div class="p-box">
                            <div class="url-box-box"></div>
                        </div>
                        
                    </div>
                
            </div>
                    <ul class="mobileNavUl"><a class="mobileNavUlLi" href="main-index.aspx">首页</a><a class="mobileNavUlLi" href="Introduction.aspx">关于</a><a class="mobileNavUlLi" href="ProjectList.aspx?pageNumber=1">项目</a><a class="mobileNavUlLi" href="Service.aspx">服务</a><a class="mobileNavUlLi" href="SrcList.aspx?pageNumber=1">资源</a><a class="mobileNavUlLi" href="ActivityList.aspx?type=0&amp;&amp;page=1">活动</a><a id="mobilePerson" runat="server" class="mobileNavUlLi" href="Person-index.aspx">个人中心</a><a id="mobileLogin" runat="server" class="mobileNavUlLi mobileNavUlLiLog">登陆</a></ul>
</div>
    <script type="text/javascript" src="./js/pop.js"></script>
    <script>
        var id = window.location.search.substr(4);

        $.ajax({
            type: "GET",
            url: "./Ajax/ProContentHandler.ashx",
            dataType: "JSON",
            async: false,
            data: { "id": id },

            success: function (data) {
                $(".brief-intro").text(data.title)
                $(".publish").text("发布时间：" + data.publish_time + "  结束时间：" + data.end_time).appendTo($(".brief-intro-boxx"))
                $(data.body).appendTo($(".url-box-box"))

            }


        });
        function KeyDown() {
            if (event.keyCode == 13) {
                event.returnValue = false;
                event.cancel = true;
                Form1.btnsubmit.click();
            }
        }
    </script>
    <script>
        $(document).ready(function () {
            var id = window.location.search.substr(4);
            $("<iframe>").addClass("pdf").attr("src", "pdfJs/generic/web/viewer.html?id=" + id).appendTo($(".content"));
//            $("<iframe>").addClass("pdf").attr("src", "pdfJs/generic/web/viewer.html?id=" + id).insertBefore($(".content"));
        })

    </script>
     <script type="text/javascript"  src="./js/mobile.js"></script>
    </asp:Content>