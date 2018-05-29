$(".p-box").click(function (event) {
    if (event.target.nodeName == "A") {
        var flag = confirm("确认下载/跳转？")
        if (!flag) {
            return false;
        }
    }

})