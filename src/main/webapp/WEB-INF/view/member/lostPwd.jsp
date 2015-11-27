<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link href="/GoodShop/style/lostpwdstyle.css" rel="stylesheet" type="text/css">
</head>
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
			<!-- <div class="form_email">
			<input type="text" id="lostId_email" placeholder="이메일주소" name="lostId_email"> </div>
			<div class="form_submit"><input type="submit" value="이메일 보내기" id="submit"/></div> -->
			<div class ="form_id">
			<input type="text" id="lostPwd_id" placeholder="아이디" name="lostPwd_id" value="${lostPwd_id}"></div>
			<div clas="lostPwd_email">
			<input type="text" id="lostPwd_id" placeholder="이메일 주소" name="lostPwd_email"></div>
			<div class="form_submit"><input type="submit" value="이메일 보내기" id="submit"/></div>
			
		<%-- <label for="lostPwd_id">아이디 </label>
		<input type="text"id="lostPwd_id" name="lostPwd_id" value="${lostPwd_id}"><br>
		<label for="lostPwd_email">이메일 주소</label>
		<input type="text"id="lostPwd_email" name="lostPwd_email"><br> 
		<input type="submit" value="보내기"> --%>
	</form>
	</div>
</div>