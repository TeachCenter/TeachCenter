!(function(doc, win) {
            var docEle = doc.documentElement,//获取html元素
                event = "onorientationchange" in window ? "orientationchange" : "resize",//判断是屏幕旋转还是resize;
                fn = function() {
                    var width = docEle.clientWidth;
                    width && (docEle.style.fontSize = 100  * (width / 750) + "px");//设置html的fontSize，随着event的改变而改变。
                    	
                };
            
            win.addEventListener(event, fn, false);
            doc.addEventListener("DOMContentLoaded", fn, false);
        
        }(document, window));
 $(function(){
            if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
                $(".left-nav img").css({
        "display":"none"
    });
    $(".left-nav ul").css({
        "display":"none"
    });

     $("<div>").addClass('mobileHeader').text('个人中心').appendTo($(".left-nav"))

    $("<a>").addClass('mobileNav').appendTo($(".mobileHeader"))
    $("<ul>").addClass('mobileNavUl').appendTo($(".left-nav"))
    $("<a>").addClass('mobileNavUlLi').text('个人主页').attr("href", "Person-index.aspx").appendTo($(".mobileNavUl"))
    $("<a>").addClass('mobileNavUlLi').text('修改信息').attr("href", "EditInfo.aspx").appendTo($(".mobileNavUl"))
    $("<a>").addClass('mobileNavUlLi').text('项目管理').attr("href", "MyProject.aspx?pageNumber=1").appendTo($(".mobileNavUl"))
    
    $("<a>").addClass('mobileNavUlLi').text('服务管理').attr("href", "MyServiceList.aspx").appendTo($(".mobileNavUl"))
    $("<a>").addClass('mobileNavUlLi').text('活动管理').attr("href", "MyActivityList.aspx").appendTo($(".mobileNavUl"))
     $("<a>").addClass('mobileNavUlLi').text('评审服务').attr("href", "MyJudgePro.aspx?pageNumber=1").appendTo($(".mobileNavUl"))
    
    
 	 $("body").css({
        "font-size": 0.32 + "rem"

    });
 	 $(".right-content h1").css({
        "font-size": 0.32 + "rem"

    });
 	 $(".right-content h2").css({
        "font-size": 0.24 + "rem"

    });
 	 $(".right-content a").css({
        "font-size": 0.24 + "rem"

    });
 	 $(".mobileHeader").css({
        "padding-left":1+"rem"

    });
 	 $(".userType").css({
 	 	"font-size":0.2+"rem"
 	 })
 	 var navFlag =false;
$(".mobileNav").click(function () {
        
        if (navFlag == false) {
            console.log("666")
            navFlag = true;
            $(".mobileNavUl").css({
                "display": "block"
            });
            
        }
        else {
            navFlag = false;
            $(".mobileNavUl").css({
                "display": "none"
            });
        }
    });
  $(".lleft-button").css({
"margin-left":1+"rem"
 	});
      $(".rright-button").css({
"margin-right":1+"rem"
 	});
	$(".clearfix").css({"margin-top":16,"margin-bottom":16,})

$(".submit").css({
 	 	"width":90+"%"
 	 })


   $("body").css({
        "width":7.5+"rem",
        "margin-top":0

    });
   $(".hei").css({
        "height":13+"rem"


    });
   $(".aA").css({
        "left":580


    });
   
    timer = setTimeout(function () {
    	
    $(".left-nav").css({
        "width":100+"%",
        "height":1+"rem"
    });
       $(".right-content").css({
        "width":7.5+"rem"

    });
      $(".right-content h2").css({"width":"auto"}) 
      $("#edui1").css({"left":170}) 
      
   if ($(".progect-content").height() < 1300) {

        $(".progect-content").addClass("hei")
        $(".hei").css({
        "height":13+"rem"


    });
    }
if (0<page < 6) {
	          	    $(".midButtonBox").css({ "width": page * 40 })
	          	    $(".left-button").css({ "margin-left": (520 - 40 * (page + 2)) / 2 })
	          	}
	          	else {
	          	    $(".midButtonBox").css({ "width": 6 * 40 })
	          	    $(".left-button").css({ "margin-left": (520 - 40 * (6 + 2)) / 2 })
	          	}
    }, 400);
            }
			
 	
})