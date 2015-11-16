<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.history{
	width: 150px;
	height: 400px;
	position: fixed;
	left: 50%;
	top: 200px;
	margin-left: 500px;
}
</style>

<div class="history">
	<div class="history_list" id="history_list">
	</div>
</div>
<script>
function makeList(){
	var historyCookie = decodeURIComponent(getCookie("historyList"));
	console.log(historyCookie);
	if(historyCookie == "") var historyList = [];
	else var historyList = JSON.parse(historyCookie);
	
	if(<c:out value='${not empty result.dataSid}'/>){
		var historyDto = {dataSid : "${result.dataSid}", dataTitle : "${result.dataTitle}", appnPrdlstPc : "${result.appnPrdlstPc}"};
		historyList.push(historyDto);
	}
	
	if(historyList.length != 0){
		for(var i = 0; i < historyList.length; i++){
			var item = document.createElement("div");
			item.className = "history_item";
			console.log(item);
			var content = "";
			content += historyList[i].dataTitle+"<br>";
			content += historyList[i].appnPrdlstPc;
			content += "<a href='goodshopview.do?dataSid="+historyList[i].dataSid+"'><img src='/GoodShop/images/photos/"+historyList[i].dataSid+"/"+historyList[i].dataSid+"_01.png'></a>";
			item.innerHTML = content;
			document.getElementById("history_list").appendChild(item);
		}
	}else{
		document.getElementById("history_list").innerHTML = "최근 본 업소가 없습니다. "
	}
	
	historyCookie = encodeURIComponent(JSON.stringify(historyList));
	document.cookie = "historyList="+historyCookie;
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

$(document).ready(makeList);
</script>