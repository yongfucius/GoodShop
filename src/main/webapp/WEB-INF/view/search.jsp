<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.search_res{
	width: 700px;
	margin: 50px auto;
}
.res_item img{
	width: 230px;
	height: 130px;
}
.res_item .desc{
	position: relative;
	top: -120px;
	left: 250px;
	height: 50px
}
</style>

<div class="search_res">
	<c:forEach items="${searchRes}" var="res">
		<div class="res_item">
			<a href="/GoodShop/goodshopview.do?dataSid=${res.dataSid}"><img src="/GoodShop/images/photos/${res.dataSid}/${res.dataSid}_01.png"></a>
			<div class="desc">
				${res.dataTitle}<br>
				${res.induty}<br>
				${res.appnPrdlstPc}
			</div>
		</div>
	</c:forEach>
</div>