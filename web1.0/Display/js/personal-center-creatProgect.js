var w=$(window).width();
$(".name").css({"width":w-520})
$(".content").css({"width":w-520})
$(".submit").css({"width":w-344})
$(window).resize(function(){
	 w=$(window).width();2
	$(".name").css({"width":w-520})
	$(".content").css({"width":w-520})
	$(".submit").css({"width":w-344})
})

function log(){
	var reg;
	var flag=[false,false,false,false,false,false,false,false,false];
	var flagUpDown=false;
	$(".name").on({
		focus:function(){
			if(!flag[0]){
				if($(".name").val()=="项目名称")
			    {
			    	 $(".name").val("");

			    }
		    $(".name-error").text("");
			}
		},
		blur:function(){
		   if($(".name").val()==""){
		    $(".name-error").text("未填写项目名称");
		    flag[0]=false;
		   }
		   else{
		   	flag[0]=true;
		   }
		}
	})
	$(".duty").on({
		focus:function(){
			if(!flag[2]){
				if($(".duty").val()=="小明")
			    {
			    	 $(".duty").val("");

			    }
		    $(".duty-error").text("");
			}
		},
		blur:function(){
		    reg=/^[\u4e00-\u9fa5]{2,20}$/;
		   if(!reg.test($(".duty").val())){
		    $(".duty-error").text("请输入正确的负责人姓名");
		    flag[2]=false;
		   }
		   else{
		   	flag[2]=true;
		   }
		}
	})
	$(".down").click(function(){
		if((!$(this).is(':animated')))
		{
			if(flagUpDown==false)
		{
			$(this).animate({"height":200},400)
		 		flagUpDown=true;
			}
			else
			{
				$(this).animate({"height":50},400)
			 	flagUpDown=false;
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
	$(".select").hover(
        function() {
            $(this).css("background", '#FFFFFF');
        },
        function() {
            $(this).css("background", '#E6E6E6');
        }
    );
    $(".select1").click(function() {
		var this_=$(this);
	$(".select-true1").text(this_.text())
	flag[1]=true;
	})
	$(".select2").click(function() {
		var this_=$(this);
	$(".select-true2").text(this_.text())
	flag[3]=true;
	})
	$(".year").on({
		focus:function(){
			if(!flag[4]){
				if($(".year").val()=="1900")
			    {
			    	 $(".year").val("");

			    }
		    $(".year-error").text("");
			}
		},
		blur:function(){
		   reg=/^20[0-9][0-9]$/;
		   if(!reg.test($(".year").val())){
		    $(".year-error").text("请输入正确的年/月/日");
		    flag[4]=false;
		   }
		   else{
		   	flag[4]=true;
		   }
		}
	})
	$(".month").on({
		focus:function(){
			
		},
		blur:function(){
		   reg=/^1[0-2]$/;
		   var reg2=/^[1-9]$/
		   if(!reg.test($(".month").val())&&!reg2.test($(".month").val())){
		    $(".year-error").text("请输入正确的年/月/日");
		    flag[5]=false;
		   }
		   else{
		   	flag[5]=true;
		   }
		}
	})
	$(".day").on({
		focus:function(){
			
		},
		blur:function(){
		   reg=/^[1-2][0-9]$/;
		   var reg2=/^[1-9]$/;
		   var reg3=/^3[0-1]$/;
		   if(!reg.test($(".day").val())&&!reg2.test($(".day").val())&&!reg3.test($(".day").val())){
		    $(".year-error").text("请输入正确的年/月/日");
		    flag[6]=false;
		   }
		   else{
		   	flag[6]=true;
		   }
		}
	})
	$(".money").on({
		focus:function(){
			if(!flag[7]){
				if($(".money").val()=="1000")
			    {
			    	 $(".money").val("");

			    }
		    $(".money-error").text("");
			}
		},
		blur:function(){
		   reg=/^[0-9]*$/;
		   if(!reg.test($(".money").val())){
		    $(".money-error").text("请输入正确的项目资金");
		    flag[7]=false;
		   }
		   else{
		   	flag[7]=true;
		   }
		}
	})


	
}
log();

function Check_FilePath() {
    var FilePath = document.getElementById("FileUp");
    var FileNewName = document.getElementById("txtFileName");
    FileNewName.value = FilePath.value;
}