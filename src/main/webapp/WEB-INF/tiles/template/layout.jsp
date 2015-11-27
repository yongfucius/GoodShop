<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
<style>
body{
	margin: 0px;
	padding: 0px;
	font-size: 12px/1.5;
	font-family: "맑은고딕",tahoma,dotum,sans-serif;
}

hr{
	width: 1005px;
}

#menu_wrap{
	background: transparent url("/GoodShop/images/bg_header.png") repeat-x;
}
</style>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
</head>
<body>
<div id="menu_wrap">
	<tiles:insertAttribute name="header" />
</div>
<tiles:insertAttribute name="body" />
<tiles:insertAttribute name="history" />
<hr>
<tiles:insertAttribute name="footer" />
<hr>
</body>
</html>