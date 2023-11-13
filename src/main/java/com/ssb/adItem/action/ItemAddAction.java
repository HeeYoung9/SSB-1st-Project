package com.ssb.adItem.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.adItem.db.ItemDAO;
import com.ssb.adItem.db.ItemDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class ItemAddAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("\t M : ItemAddAction_execute() 호출 ");

        // 한글 처리 (생략 -> 필터 설정)
        // request.setCharacterEncoding("UTF-8");

        ItemDTO dto = new ItemDTO();
        dto.setItem_name(request.getParameter("item_name"));
        dto.setItem_price(Integer.parseInt(request.getParameter("item_price"))); // 기존 가격(옵션테이블) -> (아이템테이블)
        dto.setItem_img_main(request.getParameter("item_img_main"));
        dto.setItem_img_sub(request.getParameter("item_img_sub"));
        dto.setItem_img_logo(request.getParameter("item_img_logo"));

        // 기존의 카테고리 정보
        int categoryCode =  Integer.parseInt(request.getParameter("category_code"));
        String categorySport = request.getParameter("category_sport");
        String categoryMajor = request.getParameter("category_major");
        String categorySub = request.getParameter("category_sub");
        String categoryBrand = request.getParameter("category_brand");

        // 기존의 카테고리 ID 찾기
        ItemDAO idao = new ItemDAO();

        int categoryId = idao.findCategoryId(categorySport, categoryMajor, categorySub, categoryBrand, categoryCode);
        
        dto.setCategory_id(categoryId);

        dto.setCategory_code(categoryCode);
        dto.setCategory_sport(categorySport);
        dto.setCategory_major(categoryMajor);
        dto.setCategory_sub(categorySub);
        dto.setCategory_brand(categoryBrand);

        dto.setOptions_name(request.getParameter("options_name"));
        dto.setOptions_value(request.getParameter("options_value"));
        dto.setOptions_quantity(Integer.parseInt(request.getParameter("options_quantity")));

        // ItemDAO 객체 생성 - 상품 등록 메서드
        idao.addItem(dto);

        // 페이지 이동 준비
        ActionForward forward = new ActionForward();
        forward.setPath("./ItemMgt.it");
        forward.setRedirect(true);

        return forward;
    }
}
