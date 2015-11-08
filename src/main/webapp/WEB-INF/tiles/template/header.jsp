<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<a href="/GoodShop/">홈페이지 로고</a>
<a href="http://www.goodprice.go.kr">행정자치부 착한가격업소</a>
<p>
<tiles:importAttribute name="menuList" />
<c:forEach var="menu" items="${menuList }">
${menu } 
</c:forEach>