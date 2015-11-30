<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link href="/GoodShop/style/lostidstyle.css" rel="stylesheet" type="text/css">
</head>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script>
	$(document).ready(function() {
		if ("<c:out value='${noEmail}'/>")
			alert("해당하는 이메일 주소가 없습니다. ");
	});
</script>
<div class="title">
	<a href="/GoodShop/"><img src="/GoodShop/images/logo.gif"></a>
</div>
<div class="wrapper_table">
	<div class="lostId_header"><p>아이디 찾기</p></div>
	<div class="lostId">
		<form method="post">
			<div class="form_email">
			<input type="text" id="lostId_email" placeholder="이메일주소" name="lostId_email"> </div>
			<div class="form_submit"><input type="submit" value="이메일 보내기" id="submit"/></div>
		</form>
	</div>
</div>