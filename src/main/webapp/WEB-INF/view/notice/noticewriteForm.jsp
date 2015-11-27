<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
.notice {
	width: 500px;
	margin: auto;
	position: relative;
	margin-top: 50px;
	margin-bottom: 100px;
}

.notice_write {
	width: 500px;
}

.notice_write tr {
	height: 30px;
}

.notice_write th {
	background-color: #AFE1FF;
}

</style>

<script src="scripts/write.js"></script>

<div class=notice>
	<form:form commandName="notice" class="form" name="writeform" action="noticewriteForm.do?pageNum=${pageNum}" onsubmit="return writeSave();">
		<table class=notice_write>
			<form:hidden path="num" />
			<form:hidden path="writer" />
			<form:hidden path="id" />
			<tr>
				<th>제&nbsp&nbsp&nbsp&nbsp&nbsp목</th>
			</tr>
			<tr>
				<td><form:input size="40" maxlength="50" path="subject" style="width:99%;height:100%" /></td>
			</tr>
			<tr>
				<th>내&nbsp&nbsp&nbsp&nbsp&nbsp용</th>
			</tr>
			<tr>
				<td><form:textarea path="content" cols="50" rows="20" maxlength="400" style="resize:none;width:99%;height:100%" /></td>
			</tr>
			<tr>
				<td align="center"><form:radiobuttons items="${categories}" path="category" /></td>
			</tr>
			<tr>
				<td align="right">
					<div class="write_button">
						<c:choose>
							<c:when test="${update == 1}">
								<input type="hidden" name="update" value="1">
								<input type="submit" value="수정" onclick="return confirm('수정하시겠습니까?');" />
							</c:when>
							<c:otherwise>
								<input type="submit" value="글쓰기" />
							</c:otherwise>
						</c:choose>
						<input type="reset" value="다시 작성" /> <input type="button"
							value="취소" onclick="location.href='noticelist.do?pageNum=${pageNum}'" />
					</div>
				</td>
			</tr>
		</table>
	</form:form>
</div>