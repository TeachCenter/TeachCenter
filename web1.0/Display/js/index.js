(function(window,$){
    $.fn.extend({
        mySlide:function(arr,speed){
			if(arr.length != 0){
				var ele=$(this),myW=parseInt($(this).css("width")),myH=parseInt($(this).css("height")),arrlen=arr.length;
				var html='<span class="back"><img src="images/l.png" alt="img"/></span><div class="sl_content">';
				if(arr[arrlen-1].imgurl!=undefined&&arr[arrlen-1].href!=undefined&&arr[arrlen-1].text!=undefined){
					html += '<a href="' + arr[arrlen - 1].href + '" ><img src="' + arr[arrlen - 1].imgurl + '" alt="img"/></a>';
				}else if(arr[arrlen-1].imgurl!=undefined&&arr[arrlen-1].href!=undefined){
					html += '<a href="' + arr[arrlen - 1].href + '" ><img src="' + arr[arrlen - 1].imgurl + '" alt="img"/></a>';
				}else{
					html += '<a href="javascript:void(0)"  ><img src="' + arr[arrlen - 1].imgurl + '" alt="img"/></a>';
				}
				$.each(arr,function(n,obj){
					if(obj.imgurl!=undefined&&obj.href!=undefined&&obj.text!=undefined&&obj.title!=undefined)
					{
						html += '<a href="' + obj.href + '"  target="_blank"><img src="' + obj.imgurl + '" alt="img"/><div class="summaryBox"><h2>' + obj.title + '</h2><p>' + obj.text + '</p></div></a>';
					}
					else if(obj.imgurl!=undefined&&obj.href!=undefined&&obj.text!=undefined){
						html += '<a href="' + obj.href + '"  target="_blank"><img src="' + obj.imgurl + '" alt="img"/><p>' + obj.text + '</p></a>';
					}else if(obj.imgurl!=undefined&&obj.href!=undefined){
						html += '<a href="' + obj.href + '"  target="_blank"><img src="' + obj.imgurl + '" alt="img"/></a>';
					}else{
						html += '<a href="javascript:void(0)"  target="_blank"><img src="' + obj.imgurl + '" alt="img"/></a>';
					}
				});
				if(arr[0].imgurl!=undefined&&arr[0].href!=undefined&&arr[0].text!=undefined){
					html += '<a href="' + arr[0].href + '"  ><img src="' + arr[0].imgurl + '" alt="img"/><p>' + arr[0].text + '</p></a></div><ul>';
				}else if(arr[0].imgurl!=undefined&&arr[0].href!=undefined){
					html += '<a href="' + arr[0].href + '"  ><img src="' + arr[0].imgurl + '" alt="img"/></a></div><ul>';
				}else{
					html += '<a href="javascript:void(0)"  ><img src="' + arr[0].imgurl + '" alt="img"/></a></div><ul>';
				}
				$.each(arr,function(n,obj){
					html+='<li></li>'
				});
				html+='</ul><span class="prev"><img src="images/r.png" alt="img"/></span>';
				ele.html(html);

				//载入样式
				ele.css({
					"position":"relative",
					"overflow":"hidden"
				});
				ele.find(".sl_content").css({
					"width":myW*(arrlen+2)+"px",
					"height":myH+"px",
					"margin-left":-myW+"px"
				});
				ele.find(".sl_content>a").css({
					"text-decoration":"none",
					"position":"relative",
					"display":"block",
					"float":"left",
					"width":myW+"px",
					"height":myH+"px",
					"cursor":"pointer"
				});
				ele.find(".sl_content img").css({
					"display":"block",
					"width":myW+"px",
					"height":myH+"px"
				});
				ele.find("p").css({
					"position":"absolute",
					"width":"100%",
					"height":"81px",
					"box-sizing":"border-box",
					"margin":"0px",
					"color":"#4D4D4D",
					"z-index":"5",
					"left":"0px",
					"line-height":"30px",
					"padding-top":"17px",
					"padding-bottom":"13px",
					"overflow":"hidden"
				})
				ele.find(".back").css({
					"cursor":"pointer",
					"display":"block",
					"position":"absolute",
					"width":"68px",
					"height":"68px",
					"z-index":"10",
					"left":"22px",
					"top":"156px"
				}).hover(function(){
				   ele.find(".back>img").attr("src", "images/l-hover.png")
				},function(){
					ele.find(".back>img").attr("src", "images/l.png")
				});
				ele.find(".prev").css({
					"cursor":"pointer",
					"display":"block",
					"position":"absolute",
					"width":"68px",
					"height":"68px",
					"z-index":"11",
					"right":"22px",
					"top":"156px"
				}).hover(function(){
				   ele.find(".prev>img").attr("src", "images/r-hover.png")
				},function(){
					ele.find(".prev>img").attr("src", "images/r.png")
				});
				ele.find("span>img").css({
					"position":"absolute",
					"z-index":"10",
					"left":"10px",
					"top":"10px"
				
				});
				ele.find("ul").css({
					"list-style":"none",
					"overflow":"hidden",
					"position":"absolute",
					"padding":"0px",
					"margin":"0px"
				});
				if(arr[0].imgurl!=undefined&&arr[0].href!=undefined&&arr[0].text!=undefined){
					ele.find("ul li").css({
						"list-style":"none",
						"float":"left",
						"width":"80px",
						"height":"5px",
						"background":"rgba(214,0,15,0.2)",
						"text-align":"center",
						"line-height":"18px",
						"font-size":"10px",
						"color":"white",
						"margin":"3.5px",
						"cursor":"pointer"
					});
					ele.find("ul li:eq(0)").css({
						"background":"rgba(214,0,15,1)"
					});
					}
				else if(arr[0].imgurl!=undefined&&arr[0].href!=undefined){
					ele.find("ul li").css({
						"list-style":"none",
						"float":"left",
						"width":"80px",
						"height":"5px",
						"background":"rgba(255,255,255,0.3)",
						"text-align":"center",
						"line-height":"18px",
						"font-size":"10px",
						"color":"white",
						"margin":"24px",
						"cursor":"pointer"
					});
					ele.find("ul li:eq(0)").css({
						"background":"rgba(255,255,255,0.7)"
					});
					}
				
				ele.find("ul").css({
					"left":(myW-parseInt(ele.find("ul").css("width")))/2+"px",
					"bottom":8
				});
				//下面开始定义功能函数
				var timer,myl=-myW;
				start();
				function start(){//开始轮播
					timer=setInterval(function(){
						ele.find(".sl_content").stop().animate({"margin-left":myl+"px"},speed*0.2>600?600:speed*0.2,function(){
							if(myl<=-(myW*(arrlen+1))){
								ele.find(".sl_content").css("margin-left",-myW+"px");
								myl=-myW;
							}
							var tli=(-myl/myW);
							if(tli>=arrlen){
								tli=arrlen;
							}
							if(arr[0].imgurl!=undefined&&arr[0].href!=undefined&&arr[0].text!=undefined){
								ele.find("ul li").css({
								"background":"rgba(214,0,15,0.2)"
								});
								ele.find("ul li:eq("+(tli-1)+")").css({
								   "background":"rgba(214,0,15,1)"
								});
							}
							else if(arr[0].imgurl!=undefined&&arr[0].href!=undefined){
								ele.find("ul li").css({
								"background":"rgba(255,255,255,0.3)"
								});
								ele.find("ul li:eq("+(tli-1)+")").css({
									"background":"rgba(255,255,255,0.7)"
								});
							}
						   
							myl-=myW;
						});
					},speed);
				}
				ele.hover(function(){//悬浮功能
					clearInterval(timer);
					
				},function(){
					start();
				});
				ele.find(".prev").click(function(){//快进
					if(!ele.find(".sl_content").is(":animated"))
					{
						myl=parseInt(ele.find(".sl_content").css("margin-left"));
						if(myl%myW!=0){
							myl=-myW*Math.ceil((-myl)/myW);
						}else{
							myl-=myW;
						}
						ele.find(".sl_content").stop().animate({"margin-left":myl+"px"},speed*0.2>600?600:speed*0.2,function(){
							if(myl<=-(myW*(arrlen+1))){
								ele.find(".sl_content").css("margin-left",-myW+"px");
								myl=-myW;
							}
							var tli=(-myl/myW);
							if(tli>=arrlen){
								tli=arrlen;
							}
							if(arr[0].imgurl!=undefined&&arr[0].href!=undefined&&arr[0].text!=undefined){
								ele.find("ul li").css({
								"background":"rgba(214,0,15,0.2)"
								});
								ele.find("ul li:eq("+(tli-1)+")").css({
								   "background":"rgba(214,0,15,1)"
								});
							}
							else if(arr[0].imgurl!=undefined&&arr[0].href!=undefined){
								ele.find("ul li").css({
								"background":"rgba(255,255,255,0.3)"
								});
								ele.find("ul li:eq("+(tli-1)+")").css({
									"background":"rgba(255,255,255,0.7)"
								});
							}
							myl-=myW;
						});
					}
					
				});
				ele.find(".back").click(function(){//快退
					if(!ele.find(".sl_content").is(":animated"))
					{
						myl=parseInt(ele.find(".sl_content").css("margin-left"));
						if(myl%myW!=0){
							myl=-myW*Math.floor((-myl)/myW);
						}else{
							myl+=myW;
						}
						ele.find(".sl_content").stop().animate({"margin-left":myl+"px"},speed*0.2>600?600:speed*0.2,function(){
							if(myl>=0){
								ele.find(".sl_content").css("margin-left",-(myW*(arrlen))+"px");
								myl=-(myW*(arrlen));
							}
							var tli=(-myl/myW);
							if(tli>=arrlen){
								tli=arrlen;
							}
							if(arr[0].imgurl!=undefined&&arr[0].href!=undefined&&arr[0].text!=undefined){
								ele.find("ul li").css({
								"background":"rgba(214,0,15,0.2)"
								});
								ele.find("ul li:eq("+(tli-1)+")").css({
								   "background":"rgba(214,0,15,1)"
								});
							}
							else if(arr[0].imgurl!=undefined&&arr[0].href!=undefined){
								ele.find("ul li").css({
								"background":"rgba(255,255,255,0.3)"
								});
								ele.find("ul li:eq("+(tli-1)+")").css({
									"background":"rgba(255,255,255,0.7)"
								});
							}
							myl-=myW;
						});
					}
				});
				ele.find("ul li").click(function(){//页码点击事件
					var myP=$(this).index()+1;
					myl=-myP*myW;
					ele.find(".sl_content").stop().animate({"margin-left":myl+"px"},speed*0.2>600?600:speed*0.2,function(){
						var tli=(-myl/myW);
						if(tli>=arrlen){
							tli=arrlen;
						}
					   if(arr[0].imgurl!=undefined&&arr[0].href!=undefined&&arr[0].text!=undefined){
								ele.find("ul li").css({
								"background":"rgba(214,0,15,0.2)"
								});
								ele.find("ul li:eq("+(tli-1)+")").css({
								   "background":"rgba(214,0,15,1)"
								});
							}
							else if(arr[0].imgurl!=undefined&&arr[0].href!=undefined){
								ele.find("ul li").css({
								"background":"rgba(255,255,255,0.3)"
								});
								ele.find("ul li:eq("+(tli-1)+")").css({
									"background":"rgba(255,255,255,0.7)"
								});
							}
						myl-=myW;
					});
				})
			}
		}
    })
})(window,jQuery);