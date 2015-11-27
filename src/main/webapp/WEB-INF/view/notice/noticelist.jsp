<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.notice{
	width: 750px;
	margin: auto;
	position: relative;
	margin-bottom: 100px;
}
.notice_header{
	text-align: center;
	font-size: 200%;
	margin-top: 30px;
}
.notice_name{
	position: relative;
	margin-left: 20px;
}
.notice_count{
	float: right;
	font-size: small;
}

.notice_board{
	width: 750px;
	margin: 0;
	margin-top: 25px;
	border-top: 1px solid #D5D5D5;
	border-bottom: 1px solid #D5D5D5;
	border-collapse: collapse;
}

.notice_board tr{
	height: 30px;
}
.notice_board tr:first-child{
	background-color: #AFE1FF;
}
.notice_board td{
	border-collapse: collapse;
	border-top: 1px solid #D5D5D5;
}

.notice_board a:link, .notice_board a:visited{
	color: black;
	text-decoration: none;
}

.page_move{
	width: 400px;
	margin: auto;
	margin-top: 30px;
	text-align: center;
}
.page_move a:link, .page_move a:visited{
	color: blue;
	text-decoration: none;
}

</style>

<div class="notice">
	<div class="notice_header">
		<div class="notice_name"><b>공지사항</b><br></div>
		<div class="notice_count">총 <b>${count}</b>개의 글이 있습니다. </div>
	</div>

<table class="notice_board">
<colgroup>
	<col style="width:100px;">
	<col style="width:350px;">
	<col style="width:100px;">
	<col style="width:150px;">
	<col style="width:50px;">
</colgroup>
<tr>
	<th>번 호</th>
	<th>제 목</th>
	<th>작성자</th>
	<th>작성일</th>
	<th>조 회</th>
</tr>
<c:forEach var="important" items="${important}">
<tr>
	<td align="center"><b>공지</b></td>
	<td>
		<a href="noticecontent.do?num=${important.num}&pageNum=${currentPage}"><b>${important.subject}</b></a>
	</td>
	<td>${important.writer}</td>
	<td>${important.regdate}</td>
	<td align="center">${important.readcount}</td>
</tr>
</c:forEach>
<c:if test="${count == 0}">
<tr>
	<td colspan="5" style="text-align:center;">게시판에 저장된 글이 없습니다. </td>
</tr>
</c:if>
<c:if test="${count > 0}">
<c:forEach var="notice" items="${noticeList}">
<tr>
	<td align="center"><c:out value="${number}" /><c:set var="number" value="${number-1}" /></td>
	<td>
		<a href="noticecontent.do?num=${notice.num}&pageNum=${currentPage}">${notice.subject}</a>
	</td>
	<td>${notice.writer}</td>
	<td>${notice.regdate}</td>
	<td align="center">${notice.readcount}</td>
</tr>
</c:forEach>
</c:if>
</table>


<c:if test="${sessionScope.memId == 'admin'}">
	<div class="list_button">
		<a href="noticewriteForm.do?pageNum=${currentPage}">글쓰기</a>
	</div>
</c:if>

<c:if test="${count > 0}">
	<div class="page_move">
		<fmt:parseNumber var="pageCount" value="${count/pageSize+(count%pageSize == 0 ? 0 : 1 )}" integerOnly="true"/>
		<c:set var="pageBlock" value="${5}" />
		<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}" integerOnly="true" />
		<c:set var="startPage" value="${result*pageBlock+1}" />
		<c:set var="endPage" value="${startPage+pageBlock-1}" />
		<c:if test="${endPage > pageCount}"><c:set var="endPage" value="${pageCount}" /></c:if>
		
		<c:if test="${startPage > pageBlock}">
			<a href="list.do?pageNum=1">처음으로</a>
			<a href="list.do?pageNum=${startPage-pageBlock}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<c:choose>
				<c:when test="${i == currentPage}">
					<b>[${i}]</b>
				</c:when>
				<c:otherwise>
					<a href="noticelist.do?pageNum=${i}">[${i}]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${endPage < pageCount}">
			<a href="list.do?pageNum=${startPage+pageBlock}">[다음]</a>
			<a href="list.do?pageNum=${pageCount}">끝으로</a>
		</c:if>
	</div>
</c:if>
</div>
