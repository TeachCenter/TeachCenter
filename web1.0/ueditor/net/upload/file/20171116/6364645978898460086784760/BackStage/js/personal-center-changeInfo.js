
function log(){
	var reg;
	var flag=[false,false,false,false,false,false,false];
	var flagUpDown=false;
	$(".name").on({
		focus:function(){
			if(!flag[0]){
				if($(this).val()=="王小明"){
	    		$(this).val("")
			}
		    $(".name-error").text("");
			}
		},
		blur:function(){
		   reg=/^[\u4e00-\u9fa5]{2,10}$/;
		   if(!reg.test($(".name").val())){
		    $(".name-error").text("请填写正确的姓名");
		    flag[0]=false;
		   }
		   else{
		   	flag[0]=true;
		   }
		}
	})
	$(".male").click(function() {
	$(this).css({"background-color":"#FFFFFF"})
	$(".female").css({"background-color":"#E6E6E6"})
	flag[1]=true;
	})
	$(".female").click(function() {
	$(this).css({"background-color":"#FFFFFF"})
	$(".male").css({"background-color":"#E6E6E6"})
	flag[1]=true;

	})
	$(".num").on({
		focus:function(){
			if(!flag[2]){
				if($(this).val()=="156489"){
		    		$(this).val("")
				}
		    $(".num-error").text("");
			}
		},
		blur:function(){
		   reg=/^[A-Za-z0-9]{7,7}$/;
		   if(!reg.test($(".num").val())){
		    $(".num-error").text("请输入正确的工号");
		    flag[2]=false;
		   }
		   else{
		   	flag[2]=true;
		   }
		}
	})
	$(".email").on({
		focus:function(){
			if(!flag[3]){
				if($(this).val()=="sfhaui@ouc.edu.cn"){
		    		$(this).val("")
				}
		    $(".email-error").text("");
			}
		},
		blur:function(){
		    reg=/^\w+([\.\-]\w+)*\@\w+([\.\-]\w+)*\.\w+$/;
		   if(!reg.test($(".email").val())){
		    $(".email-error").text("请输入正确的邮箱地址");
		    flag[3]=false;
		   }
		   else{
		   	flag[3]=true;
		   }
		}
	})
	$(".tel").on({
		focus:function(){
			if(!flag[4]){
				if($(this).val()=="18000000000"){
		    		$(this).val("")
				}
		    $(".tel-error").text("");
			}
		},
		blur:function(){
		  reg=/^1[34578]\d{9}$/;
		   if(!reg.test($(".tel").val())){
		    $(".tel-error").text("请输入正确的手机号码");
		    flag[4]=false;
		   }
		   else{
		   	flag[4]=true;
		   }
		}
	})
	$(".position").on({
		focus:function(){
			if(!flag[5]){
		    if($(this).val()=="副教授"){
		    $(this).val("")
			}
			$(".position-error").text("");
			}
		},
		blur:function(){
		  reg=/^[\u4e00-\u9fa5]{2,10}$/;
		   if(!reg.test($(".position").val())){
		    $(".position-error").text("请输入正确的职称");
		    flag[5]=false;
		   }
		   else{
		   	flag[5]=true;
		   }
		}
	})
	
	$(".select").hover(
        function() {
            $(this).css("background", '#FFFFFF');
        },
        function() {
            $(this).css("background", '#E6E6E6');
        }
    );
	$(".select").click(function() {
		var this_=$(this);
	$(".select-true").text(this_.text())
	flag[6]=true;
	})
	$(".submit").click(function(){
	if(flag[0]==true&&flag[1]==true&&flag[2]==true&&flag[3]==true&&flag[4]==true&&flag[5]==true&&flag[6]==true)
	{
	} 
	else{
		for(i=0;i<7;i++){
			console.log(flag[i])
		}
		alert("登录失败")
	}
	});
	$("form").submit(function () {
	    if (flag[0]==true&&flag[1]==true&&flag[2]==true&&flag[3]==true&&flag[4]==true&&flag[5]==true&&flag[6]==true)
	    {
	        return true;
	    }
	    else {
	        return false;
	    }
	});
}
log();