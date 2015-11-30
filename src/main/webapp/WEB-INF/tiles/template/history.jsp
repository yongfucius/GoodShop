<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.history{
	width: 150px;
    height: 550px;
    left: 50%;
    margin-left: 500px;
    border: 1px solid #17375E;
    background: white;
}
.history_label{
	height: 50px;
	text-align: center;
	background-image: url("/GoodShop/images/history/historyLabel.png");
	background-size: contain;
}

.history_cnt{
	text-align: center;
}

.history hr{
	width: 150px;
}
.history_container{
	height: 375px;
}
.history_list{
    position: relative;
}

.history_item{
	width: 120px;
	margin: auto;
	position: relative;
	height: 75px;
}
.history_item img{
	height: 65px;
	padding: 2px;
}

.history_content{
	position: absolute;
	width: 300px;
	margin: 0px;
	right: 170px;
	top: 108px;
}
.content_txt{
	width: 300px;
	margin: 0px;
	padding: 10px;
	position: absolute;
	border: 1px solid white;
	background-color: #17375E;
	color: white;
}

.scroller{
	height: 20px;
	margin: 5px auto;
	position: relative;
	cursor: pointer;
	background-size: contain;
	background-repeat: no-repeat;
}
#scrollerUp{
	background-image: url("/GoodShop/images/history/arrowUp.png");
}
#scrollerDown{
	background-image: url("/GoodShop/images/history/arrowDown.png");
}

.history_del_btn{
	width: 150px;
	height: 30px;
	position: absolute;
	bottom: 0px;
	cursor: pointer;
	background-image: url("/GoodShop/images/history/historyDelBtn.png");
}
</style>

<div class="history" style="position:absolute; top:286px;">
	<div class="history_label"></div>
	<div class="history_cnt"></div>
	<div class="scroller" id="scrollerUp" style="width:0px;"></div>
	<div class="history_content"></div>
	<div class="history_container" style="overflow:hidden;">
		<div class="history_list"></div>
	</div>
	<div class="scroller" id="scrollerDown" style="width:0px;"></div>
	<div class="history_del_btn"></div>
</div>
<script>
var itemHeight = 75;

function makeList(){
	var historyCookie = decodeURIComponent(getCookie("historyList"));
	var historyIndexCookie = getCookie("historyIndex");
	if(historyCookie == "") var historyList = [];
	else var historyList = JSON.parse(historyCookie);
	if(historyIndexCookie == "") var historyIndex = 0;
	else var historyIndex = parseInt(historyIndexCookie);
	
	if(<c:out value='${not empty result.dataSid}'/>){
		var historyDto = {dataSid : "${result.dataSid}", dataTitle : "${result.dataTitle}", appnPrdlstPc : "${result.appnPrdlstPc}"};
		var dup = false;
		for(var i in historyList){
			if(historyDto.dataSid == historyList[i].dataSid){
				dup = true;
				var temp = historyList[i];
				historyList.splice(i, 1);
				historyList.unshift(temp);
			}
		}
		if(!dup) historyList.unshift(historyDto);
		if(historyList.length > 10) historyList.pop();
		historyIndex = 0;
	}
	
	if(historyList.length != 0){
		for(var i in historyList){
			$(".history_cnt").html("최근 <b>"+historyList.length+"</b>곳 방문<hr>");
			var item = document.createElement("div");
			item.className = "history_item";
			
			var txt = document.createElement("p");
			txt.className = "content_txt";
			txt.style.display = "none";
			txt.style.top = i * itemHeight +"px";
			txt.innerHTML = "<b>"+historyList[i].dataTitle+"</b>"+"<br><br>"+historyList[i].appnPrdlstPc;
			$(".history_content").append(txt);
			
			var content = "";
			content += "<a href='goodshopview.do?dataSid="+historyList[i].dataSid+"'>";
			content += "<img src='/GoodShop/images/photos/"+historyList[i].dataSid+"/"+historyList[i].dataSid+"_01.png' style='border:3px solid white;'>";
			content += "</a>";
			item.innerHTML += content;
			$(".history_list").append(item);
		}
		
		switch(historyIndex){
		case 0:
			showScrollerDown(historyList.length);
			break;
		case 1:
			showScrollerUp();
			var scrollNum = $(".history_item").length - 5;
			$(".history_list").css("top", -scrollNum * itemHeight + "px");
			$(".history_content").css("top", -scrollNum * itemHeight + 100+"px");
			break;
		}
	}else{
		notatall();
	}
	
	historyCookie = encodeURIComponent(JSON.stringify(historyList));
	document.cookie = "historyList="+historyCookie;
	document.cookie = "historyIndex="+historyIndex;
	
	return historyIndex;
}

function notatall(){
	var item = document.createElement("div");
	item.className = "history_item";
	item.innerHTML = "<br><br><br><br>최근 본 업소가 없습니다. ";
	
	$(".history_cnt").html("");
	$(".history_list").html("");
	$(".history_list").append(item);
}

function showScrollerDown(number){
	$("#scrollerUp").css("width", "0px");
	if(number > 5) $("#scrollerDown").css("width", "40px");
}
function showScrollerUp(){
	$("#scrollerUp").css("width", "40px");
	$("#scrollerDown").css("width", "0px");
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length,c.length);
    }
    return "";
}

$(document).ready(function(){
	var idx = makeList();
	
	$(window).scroll(function(event){
		var scroll = $(window).scrollTop();
		
		if(scroll > 266) $(".history").css("position", "fixed").css("top", "20px");
		else $(".history").css("position", "absolute").css("top", "286px");
	});
	
	$(".history_item img").hover(function(){
		var child = $(this).parent().parent().prevAll().length+1;
		$(".history_content .content_txt:nth-child("+child+")").show();
		$(this).css("border", "3px solid #17375E");
	}, function(){
		var child = $(this).parent().parent().prevAll().length+1;
		$(".history_content .content_txt:nth-child("+child+")").hide();
		$(this).css("border", "3px solid white");
	});
	
	$("#scrollerDown").click(function(){
		showScrollerUp();
		var scrollNum = $(".history_item").length - 5;
		$(".history_list").finish().animate({
			top: "-="+scrollNum * itemHeight + "px"
		});
		$(".history_content").finish().animate({
			top: "-="+scrollNum * itemHeight + "px"
		});
		document.cookie = "historyIndex="+1;
	});
	$("#scrollerUp").click(function(){
		showScrollerDown($(".history_item").length);
		var scrollNum = $(".history_item").length - 5;
		$(".history_list").finish().animate({
			top: "+="+scrollNum * itemHeight + "px"
		});
		$(".history_content").finish().animate({
			top: "+="+scrollNum * itemHeight + "px"
		});
		document.cookie = "historyIndex="+0;
	});
	
	$(".history_del_btn").click(function(){
		document.cookie = "historyList=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
		document.cookie = "historyIndex=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
		notatall();
	});
});
</script>