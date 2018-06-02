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

   var navFlag = false;
    $(".header").children().css({
        "display": 'none'
    });
    
    $("<div>").addClass('mobileHeader').text('教学支持中心').appendTo($(".header"))
	
    $("<a>").addClass('mobileNav').appendTo($(".mobileHeader"))
    $("<a>").addClass('mobileSearch').attr("href", "Search.aspx").appendTo($(".mobileHeader"))
    $("<ul>").addClass('mobileNavUl').appendTo($(".main"))
    $("<a>").addClass('mobileNavUlLi').text('首页').attr("href", "main-index.aspx").appendTo($(".mobileNavUl"))
    $("<a>").addClass('mobileNavUlLi').text('关于').attr("href", "Introduction.aspx").appendTo($(".mobileNavUl"))
    $("<a>").addClass('mobileNavUlLi').text('项目').attr("href", "ProjectList.aspx?pageNumber=1").appendTo($(".mobileNavUl"))
    
    $("<a>").addClass('mobileNavUlLi').text('服务').attr("href", "Service.aspx").appendTo($(".mobileNavUl"))
    $("<a>").addClass('mobileNavUlLi').text('资源').attr("href", "SrcList.aspx?pageNumber=1").appendTo($(".mobileNavUl"))
     $("<a>").addClass('mobileNavUlLi').text('活动').attr("href", "ActivityList.aspx?type=0&&page=1").appendTo($(".mobileNavUl"))
    
     $("<a>").addClass('mobileNavUlLi').addClass('mobileNavUlLiLog').text('登录').appendTo($(".mobileNavUl"))
   
    $("#mySlide1").css({
        "height": 4.2 + "rem"
    });
    $(".teach").css({
        "width": 90 + "%",
        "height": 6 + "rem",
        "margin-left": 5 + "%"
    });
    $("#mySlide2").css({
        "width": 100 + "%",
        "height": 5.5 + "rem",
        
    });
   
    $(".work").css({
        "width": 90 + "%",
        "height": 6 + "rem",
        "margin-left": 5 + "%"
    });
    $("#mySlide3").css({
        "width": 100 + "%",
        "height": 5.5+ "rem",
    });

    $(".inform").css({
        "width": 90 + "%",
        "height": 5.5 + "rem",
        "margin-left": 5 + "%"
    });
    
    $(".main h1").css({
        "font-size": 0.32 + "rem"

    });
    $(".more").css({
        "font-size": 0.32 + "rem"

    });
    $(".brief-intro").css({
        "font-size": 0.32 + "rem"

    });
   $(".center h1").css({
        "font-size": 0.32 + "rem"

    });
    $(" .p-box p").css({
        "font-size": 0.32 + "rem"

    });
    $(" .p-box pre").css({
        "font-size": 0.32 + "rem"

    });
    
    
    $(".hhh").css({
        "font-size": 0.32 + "rem"

    });
    
   
    $(".submit").css({
        "font-size": 0.32 + "rem",
        "width":90+"%",
        "margin-left":5+"%"

    });
    $(".redA").css({
        "font-size": 0.4 + "rem"

    });
    $(".right-content textarea").css({
        "font-size": 0.24 + "rem"

    });
    $(".right-content span").css({
        "font-size": 0.24 + "rem"

    });
    $(".right-content a").css({
        "font-size": 0.24 + "rem"

    });
     $(".unchangeable h2").css({
        "font-size": 0.24 + "rem",
        "width":110+"px"

    });
     $(".unchangeable input").css({
        "font-size": 0.24 + "rem"

    });
      
     
    $(".changeable h2").css({
        "font-size": 0.24 + "rem",
        "width":110+"px"

    });
    $(".changeable input").css({
        "font-size": 0.24 + "rem"

    });
    $(".changeable textarea").css({
        "font-size": 0.24 + "rem"

    });
    $(".creat").css({
        "font-size": 0.4 + "rem"

    });


    $(".publish").css({
        "font-size": 0.24 + "rem"

    });
    

    
    
    $(".right-content p").css({
        "font-size": 0.32 + "rem"

    });
    $(".creat").css({
        "font-size": 0.32 + "rem"

    });
    $(".add").css({
        "font-size": 0.24 + "rem",
        "top":155+"px",
        "left":600+"px"

    });
    $(".left-content-nav").css({
        "font-size": 0.32 + "rem"

    });
    $(".right-content h1").css({
        "font-size": 0.32 + "rem"

    });
    
    $(".title").css({
        "font-size": 0.32 + "rem"

    });
     
     $(".passage a").css({
        "font-size": 0.24 + "rem",
        "width":1.5+ "rem"

    });  $(".buttons a").css({
        "font-size": 0.24 + "rem"

    }); 
    $("body").css({
        "font-size": 0.32 + "rem"

    });
    $(".footer").css({
        "height":2 + "rem",
        "font-size": 0.24 + "rem"

    });
     $(".left-content").css({
        "width":100+"%",
        "margin-top":0

    });
     $(".left-content-nav").css({
        "background":"#FFFFFF",
        "color":"black",
        "margin-top":0.6 + "rem",
        "margin-bottom":0.48 + "rem"

    });
      $(".right-content").css({
        "width":100+"%"

    });
       $(".right-content h1").css({
        "display":"none"

    });
      $(".title-name").css({
        "display":"none"


    });

     
       $(".hei").css({
        "height":18+"rem"


    });
        $(".brief-intro-box").css({
        "height":"auto"


    });
     
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
   $(".left-content-nav-content-select").css({
        "font-size": 0.24 + "rem",
        "width":(1/($(".left-content-nav-content").length+$(".left-content-nav-content-select").length))*100+"%",
        "float":"left",
        "text-align":"center"

    });
        $(".left-content-nav-content").css({
        "font-size": 0.24 + "rem",
        "width":(1/($(".left-content-nav-content").length+$(".left-content-nav-content-select").length))*100+"%",
        "float":"left",
        "text-align":"center"

    });
        $(".mobileNavUlLiLog").click(function () {
        	navFlag = false;
            $(".mobileNavUl").css({
                "display": "none"
            });
     $(".mask").css({"display":"block",
     	"z-index":"20",
     	"font-size":0.24+"rem",
     	"width":7.5+"rem",
     	"background":"transparent"


 		})
     
     $(".log-box-form").css({"left":50 + "%","z-index":"21"});
    $(".log-box-form").css("display", "block");
	});

    $("body").css("width",7.5+"rem");
    $(".center").css("width",7.5+"rem");
    $("#mySlide1").css("width",7.5+"rem");
     $(".sign-box-form").css({"width":6+"rem",
     	"margin-left":-3+"rem","z-index":"21"
 	});
     $(".sign-box-form input").css({"width":1.8+"rem",
"font-size":0.24+"rem"
 	});
     $(".log-box-form input").css({
"font-size":0.24+"rem"
 	});
     $(".turn-right").css({
"font-size":0.24+"rem"
 	});
      $(".turn-right").click(function(){
      	$(".log-box-form").css({"display":"none"})
      })
       $(".turn-left").click(function(){
      	$(".sign-box-form").css({"display":"none"})
      })
     $(".turn-left").css({
"font-size":0.24+"rem"
 	});
     $(".log-submit").css({
"font-size":0.24+"rem"
 	});
     $(".sign-submit").css({
"font-size":0.24+"rem"
 	});
     $(".sign-submit").css("width",5.4+"rem");
     $(".lleft-button").css({
"margin-left":1+"rem"
 	});
      $(".rright-button").css({
"margin-right":1+"rem"
 	});
      $(".changeable textarea").css({
"width":500
 	});
    

    timer = setTimeout(function () {
    	
    	$(".right-content .passage div").css({
        "width": "auto",
        "height":1.48+"rem",
        "margin-right":32+"px"

    });
    	$(".passage div").css({
        "width": "auto",
        "height":1.48+"rem",
        "margin-right":32+"px"

    });
        $("#mySlide2 img").css({
            "height": 4 + "rem"
        });
        $("#mySlide3 img").css({
            "height": 4 + "rem"
        });
        $("#mySlide2 p").css({
            "font-size": 0.32 + "rem"
        });
        $("#mySlide3 p").css({
            "font-size": 0.32 + "rem"
        });
        $(".p-box").css({
            "width": 6 + "rem"
        });
         $(".search1").css({
            "width": 7.2 + "rem"
        });
        $(".inform li").css({
            "width": 90 + "%"
        });
         $(".passage").css({
        "height":2.9+"rem"


    	});
         $(".passage h2").css({
        "font-size": 0.32 + "rem"

    });
         $(".passage p").css({
        "font-size": 0.24 + "rem"

    });
         $(".passage h3").css({
        "font-size": 0.24 + "rem"

         });
         
        
	$(".left-content-nav-content-select").css({
        "font-size": 0.24 + "rem",
        "width":(1/($(".left-content-nav-content").length+$(".left-content-nav-content-select").length))*100+"%",
        "float":"left",
        "text-align":"center"

    });
        $(".left-content-nav-content").css({
        "font-size": 0.24 + "rem",
        "width":(1/($(".left-content-nav-content").length+$(".left-content-nav-content-select").length))*100+"%",
        "float":"left",
        "text-align":"center"

    });
         if ($(".hei").height() < $(".p-box").height()) {
        $(".hei").css({ "height": $(".p-box").height() + 250 })

	    }
	    if ($(".content").height() < 1800) {

	        $(".passage-content1").addClass("hei")

	    }
	    else {

	    }
	    if ($(".right-content").height() < 1800) {
	        $(".passage-content").addClass("hei")


	    }
	     $(".hei").css({
        "height":16+"rem"


    });
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
       