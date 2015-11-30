<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link href="/GoodShop/style/lostpwdstyle.css" rel="stylesheet" type="text/css">
</head>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script>
	$(document).ready(function() {
		if ("<c:out value='${noId}'/>")
			alert("해당하는 아이디가 없습니다. ");
		if ("<c:out value='${noEmail}'/>")
			alert("알맞은 이메일 주소가 아닙니다. ");
	});
</script>
<div class="title">
	<a href="/GoodShop/"><img src="/GoodShop/images/logo.gif"></a>
</div>
<div class="wrapper_table">
	<div class="lostPwd_header"><p>비밀번호 찾기</p></div>
	<div class="lostPwd">
	<form method="post">
			<div class ="form_id">
			<input type="text" id="lostPwd_id" placeholder="아이디" name="lostPwd_id" value="${lostPwd_id}"></div>
			<div clas="lostPwd_email">
			<input type="text" id="lostPwd_id" placeholder="이메일 주소" name="lostPwd_email"></div>
			<div class="form_submit"><input type="submit" value="이메일 보내기" id="submit"/></div>
	</form>
	</div>
</div>