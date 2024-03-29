function chkForm() {
	let f = document.frm;
	
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