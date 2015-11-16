<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.main{
	width: 700px;
	margin: auto;
}
.main img{
	width: 230px;
	height: 130px;
}
</style>
<div class="main">
	<img src="/GoodShop/images/photos/${id}/${id}_01.png"><br>
	${title}<br>
	${contents}
</div>
