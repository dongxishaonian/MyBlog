//1个是父级名。
$(function(){
imgscrool('#ban1');
imgscrool('#ban2');
})

function imgscrool(obj){
	var width = $(obj+" .banner .img img").width();
	var i=0;
	var clone=$(obj+" .banner .img li").first().clone();
	$(obj+" .banner .img").append(clone);	
	var size=$(obj+" .banner .img li").size();	
	for(var j=0;j<size-1;j++){
		$(obj+" .banner .num").append("<li></li>");
	}
	$(obj+" .banner .num li").first().addClass("on");
	
	/*鼠标划入圆点*/
	$(obj+" .banner .num li").hover(function(){
		var index=$(this).index();
		i=index;
		$(obj+" .banner .img").stop().animate({left:-index*width},500)	
		$(this).addClass("on").siblings().removeClass("on")		
	})
		
	/*自动轮播*/
	var t=setInterval(function(){
		i++;
		move();
	},2000)
		
	/*对banner定时器的操作*/
	$(obj+" .banner").hover(function(){
		clearInterval(t);
	},function(){
		t=setInterval(function(){
			i++;
			move();
		},2000)
	})
		
	/*向左的按钮*/
	$(obj+" .banner .btn_l").stop(true).delay(800).click(function(){
		i--
		move();	
	})
	
	/*向右的按钮*/
	$(obj+" .banner .btn_r").stop(true).delay(800).click(function(){
		i++
		move()				
	})
		
	function move(){
		
		if(i==size){
			$(obj+" .banner  .img").css({left:0})			
			i=1;
		}
		
		// 修改轮播没屏宽度
		if(i==-1){
			$(obj+" .banner .img").css({left:-(size-1)*width})
			i=size-2;
		}
		
		$(obj+" .banner .img").stop(true).animate({left:-i*width},500)	
		
		if(i==size-1){
			$(obj+" .banner .num li").eq(0).addClass("on").siblings().removeClass("on")	
		}else{		
			$(obj+" .banner .num li").eq(i).addClass("on").siblings().removeClass("on")	
		}
	}	
}	