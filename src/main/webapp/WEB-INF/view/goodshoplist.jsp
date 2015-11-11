<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.goodshoplist{
	width: 700px;
	margin: auto;
}
.goodshoplist img{
	width: 230px;
	height: 130px;
}
.goodshoplist .desc{
	position: relative;
	top: -120px;
	left: 250px;
	height: 50px
}
</style>
<div class="goodshoplist">
	<c:forEach items="${list}" var="goodshop">
		<img src="/GoodShop/images/photos/${goodshop.dataSid}/${goodshop.dataSid}_01.png">
		<div class="desc">
			<a href="/GoodShop/goodshopview.do">${goodshop.dataTitle}<br>
			${goodshop.appnPrdlstPc}<br>
			${goodshop.adres}<br>
			${goodshop.area}<br>
			${goodshop.telNo}</a><br>
		</div>
	</c:forEach>
</div>