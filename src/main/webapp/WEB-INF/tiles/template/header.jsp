<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
<link href="/GoodShop/style/headerstyle.css" rel="stylesheet" type="text/css">
</head>
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
	
	<form id="searchbox" action="search.do" onsubmit="return selectedSubmit(this)">
		<input id="search" name="search" type="text" autocomplete="off" placeholder="가게 이름, 업종, 메뉴로 검색" onkeyup="searchTitle(this.value, event);" onkeydown="updownRes(event);" onfocus="searchTitle(this.value, event);" onblur="document.getElementById('searchTitleRes').innerHTML = '';">
		<input id="submit" type="submit" value="검색">
		<ul id='searchTitleRes'></ul>
	</form>
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script src="/GoodShop/scripts/searchTitle.js"></script>
	
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