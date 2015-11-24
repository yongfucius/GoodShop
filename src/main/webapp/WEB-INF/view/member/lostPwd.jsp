<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.lostPwd{
	width: 500px;
	margin: auto;
}

.lostPwd label{
	width: 200px;
}

#lostPwd_id{
	margin-left: 37px;
}
#lostPwd_email{
	margin-left: 5px;
}
</style>
<script>
$(document).ready(function(){
	if("<c:out value='${noId}'/>") alert("해당하는 아이디가 없습니다. ");
	if("<c:out value='${noEmail}'/>") alert("알맞은 이메일 주소가 아닙니다. ");
});
</script>
<div class="lostPwd">
	<form method="post">
	<label for="lostPwd_id">아이디 </label><input type="text" id="lostPwd_id" name="lostPwd_id" value="${lostPwd_id}"><br>
	<label for="lostPwd_email">이메일 주소</label><input type="text" id="lostPwd_email" name="lostPwd_email"><br>
	<input type="submit" value="보내기">
	</form>
</div>