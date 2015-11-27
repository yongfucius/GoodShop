<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko" xmlns:v="urn:schemas-microsoft-com:vml">
<style>
.goodshopview {
	width: 800px;
	margin: 50px auto;
	padding: 20px;
	background-color: #E0FFFF;
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

h1{
	width: 500px;
	margin: auto;
	text-align: center;
	font-family: "제주명조", serif;
}

.goodshopview a:visited{
	color: blue;
}

.goodshopphotos{
	height: 150px;
	width: 600px;
	margin: 20px auto;
	text-align: center;
}
.goodshopphotos img{
	max-height: 150px;
}
.goodshopphotos_container{
	height: 50px;
	text-align: center;
}
.goodshopphotos_container img{
	max-width: 100%;
	max-height: 100%;
	border: 5px solid transparent;
}

.goodshopdetail{
	width: 500px;
	margin: 20px auto;
	background-color: white;
	border: 1px solid darkslateblue;
}
.goodshopdetail th{
	width: 80px;
}
.goodshopdetail tr, .goodshopdetail td, .goodshopdetail th{
	padding: 10px;
}

.goodshopview p{
	margin-top: 50px;
	font-weight: bold;
	font-size: 120%;
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

<!-- 업소 사진 -->
<div class="goodshopview">
	<h1>${result.dataTitle}</h1>
	<c:choose>
		<c:when test="${empty induty}"><a href="goodshoplist.do?itemlistPage=${itemlistPage}&induty=${result.induty}">처음으로</a></c:when>
		<c:otherwise>
			<c:forEach items="${induty}" var="indutyArray" varStatus="stat">
				<c:set var="moveinduty" value="${stat.first ? '' : moveinduty}&induty=${indutyArray}" />
			</c:forEach>
			<a href="goodshoplist.do?itemlistPage=${itemlistPage}${moveinduty}">목록으로</a>
		</c:otherwise>
	</c:choose>
	<div class="goodshopphotos"></div>
	<div class="goodshopphotos_container">
		<img src="/GoodShop/images/photos/${result.dataSid}/${result.dataSid}_01.png" onerror="this.style.display='none'">
		<img src="/GoodShop/images/photos/${result.dataSid}/${result.dataSid}_02.png" onerror="this.style.display='none'">
		<img src="/GoodShop/images/photos/${result.dataSid}/${result.dataSid}_03.png" onerror="this.style.display='none'">
		<img src="/GoodShop/images/photos/${result.dataSid}/${result.dataSid}_04.png" onerror="$(this).hide()">
	</div>
	<script>
	$(document).ready(function(){
		$(".goodshopphotos").html($(".goodshopphotos_container img:first-child").clone());
		$(".goodshopphotos_container img:first-child").css("border", "5px solid orange");
		$(".goodshopphotos_container img").hover(function(){
			$(".goodshopphotos_container img").css("border", "5px solid transparent");
			$(this).css("border", "5px solid orange");
			$(".goodshopphotos").html($(this).clone().css("border", "none"));
		}, function(){});
	});
	</script>

	<table class="goodshopdetail">
		<tr>
			<th>업종</th>
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
		<img class="find12" id="find1" src="/GoodShop/images/find/find1.png" style="display: none;">
		<img class="find12" id="find2" src="/GoodShop/images/find/find2.png" style="display: none;">
	</div>
	
	<c:forEach var="sid" items="${dataSidList}">
		<c:if test="${sid ==  result.dataSid}">
			<c:set var="sidcheck" value="true" />
		</c:if>
	</c:forEach>
	<p>근처 같은 업종의 다른 착한가격업소</p>
	<div id="google_map" style="width: 800px; height: 500px;"></div>
</div>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDfJMh25mUQRqsUx1T8uOsaAILoFGcY8A8&sensor=true또는false"></script>
<script type="text/javascript">
jQuery(document).ready(function() {
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
});//jQuery-end

</script>
