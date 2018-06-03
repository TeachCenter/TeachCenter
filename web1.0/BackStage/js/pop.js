


var time = setTimeout(function () {
    $(".mask").css("height", $(document).height())

    if (document.body.clientHeight >= document.documentElement.clientHeight) {
        $(".log-box-form").css("top", $(document).scrollTop() + (document.documentElement.clientHeight - parseInt($(".log-box-form").css("height"))) / 2)
        $(".sign-box-form").css("top", $(document).scrollTop() + (document.documentElement.clientHeight - parseInt($(".log-box-form").css("height"))) / 2)
    }
    else {
        $(".log-box-form").css("top", $(document).scrollTop() + (document.body.clientHeight - parseInt($(".log-box-form").css("height"))) / 2)
        $(".sign-box-form").css("top", $(document).scrollTop() + (document.body.clientHeight - parseInt($(".log-box-form").css("height"))) / 2)
    }
    $(".mask").css({ "width": $(document).width() })
    $(".leftLine").css({ "width": $(document).width() })

}, 200)
$(window).resize(function () {
    $(".mask").css({ "width": $(document).width() })
    $(".leftLine").css({ "width": $(document).width() })
})
$(window).scroll(function () {
    if (document.body.clientHeight >= document.documentElement.clientHeight) {
        $(".log-box-form").css("top", $(document).scrollTop() + (document.documentElement.clientHeight - parseInt($(".log-box-form").css("height"))) / 2)
        $(".sign-box-form").css("top", $(document).scrollTop() + (document.documentElement.clientHeight - parseInt($(".log-box-form").css("height"))) / 2)
    }
    else {
        $(".log-box-form").css("top", $(document).scrollTop() + (document.body.clientHeight - parseInt($(".log-box-form").css("height"))) / 2)
        $(".sign-box-form").css("top", $(document).scrollTop() + (document.body.clientHeight - parseInt($(".log-box-form").css("height"))) / 2)
    }
})
$(".log").click(function () {
    pop($(".log-box-form"), "left");
})

$(".sign").click(function () {
    pop($(".sign-box-form"), "right");
})
$(".turn-right").click(function () {
    turn($(".log-box-form"), "right", $(".sign-box-form"))
})
$(".turn-left").click(function () {
    turn($(".sign-box-form"), "left", $(".log-box-form"));
})
$(".mask").click(function () {
    shut();
})
$(".shut").click(function () {
    shut();
})
function pop(argument, position) {
    $(".mask").css("display", "block")
    argument.css("left", 50 + "%");
    argument.css("display", "block");
}

function shut() {
    $(".mask").css("display", "none")
    $(".log-box-form").css({ "display": "none", "left": -150 + "%" });
    $(".sign-box-form").css({ "display": "none", "left": 150 + "%" });
    init();

}
function turn(argument, direction, to) {
    if (direction == "right") {
        argument.animate({ "left": -150 + "%" }, 500, function () {
            argument.css("display", "none");
        });
        to.css("display", "block");
        to.animate({ "left": 50 + "%" }, 500)
        init();
    }
    else if (direction == "left") {
        argument.animate({ "left": 150 + "%" }, 500, function () {
            argument.css("display", "none");
        });
        to.css("display", "block");
        to.animate({ "left": 50 + "%" }, 500)
        init();
    }

}
function search() {
    $(".search").on({
        focus: function () {

        },
        blur: function () {

        }
    })
}
$(".search-button").click(function () {
    window.location.href = "Search.aspx?page=1&&key=" + encodeURI($(".search").val());
})
function init() {
    $(".number").val("工号：");
    $(".name").val("姓名：");
    $(".sign-box-number").val("工号：");
    $(".sign-box-phone").val("手机：");
    $(".email").val("电子邮箱：");
    $(".error").text("");
    $(".show-password").css({ "display": "block" });
    $(".show-sign-box-password").css({ "display": "block" });
    $(".show-sign-box-verify-password").css({ "display": "block" });
    $(".hide-password").val("").css({ "display": "none" });
    $(".hide-sign-box-password").val("").css({ "display": "none" });
    $(".hide-sign-box-verify-password").val("").css({ "display": "none" });

}
function log() {
    var reg;
    var flag1 = [false, false];
    $(".number").on({
        focus: function () {
            if ($(".number").val().length == 7) {
                $(".show-password").focus();
            }
            if (!flag1[0]) {
                if ($(".number").val() == "工号：") {
                    $(".number").val("");

                }

                $(".number-error").text("");
            }
        },
        blur: function () {
            reg = /^[A-Za-z0-9]{7,7}$/;
            if (!reg.test($(".number").val())) {
                $(".number-error").text("*账号错误");
                flag1[0] = false;
            }
            else {
                flag1[0] = true;
            }
        }
    })
    $(".show-password").on({
        focus: function () {
            $(".show-password").css({ "display": "none" })
            $(".hide-password").css({ "display": "block" })
            if (!flag1[1]) {
                $(".password-error").text("");
            }
        }
    })
    $(".hide-password").on({
        focus: function () {
            if (!flag1[1]) {
                $(".password-error").text("");
            }
        },
        blur: function () {
            reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[A-Za-z0-9]{5,15}$/;
            if (!reg.test($(".hide-password").val())) {
                $(".password-error").text("*用户名或密码错误");
                flag1[1] = false;
            }
            else {
                flag1[1] = true;
            }
        }
    })

}

function sign() {
    var reg;
    var flag2 = [false, false, false, false, false, false];
    $(".name").on({
        focus: function () {
            if (!flag2[0]) {
                if ($(".name").val() == "姓名：") {
                    $(".name").val("");

                }
                $(".name-error").text("");
            }
        },
        blur: function () {
            reg = /^[\u4e00-\u9fa5]{2,10}$/;
            if (!reg.test($(".name").val())) {
                $(".name-error").text("*请输入正确的姓名");
                flag2[0] = false;
            }
            else {
                flag2[0] = true;
            }
        }
    })
    $(".show-sign-box-password").on({
        focus: function () {
            $(".show-sign-box-password").css({ "display": "none" })
            $(".hide-sign-box-password").css({ "display": "block" })
            if (!flag2[1]) {
                $(".sign-box-password-error").text("");
            }
        }
    })
    $(".hide-sign-box-password").on({
        focus: function () {
            if (!flag2[1]) {
                $(".sign-box-password-error").text("");
            }
        },
        blur: function () {
            reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[A-Za-z0-9]{5,15}$/;
            if (!reg.test($(".hide-sign-box-password").val())) {
                $(".sign-box-password-error").text("*请设置6-16位字母+数字组合为密码");
                flag2[1] = false;
            }
            else if ($(".hide-sign-box-password").val() != $(".hide-sign-box-verify-password").val()) {
                $(".sign-box-verify-password-error").text("*两次输入的密码不一致");
                flag2[2] = false;
            }
            else {
                flag2[1] = true;
            }
        }
    })

    $(".show-sign-box-verify-password").on({
        focus: function () {
            $(".show-sign-box-verify-password").css({ "display": "none" })
            $(".hide-sign-box-verify-password").css({ "display": "block" })
            if (!flag2[2]) {
                $(".sign-box-verify-password-error").text("");
            }
        }
    })
    $(".hide-sign-box-verify-password").on({
        focus: function () {
            if (!flag2[2]) {
                $(".sign-box-verify-password-error").text("");
            }
        },
        blur: function () {
            if ($(".hide-sign-box-password").val() != $(".hide-sign-box-verify-password").val() || $(".hide-sign-box-verify-password").val() == "") {
                $(".sign-box-verify-password-error").text("*两次输入的密码不一致");
                flag2[2] = false;
            }
            else if ($(".show-sign-box-password").css("display") == "inline-block") {
                $(".sign-box-verify-password-error").text("*请输入密码");
                flag2[2] = false;
            }
            else {
                flag2[1] = true;
                flag2[2] = true;
            }
        }
    })

    $(".sign-box-number").on({
        focus: function () {
            if (!flag2[3]) {
                if ($(".sign-box-number").val() == "工号：") {
                    $(".sign-box-number").val("");

                }
                $(".sign-box-number-error").text("");
            }
        },
        blur: function () {
            reg = /^[A-Za-z0-9]{7,7}$/;
            if (!reg.test($(".sign-box-number").val())) {
                $(".sign-box-number-error").text("*请输入正确的工号");
                flag2[3] = false;
            }
            else {
                flag2[3] = true;
            }
        }
    })
    $(".sign-box-phone").on({
        focus: function () {
            if (!flag2[4]) {
                if ($(".sign-box-phone").val() == "手机：") {
                    $(".sign-box-phone").val("");

                }

                $(".sign-box-phone-error").text("");
            }
        },
        blur: function () {
            reg = /^1[34578]\d{9}$/;
            if (!reg.test($(".sign-box-phone").val())) {
                $(".sign-box-phone-error").text("*请输入正确的手机号码");
                flag2[4] = false;
            }
            else {
                flag2[4] = true;
            }
        }
    })
    $(".email").on({
        focus: function () {
            if (!flag2[5]) {
                if ($(".email").val() == "电子邮箱：") {
                    $(".email").val("");

                }
                $(".email-error").text("");
            }
        },
        blur: function () {
            reg = /^\w+([\.\-]\w+)*\@\w+([\.\-]\w+)*\.\w+$/;
            if (!reg.test($(".email").val())) {
                $(".email-error").text("*电子邮箱格式错误");
                flag2[5] = false;
            }
            else {
                flag2[5] = true;
            }
        }
    })



}
search();
var explorer = navigator.userAgent;
var userAgent = navigator.userAgent;
if (window.ActiveXObject || "ActiveXObject" in window || userAgent.indexOf("Edge") > -1) {
    $(".number").on({
        focus: function () {
            if ($(".number").val().length == 7) {
                $(".show-password").focus();
            }

            if ($(".number").val() == "工号：") {
                $(".number").val("");

            }
        }
    })
    $(".show-password").on({
        focus: function () {
            $(".show-password").css({ "display": "none" })
            $(".hide-password").css({ "display": "block" })

        }
    })

    $(".name").on({
        focus: function () {

            if ($(".name").val() == "姓名：") {
                $(".name").val("");

            }
        }
    })
    $(".show-sign-box-password").on({
        focus: function () {
            $(".show-sign-box-password").css({ "display": "none" })
            $(".hide-sign-box-password").css({ "display": "block" })

        }
    })
    $(".show-sign-box-verify-password").on({
        focus: function () {
            $(".show-sign-box-verify-password").css({ "display": "none" })
            $(".hide-sign-box-verify-password").css({ "display": "block" })
        }
    })

    $(".sign-box-number").on({
        focus: function () {

            if ($(".sign-box-number").val() == "工号：") {
                $(".sign-box-number").val("");

            }

        }
    })
    $(".sign-box-phone").on({
        focus: function () {

            if ($(".sign-box-phone").val() == "手机：") {
                $(".sign-box-phone").val("");

            }
        }
    })
    $(".email").on({
        focus: function () {

            if ($(".email").val() == "电子邮箱：") {
                $(".email").val("");
                
            }

        }
    })
}
else {
    log();
    sign();
}



