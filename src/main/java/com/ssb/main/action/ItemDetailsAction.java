package com.ssb.main.action;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssb.adItem.db.ItemDAO;
import com.ssb.adItem.db.ItemDTO;
import com.ssb.util.Action;
import com.ssb.util.ActionForward;

public class ItemDetailsAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    System.out.println(" M : ItemDetailAction_execute() 호출! ");

	    int item_id = Integer.parseInt(request.getParameter("item_id"));

	    ItemDAO idao = new ItemDAO();
	    ItemDTO itemDTO = idao.getItem(item_id);

	    ArrayList getOptList = new com.ssb.adItem.db.ItemDAO().getOptList(item_id);
	    request.setAttribute("getOptList", getOptList);

	    request.setAttribute("itemDTO", itemDTO);

	    ActionForward forward = new ActionForward();
	    forward.setPath("/saleItem/itemDetails.jsp");
	    forward.setRedirect(false);

	    return forward;
	}
}
