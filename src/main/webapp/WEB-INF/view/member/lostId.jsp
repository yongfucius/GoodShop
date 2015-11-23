<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.lostId{
	width: 500px;
	margin: auto;
}
#lostId_email{
	margin-left: 5px;
}
</style>
<script>
$(document).ready(function(){
	if("<c:out value='${noEmail}'/>") alert("해당하는 이메일 주소가 없습니다. ");
});
</script>
<div class="lostId">
	<form method="post">
	<label for="lostId_email">이메일 주소</label><input type="text" id="lostId_email" name="lostId_email">
	<input type="submit" value="보내기">
	</form>
</div>