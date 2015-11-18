<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
.signform{
	width:1000px;
	margin: auto;
	font-size: 12px;
}
.signform div{
	width: 500px;
	height: 70px;
	margin: auto;
	background-color: antiquewhite;
	position: relative;
}
.signform input{
	border: none;
	background: white;
	width: 400px;
	height: 30px;
	position: absolute;
	top: 10px;
	left: 50px;
}
.signform label{
	width: 380px;
	height: 20px;
	position: absolute;
	top: 50px;
	left: 60px;
	color: red;
}

</style>
<c:choose>
<c:when test="${complete}">
<div class="complete" style="width:400px; height:400px; margin:auto; font-size:30px; text-align:center;">가입이 완료되었습니다. </div>
</c:when> 
<c:otherwise>
<script src="scripts/signUp.js"></script>
<div class="signform">
	<form:form commandName="command" onsubmit="return checkSubmit();">
	<div class="form_id">
		<form:input path="id" placeholder="아이디" onblur="checkId();" maxlength="20"/>
		<label id="id_msg" ></label>
	</div>
	<div class="form_pwd">
		<form:password path="pwd" placeholder="비밀번호" onkeypress="checkCapsLock(event, 'pwd', 'pwd_msg');" onblur="checkPwd();" maxlength="20"/>
		<label id="pwd_msg"></label>
	</div>
	<div class="form_pwdchk">
		<input type="password" id="pwdchk" name="pwdchk" placeholder="비밀번호 확인" onkeypress="checkCapsLock(event, 'pwdchk', 'pwdchk_msg');" onblur="checkPwdChk();" maxlength="20"/>
		<label id="pwdchk_msg"></label>
	</div>
	<div class="form_email">
		<form:input path="email" placeholder="이메일" onblur="checkEmail();" maxlength="40"/>
		<label id="email_msg"></label>
	</div>
	<div class="form_name">
		<form:input path="name" placeholder="닉네임" onblur="checkName();" maxlength="10"/>
		<label id="name_msg"></label>
	</div>
	<div class="form_submit"><input type="submit" value="가입하기" id="submit"/></div>
	</form:form>
</div>
</c:otherwise>
</c:choose>