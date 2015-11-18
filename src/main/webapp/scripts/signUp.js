function checkId(){
	var id = document.getElementById("id");
	var msg = document.getElementById("id_msg");
	
	if (!checkRequire(id, msg)) return false;
	
	var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	if (!isID.test(id.value)) {
		return exError(id, msg, "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
	}
	
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			var count = xmlhttp.responseText;
			if(count > 0) {
				exError(id, msg, "누군가 사용하고 있는 아이디입니다. ");
			}else {
				exNotError(id, msg);
			}
		}
	};
	xmlhttp.open("GET", "duplicateId.do?id="+id.value, true);
	xmlhttp.send();
}
function checkRequire(input, label){
	if(input.value == ""){
		return exError(input, label, "필수 정보입니다. ");
	}else return true;
}
function exError(input, label, string){
	input.style.border = "1px solid red";
	input.style.background = "azure"
	label.innerHTML = string;
	input.className = "error";
	return false;
}
function exNotError(input, label){
	input.style.border = "none";
	input.style.background = "white"
	label.innerHTML = "";
	input.className = "";
	return true;
}

function checkCapsLock(e, inputId, labelId){
	var pwd = document.getElementById(inputId);
	var msg = document.getElementById(labelId);
	var kc = e.keyCode ? e.keyCode : e.which;
	var sk = e.shiftKey ? e.shiftKey : ((kc == 16) ? true : false);
	if (((kc >= 65 && kc <= 90) && !sk)	|| ((kc >= 97 && kc <= 122) && sk)) {
		return exError(pwd, msg, "Caps Lock이 켜져 있습니다.");
	} else {
		return exNotError(pwd, msg);
	}
}

function checkPwd() {
	var pwd = document.getElementById("pwd");
	var msg = document.getElementById("pwd_msg");

	if (!checkRequire(pwd, msg)) return false;
	
	if (isValidPwd(pwd.value) != true) {
		return exError(pwd, msg, "6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
	} else {
		return exNotError(pwd, msg);
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

function checkPwdChk() {
	var pwd = document.getElementById("pwd");
	var pwdchk = document.getElementById("pwdchk");
	var msg = document.getElementById("pwdchk_msg");

	if (!checkRequire(pwdchk, msg)) return false;
	
	if (pwd.value != pwdchk.value) {
		return exError(pwd, msg, "비밀번호가 일치하지 않습니다.");
	} else {
		return exNotError(pwdchk, msg);
	}
}

function checkEmail(){
	var email = document.getElementById("email");
	var msg = document.getElementById("email_msg");
	
	if (!checkRequire(email, msg)) return false;
	
	var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var isHan = /[ㄱ-ㅎ가-힣]/g;
	if (!isEmail.test(email.value) || isHan.test(email.value)) {
		return exError(email, msg, "이메일 주소를 다시 확인해주세요.");
	}
	
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			var count = xmlhttp.responseText;
			if(count > 0) {
				exError(email, msg, "누군가 사용하고 있는 이메일 주소입니다. ");
			}else {
				exNotError(email, msg);
			}
		}
	};
	xmlhttp.open("GET", "duplicateEmail.do?email="+email.value, true);
	xmlhttp.send();
}

function checkName(){
	var name = document.getElementById("name");
	var msg = document.getElementById("name_msg");
	
	if (!checkRequire(name, msg)) return false;
	
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			var count = xmlhttp.responseText;
			if(count > 0) {
				exError(name, msg, "누군가 사용하고 있는 이름입니다. ");
			}else {
				exNotError(name, msg);
			}
		}
	};
	xmlhttp.open("GET", "duplicateName.do?name="+name.value, true);
	xmlhttp.send();
}

function checkSubmit(){
	checkId();
	checkPwd();
	checkPwdChk();
	checkEmail();
	checkName();
	
	if($(".error").length == 0) return confirm("가입하시겠습니까?");
	return false;
}