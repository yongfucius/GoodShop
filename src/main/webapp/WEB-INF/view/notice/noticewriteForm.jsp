<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
.notice{
	width: 750px;
	margin: auto;
	position: relative;
	margin-bottom: 100px;
}

.form label{
	font-size: large;
	font-weight: bold;
}
</style>

<script src="scripts/write.js"></script>

<div class=notice>
<form:form commandName="notice" class="form" name="writeform" action="noticewriteForm.do?pageNum=${pageNum}" onsubmit="return writeSave();">
	<form:hidden path="num"/>
	<form:hidden path="writer"/>
	<form:hidden path="id"/>
	<div class="notice_subject">
		<form:label path="subject">제목</form:label>
		<form:input size="40" maxlength="50" path="subject" />
	</div>
	<div class="notice_content">
		<form:textarea path="content"/>
	</div>
	
	<input type="submit" value="글쓰기" />
	<input type="reset" value="다시 작성" />
	<input type="button" value="취소" onclick="window.location.href='list.do?pageNum=${pageNum}'" />
</form:form>
</div>