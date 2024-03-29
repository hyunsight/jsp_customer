function chkForm() {
	let f = document.frm;
	
	if(f.name.value == '') {
		alert("이름을 입력해주세요.")
		return false;
	}
	
	if(f.phone.value == '') {
		alert("휴대폰을 입력해주세요.")
		return false;
	}
	
	if(f.address.value == '') {
		alert("주소를 입력해주세요.")
		return false;
	}	
	
	if(f.grade.value == "null") {
		alert("등급을 입력해주세요.")
		return false;
	}
	
	if(f.point.value == '') {
		alert("포인트를 입력해주세요.")
		return false;
	}			
	
	return f.submit();
}


function chkDelete(id) {
	let result = confirm("삭제하시겠습니까?");
	
	if (result) {
		let url = location.origin;
	
		location.href = url + "/jsp_customer/delete?id=" + id;		
	} else {
		return false;	
	}
}


//검색 관련
function search() {
	let input = document.querySelector(".wrap_index input")
	
	let url = location.origin;
	location.href = url + "/jsp_customer/search?name=" + input.value;
}