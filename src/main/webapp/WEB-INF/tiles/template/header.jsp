<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
.header{
	width: 1000px;
	height: 150px;
	margin: 0px auto;
	position: relative;
}
.title{
}
.title img{
	height: 70px;
}

.sign{
	position: absolute;
	top: 5px;
	right: 10px;
	width: 360px;
	height: 50px;
}
.sign .login{
	position:relative;
	width: 360px;
	height: 25px
}

.menu{
	width: 1000px;
}
.menu img{
	width: 160px;
}
</style>

<div class="header">
	<div class="title">
		<a href="/GoodShop/"><img src="/GoodShop/images/logo.gif"></a>
		<a href="http://www.goodprice.go.kr">
		<img src="/GoodShop/images/logo_gov.jpg" style="height:50px; position:absolute; margin-left:20px; top:10px;">
		</a>
	</div>
	
	<script>
	function space(){
		if(!document.login.login_id.value.trim()){
			alert("계정을 입력하지 않았습니다. ");
			document.login.login_id.focus();
			return false;
		}
		if(!document.login.login_pwd.value.trim()){
			alert("비밀번호를 입력하지 않았습니다. ");
			document.login.login_pwd.focus();
			return false;
		}
	}
	
	function check(){
		chk = "<c:out value='${sessionScope.check}'/>";
		if(chk == "-1") alert("해당하는 계정이 없습니다. ");
		else if(chk == "0") alert("비밀번호가 맞지 않습니다. ");
		else return;
	}
	</script>
	<div class="sign">
		<div class="login">
		<c:choose>
			<c:when test="${sessionScope.check == 1}">
				<c:out value="${sessionScope.memId}" />
				<button onclick="location.href='signOut.do'">로그아웃</button>
			</c:when>
			<c:otherwise>
				<script>check();</script>
				<form name="login" method="post" action="signIn.do" onsubmit="return space();">
					<label for="login_id" >계정&nbsp;</label><input type="text" id="login_id" name="login_id" size="10" value="${sessionScope.memId}"/>
					<label for="login_pwd" >비밀번호&nbsp;</label><input type="password" id="login_pwd" name="login_pwd" size="10"/>
					<input type="submit" value="로그인" />
				</form>
				<c:remove var="check" scope="session" />
				<c:remove var="memId" scope="session" />
			</c:otherwise>
		</c:choose>
		</div>
		<button onclick="location.href='signUp.do'">회원가입</button>
	</div>
	
	<tiles:importAttribute name="menuList" />
	<div class="menu">
		<c:forEach var="menu" items="${menuList}" varStatus="status">
			<a href="${menu}"><img src="/GoodShop/images/menu/${status.count}.png"></a>
		</c:forEach>
	</div>
</div>