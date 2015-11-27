<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
.header{
	width: 1000px;
	height: 216px;
	margin: 0px auto;
	position: relative;
}
.title{
}
.title img{
	height: 150px;
}

.sign{
	position: absolute;
	top: 10px;
	right: 10px;
	width: 380px;
	height: 140px;
}

.menu{
	width: 1000px;
	margin: auto;
}
.menu img{
	float: left;
	width: 166px;
}

/* Login Container (default to float:right) */
#loginContainer {
    position:relative;
    float:right;
    font-size:12px;
}
#loginContainer span{
    color:#445058; 
    font-size:14px; 
    font-weight:bold; 
    text-shadow:1px 1px #fff; 
    padding:7px 29px 9px 10px;
    display:block

}
/* Login Button */
#loginButton { 
    display:inline-block;
    float:right;
    background:#d2e0ea url(/GoodShop/images/login/buttonbg.png) repeat-x; 
    border:1px solid #899caa; 
    border-radius:3px;
    -moz-border-radius:3px;
    position:relative;
    z-index:30;
    cursor:pointer;
}

#memNameSpan{
	float: right;
}

/* Login Button Text */
#loginButton span {
    color:#445058; 
    font-size:14px; 
    font-weight:bold; 
    text-shadow:1px 1px #fff; 
    padding:7px 29px 9px 10px;
    background:url(/GoodShop/images/login/loginArrow.png) no-repeat 53px 7px;
    display:block
}
#loginButton span2 {
    color:#445058; 
    font-size:12px; 
    font-weight:bold; 
    text-shadow:1px 1px #fff; 
    padding:7px 29px 9px 10px;
    background:url(/GoodShop/images/login/loginArrow.png) no-repeat 53px 7px;
    display:block
}
#loginButton:hover {
    background:url(/GoodShop/images/login/buttonbgHover.png) repeat-x;
}

/* Login Box */
#loginBox {
    position:absolute;
    top:34px;
    right:0;
    display:none;
    z-index:29;
}

/* If the Login Button has been clicked */    
#loginButton.active {
    border-radius:3px 3px 0 0;
}

#loginButton.active span {
    background-position:53px -76px;
}

/* A Line added to overlap the border */
#loginButton.active em {
    position:absolute;
    width:100%;
    height:1px;
    background:#d2e0ea;
    bottom:-1px;
}

/* Login Form */
#loginForm {
    width:248px; 
    border:1px solid #899caa;
    border-radius:3px 0 3px 3px;
    -moz-border-radius:3px 0 3px 3px;
    margin-top:-1px;
    background:#d2e0ea;
    padding:6px;
}

#loginForm fieldset {
    margin:0 0 12px 0;
    display:block;
    border:0;
    padding:0;
}

fieldset#body {
    background:#fff;
    border-radius:3px;
    -moz-border-radius:3px;
    padding:10px 13px;
    margin:0;
}

#body label {
    color:#3a454d;
    margin:9px 0 0 0;
    display:block;
    float:left;
}

#loginForm #body fieldset label {
    display:block;
    float:none;
    margin:0 0 6px 0;
}

/* Default Input */
#loginForm input {
    width:92%;
    border:1px solid #899caa;
    border-radius:3px;
    -moz-border-radius:3px;
    color:#3a454d;
    font-weight:bold;
    padding:8px 8px;
    box-shadow:inset 0px 1px 3px #bbb;
    -webkit-box-shadow:inset 0px 1px 3px #bbb;
    -moz-box-shadow:inset 0px 1px 3px #bbb;
    font-size:12px;
}

/* Sign In Button */
#loginForm #login {
    width:auto;
    float:left;
    background:#339cdf url(/GoodShop/images/login/loginbuttonbg.png) repeat-x;
    color:#fff;
    padding:7px 10px 8px 10px;
    text-shadow:0px -1px #278db8;
    border:1px solid #339cdf;
    box-shadow:none;
    -moz-box-shadow:none;
    -webkit-box-shadow:none;
    margin:0 12px 0 0;
    cursor:pointer;
    *padding:7px 2px 8px 2px; /* IE7 Fix */
}

/* Forgot your password */
#loginForm span {
    text-align:center;
    display:block;
    padding:7px 0 4px 0;
}

#loginForm span a {
    color:#3a454d;
    text-shadow:1px 1px #fff;
    font-size:12px;
}

input:focus {
    outline:none;
}

</style>
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

function checkCapsLock(e){
	var pwd = document.getElementById("login_pwd");
	var msg = document.getElementById("login_pwd_msg");
	var kc = e.keyCode ? e.keyCode : e.which;
	var sk = e.shiftKey ? e.shiftKey : ((kc == 16) ? true : false);
	console.log(kc);
	console.log(sk);
	if (((kc >= 65 && kc <= 90) && !sk)	|| ((kc >= 97 && kc <= 122) && sk)) {
		pwd.style.border = "2px solid darkorange";
		msg.innerHTML = "Caps Lock이 켜져 있습니다.";
		return false;
	} else {
		pwd.style.border = "";
		msg.innerHTML = "";
		return true;
	}
}
$(function() {
    var button = $('#loginButton');
    var box = $('#loginBox');
    var form = $('#loginForm');
    button.removeAttr('href');
    button.mouseup(function(login) {
        box.toggle();
        button.toggleClass('active');
    });
    form.mouseup(function() { 
        return false;
    });
    $(this).mouseup(function(login) {
        if(!($(login.target).parent('#loginButton').length > 0)) {
            button.removeClass('active');
            box.hide();
        }
    });
});

$(document).ready(check);
</script>

<div class="header">
	<div class="title">
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
                                <label id="login_pwd_msg" style="height:15px; width:200px; font-weight:bold; font-size:12px; color:darkorange;"></label>
                            </fieldset>
                            <input type="submit" id="login" value="로그인" />
                            </fieldset>
                        <span><a href="/GoodShop/signUp.do">회원가입</a>&nbsp;
                        <a href="/GoodShop/lostId.do">아이디 찾기</a>&nbsp;
                        <a href="/GoodShop/lostPwd.do">비밀번로 찾기</a></span>
                    </form>
                    <c:remove var="check" scope="session" />
					<c:remove var="memId" scope="session" />
                </div>
                </c:otherwise>
                </c:choose>
            </div>
            <!-- Login Ends Here -->
        </div>
    </div>
   </div>
	<%-- <div class="sign">
		<div class="login">
 		<c:choose>
			<c:when test="${sessionScope.check == 1}">
				<c:out value="${sessionScope.memName}" />
				<button onclick="location.href='memberInfo.do'">회원정보</button>
				<button onclick="location.href='find.do'">즐겨찾기</button>
				<button onclick="location.href='signOut.do'">로그아웃</button>
			</c:when>
			<c:otherwise>
				<label id="login_pwd_msg" style="position:absolute; top:-15px; height:15px; width:200px; right:50px; font-weight:bold; font-size:12px; color:darkorange;"></label>
				<form name="login" method="post" action="signIn.do" onsubmit="return space();">
					<label for="login_id" >계정&nbsp;</label><input type="text" id="login_id" name="login_id" size="10" value="${sessionScope.memId}"/>
					<label for="login_pwd" >비밀번호&nbsp;</label><input type="password" id="login_pwd" name="login_pwd" size="10" onkeypress="checkCapsLock(event);"/>
					<input type="submit" value="로그인" />
				</form>
				<c:remove var="check" scope="session" />
				<c:remove var="memId" scope="session" />
			</c:otherwise>
		</c:choose> 
		</div>
		<button onclick="location.href='signUp.do'" style="margin-top:3px">회원가입</button>
		<button onclick="location.href='lostId.do'" style="margin-top:3px">아이디 찾기</button>
		<button onclick="location.href='lostPwd.do'" style="margin-top:3px">비밀번호 찾기</button>
	</div> --%>
	
	<tiles:importAttribute name="menuList" />
	<div class="menu">
		<c:forEach var="menu" items="${menuList}" varStatus="status">
			<a href="${menu}"><img src="/GoodShop/images/menu/${status.count}.png"></a>
		</c:forEach>
	</div>
	<script>
	$(document).ready(function(){
		$(".menu img").hover(function(){
			var statcnt = $(this).parent().prevAll().length+1;
			$(this).prop("src", "/GoodShop/images/menu/hov"+statcnt+".png");
		}, function(){
			var statcnt = $(this).parent().prevAll().length+1;
			$(this).prop("src", "/GoodShop/images/menu/"+statcnt+".png");
		});
	});
	</script>
</div>