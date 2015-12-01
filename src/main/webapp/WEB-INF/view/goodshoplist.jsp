<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.goodshoplist{
	width: 800px;
	margin: 60px auto;
}

.goodshopitem{
	width: 800px;
	position: relative;
	margin-top: 30px;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

.photo{
	width: 230px;
	height: 130px;
}
.photo img{
	margin: auto;
}

.desc{
	width: 310px;
	position: absolute;
	top: 0px;
	left: 230px;
}
.desc ul{
	list-style-type: none;
}
.desc ul li:nth-child(1){
	font-weight: bold;
	font-size: 120%;
}
.desc ul li:nth-child(1) a:link, .desc ul li:nth-child(1) a:visited{
	color: black;
	text-decoration: none;
}
.desc ul li:nth-child(1) a:hover{
	text-decoration: underline;
}
.desc ul li:nth-child(2){
	margin-top: 15px;
	font-size: 12px;
}
.desc ul li:nth-child(3){
	color: gray;
	font-size: 12px;
}
.desc ul li:nth-child(4){
	margin-top: 5px;
}

.induty{
	width: 260px;
	height: 130px;
	position: absolute;
	top: 0px;
	left: 540px;
	display: table;
}
.induty_content{
	display: table-cell;
	vertical-align: middle;
}

.move{
	width: 450px;
	margin: auto;
	margin-top: 30px;
	text-align: center;
}
.move a:link, .move a:visited{
	color: blue;
	text-decoration: none;
}
</style>
<div class="goodshoplist">
	총 <b>${itemCount}</b>개의 업소가 있습니다.
	<c:forEach items="${induty}" var="indutyArray" varStatus="stat">
		<c:set var="moveinduty" value="${stat.first ? '' : moveinduty}&induty=${indutyArray}" />
	</c:forEach>
	<c:forEach items="${list}" var="goodshop" begin="${(itemlistPage-1)*5}" end="${itemlistPage*5-1}" varStatus="itemIndex">
		<div class="goodshopitem">
			<div class="photo">
				<a href="/GoodShop/goodshopview.do?dataSid=${goodshop.dataSid}&itemlistPage=${itemlistPage}${moveinduty}">
				<img src="/GoodShop/images/photos/${goodshop.dataSid}/${goodshop.dataSid}_01.png" height="130px">
				</a>
			</div>
			<div class="desc">
				<ul>
					<li>
						<a href="/GoodShop/goodshopview.do?dataSid=${goodshop.dataSid}&itemlistPage=${itemlistPage}${moveinduty}">
							${goodshop.dataTitle}
						</a>
					</li>
					<li>${goodshop.adres}</li>
					<li>${goodshop.area}</li>
					<li>${goodshop.telNo}</li>
				</ul>
			</div>
			<div class="induty">
				<div class="induty_content">${goodshop.appnPrdlstPc}</div>
			</div>
		</div>
	</c:forEach>
	<div class="move">
		<fmt:parseNumber var="itemlistCount" value="${itemCount/5+(itemCount%5 == 0 ? 0 : 1 )}" integerOnly="true"/>
		<fmt:parseNumber var="itemlist" value="${(itemlistPage-1)/5}" integerOnly="true" />
		<c:set var="startlist" value="${itemlist*5+1}" />
		<c:set var="endlist" value="${startlist+5-1}" />
		<c:if test="${endlist > itemlistCount}"><c:set var="endlist" value="${itemlistCount}" /></c:if>
		
		<c:if test="${startlist > 5}">
			<a href="goodshoplist.do?itemlistPage=1${moveinduty}">처음으로</a> ...
			<a href="goodshoplist.do?itemlistPage=${startlist-1}${moveinduty}">이전</a>
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
			<a href="goodshoplist.do?itemlistPage=${endlist+1}${moveinduty}">다음</a> ...
			<a href="goodshoplist.do?itemlistPage=${itemlistCount}${moveinduty}">끝으로</a>
		</c:if>
	</div>
</div>