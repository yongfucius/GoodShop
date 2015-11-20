<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.table{
	width: 800px;
	margin: auto;
}
td, tr{
	border: 1px solid black;
	position: relative;
}

.kind{
	width: 200px;
	height: 140px;
	background-color: #D5D5D5;
	text-align: center;
	
}

.value{
	display: inline-table;
	width: 600px;
	margin: 4px;
	position: relative;
}
.value button{
	margin-top: 5px;
}
.cancel{
	margin-top: 5px;
	margin-left: 5px;
	position: relative;
}

.pwd_table tr td{
	border: none;
}
</style>
<script src="scripts/memberInfo.js"></script>
<script>
$(document).ready(function(){
	if("<c:out value="${pwdNotEqual}"/>"){
		alert("알맞은 비밀번호가 아닙니다. ")
	}
});
</script>
<c:if test="${complete}">
	<div class="complete" style="width:400px; height:100px; margin:auto; font-size:25px; text-align:center;">수정되었습니다. </div>
</c:if> 
<table class="table">
<tr>
	<td><div class="kind"><br><b>이름</b></div></td>
	<td>
		<div class="value" id="value_name">${member.name}</div>
		<div class="value_div" id="name_div" style="display:none;">
			<label id="info_name_msg">수정할 내용을 입력하세요. </label>
			<form method="post" onsubmit="return checkInfoNameSubmit();">
				<input type="text" id="info_name" name="name" size="10" maxlength="10" onblur="checkInfoName();">
				<input type="submit" value="확인">
			</form>
			<button class="cancel">취소</button>
		</div>
		<button class="btn">수정</button>
	</td>
</tr>
<tr>
	<td><div class="kind"><br><b>이메일</b></div></td>
	<td>
		<div class="value" id="value_email">${member.email}</div>
		<div class="value_div" id="email_div" style="display:none;">
			<label id="info_email_msg">수정할 내용을 입력하세요. </label>
			<form method="post" onsubmit="return checkInfoEmailSubmit();">
				<input type="text" id="info_email" name="email" size="30" maxlength="40" onblur="checkInfoEmail();">
				<input type="submit" value="확인">
			</form>
			<button class="cancel">취소</button>
		</div>
		<button class="btn">수정</button>
	</td>
</tr>
<tr>
	<td><div class="kind"><br><b>비밀번호</b></div></td>
	<td>
		<div class="value_div" id="pwd_div" style="display:none;">
		<form method="post" onsubmit="return checkInfoPwdSubmit();">
			<table class="pwd_table">
			<tr>
				<td>현재 비밀번호</td>
				<td><input type="password" id="info_curr_pwd" name="curr_pwd" size="16" maxlength="20" ></td>
				<td><label id="info_curr_pwd_msg">현재 비밀번호를 입력해주세요. </label></td>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td><input type="password" id="info_pwd" name="pwd" size="16" maxlength="20" onkeypress="checkCapsLock(event, 'info_pwd', 'info_pwd_msg');" onblur="checkInfoPwd();"></td>
				<td><label id="info_pwd_msg">바꿀 새 비밀번호를 입력해주세요. </label></td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>
				<td><input type="password" id="info_pwdchk" name="pwdchk" size="16" maxlength="20" onkeypress="checkCapsLock(event, 'info_pwdchk', 'info_pwdchk_msg');" onblur="checkInfoPwdChk();" ></td>
				<td><label id="info_pwdchk_msg"></label></td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
				<td><input type="hidden" value="true" name="passwordcheck"></td>
				<td></td>
			</tr>
			</table>
		</form>
		<button class="cancel">취소</button>
		</div>
		<button class="btn">수정</button>
	</td>
</tr>
</table>
