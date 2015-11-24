function writeSave(){
	if(document.writeform.subject.value == ""){
		alert("제목를 입력하세요. ");
		document.writeform.subject.focus();
		return false;
	}
	if(document.writeform.content.value == ""){
		alert("내용을 입력하세요. ");
		document.writeform.content.focus();
		return false;
	}
	if(document.writeform.category.value == ""){
		alert("분류를 선택하세요");
		return false;
	}
}