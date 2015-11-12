<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<table width="800" border="1" cellspacing="0" cellpadding="0">
	<tr height="50">
		<td width=30%>
			<!-- 업소 사진 -->
		</td>
		<td width=70%>
			<table>
				<tr>
					<th>업종</th>
					<td>${goodshop.induty}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${goodshop.area} ${goodshop.adres}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${goodshop.telNo}</td>
				</tr>
				<tr>
					<th>주요메뉴</th>
					<td>${goodshop.appnPrdlstPc}</td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td>${goodshop.bsnTime}</td>
				</tr>
				<tr>
					<th>휴무일</th>
					<td>${goodshop.hvofSttus}</td>
				</tr>
				<tr>
					<th>상세정보</th>
					<td>${goodshop.dataContent}</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<div id="shopMap" style="width: 600px; border: 1px solid black; height: 400px; margin: 20px auto; display: block;"></div>

<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=8c7ebb60a16a2b605a0ef322e6bc60c4">

	// 지도 위치 관련 스크립트                                                                                                                       
	var oPoint = new nhn.api.map.LatLng('${goodshop.posx}', '${goodshop.posy}'); // 위도, 경도 값
	nhn.api.map.setDefaultPoint('LatLng');
	oMap = new nhn.api.map.Map('myMap', {
		point : oPoint,
		zoom : 10, // 초기 줌 레벨 1~10
		enableWheelZoom : true,
		enableDragPan : true,
		enableDblClickZoom : false,
		mapMode : 0,
		activateTrafficMap : false,
		activateBicycleMap : false,
		minMaxLevel : [ 1, 14 ],
		size : new nhn.api.map.Size(600, 400) // 보여지는 지도의 사이즈
	});

	var mapZoom = new nhn.api.map.ZoomControl(); // 줌 컨트롤 선언
	mapZoom.setPosition({
		left : 80,
		bottom : 40
	}); // 줌 컨트롤 위치 지정
	oMap.addControl(mapZoom); // 줌 컨트롤 추가

	// 마커 관련 스크립트
	var oSize = new nhn.api.map.Size(28, 37);
	var oOffset = new nhn.api.map.Size(14, 37);
	var oIcon = new nhn.api.map.Icon(
			'http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);
	var oMarker1 = new nhn.api.map.Marker(oIcon, {
		title : '${goodshop.dataTitle}'
	}); // 마커 위치, 상단 문구
	oMarker1.setPoint(oPoint);
	oMap.addOverlay(oMarker1);
	var oLabel1 = new nhn.api.map.MarkerLabel();
	oMap.addOverlay(oLabel1);
	oLabel1.setVisible(true, oMarker1);
</script>