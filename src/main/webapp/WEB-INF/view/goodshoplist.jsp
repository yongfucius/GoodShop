<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.goodshoplist{
	width: 800px;
	margin: 50px auto;
}

#foodtab{
	list-style-type: none;
	position: absolute;
	right: 50%;
	margin-right: 500px; 
}
#foodtab li img{
	width: 120px;
	height: 80px;
	margin-top: 15px;
	cursor: pointer;
}

.goodshopitem{
	width: 800px;
	position: relative;
	margin-top: 30px;
}

.photo{
	width: 250px;
	height: 130px;
}
.photo img{
	height: 130px;
	margin: auto;
}

.desc{
	width: 300px;
	position: absolute;
	top: 20px;
	left: 250px;
}
.induty{
	width: 250px;
	position: absolute;
	top: 40px;
	left: 550px;
}

.move{
	width: 400px;
	margin: auto;
	margin-top: 30px;
	text-align: center;
}
.move a:link, .move a:visited{
	text-decoration: none;
}
</style>
<div class="goodshoplist">
	총 ${itemCount}개의 업소가 있습니다. 
	<c:if test="${induty[0] == '한식' || induty[0] == '중식' || induty[0] == '일식' || induty[0] == '경양식'}">
	<ul id="foodtab">
		<li><img src="images/foodtab/한식.png" onclick="location.href='goodshoplist.do?induty=한식'"></li>
		<li><img src="images/foodtab/중식.png" onclick="location.href='goodshoplist.do?induty=중식'"></li>
		<li><img src="images/foodtab/일식.png" onclick="location.href='goodshoplist.do?induty=일식'"></li>
		<li><img src="images/foodtab/경양식.png" onclick="location.href='goodshoplist.do?induty=경양식'"></li>
	</ul>
	</c:if>
	<c:forEach items="${list}" var="goodshop" begin="${(itemlistPage-1)*5}" end="${itemlistPage*5-1}" varStatus="itemIndex">
		<div class="goodshopitem">
			<div class="photo">
				<a href="/GoodShop/goodshopview.do?dataSid=${goodshop.dataSid}">
				<img src="/GoodShop/images/photos/${goodshop.dataSid}/${goodshop.dataSid}_01.png">
				</a>
			</div>
			<div class="desc">
				${goodshop.dataTitle}<br>
				${goodshop.adres}<br>
				${goodshop.area}<br>
				${goodshop.telNo}<br>
			</div>
			<div class="induty">
				${goodshop.appnPrdlstPc}
			</div>
		</div>
	</c:forEach>
	<div class="move">
		<fmt:parseNumber var="itemlistCount" value="${itemCount/5+(itemCount%5 == 0 ? 0 : 1 )}" integerOnly="true"/>
		<fmt:parseNumber var="itemlist" value="${(itemlistPage-1)/5}" integerOnly="true" />
		<c:set var="startlist" value="${itemlist*5+1}" />
		<c:set var="endlist" value="${startlist+5-1}" />
		<c:if test="${endlist > itemlistCount}"><c:set var="endlist" value="${itemlistCount}" /></c:if>
		<c:forEach items="${induty}" var="indutyArray" varStatus="stat">
			<c:set var="moveinduty" value="${stat.first ? '' : moveinduty}&induty=${indutyArray}" />
		</c:forEach>
		
		<c:if test="${startlist > 5}">
			<a href="goodshoplist.do?itemlistPage=1${moveinduty}">처음으로</a>
			<a href="goodshoplist.do?itemlistPage=${endlist-5}${moveinduty}">이전</a>
		</c:if>
		<c:forEach var="i" begin="${startlist}" end="${endlist}" step="1">
			|<c:choose>
				<c:when test="${i == itemlistPage}">
					<b>${i}</b>
				</c:when>
				<c:otherwise>
					<a href="goodshoplist.do?itemlistPage=${i}${moveinduty}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>|
		<c:if test="${endlist < itemlistCount}">
			<a href="goodshoplist.do?itemlistPage=${startlist+5}${moveinduty}">다음</a>
			<a href="goodshoplist.do?itemlistPage=${itemlistCount}${moveinduty}">끝으로</a>
		</c:if>
	</div>
</div>