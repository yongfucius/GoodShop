<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<style>
.header{
	width: 1000px;
	margin: 0px auto;
	position: relative;
}
.title{
}
.title img{
	height: 70px;
}

.menu{
	width: 1000px;
}
.menu img{
	width: 160px;
}
</style>

<div class="header">
	<div class="title">
		<a href="/GoodShop/"><img src="/GoodShop/images/logo.gif"></a>
		<a href="http://www.goodprice.go.kr">
		<img src="/GoodShop/images/logo_gov.jpg" style="height:50px; position:absolute; margin-left:20px; top:10px;">
		</a>
	</div>
	<tiles:importAttribute name="menuList" />
	<div class="menu">
		<c:forEach var="menu" items="${menuList}" varStatus="status">
			<a href="${menu}"><img src="/GoodShop/images/menu/${status.count}.png"></a>
		</c:forEach>
	</div>
</div>