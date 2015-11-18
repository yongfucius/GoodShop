<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3 align=center>${result.dataTitle}</h3>
<table width="900" align="center">
	<tr height="50">
		<td width=30%>
			<!-- 업소 사진 -->
			<img src="/GoodShop/images/photos/${result.dataSid}/${result.dataSid}_01.png"
			alt="${result.dataTitle}">
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
		</td>
	</tr>
</table>

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

	mapTypeChangeButton = new nhn.api.map.MapTypeBtn();
	mapTypeChangeButton.setPosition({bottom:40, right:40});
	oMap.addControl(mapTypeChangeButton);
</script>
