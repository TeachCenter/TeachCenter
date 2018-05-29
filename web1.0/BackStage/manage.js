$(document).ready(function () {

    $("#txtSearch").attr("placeholder", " 搜标题");

    $("[id^=txt]").focusout(function () {
         
         
         if ($(this).val().length == 0) {
             $(this).val("输入不能为空");
             $(this).css("color", "red");
             $("#btnSub").attr("disabled", true);
         }
         else {
             $("#btnSub").attr("disabled", false);
         }
    });
    $("[id^=txt]").focus(function () {
         if ($(this).val() == "输入不能为空") {
             $(this).val("");
             $(this).css("color", "#333");
        }
    });

    $("#txtEmail").on({
        /*focus: function () {
            if (!flag2[5]) {
                if ($("#txtEmail").val() == "电子邮箱") {
                    $("#txtEmail").val("");

                }
                $(".email-error").text("");
            }
        },*/
        blur: function () {
            reg = /^\w+([\.\-]\w+)*\@\w+([\.\-]\w+)*\.\w+$/;
            if (!reg.test($("#txtEmail").val())) {
                $("#txtEmail").val("*电子邮箱格式错误");
                //flag2[5] = false;
            }
            else {
                //flag2[5] = true;
            }
        }
    })

});

