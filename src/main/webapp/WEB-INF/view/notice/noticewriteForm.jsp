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

.notice_subject{
	width: 400px;
	margin: auto;
	margin-top: 20px;
	padding: 10px
}

.notice_content{
	width: 400px;
	margin: auto;
	padding: 10px;
}

.notice_category{
	width: 400px;
	margin: auto;
	padding: 20px;
}

.write_button{
	width: 400px;
	margin: auto;
	padding: 10px
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
			<form:textarea path="content" cols="50" rows="20" maxlength="400" style="resize:none;"/>
		</div>
		<div class="notice_category">
			<form:radiobuttons items="${categories}" path="category"/>
		</div>
		<div class="write_button">
			<c:choose>
				<c:when test="${update == 1}">
					<input type="hidden" name="update" value="1">
					<input type="submit" value="수정" onclick="return confirm('수정하시겠습니까?');"/>
				</c:when>
				<c:otherwise>
					<input type="submit" value="글쓰기" />
				</c:otherwise>
			</c:choose>
			<input type="reset" value="다시 작성" />
			<input type="button" value="취소" onclick="location.href='noticelist.do?pageNum=${pageNum}'" />
		</div>
	</form:form>
</div>