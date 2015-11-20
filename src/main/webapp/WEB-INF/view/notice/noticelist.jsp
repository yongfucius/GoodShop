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
	font-size:large;
}
.notice_name{
	position: relative;
	margin-left: 20px;
}
.notice_count{
	float: right;
	font-size: small;
	margin-right: 10px;
}

.notice_board{
	width: 750px;
	margin: auto;
	margin-top: 25px;
	border: 1px solid black;
	
}

.notice_board tr{
	height: 30px;
}
.notice_board tr:first-child{
	background-color: black;
	color: white;
}
</style>

<div class="notice">
	<div class="notice_header">
		<div class="notice_name"><b>공지사항</b><br></div>
		<div class="notice_count">총 <b>${count}</b>개의 글이 있습니다. </div>
	</div>

<c:if test="${count == 0}">
	<table class="notice_board">
	<tr>
		<td style="text-align:center;">게시판에 저장된 글이 없습니다. </td>
	</tr>
	</table>
</c:if>

<c:if test="${count > 0}">
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
<c:forEach var="notice" items="${noticeList}">
<tr>
	<td align="center" width="50"><c:out value="${number}" /><c:set var="number" value="${number-1}" /></td>
	<td>
		<a href="noticecontent.do?num=${notice.num}&pageNum=${currentPage}">${notice.subject}</a>
	</td>
	<td>${notice.writer}</td>
	<td>${notice.regdate}</td>
	<td>${notice.readcount}</td>
</tr>
</c:forEach>
</table>
</c:if>

<c:if test="${sessionScope.memId == 'admin'}">
<a href="noticewriteForm.do?pageNum=${currentPage}">글쓰기</a>
</c:if>

<c:if test="${count > 0}">
	<c:set var="pageCount" value="${count/pageSize+(count%pageSize == 0 ? 0 : 1 )}" />
	<c:set var="pageBlock" value="${5}" />
	<fmt:parseNumber var="result" value="${(currentPage-1)/pageBlock}" integerOnly="true" />
	<c:set var="startPage" value="${result*pageBlock+1}" />
	<c:set var="endPage" value="${startPage+pageBlock-1}" />
	<c:if test="${endPage > pageCount}"><c:set var="endPage" value="${pageCount}" /></c:if>
	<c:if test="${startPage > pageBlock}"><a href="list.do?pageNum=${startPage-pageBlock}">이전</a></c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}"><a href="list.do?pageNum=${i}">[${i}]</a></c:forEach>
	<c:if test="${endPage < pageCount}"><a href="list.do?pageNum=${startPage+pageBlock}">다음</a></c:if>
</c:if>
</div>
