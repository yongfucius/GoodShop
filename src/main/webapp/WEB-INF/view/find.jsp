<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.goodshoplist{
	width: 650px;
	margin: auto;
}
.goodshoplist img{
	width: 180px;
	height: 100px;
}
.goodshoplist .desc{
	position: relative;
	top: -120px;
	left: 250px;
	height: 50px
}
</style>
<div class="find">
	<c:forEach items="${list}" var="find">
		<img src="/GoodShop/images/photos/${find.dataSid}/${find.dataSid}_01.png">
		<div class="desc">
			${find.dataTitle}<br>
			${find.appnPrdlstPc}<br>
			${find.adres}<br>
			${find.area}<br>
			${find.telNo}<br>
		</div>
	</c:forEach>
</div>