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
            <div class="center clearfix ">
                <div class="content">
                    <div class="brief-intro-box" style="height:1350px;">

                        <h1 class="brief-intro"></h1>
                        <span class="brief-intro-line"></span>
                        <h2 class="publish"></h2>
                        <div class="p-box">

                        </div>
                        <div class="url-box" style="position:absolute;top:1220px;left:140px;" ></div>
                    </div>
                </div>
            </div>
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
                $(".publish").text("发布时间：" + data.publish_time + "  结束时间：" + data.end_time).appendTo($(".p-box"))
                $(data.body).appendTo($(".url-box"))

            }


        });
    </script>
    <script>
        $(document).ready(function () {
            var id = window.location.search.substr(4);
            $("<iframe>").addClass("pdf").attr("src", "pdfJs/generic/web/viewer.html?id=" + id).appendTo($(".content"));
        })

    </script>
    </asp:Content>