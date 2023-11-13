
 /* (1) 체크박스 제어 */
$(document).ready(function() {
	$("#cbx_chkAll").click(function() {
		if ($("#cbx_chkAll").is(":checked")) $("input[name=options_id]").prop("checked", true);
		else $("input[name=options_id]").prop("checked", false);
	});

	$("input[name=options_id]").click(function() {
		var total = $("input[name=options_id]").length;
		var checked = $("input[name=options_id]:checked").length;

		if (total != checked) $("#cbx_chkAll").prop("checked", false);
		else $("#cbx_chkAll").prop("checked", true);
	});
});




/* (2) form 유효성 검사 */
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
	
            const categorySport = form.querySelector('select[name="category_sport"]');
            if (categorySport.value === "") {
                categorySport.setCustomValidity("미선택 상태에서는 제출할 수 없습니다.");
            } else {
                categorySport.setCustomValidity("");
            }

            const categoryMajor = form.querySelector('select[name="category_major"]');
            if (categoryMajor.value === "") {
                categoryMajor.setCustomValidity("미선택 상태에서는 제출할 수 없습니다.");
            } else {
                categoryMajor.setCustomValidity("");
            }

            const categorySub = form.querySelector('select[name="category_sub"]');
            if (categorySub.value === "") {
                categorySub.setCustomValidity("미선택 상태에서는 제출할 수 없습니다.");
            } else {
                categorySub.setCustomValidity("");
            }

            const categoryBrand = form.querySelector('select[name="category_brand"]');
            if (categoryBrand.value === "") {
                categoryBrand.setCustomValidity("미선택 상태에서는 제출할 수 없습니다.");
            } else {
                categoryBrand.setCustomValidity("");
            }

          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  
  
  
  
/* (3) 파일이름을 input 요소의 값으로 설정 (+ 이미지 확장자 가리기 추가함) */
 $("#img_main").on('change', function () {
    var fileName = $("#img_main").val();
    var fileNameWithoutExtension = fileName.split('.').slice(0, -1).join('.');
    $(".upload-main").val(fileNameWithoutExtension);
});

$("#img_sub").on('change', function () {
    var fileName = $("#img_sub").val();
    var fileNameWithoutExtension = fileName.split('.').slice(0, -1).join('.');
    $(".upload-sub").val(fileNameWithoutExtension);
});

$("#img_logo").on('change', function () {
    var fileName = $("#img_logo").val();
    var fileNameWithoutExtension = fileName.split('.').slice(0, -1).join('.');
    $(".upload-logo").val(fileNameWithoutExtension);
});



  
/* (4) 상품/옵션 삭제 처리 */
function selectOptions(url) {
    var selectedItems = $("input[name=options_id]:checked").map(function() {
        return this.value; 
    }).get(); // options_id를 가져와 selectedItems 배열에 저장함

    if (selectedItems.length === 1) { // 선택된 옵션ID 배열의 길이가 1인 경우
        if (url == 'ItemDeleteAction.it' && !confirm("선택한 상품을 삭제하시겠습니까?")) {
            return false;
        }

        // 선택된 옵션ID 배열을 서버로 전송
        $.ajax({
            type: 'POST',
            url: './ItemDeleteAction.it',
            data: { options_id: selectedItems },
            traditional: true, // 배열 전송을 위해 필요한 옵션
            success: function(response) {
                // 서버 응답에 따라 처리
                console.log(response);
                alert("상품 삭제 성공!");

                // 화면 갱신
                location.reload();
            },
            error: function(error) {
                console.error(error);
                alert("삭제 중 오류가 발생했습니다.");
            }
        });
    } else if (selectedItems.length > 1) { 
        alert("하나의 상품만 선택해 주세요!!");
    } else {
        alert("삭제할 상품을 선택해주세요!!");
    }
}




/* (5) 사이드바 자동으로 접기 */
$(document).ready(function() {
   // 로컬 스토리지에서 상태를 읽어옴
   var isSidebarCollapsed = localStorage.getItem('isSidebarCollapsed');

   // 로컬 스토리지에 저장된 값이 없거나 true일 경우에는 접힌 상태로 시작
   if (isSidebarCollapsed === null || isSidebarCollapsed === 'true') {
      $('#sidebar').addClass('collapsed');
   }

   // 토글 버튼 클릭 시 사이드바 펼침/접힘 기능 추가
   $('.sidebar-toggler').click(function() {
      $('#sidebar').toggleClass('collapsed');

      // 상태를 로컬 스토리지에 저장
      var isCollapsed = $('#sidebar').hasClass('collapsed');
      localStorage.setItem('isSidebarCollapsed', isCollapsed);
   });
});




/* (6) 상품등록창 - 불러온 카테고리 정렬 (중복제거, 가나다순) */
function removeDuplicatesAndSort(selectElement) {
    var values = [];
    var options = selectElement.options;

    // 옵션을 배열로 복사하고 가나다 순으로 정렬
    var sortedOptions = Array.from(options).sort(function(a, b) {
        return a.text.localeCompare(b.text, 'ko-KR');
    });

    // 기존 옵션을 모두 제거
    while (selectElement.options.length > 0) {
        selectElement.remove(0);
    }

    // 정렬된 옵션을 중복 제거하면서 추가
    for (var i = 0; i < sortedOptions.length; i++) {
        var optionValue = sortedOptions[i].value;
        if (values.indexOf(optionValue) === -1) {
            values.push(optionValue);
            selectElement.add(sortedOptions[i]);
        }
    }
}
// 각 셀렉트 박스에 중복 옵션 제거 함수 호출
var selects = document.getElementsByClassName("Add-C")[0].getElementsByTagName("select");
for (var i = 0; i < selects.length; i++) {
    removeDuplicatesAndSort(selects[i]);
}







/* 검색 임시 */
document.getElementById('searchForm').addEventListener('submit', function(event) {
    event.preventDefault(); 

    var searchTerm = document.getElementById('searchInput').value;
    console.log('검색어:', searchTerm);

});




