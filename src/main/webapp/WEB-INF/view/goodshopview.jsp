<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko" xmlns:v="urn:schemas-microsoft-com:vml">
<link rel="stylesheet" type="text/css"
	href="scripts/slick/core/slick.css" />
<link rel="stylesheet" type="text/css"
	href="scripts/slick/core/slick-theme.css" />
<script type="text/javascript" src="scripts/slick/core/slick.min.js"></script>
<style>
.goodshopview {
	width: 800px;
	margin: auto;
}

.find {
	position: relative;
}

.find12 {
	width: 50px;
	height: 50px;
	top: -60px;
	left: 30px;
	position: absolute;
	cursor: pointer;
}

.slick_container {
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
			<img
				src="/GoodShop/images/photos/${result.dataSid}/${result.dataSid}_01.png"
				alt="${result.dataTitle}" onerror="this.style.display='none'">
			<img
				src="/GoodShop/images/photos/${result.dataSid}/${result.dataSid}_02.png"
				alt="${result.dataTitle}" onerror="this.style.display='none'">
			<img
				src="/GoodShop/images/photos/${result.dataSid}/${result.dataSid}_03.png"
				alt="${result.dataTitle}" onerror="this.style.display='none'">
			<img
				src="/GoodShop/images/photos/${result.dataSid}/${result.dataSid}_04.png"
				alt="${result.dataTitle}" onerror="this.style.display='none'">
		</div>
		<button class="next-button">Next</button>
	</div>

	<table width="900" align="center">
		<tr height="50">
			<td width=30%></td>
			<td width=70%>
				<table border="1" cellpadding="3">
					<tr>
						<th width=100>업종</th>
						<td>${result.induty}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${result.area}${result.adres}</td>
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
					<img class="find12" id="find1"
						src="/GoodShop/images/find/find1.png" style="display: none;">
					<img class="find12" id="find2"
						src="/GoodShop/images/find/find2.png" style="display: none;">
				</div> <c:forEach var="sid" items="${dataSidList}">
					<c:if test="${sid ==  result.dataSid}">
						<c:set var="sidcheck" value="true" />
					</c:if>
				</c:forEach>
			</td>
		</tr>
	</table>

<head>
<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDfJMh25mUQRqsUx1T8uOsaAILoFGcY8A8&sensor=true또는false"></script>
</head>
<body>
<div id="google_map" style="width: 800px; height: 500px;"></div>

<script type="text/javascript">
jQuery(document).ready(
		function() {
			google.maps.event.addDomListener(window, 'load', initialize);

function initialize(){
	if($("#google_map").length) {
                 
		var mapOptions = { //구글 맵 옵션 설정
			zoom : 18, //기본 확대율
			center : new google.maps.LatLng('${result.posy}', '${result.posx}'), // 지도 중앙 위치
			scrollwheel : true, //마우스 휠로 확대 축소 사용 여부
			mapTypeControl : false //맵 타입 컨트롤 사용 여부
		};

		var map = new google.maps.Map(document.getElementById('google_map'), mapOptions); //구글 맵을 사용할 타겟
		
		/* var marker = new google.maps.Marker({ //마커 설정
            map : map,
            position : map.getCenter(), //마커 위치
            title : "<c:out value="${result.dataTitle}"/>"
        }); */
		
		
		/* for(var i=0; i<"<c:out value="${end}"/>"; i++) {
			var company = [];
			company = [	"<c:out value="${list[i].dataTitle}"/>",
			           	"<c:out value="${list[i].posy}"/>",
			           	"<c:out value="${list[i].posx}"/>",
			           	++i ];
		} */
		
		var company = []
		<c:forEach items="${list}" var="shop" varStatus="index">
			company.push([ '${shop.dataTitle}',
			                '${shop.posy}',
			                '${shop.posx}',
			                '${status.index}' ]);
		</c:forEach>
		
		setMarkers(map, company);
	}
		
	function setMarkers(map, locations) {
		for(var i=0; i<locations.length; i++) {
			var image='http://maps.google.com/mapfiles/ms/micons/blue.png';
			var compa = locations[i];
			var myLatLng = new google.maps.LatLng(compa[1], compa[2]);
			var marker = new google.maps.Marker( {
				position: myLatLng, 
				map: map, 
				icon: image, 
				title: compa[0], 
				zIndex: compa[3]
			} );
		}
	}
}

		} );//jQuery-end

</script>
</body>
</html>