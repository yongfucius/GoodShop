function replaceForm(id){
	var div = document.getElementById(id);
	div.style.display = "";
	
	var button = document.getElementById("cancel_"+id.substring(0, id.indexOf("_")));
	button.style.display = "none";
}

function cancelForm(id){
	var div = document.getElementById(id);
	div.style.display = "none";
	
	var button = document.getElementById("cancel_"+id.substring(0, id.indexOf("_")));
	button.style.display = "";
}

function checkInfoName(){
	var name = document.getElementById("info_name");
	var msg = document.getElementById("info_name_msg");
	
	if (!checkInfoRequire(name, msg)) return false;
	
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			var count = xmlhttp.responseText;
			if(count > 0) {
				exInfoError(name, msg, "누군가 사용하고 있는 이름입니다. ");
			}else {
				exInfoNotError(name, msg);
			}
		}
	};
	xmlhttp.open("GET", "duplicateName.do?name="+name.value, true);
	xmlhttp.send();
}
	
function checkInfoRequire(input, label){
	if(input.value == ""){
		return exInfoError(input, label, "필수 정보입니다. ");
	}else return true;
}
function exInfoError(input, label, string){
	input.style.border = "1px solid red";
	label.style.color = "red";
	label.innerHTML = string;
	input.className = input.id.substring(input.id.indexOf("_")+1, input.id.length)+"_error";
	return false;
}
function exInfoNotError(input, label){
	input.style.border = "";
	label.style.color = "black";
	label.innerHTML = "수정할 내용을 입력하세요. ";
	if(label.id == "info_pwd_msg") label.innerHTML = "바꿀 새 비밀번호를 입력해주세요. ";
	else if(label.id == "info_pwdchk_msg") label.innerHTML = "";
	input.className = "";
	return true;
}

function checkInfoEmail(){
	var email = document.getElementById("info_email");
	var msg = document.getElementById("info_email_msg");
	
	if (!checkInfoRequire(email, msg)) return false;
	
	var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	var isHan = /[ㄱ-ㅎ가-힣]/g;
	if (!isEmail.test(email.value) || isHan.test(email.value)) {
		return exInfoError(email, msg, "이메일 주소를 다시 확인해주세요.");
	}
	
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			var count = xmlhttp.responseText;
			if(count > 0) {
				exInfoError(email, msg, "누군가 사용하고 있는 이메일 주소입니다. ");
			}else {
				exInfoNotError(email, msg);
			}
		}
	};
	xmlhttp.open("GET", "duplicateEmail.do?email="+email.value, true);
	xmlhttp.send();
}

function checkInfoPwd(){
	var pwd = document.getElementById("info_pwd");
	var msg = document.getElementById("info_pwd_msg");
	
	if (!checkInfoRequire(pwd, msg)) return false;
	
	if (isValidPwd(pwd.value) != true) {
		msg.style.fontSize = "12.5px";
		return exInfoError(pwd, msg, "6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
	} else {
		return exInfoNotError(pwd, msg);
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
function checkCapsLock(e, inputId, labelId){
	var pwd = document.getElementById(inputId);
	var msg = document.getElementById(labelId);
	var kc = e.keyCode ? e.keyCode : e.which;
	var sk = e.shiftKey ? e.shiftKey : ((kc == 16) ? true : false);
	if (((kc >= 65 && kc <= 90) && !sk)	|| ((kc >= 97 && kc <= 122) && sk)) {
		return exInfoError(pwd, msg, "Caps Lock이 켜져 있습니다.");
	} else {
		return exInfoNotError(pwd, msg);
	}
}

function checkInfoPwdChk() {
	var pwd = document.getElementById("info_pwd");
	var pwdchk = document.getElementById("info_pwdchk");
	var msg = document.getElementById("info_pwdchk_msg");

	if (!checkInfoRequire(pwdchk, msg)) return false;
	
	if (pwd.value != pwdchk.value) {
		return exInfoError(pwdchk, msg, "비밀번호가 일치하지 않습니다.");
	} else {
		return exInfoNotError(pwdchk, msg);
	}
}

function checkInfoNameSubmit(){
	checkInfoName();
	if($(".name_error").length == 0) return confirm("수정하시겠습니까?");
	else return false;
}
function checkInfoEmailSubmit(){
	checkInfoEmail();
	if($(".email_error").length == 0) return confirm("수정하시겠습니까?");
	else return false;
}
function checkInfoPwdSubmit(){
	checkInfoPwd();
	checkInfoPwdChk();
	if($(".pwdchk_error").length == 0 && $(".pwd_error").length == 0) return confirm("수정하시겠습니까?");
	else return false;
}