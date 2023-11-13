<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script defer src="rating.js"></script>
<link href="rating.css" rel="stylesheet"/>

<style type="text/css">
/* 창 여분 없애기 */
body {margin : 0;}

/* 전체 배경화면 색상 */
.wrapper_div {background-color: #f5f5f5;
height: 100%;}

/* 팝업창 제목 */
.subject_div {background-color: #000000;
color: white;
font-weight: bold;
padding: 10px;
width: 96%;}
  	
/* 컨텐츠, 버튼 영역 padding */
.input_wrap {padding: 20px;}
.btn_wrap {padding: 5px 30px 30px 30px;
text-align: center;}
  	
/* 버튼 영역 */
.cancel_btn {background-color: #000000;
padding-top: 10px;
margin-right:5px;
display: inline-block;
width: 130px;
height: 27px;
color: #fff;
font-size: 14px;
line-height: 18px;}
.enroll_btn {background-color: #000000;
padding-top: 10px;
display: inline-block;
width: 130px;
height: 27px;
color: #fff;
font-size: 14px;
line-height: 18px;}

/* 제품명 영역 */
.item_div h2 {margin : 0;}

/* 리뷰 작성 영역 */
.content_div {padding-top: 10px;}
.content_div h4 {margin : 0;}
  	
textarea {border: 1px solid #dadada;
width: 97%;
height: 100px;
padding: 12px 8px 12px 8px;
font-size: 15px;
color: #a9a9a9;
resize: none;
margin-top: 10px;
margin-bottom: 5px;} 
</style>
</head>
<body>
  <div class="wrapper_div">
	<div class="subject_div">
	 리뷰 작성
	</div>
  </div>
	
  <div class="input_wrap">					
    <div class="r_div1">
 	  <strong>상품은 어떠셨나요?</strong>
 	</div>
 	<div class="r_div2">
 	  상품에 대한 별점을 매겨주세요.
 	</div>
 	  
 	<div class="rating_box">
      <div class="rating">
      	★★★★★
      	<span class="rating_star">★★★★★</span>
      	<input type="range" value="1" step="1" min="0" max="10">
   	  </div>
  	</div>
  		
	<div class="content_div">
	  <h4>내용</h4>
	  <textarea name="content" placeholder="최소 10자 이상 작성해 주세요"></textarea>
	</div>
	<div class="checkbox">
	  <input type="checkbox">보다 나은 후기 서비스 제공을 위해 정보 수집ㆍ이용에 동의합니다. (선택)
    </div>
  </div>
	
  <div class="btn_wrap">
	<a class="cancel_btn">취소</a><a class="enroll_btn">등록</a>
  </div>	
</body>
</html>