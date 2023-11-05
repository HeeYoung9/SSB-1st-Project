<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Item Management</title>

    
</head>
<body>
	<%@ include file="/resources/layout/header.jsp"%>

     <!-- 공용 header 시작 -->
    <header class="header">
        <div class="logo">
            <img alt="ssb_logo" src="./resources/img/SSB_gold.png" style="width: 200px;">
        </div>
        <div>
            <button class="login-button">로그인</button>
            <button class="signup-button">회원가입</button>
        </div>
    </header>
    <!-- 공용 header 끝 -->

    <!-- 공용 navbar 시작 -->
    <nav class="navbar">
        <button class="login-button">로그인</button>
        <a href="#">홈</a>
        <a href="#">마이페이지</a>
        <a href="#">장바구니</a>
        <a href="#">주문배송조회</a>
        <a href="#">.....</a>
        <a href="#">......</a>
        <a href="#">.......</a>
    </nav>
    <!-- 공용 navbar 끝 -->


    <main id="item">
        <section class="list">
            <span>
                <h1>상품 관리</h1>
                <%-- 검색창 --%>
                <span class="search-bar">
                    <input type="text" id="searchInput" placeholder="   상품명을 입력해 주세요">
                    <button id="searchButton">검색</button>
                    <button id="addButton">상품 등록</button>
                    <button id="editButton">상품 수정</button>
                </span>
            </span>
            <table class="sort">
                <%-- 체크박스 / 상품ID / 상품명(썸네일+제목) / 판매가 / 카테고리 / 옵션 / 재고 --%>
                <colgroup>
                    <col style="width: 5%" />
                    <col style="width: 5%" />
                    <col style="width: 7%" />
                    <col style="width: 15%" />
                    <col style="width: 7%" />
                    <col style="width: 15%" />
                    <col style="width: 20%" />
                    <col style="width: 5%" />
                </colgroup>
                <thead>
                    <tr>
                        <th>
                            <label class="checkbox-inline">
                                <input type="checkbox" id="allCheckBox" onclick="allChecked()">
                            </label>
                        </th>
                        <th>제품ID</th>
                        <th>이미지</th>
                        <th>상품명</th>
                        <th>판매가</th>
                        <th>카테고리</th>
                        <th>옵션</th>
                        <th>재고</th>
                    </tr>
                </thead>
                
                <%-- 상품 리스트 --%>
                <c:forEach var="dto" items="${ItemMgt }">
                    <tr>
                        <td>
                            <label class="checkbox-inline">
                            <input type="checkbox" name="item_id" value="${dto.item_id }" onclick="allChecked()">
                            </label>
                        </td>
                        <td><c:out value="${dto.item_id }"></c:out></td>
                         <td>
                            <a href="#" class="thumb">
                    		    <img alt="제품이미지" src="${dto.item_img_main }">
                            </a>
                        </td>
                        <td>${dto.item_name }</td>
                        <td>${dto.options_price }</td>
                        <td>${dto.category_id }</td>
                        <td>${dto.options_name } 
                            ${dto.options_value }</td>
                        <td>${dto.options_quantity }</td>

                </c:forEach>
            
            </table>
            
            
            <%-- 페이징 --%>
            <div class="paging">
                <button id="deleteButton">상품 삭제</button>
                <span class="prev">
                    <a href="#">< 이전</a>
                </span>
                <span class="num">
                    <a href="#" class="on">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">6</a>
                    <a href="#">7</a>
                </span>
                <span class="next">
                    <a href="#">다음 ></a>
                </span>
            </div>
        </section>
    </main>
    
    
    <%-- 공용 footer 시작 --%>
    <footer class="footer">
        <p>&copy; 2023 SSB Style</p>
    </footer>
    <%-- 공용 footer 끝 --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="../js/test.js"></script>
</body>
</html>
