<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="scripts/slick/core/slick.css"/>
<link rel="stylesheet" type="text/css" href="scripts/slick/core/slick-theme.css"/>
<script type="text/javascript" src="scripts/slick/core/slick.min.js"></script>
<style>
.goodshopview{
	width: 800px;
	margin: auto;
}

.find{
	position: relative;
}
.find12{
	width: 50px;
	height: 50px;
	top: -60px;
	left: 30px;
	position: absolute;
	cursor: pointer;
}

.slick_container{
	position: absolute;
	width: 200px;
}
</style>
<script>
$(document).ready(function(){
	
	var sidChk = "<c:out value="${sidcheck}"/>";
	if(sidChk) $("#find1").show();
	else if("${sessionScope.memId}" != "") $("#find2").show();
	
	$("#find1").click(function(){
		var find_dataSid = "<c:out value="${result.dataSid}"/>";
		var find_id = "<c:out value="${sessionScope.memId}"/>";
		var mode = "off";
		
		var xhf = new XMLHttpRequest();
		xhf.onreadystatechange = function(){
			if(xhf.readyState == 4 && xhf.status == 200){
				var res = xhf.responseText;
				if(res > 0){
					$("#find1").fadeOut();
					$("#find2").fadeIn();
				}
			}
		};
		xhf.open("GET", "findToggle.do?dataSid="+find_dataSid+"&id="+find_id+"&mode="+mode, true);
		xhf.send();
	});
	
	$("#find2").click(function(){
		var find_dataSid = "<c:out value="${result.dataSid}"/>";
		var find_id = "<c:out value="${sessionScope.memId}"/>";
		var mode = "on";
		
		var xhf = new XMLHttpRequest();
		xhf.onreadystatechange = function(){
			if(xhf.readyState == 4 && xhf.status == 200){
				var res = xhf.responseText;
				if(res > 0){
					$("#find2").fadeOut();
					$("#find1").fadeIn();
				}
			}
		};
		xhf.open("GET", "findToggle.do?dataSid="+find_dataSid+"&id="+find_id+"&mode="+mode, true);
		xhf.send();
	});
});
</script>
<h3 align=center>${result.dataTitle}</h3>

<!-- 업소 사진 -->
<div class="goodshopview">
<div class="goodshopphotos_container">
	<button class="prev-button">Prev</button>
	<div class="goodshopphotos">
		<img src="/GoodShop/images/photos/${result.dataSid}/${result.dataSid}_01.png" alt="${result.dataTitle}" onerror="this.style.display='none'">
		<img src="/GoodShop/images/photos/${result.dataSid}/${result.dataSid}_02.png" alt="${result.dataTitle}" onerror="this.style.display='none'">
		<img src="/GoodShop/images/photos/${result.dataSid}/${result.dataSid}_03.png" alt="${result.dataTitle}" onerror="this.style.display='none'">
		<img src="/GoodShop/images/photos/${result.dataSid}/${result.dataSid}_04.png" alt="${result.dataTitle}" onerror="this.style.display='none'">
	</div>
	<button class="next-button">Next</button>
</div>

<table width="900" align="center">
	<tr height="50">
		<td width=30%>
			
		</td>
		<td width=70%>
			<table border="1" cellpadding="3">
				<tr>
					<th width=100>업종</th>
					<td>${result.induty}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${result.area} ${result.adres}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${result.telNo}</td>
				</tr>
				<tr>
					<th>주요메뉴</th>
					<td>${result.appnPrdlstPc}</td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td>${result.bsnTime}</td>
				</tr>
				<tr>
					<th>휴무일</th>
					<td>${result.hvofSttus}</td>
				</tr>
				<tr>
					<th>상세정보</th>
					<td>${result.dataContent}</td>
				</tr>
			</table>			
			
			<div class="find">
			<img class="find12" id="find1" src="/GoodShop/images/find/find1.png" style="display:none;">
			<img class="find12" id="find2" src="/GoodShop/images/find/find2.png" style="display:none;">
			</div>
			
			<c:forEach var="sid" items="${dataSidList}">
				<c:if test="${sid ==  result.dataSid}">
					<c:set var="sidcheck" value="true"/>
				</c:if>
			</c:forEach>
			
		</td>
	</tr>
</table>
<td width=30%>
</td>
<div id="shopMap"
	style="width: 600px; border: 1px solid black; height: 400px; margin: 20px auto; display: block;"></div>

<script type="text/javascript"
	src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=d39e0827c7427bab5cc771977e72a51c"></script>

<script type="text/javascript">
	var oPoint = new nhn.api.map.LatLng('${result.posy}', '${result.posx}'); // 위도(posy), 경도(posx)
	nhn.api.map.setDefaultPoint('LatLng');
	oMap = new nhn.api.map.Map('shopMap', {
		point : oPoint,
		zoom : 10,
		enableWheelZoom : true,
		enableDragPan : true,
		enableDblClickZoom : false,
		mapMode : 0,
		activateTrafficMap : false,
		activateBicycleMap : false,
		minMaxLevel : [ 1, 14 ],
		size : new nhn.api.map.Size(900, 400)
	});

	var mapZoom = new nhn.api.map.ZoomControl(); // - 줌 컨트롤 선언
	mapZoom.setPosition({
		left : 40,
		bottom : 40
	}); // - 줌 컨트롤 위치 지정
	oMap.addControl(mapZoom); // - 줌 컨트롤 추가.

	// 여기서부터는 마커에 관한 스크립트이다
	var oSize = new nhn.api.map.Size(28, 37);
	var oOffset = new nhn.api.map.Size(14, 37);
	var oIcon = new nhn.api.map.Icon(
			'http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);

	var oMarker1 = new nhn.api.map.Marker(oIcon, {
		title : '${result.dataTitle}' }); // dataTitle
	
		
		
	oMarker1.setPoint(oPoint);
	oMap.addOverlay(oMarker1);
	var oLabel1 = new nhn.api.map.MarkerLabel();
	oMap.addOverlay(oLabel1);
	oLabel1.setVisible(true, oMarker1);
	
	var oMarker = [];
	var oPoint = [];
	for(var i=0; i< <c:out value="${end}"/>; i++) {
	   oPorint[i] = ['<c:out value="${list[i].posy}"/>', '<c:out value="${list[i].posx}"/>'];
	   oMarker[i] = new nhn.api.map.Marker(oIcon, {
		   title : '${list[i].dataTitle}' });
	   oMarker[i].setPoint(oPorint[i]);
	    
	   oMap.addOverlay(oMarker[i]);
	   oLabel.setVisible(true, oMarker[i]);
	} 
    

	mapTypeChangeButton = new nhn.api.map.MapTypeBtn();
	mapTypeChangeButton.setPosition({bottom:40, right:40});
	oMap.addControl(mapTypeChangeButton);
</script>
</div>
