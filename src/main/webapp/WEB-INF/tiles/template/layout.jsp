<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
<style>
body{
	margin: 0px;
	padding: 0px;
	font-size: 15px;
	font-family: "맑은고딕",tahoma,dotum,sans-serif;
}

hr{
	width: 1005px;
}

#menu_wrap{
	background: transparent url("/GoodShop/images/bg_header.png") repeat-x;
}

#tab_wrap{
	position: absolute;
	top: 216px;
	width: 100%;
	height: 50px;
	margin: 0px;
	background: transparent url("/GoodShop/images/menu/foodtab/bg_tab.png") repeat-x;
}
#foodtab{
	list-style-type: none;
	height: 50px;
	position: absolute;
	right: 50%;
}
#foodtab img{
	float: left;
	height: 50px;
	cursor: pointer;
}
#lodgingshowertab{
	list-style-type: none;
	height: 50px;
	position: absolute;
	left: 59%;
}
#lodgingshowertab img{
	float: left;
	height: 50px;
	cursor: pointer;
}
</style>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script>
$(document).ready(function(){
	var isfoodtab = $("#foodtab").css("display") == "none" ? false : true;
	var islodgingshowertab = $("#lodgingshowertab").css("display") == "none" ? false : true;
	$(".menu a:nth-child(2) img").hover(function(){
		$("#tab_wrap").show();
		$("#foodtab").show();
		$("#foodtab").hover(function(){
			$("#tab_wrap").show();
			$("#foodtab").show();
		}, function(){
			if(!isfoodtab){
				$("#foodtab").hide();
				if(!islodgingshowertab) $("#tab_wrap").hide();
			}
		});
	}, function(){
		if(!isfoodtab){
			$("#foodtab").hide();
			if(!islodgingshowertab) $("#tab_wrap").hide();
		}
	});
	$(".menu a:nth-child(5) img").hover(function(){
		$("#tab_wrap").show();
		$("#lodgingshowertab").show();
		$("#lodgingshowertab").hover(function(){
			$("#tab_wrap").show();
			$("#lodgingshowertab").show();
		}, function(){
			if(!islodgingshowertab){
				$("#lodgingshowertab").hide();
				if(!isfoodtab) $("#tab_wrap").hide();
			}
		});
	}, function(){
		if(!islodgingshowertab){
			$("#lodgingshowertab").hide();
			if(!isfoodtab) $("#tab_wrap").hide();
		}
	});
});
</script>
</head>
<body>
<div id="menu_wrap">
	<tiles:insertAttribute name="header" />
</div>
<div id="tab_wrap" style="display:none;">
	<div id="foodtab" style="display:none;">
		<img src="/GoodShop/images/menu/foodtab/korea.png" onclick="location.href='goodshoplist.do?induty=한식'">
		<img src="/GoodShop/images/menu/foodtab/china.png" onclick="location.href='goodshoplist.do?induty=중식'">
		<img src="/GoodShop/images/menu/foodtab/japan.png" onclick="location.href='goodshoplist.do?induty=일식'">
		<img src="/GoodShop/images/menu/foodtab/west.png" onclick="location.href='goodshoplist.do?induty=경양식'">
	</div>
	<div id="lodgingshowertab" style="display:none;">
		<img src="/GoodShop/images/menu/lodgingshowertab/shower.png" onclick="location.href='goodshoplist.do?induty=목욕업'">
		<img src="/GoodShop/images/menu/lodgingshowertab/lodging.png" onclick="location.href='goodshoplist.do?induty=민박업'">
	</div>
</div>
<c:if test="${induty[0] == '한식' || induty[0] == '중식' || induty[0] == '일식' || induty[0] == '경양식'}"><script>$("#tab_wrap").show();$("#foodtab").show();var isfoodtab = true;</script></c:if>
<c:if test="${induty[0] == '목욕업' || induty[0] == '민박업'}"><script>$("#tab_wrap").show();$("#lodgingshowertab").show();var islodgingshowertab = true;</script></c:if>
<tiles:insertAttribute name="history" />
<tiles:insertAttribute name="body" />
<hr>
<tiles:insertAttribute name="footer" />
<hr>
</body>
</html>