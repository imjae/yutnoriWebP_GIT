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
		
		ItemShopDTO itemShopDTO = itemShopService.itemDetail(item_code);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("ea", ea);
		modelAndView.addObject("itemShopDTO", itemShopDTO);
		
		modelAndView.setViewName("../itemShop/itemPayment.jsp");
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
		
		if(suc>0 && insertCount>0) {
			userDTO.setUser_cash(user_cash - item_charge);
			session.setAttribute("session_dto", userDTO);
			
		}
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("suc", suc);
		modelAndView.addObject("insertCount", insertCount);
		modelAndView.addObject("payOK", "ok");
		modelAndView.addObject("item_charge", item_charge);
		modelAndView.addObject("user_cash", user_cash);
		
		modelAndView.setViewName("../itemShop/itemPayment.jsp");
		return modelAndView;
		
	}
	
	
	@RequestMapping(value="/itemShop/itemShopPreview.do")
	public ModelAndView itemShopPreview() {
		List<ItemShopDTO> list = itemShopService.itemShopList(1, 7, "logtime desc", "character");
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
