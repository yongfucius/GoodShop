<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<link href="/GoodShop/style/headerstyle.css" rel="stylesheet" type="text/css">
</head>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
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
<div class="memberinfo">
	<div class="membertitle">
		<a href="/GoodShop/"><img src="/GoodShop/images/logo.gif"></a>
	</div>
	<div class="sign">
   	 <div id="bar">
   	     <div id="container">
   	         <!-- Login Starts Here -->
   	         <div id="loginContainer">
   	         	<c:choose>
   	         	 <c:when test="${sessionScope.check == 1}">
                 
   	             <a href="#" id="loginButton"><span2>회원정보</span2><em></em></a>
   	             <span id="memNameSpan"><c:out value="${sessionScope.memName}" /></span>
   	             <div style="clear:both"></div>
   	             <div id="loginBox">                
   	                 <form id="loginForm">
    	                    <fieldset id="body">
                            	<fieldset>
                            	<a href="/GoodShop/memberInfo.do">회원정보</a>&nbsp;
                            	<a href="/GoodShop/find.do">즐겨찾기</a>
                            	</fieldset>
                            </fieldset>
                        <span><a href="/GoodShop/signOut.do">로그아웃</a></span>
   	                 </form>
   	             </div>

   	         	</c:when>
   	         	<c:otherwise>
   	             <a href="#" id="loginButton"><span>로그인</span><em></em></a>
   	             <div style="clear:both"></div>
   	             <div id="loginBox" >                
   	                 <form id="loginForm" name="login" method="post" action="signIn.do" onsubmit="return space();">
    	                    <fieldset id="body">
                            <fieldset>
                                <label for="login_id">아이디</label>
                                <input type="text" name="login_id" id="login_id" value="${sessionScope.memId}"/>
                            </fieldset>
                            <fieldset>
                                <label for="login_pwd">비밀번호</label>
                                <input type="password" name="login_pwd" id="login_pwd" onkeypress="checkCapsLock(event);"/>
                            </fieldset>
                            <input type="submit" id="login" value="로그인" />
                            </fieldset>
                        <span><a href="/GoodShop/signUp.do">회원가입</a>&nbsp;
                        <a href="/GoodShop/lostId.do">아이디 찾기</a>&nbsp;
                        <a href="/GoodShop/lostPwd.do">비밀번호 찾기</a></span>
                    </form>
                    <c:remove var="check" scope="session" />
					<c:remove var="memId" scope="session" />
                </div>
                </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
   </div>
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
<tr>
	<td><div class="kind"><br><b>회원 탈퇴</b></div></td>
	<td>
		<div class="value_div" id="break_div" style="display:none;">
			탈퇴하시겠습니까? <button onclick="location.href='breakMember.do'">탈퇴</button><br>
			<button class="cancel">취소</button>
		</div>
		<button class="btn">탈퇴</button>
	</td>
</tr>
</table>
</div>
