/*$(function(){
	$("#search").autocomplete({
		search: function(){
			$.ajax({
				url: "searchtitle.do?q="+$("#search").val(),
				success: function(d){
					$("#searchTitleRes").html(d);
				}
			});
		}
	})
});*/

function searchTitle(input, event){
	if(input.length > 0){
		if(event.which != 38 && event.which != 40){
			$.ajax({
				url: "searchtitle.do?q="+input,
				success: function(d){
					$("#searchTitleRes").html(d);
					$("#searchTitleRes li").hover(function(){
						$(".selected").removeClass();
						$(this).addClass("selected");
					}, null);
				}
			});
		}
	}
}

function updownRes(event){
	if(event.which == 38){
		if($("#searchTitleRes .selected").length > 0) $("#searchTitleRes .selected").removeClass("selected").prev().addClass("selected");
		else $("#searchTitleRes li:last-child").addClass("selected");
	}
	if(event.which == 40){
		if($("#searchTitleRes .selected").length > 0) $("#searchTitleRes .selected").removeClass("selected").next().addClass("selected");
		else $("#searchTitleRes li:first-child").addClass("selected");
	}
}

function selectedSubmit(form){
	if($("#searchTitleRes .selected").length > 0){
		$("#searchTitleRes .selected")[0].click();
		return false;
	}
	else form.submit();
}