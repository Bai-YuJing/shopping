/**
 * 弹出一个指定的页面：指明标题，宽，高，地址
 */
function show(t,w,h,url) {
	layer.open( {
		type : 2,
		title : t,
		maxmin : true,
		shadeClose : true, // 点击遮罩关闭层
		area : [ w+'px', h+'px' ],
		content : url
	});
}
/**
 * 关闭当前弹出页面
 */
function close(){
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}
/**
 * 添加或者修改页面块展示/隐藏
 * @param id
 * @param type
 * @return
 */
function change(id,type){
	if(type == 1){
		$("div.change").hide();
		//$("div").not(".change").show("slow");
		//$("#"+id).hide("slow",function(){
			$("#update_"+id).show();
		//});
	}else if(type == 2){
		$("#update_"+id).hide();
		//$("#update_"+id).hide("slow",function(){
		//	$("#"+id).show("slow");
		//});
	}else if(type==3){
		$("div.change").hide();
		//$("div").not(".change").show("slow");
		//$("#"+id).hide("slow",function(){
			$("#insert_"+id).show();
		//});					
	}else{
		$("#insert_"+id).hide();
		//$("#insert_"+id).hide("slow",function(){
		//	$("#"+id).show("slow");
		//});	
		
	}
}


$(document).ready(function () { 
		$("#cart_show").click(function (){
			var h =$("#cart").height();
			if(h > 200){
				$("#cart").css("height","8%");
			}else{
				$("#cart").css("height","100%");
			}
		})
		$("#close").click(function (){
			$("#cart").css("height","8%");
		})		
		


});