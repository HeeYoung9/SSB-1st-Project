function listPopup() {
	window.open("./locationPopup.lo?", "배송지", "width = 500, height = 500, top = 100, left = 200, location = no");
}
function insertPopup(location_id) {
	window.open("./locationInsert.lo?&location_id=" + location_id, "신규배송지", "width = 500, height = 600, top = 100, left = 200, location = no");
}
function updatePopup(location_id) {
	window.open("./locationInsert.lo?location_id=" + location_id, "수정배송지", "width = 500, height = 600, top = 100, left = 200, location = no");
}
function deletePopup(location_id) {
	if (confirm("삭제하시겠습니까?")) {//삭제 시 재확인
		//페이지 이동
		$.ajax({
			type: "POST",
			url: "./deleteLocation.lo",
			dataType: "text",
			data: {
				"location_id": location_id
			},
			error: function() {
				alert('통신실패!!');
			},
			success: function() {
				opener.location.reload();
				location.reload();
			}
		});
	}else{
		return false;
	}
}
function selectPopup(location_id){//배송지 선택시 부모창으로 값 넘기기
	opener.document.getElementById("getPopup").value = location_id;
	alert(location_id);
    window.close();
}
