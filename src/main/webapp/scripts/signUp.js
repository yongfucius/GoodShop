function checkId(){
	var id = document.getElementById("id");
	var msg = document.getElementById("id_msg");
	if (id.value == "") {
		id.style.border = "1px solid red";
		id.style.background = "azure"
		msg.innerHTML = "필수 정보입니다. ";
		return false;
	}
	
	var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	if (!isID.test(id.value)) {
		id.style.border = "1px solid red";
		id.style.background = "azure"
		msg.innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
		return false;
	}
	
	else {
		id.style.border = "none";
		id.style.background = "white"
		msg.innerHTML = "";
		return true;
	}
}

function checkCapsLock(e){
	var pwd = document.getElementById("pwd");
	var msg = document.getElementById("pwd_msg");
	var kc = e.keyCode ? e.keyCode : e.which;
	var sk = e.shiftKey ? e.shiftKey : ((kc == 16) ? true : false);
	console.log(kc);
	console.log(sk);
	if (((kc >= 65 && kc <= 90) && !sk)	|| ((kc >= 97 && kc <= 122) && sk)) {
		pwd.style.border = "1px solid red";
		pwd.style.background = "azure"
		msg.innerHTML = "Caps Lock이 켜져 있습니다.";
		return false;
	} else {
		pwd.style.border = "none";
		pwd.style.background = "white"
		msg.innerHTML = "";
		return true;
	}
}
function checkCapsLock2(e){
	var pwdchk = document.getElementById("pwdchk");
	var msg = document.getElementById("pwdchk_msg");
	var kc = e.keyCode ? e.keyCode : e.which;
	var sk = e.shiftKey ? e.shiftKey : ((kc == 16) ? true : false);
	if (((kc >= 65 && kc <= 90) && !sk)	|| ((kc >= 97 && kc <= 122) && sk)) {
		pwdchk.style.border = "1px solid red";
		pwdchk.style.background = "azure"
		msg.innerHTML = "Caps Lock이 켜져 있습니다.";
		return false;
	} else {
		pwdchk.style.border = "none";
		pwdchk.style.background = "white"
		msg.innerHTML = "";
		return true;
	}
}

function checkPwd() {
	checkPwd2();

	var id = document.getElementById("id");
	var pwd = document.getElementById("pwd");
	var msg = document.getElementById("pwd_msg");

	if (pwd.value == "") {
		pwd.style.border = "1px solid red";
		pwd.style.background = "azure"
		msg.innerHTML = "필수 정보입니다.";
		return false;
	}
	if (isValidPwd(pwd.value) != true) {
		pwd.style.border = "1px solid red";
		pwd.style.background = "azure"
		msg.innerHTML = "6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
		return false;
	} else {
		pwd.style.border = "none";
		pwd.style.background = "white"
		msg.innerHTML = "";
		return true;
	}
}
function isValidPwd(str) {
	var cnt = 0;
	if (str == "") {
		return false;
	}

	/* check whether input value is included space or not */
	var retVal = checkSpace(str);
	if (retVal) {
		return false;
	}
	if (str.length < 6) {
		return false;
	}
	for (var i = 0; i < str.length; ++i) {
		if (str.charAt(0) == str.substring(i, i + 1))
			++cnt;
	}
	if (cnt == str.length) {
		return false;
	}

	var isPW = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{6,16}$/;
	if (!isPW.test(str)) {
		return false;
	}

	return true;
}
function checkSpace(str) {
	if (str.search(/\s/) != -1) {
		return true;
	} else {
		return false;
	}
}
function checkPwd2() {
	var pwd = document.getElementById("pwd");
	var pwdchk = document.getElementById("pwdchk");
	var msg = document.getElementById("pwdchk_msg");

	if (pwdchk.value == "") {
		pwdchk.style.border = "1px solid red";
		pwdchk.style.background = "azure"
		msg.innerHTML = "필수 정보입니다.";
		return false;
	}
	if (pwd.value != pwdchk.value) {
		pwdchk.style.border = "1px solid red";
		pwdchk.style.background = "azure"
		msg.innerHTML = "비밀번호가 일치하지 않습니다.";
		return false;
	} else {
		pwdchk.style.border = "none";
		pwdchk.style.background = "white"
		msg.innerHTML = "";
		return true;
	}
}