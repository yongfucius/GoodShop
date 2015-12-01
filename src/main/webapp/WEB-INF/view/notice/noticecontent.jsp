<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.notice_content {
	width: 750px;
	margin: 50px auto;
}

.content_board {
	width: 750px;
	margin: 0;
	margin-top: 25px;
	border: 1px solid #D5D5D5;
	border-left: none;
	border-right: none;
	border-collapse: collapse;
}
.content_board tr {
	height: 30px;
}
.content_board th {
	width: 100px;
	background-color: #AFE1FF;
	border-right: 1px solid #D5D5D5;
}
.content_board td {
	margin-left: 100px;
}

.content_button {
    float:right;
    margin-top: 10px;
}
.content_button a {
	color: black;
	text-decoration: none;
	visited: none;
}

.content {
	border-top: 1px solid #D5D5D5;
}

</style>

<div class="notice_content">
	<c:choose>
		<c:when test="${delete == 1}">
			<div class="content_delete">
				<b>삭제되었습니다. </b><br> 3초 뒤에 자동으로 이동합니다. <br>
			</div>
			<meta http-equiv="Refresh" content="3;url=noticelist.do">
		</c:when>
		<c:otherwise>
			
			<table class="content_board">
				<tr>
					<th>제  목</th>
					<td>${notice.subject}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${notice.writer}</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${notice.regdate}</td>
				</tr>
				<tr class="content">
					<th>내 용</th>
					<td>${notice.content}</td>
				</tr>
			</table>

			<div class="content_button">
				<c:if test="${sessionScope.memId == 'admin'}">
					<a href="noticewriteForm.do?num=${notice.num}&pageNum=${pageNum}">&nbsp수정</a>
					<a href="noticedelete.do?num=${notice.num}&pageNum=${pageNum}"
						onclick="return confirm('삭제하시겠습니까?');">&nbsp삭제</a>
				</c:if>
				<a href="noticelist.do?pageNum=${pageNum}">&nbsp목록</a>
			</div>

		</c:otherwise>
	</c:choose>
</div>