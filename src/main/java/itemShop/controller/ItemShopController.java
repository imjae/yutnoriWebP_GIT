package itemShop.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import itemShop.bean.ItemShopDTO;
import itemShop.bean.PaymentHistoryDTO;
import user.bean.UserDTO;
import user.controller.UserService;

@Controller
public class ItemShopController {
	
	@Autowired
	private ItemShopService itemShopService;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/itemShop/mainShop.do")
	public ModelAndView mainShop(HttpServletRequest request) {
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		String category = request.getParameter("category");
		String order = request.getParameter("order");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("category", category);
		modelAndView.addObject("order", order);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("cateAdd", "../itemShop/itemShopList.do");

		modelAndView.setViewName("../itemShop/mainShop.jsp");
		return modelAndView;
	}

	
	@RequestMapping(value="/itemShop/itemShopList.do")
	public ModelAndView itemShopList(HttpServletRequest request) {
		int pg = Integer.parseInt(request.getParameter("pg"));
		String category = request.getParameter("category");
		String order = request.getParameter("order");
		
		if(order.equals("logtime")) {
			order += " desc";
		}else if(order.equals("item_charge_high")){
			order = "item_charge desc";
		}else {
			order += " asc";
		}
		
		int endNum = pg * 12;
		int startNum = endNum - 11;
		List<ItemShopDTO> list ;
		int totalA;
		
		if(category.equals("all")) {
			list = itemShopService.allItemShopList(startNum, endNum, order);
			totalA = itemShopService.getTotalA();
		}else {
			list = itemShopService.itemShopList(startNum, endNum, order, category);
			totalA = itemShopService.getCategoryA(category);
		}
		
		int totalP = (totalA + 11)/12;
		int startPage = (pg - 1)/3*3+1;
		int endPage = startPage + 2;
				
		if(endPage > totalP) {
			endPage = totalP;
		}
				
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("list", list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("category", category);
		modelAndView.setViewName("../itemShop/itemShopList.jsp");
		
		return modelAndView;
	}

	
	@RequestMapping(value="/itemShop/itemDetail.do")
	public ModelAndView itemDetail(HttpServletRequest request) {

		String category = request.getParameter("category");
		int pg = Integer.parseInt(request.getParameter("pg"));
		String item_code = request.getParameter("item_code");
		String order = request.getParameter("order");
		
		ItemShopDTO itemShopDTO = itemShopService.itemDetail(item_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("category", category);
		modelAndView.addObject("itemShopDTO", itemShopDTO);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("order", order);

		modelAndView.setViewName("../itemShop/itemDetail.jsp");
		return modelAndView;		
	}

	
	@RequestMapping(value="/itemShop/itemPayment.do")
	public ModelAndView itemPayment(HttpServletRequest request) {
		
		String item_code = request.getParameter("item_code");
		int ea = Integer.parseInt(request.getParameter("ea"));
		String user_id = String.valueOf(request.getSession().getAttribute("session_id"));
		ItemShopDTO itemShopDTO = itemShopService.itemDetail(item_code);
		
		
		int have = 0;
		/* 이미 가지고 있는 아이템인 경우 결제 안됨 */
		int endNum = userService.haveItemCount(user_id);
		List<PaymentHistoryDTO> list = userService.haveItemListAll(user_id, 1, endNum);
		for(int i=0;i<list.size();i++) {
			if( item_code.equals(list.get(i).getItem_code()) ) {
				have++;
			}
		}
		
		ModelAndView modelAndView = new ModelAndView();
		
		
		
		
		if(have>0) { // 이미 결제한 아이템인 경우
			modelAndView.addObject("status", "have");
			modelAndView.setViewName("../itemShop/mainShop.do?category=all&pg=1&order=logtime");
		}else {
			
			// 장바구니에 있는지 먼저 확인
			int checkCart = 0;
			checkCart = itemShopService.checkCart(user_id, item_code);
			int cartOut = 0;
			if(checkCart > 0) { // 장바구니에 이미 존재하므로 기존걸 삭제
				cartOut = itemShopService.deleteCart(user_id, item_code);
			}

			if(cartOut>0 || checkCart == 0) {
				// 장바구니에 넣기
				int cartIn = itemShopService.insertCart(user_id, item_code);
				if(cartIn>0) {
					modelAndView.addObject("ea", ea);
					modelAndView.addObject("itemShopDTO", itemShopDTO);
					modelAndView.setViewName("../itemShop/itemPayment.jsp");
				}else {// 넣기 실패 했을경우
					modelAndView.addObject("status", "failDel");
					modelAndView.setViewName("../itemShop/mainShop.do?category=all&pg=1&order=logtime");				
				}
				
			}else {// 삭제 실패 했을경우
				modelAndView.addObject("status", "failDel");
				modelAndView.setViewName("../itemShop/mainShop.do?category=all&pg=1&order=logtime");
			}
		}
		
		
		
		
		return modelAndView;	
		
	}
	
	
	@RequestMapping(value="/itemShop/itemPaymentSuccess.do")
	public ModelAndView itemPaymentSuccess(HttpServletRequest request) {
		int item_charge = Integer.parseInt(request.getParameter("item_charge"));
		String item_code = request.getParameter("item_code");
		HttpSession session = request.getSession();
		UserDTO userDTO = (UserDTO)session.getAttribute("session_dto");
		
		int suc = itemShopService.itemPaymentSuccess(item_charge, userDTO.getUser_id());
		int insertCount = userService.insertHistory(userDTO.getUser_id(), item_code);
		int user_cash = userDTO.getUser_cash();
		int cartOut = itemShopService.deleteCart(userDTO.getUser_id(), item_code);
		
		if(suc>0 && insertCount>0 && cartOut > 0) {	// 결제 완료되었고 장바구니에서 삭제완료			
			userDTO.setUser_cash(user_cash - item_charge);
			session.setAttribute("session_dto", userDTO);			
		}
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("cartOut", cartOut);
		modelAndView.addObject("suc", suc);
		modelAndView.addObject("insertCount", insertCount);
		modelAndView.addObject("payOK", "ok");
		modelAndView.addObject("item_charge", item_charge);
		modelAndView.addObject("user_cash", user_cash);
		
		modelAndView.setViewName("../itemShop/itemPayment.jsp");
		return modelAndView;
		
	}
	
	@RequestMapping(value="/itemShop/itemCart.do")
	public ModelAndView itemCart(HttpServletRequest request ) {
		String item_code = request.getParameter("item_code");
		String user_id = String.valueOf(request.getSession().getAttribute("session_id"));
		
		int have = 0;
		/* 이미 가지고 있는 아이템인 경우 결제 안됨 */
		int endNum = userService.haveItemCount(user_id);
		List<PaymentHistoryDTO> list = userService.haveItemListAll(user_id, 1, endNum);
		for(int i=0;i<list.size();i++) {
			if( item_code.equals(list.get(i).getItem_code()) ) {
				have++;
			}
		}
		
		ModelAndView modelAndView = new ModelAndView();
		
		// 장바구니에 있는지 먼저 확인
		int checkCart = 0;
		checkCart = itemShopService.checkCart(user_id, item_code);
		
		if(have>0) { // 이미 가진 아이템
			modelAndView.addObject("status", "have");
			modelAndView.setViewName("../itemShop/mainShop.do?category=all&pg=1&order=logtime");			
		}else if(checkCart>0) {	// 장바구니에 있는 아이템
			modelAndView.addObject("status", "carthave");
			modelAndView.setViewName("../itemShop/mainShop.do?category=all&pg=1&order=logtime");			
		}else { // 가지고 있지도 장바구니에도 없는 상태
			// 장바구니에 넣기
			int cartIn = itemShopService.insertCart(user_id, item_code);
			if(cartIn>0) {
				modelAndView.addObject("status", "cartIn");
				modelAndView.setViewName("../itemShop/mainShop.jsp");				
			}else {	// 넣기실패
				modelAndView.addObject("status", "failDel");
				modelAndView.setViewName("../itemShop/mainShop.do?category=all&pg=1&order=logtime");				
			}
		}
		
		return modelAndView;
		
	}
	

	@RequestMapping(value="/itemShop/itemShoppingCart.do")
	public ModelAndView itemShoppingCart(HttpServletRequest request ) {
		String user_id = String.valueOf(request.getSession().getAttribute("session_id"));
		
		List<ItemShopDTO> list = itemShopService.itemShoppingCart(user_id);
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("display", "shoppingCart");
		modelAndView.addObject("list", list);
		modelAndView.setViewName("../itemShop/mainShop.jsp");	
		
		return modelAndView;
		
	}
	
	
	
	@RequestMapping(value="/itemShop/itemShopPreview.do")
	public ModelAndView itemShopPreview() {
		List<ItemShopDTO> list = itemShopService.itemShopList(1, 6, "logtime desc", "character");
		int total = list.size();

		JSONObject json = new JSONObject();
		json.put("total", total);
		
		if(total > 0) {
			JSONArray items = new JSONArray();
			for(int i=0; i<list.size(); i++) {
				ItemShopDTO itemShopDTO = list.get(i);
				JSONObject temp = new JSONObject();
				temp.put("category", itemShopDTO.getCategory());
				temp.put("item_code", itemShopDTO.getItem_code());
				temp.put("item_img",itemShopDTO.getItem_img());
				items.put(i,temp);
			}
			json.put("items", items);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("json", json);
		modelAndView.setViewName("../itemShop/itemShopPreview_json.jsp");
		return modelAndView;
		
	}

	
	
}
