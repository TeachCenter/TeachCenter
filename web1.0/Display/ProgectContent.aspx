<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProgectContent.aspx.cs" Inherits="Display_ProgectContent" MasterPageFile="~/Display/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/progect-pdf.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="main">
            <div class="center clearfix">
                <div class="content">

                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="./js/pop.js"></script>
    <script>
        $(document).ready(function () {
            $.ajax({

                url: "./Ajax/ProContentHandler.ashx",
                dataType: "JSON",
                type: "POST",
                async: true,
                data: { "Develop_id": id },

                success: function (data) {
                    $(".brief-intro").text(data.Develop_title)
                    $(".publish").text("发布人：" + data.Develop_author + "  发布时间：" + data.Develop_time.substr(0, 10) + " 类型：" + data.Develop_category + "  浏览次数：" + data.Develop_hit);
                    $(data.Develop_content).appendTo($(".p-box"))

                }


            });

        })

    </script>

    <script>
        $(document).ready(function () {
            var id = window.location.search.substr(4);
            $("<iframe>").addClass("pdf").attr("src", "pdfJs/generic/web/viewer.html?id=" + id).appendTo($(".content"));
        })
        
    </script>

>>>>>>> gxyDev
</asp:Content>
