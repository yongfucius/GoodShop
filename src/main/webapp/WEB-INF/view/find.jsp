<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.findlist {
	width: 800px;
	margin: 60px auto;
}

.finditem {
	width: 800px;
	height: 130px;
	position: relative;
	margin-top: 30px;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

.photo {
	width: 230px;
	height: 130px;
}
.photo img {
	margin: auto;
}

.desc {
	position: relative;
	top: -120px;
	left: 250px;
	height: 50px;
}
.desc ul {
	list-style-type: none;
}
.desc ul li:nth-child(1) {
	font-weight: bold;
	font-size: 120%;
}
.desc ul li:nth-child(1) a:link, .desc ul li:nth-child(1) a:visited {
	color: black;
	text-decoration: none;
}
.desc ul li:nth-child(1) a:hover {
	text-decoration: underline;
}
.desc ul li:nth-child(2) {
	margin-top: 15px;
	font-size: 12px;
}
.desc ul li:nth-child(3) {
	color: gray;
	font-size: 12px;
}
.desc ul li:nth-child(4) {
	margin-top: 5px;
}

.induty {
	width: 260px;
	height: 130px;
	position: absolute;
	top: 0px;
	left: 540px;
	display: table;
}
.induty_content {
	display: table-cell;
	vertical-align: middle;
}

</style>
<div class="findlist">
	총 <b>${findCount}</b>개의 즐겨찾기가 있습니다.
	<c:forEach items="${list}" var="find">
		<div class="finditem">
	
			<div class="photo">
				<a href="/GoodShop/goodshopview.do?dataSid=${find.dataSid}">
					<img src="/GoodShop/images/photos/${find.dataSid}/${find.dataSid}_01.png" height="130px"></a>
			</div>
			
			<div class="desc">
				<ul>
					<li>
						<a href="/GoodShop/goodshopview.do?dataSid=${find.dataSid}">${find.dataTitle}</a>
					</li>
					<li>${find.adres}</li>
					<li>${find.area}</li>
					<li>${find.telNo}</li>
				</ul>
			</div>
			
			<div class="induty">
				<div class="induty_content">${find.appnPrdlstPc}</div>
			</div>
			
		</div>
	</c:forEach>
</div>