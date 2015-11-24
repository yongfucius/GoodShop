<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.history{
	width: 150px;
    height: 550px;
    position: fixed;
    left: 50%;
    top: 200px;
    margin-left: 500px;
}
.history_label{
	height: 30px;
	text-align: center;
}
.history_container{
	height: 400px;
}
.history_list{
    position: relative;
}

.history_item{
	width: 120px;
	margin: auto;
	position: relative;
	height: 80px;
}
.history_item img{
	margin: auto;
}

.history_content{
	position: absolute;
	width: 300px;
	margin: 0px;
	right: 160px;
	top: 65px;
}

.content_txt{
	width: 300px;
	margin: 0px;
	position: absolute;
	border: 1px solid black;
	background-color: white;
}
.history_item img{
	height: 70px;
	margin-top: 5px;
}

.scrollerUp{
	
	height: 30px;
	margin: auto;
	position: relative;
	cursor: pointer;
	background-image: url("images/arrowUp.png");
	background-size: contain;
}
.scrollerDown{
	
	height: 30px;
	margin: auto;
	position: relative;
	cursor: pointer;
	background-image: url("images/arrowDown.png");
	background-size: contain;
}
</style>

<div class="history">
	<div class="history_label">방문 목록</div>
	<div class="scrollerUp" style="width:0px;"></div>
	<div class="history_content"></div>
	<div class="history_container" style="overflow:hidden;">
		<div class="history_list"></div>
	</div>
	<div class="scrollerDown" style="width:0px;"></div>
</div>
<script>
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
			var item = document.createElement("div");
			item.className = "history_item";
			
			var txt = document.createElement("p");
			txt.className = "content_txt";
			txt.style.display = "none";
			txt.style.top = i * 80 +"px";
			txt.innerHTML = historyList[i].dataTitle+"<br><br>"+historyList[i].appnPrdlstPc;
			$(".history_content").append(txt);
			
			var content = "";
			content += "<a href='goodshopview.do?dataSid="+historyList[i].dataSid+"'>";
			content += "<img src='/GoodShop/images/photos/"+historyList[i].dataSid+"/"+historyList[i].dataSid+"_01.png'>";
			content += "</a>";
			item.innerHTML = content;
			$(".history_list").append(item);
		}
		
		switch(historyIndex){
		case 0:
			$(".scrollerUp").css("width", "0px");
			if(historyList.length > 5) $(".scrollerDown").css("width", "60px");
			break;
		case 1:
			$(".scrollerUp").css("width", "60px");
			$(".scrollerDown").css("width", "0px");
			var scrollNum = $(".history_item").length - 5;
			$(".history_list").css("top", -scrollNum * 80 + "px");
			break;
		}
	}else{
		$(".history_list").html("최근 본 업소가 없습니다. ");
	}
	
	historyCookie = encodeURIComponent(JSON.stringify(historyList));
	document.cookie = "historyList="+historyCookie;
	document.cookie = "historyIndex="+historyIndex;
	
	return historyIndex;
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
	
	$(".history_item img").hover(function(){
		var child = $(this).parent().parent().prevAll().length+1;
		$(".history_content .content_txt:nth-child("+child+")").show();
	}, function(){
		var child = $(this).parent().parent().prevAll().length+1;
		$(".history_content .content_txt:nth-child("+child+")").hide();
	});
	
	$(".scrollerDown").click(function(){
		$(".scrollerUp").css("width", "60px");
		$(".scrollerDown").css("width", "0px");
		var scrollNum = $(".history_item").length - 5;
		$(".history_list").finish().animate({
			top: "-="+scrollNum * 80 + "px"
		});
		$(".history_content").finish().animate({
			top: "-="+scrollNum * 80 + "px"
		});
		document.cookie = "historyIndex="+1;
	});
	$(".scrollerUp").click(function(){
		$(".scrollerUp").css("width", "0px");
		$(".scrollerDown").css("width", "60px");
		var scrollNum = $(".history_item").length - 5;
		$(".history_list").finish().animate({
			top: "+="+scrollNum * 80 + "px"
		});
		$(".history_content").finish().animate({
			top: "+="+scrollNum * 80 + "px"
		});
		document.cookie = "historyIndex="+0;
	});
});
</script>