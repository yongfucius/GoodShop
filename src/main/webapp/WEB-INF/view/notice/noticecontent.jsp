<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.notice_content{
	width: 600px;
	margin: auto;
}
</style>
<div class="notice_content">
	<c:choose>
		<c:when test="${delete == 1}">
			<div class="content_delete">
				<b>삭제되었습니다. </b><br>
				3초 뒤에 자동으로 이동합니다. <br>
			</div>
			<meta http-equiv="Refresh" content="3;url=noticelist.do">
		</c:when>
		<c:otherwise>
			<div class="content_subject">${notice.subject}</div>
			<div class="content_subject">${notice.writer}</div>
			<div class="content_subject">${notice.id}</div>
			<div class="content_subject">${notice.readcount}</div>
			<div class="content_subject">${notice.regdate}</div>
			<div class="content_content">${notice.content}</div>
			<div class="content_button">
				<a href="noticewriteForm.do?num=${notice.num}&pageNum=${pageNum}">수정</a>
				<a href="noticedelete.do?num=${notice.num}&pageNum=${pageNum}" onclick="return confirm('삭제하시겠습니까?');">삭제</a>
				<a href="noticelist.do?pageNum=${pageNum}">목록</a>
			</div>
		</c:otherwise>
	</c:choose>
</div>