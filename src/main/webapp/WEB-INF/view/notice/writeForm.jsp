<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%-- <%@ include file="../style/color.jspf" %> --%>
<link href="../style/style.css" rel="stylesheet" type="text/css">
<script src="scripts/script.js"></script>
<center><b>글쓰기</b><br>
<form:form name="writeform" action="writeForm.do?pageNum=${pageNum}" onsubmit="return writeSave()">
<form:hidden path="num" />
<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
<tr>
	<td align="right" colspan="2" bgcolor="${value_c}"><a href="list.do">목록</a></td>
</tr>
<tr>
	<td width="70" bgcolor="${value_c}" align="center">이 름</td>
	<td width="330"><form:input size="10" maxlength="10" path="writer" /></td>
</tr>
<tr>
	<td width="70" bgcolor="${value_c}" align="center">제 목</td>
	<td width="330"><form:input size="40" maxlength="50" path="subject" /></td>
</tr>
<tr>
	<td width="70" bgcolor="${value_c}" align="center">내 용</td>
	<td width="330"><form:textarea path="content" rows="13" cols="40" /></td>
</tr>
<tr>
	<td colspan="2" bgcolor="${value_c}" align="center">
	<input type="submit" value="글쓰기" />
	<input type="reset" value="다시 작성" />
	<input type="button" value="목록 보기" onclick="window.location.href='list.do?pageNum=${pageNum}'" />
	</td>
</tr>
</table>
</form:form>
</center>