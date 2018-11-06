package user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import itemShop.bean.PaymentHistoryDTO;
import rank.bean.PreviewDTO;
import user.bean.UserDTO;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login/userLogin.do")
	public ModelAndView userLogin(HttpServletRequest request) {

		String user_id = request.getParameter("id");
		String user_password = request.getParameter("pw");

		System.out.println(user_id + "," + user_password);

		UserDTO dto = new UserDTO();
		dto.setUser_id(user_id);
		dto.setUser_password(user_password);

		dto = userService.userLogin(dto);

		HttpSession session = request.getSession();
		ModelAndView modelAndView = new ModelAndView();

		if (dto == null) {
			// 아이디 비밀번호 불일치
			System.out.println("로그인 실패");
			modelAndView.setViewName("../login/loginPage.jsp");
		} else {
			// 로그인 성공.
			session.setAttribute("session_id", user_id);
			session.setAttribute("session_name", dto.getUser_name());
			session.setAttribute("session_dto", dto);
			modelAndView.addObject("dto", dto);
			System.out.println("로그인 성공");
			modelAndView.setViewName("../main/index.jsp");
		}

		return modelAndView;
	}

	@RequestMapping(value = "/main/signOut.do")
	public ModelAndView signOut(HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.removeAttribute("session_id");
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("index.jsp");

		return modelAndView;
	}

	@RequestMapping(value = "/main/myPage.do")
	public ModelAndView myPage_go(HttpServletRequest request) {

		String url = request.getParameter("dis");

		if (url == null) {
			url = "../user/userInfo_page.jsp";
		}

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("display", "../user/userInfo_title.jsp");
		modelAndView.addObject("userInfo_page_url", url);

		modelAndView.setViewName("../main/index.jsp");

		return modelAndView;

		// index.jsp?display=
	}

	@RequestMapping(value = "/user/user_modify.do")
	public ModelAndView userModify(HttpServletRequest request) {

		String password = request.getParameter("re_pw1");
		String id = (String) request.getSession().getAttribute("session_id");

		UserDTO dto = new UserDTO();
		dto.setUser_password(password);
		dto.setUser_id(id);

		int modifyCount = userService.userModify(dto);

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("modifyCount", modifyCount);
		modelAndView.addObject("userInfo_page_url", "../user/userInfo_page.jsp");
		modelAndView.addObject("display", "../user/userInfo_title.jsp");
		modelAndView.setViewName("../main/index.jsp");

		return modelAndView;
	}

	@RequestMapping(value = "/user/idPwFind_final.do")
	public ModelAndView idPwFind(HttpServletRequest request) {

		String name = request.getParameter("name");
		String phone = request.getParameter("phone");

		StringBuilder b = new StringBuilder(phone);
		b.insert(3, "-");
		b.insert(8, "-");

		phone = b.toString();
		System.out.println(phone + "<---sdfsdfasdf-s");

		System.out.println(name + "," + phone + "<!@#!@#!@#");

		UserDTO dto = new UserDTO();
		dto.setUser_name(name);
		dto.setUser_phone(phone);

		UserDTO tmp_dto = userService.findIdPwSelect(dto);

		System.out.println(tmp_dto.getUser_id() + "<-----");

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("id", tmp_dto.getUser_id());
		modelAndView.addObject("pw", tmp_dto.getUser_password());
		modelAndView.setViewName("../user/id_pw_findPage.jsp?step=03");

		return modelAndView;
	}

	@RequestMapping(value = "/user/sign_final.do")
	public ModelAndView signUp_auth(HttpServletRequest request) {

		String id = request.getParameter("user_id");
		String password = request.getParameter("user_password");
		String name = request.getParameter("user_name");
		String jumin = request.getParameter("user_jumin");
		String gender = request.getParameter("user_gender");
		String phone = request.getParameter("user_phone");

		System.out.println(phone + "<--");

		UserDTO dto = new UserDTO();
		dto.setUser_id(id);
		dto.setUser_password(password);
		dto.setUser_jumin(jumin);
		dto.setUser_name(name);
		dto.setUser_gender(gender);
		dto.setUser_phone(phone);

		userService.userSignUp(dto);

		request.getSession().removeAttribute("authNum");

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("signUp.jsp?step=signUp_step04");
		modelAndView.addObject("dto", dto);

		return modelAndView;
	}

	@RequestMapping(value = "/user/userIdCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String userIdCheck(HttpServletRequest request) {

		String id = request.getParameter("id");
		int count = userService.userIdCheck(id);

		return String.valueOf(count);
	}

	@RequestMapping(value = "/user/userPwCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String userPwCheck(HttpServletRequest request) {

		String id = (String) request.getSession().getAttribute("session_id");
		String pw = request.getParameter("pw");

		UserDTO dto = new UserDTO();
		dto.setUser_id(id);
		dto.setUser_password(pw);

		String result = "";

		UserDTO tmp_dto = userService.userIdPwCheck(dto);

		if (tmp_dto == null) {
			result = "X";
		} else {
			result = "O";
		}

		return result;
	}

	@RequestMapping(value = "/user/userIdPwCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String userIdPwCheck(HttpServletRequest request) {

		String id = request.getParameter("id");
		String password = request.getParameter("pw");

		System.out.println(id + "," + password);

		int id_count = userService.userIdCheck(id);
		int pw_count = userService.userPwCheck(password);

		int qwert = id_count + pw_count;
		System.out.println(qwert);

		String result = "";

		if (qwert >= 2) {
			result = "O";
		} else {
			result = "X";
		}

		return result;
	}

	@RequestMapping(value = "/user/userNameJuminCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String userNameJuminCheck(HttpServletRequest request) {

		String name = request.getParameter("name");
		String jumin1 = request.getParameter("jumin1");
		String jumin2 = request.getParameter("jumin2");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");

		String jumin = jumin1 + "-" + jumin2;
		String phone = phone1 + "-" + phone2 + "-" + phone3;

		UserDTO dto = new UserDTO();
		dto.setUser_name(name);
		dto.setUser_jumin(jumin);
		dto.setUser_phone(phone);

		System.out.println(name + "," + jumin + "," + phone);

		int name_count = userService.userNameCheck(name);
		int jumin_count = userService.userJuminCheck(jumin);
		int phone_count = userService.userPhoneCheck(phone);

		int qwert = name_count + jumin_count + phone_count;

		String result = "";

		if (qwert == 3) {
			result = "O";
		} else {
			result = "X";
		}

		return result;
	}

	@RequestMapping(value = "/user/have_itemList.do", method = { RequestMethod.POST })
	public ModelAndView have_itemList(HttpServletRequest request) {
		String category = request.getParameter("category");
		String user_id = String.valueOf(request.getSession().getAttribute("session_id"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		// 페이징 처리

		System.out.println(category + "  " + user_id + "  " + pg);

		int startNum = 0;
		int endNum = 0;
		if (pg == 1) {
			startNum = 1;
			endNum = 20;
		} else {
			startNum = 21;
			endNum = 40;
		}
		// (2) DB
		List<PaymentHistoryDTO> list = null;

		if (category.equals("total")) {
			list = userService.haveItemListAll(user_id, startNum, endNum);
		} else {
			list = userService.haveItemList(category, user_id, startNum, endNum);
		}

		int totalA = list.size();

		int su = 20 - totalA % 20;
		String rt = null;
		int total = list.size(); // 조회된 데이터 수

		if (total >= 0) {
			rt = "OK";
		} else {
			rt = "FAIL";
		}

		JSONObject json = new JSONObject();
		json.put("rt", rt);
		json.put("total", total);

		if (total > 0) {
			JSONArray items = new JSONArray();
			for (int i = 0; i < list.size(); i++) {
				PaymentHistoryDTO paymentHistoryDTO = list.get(i);

				JSONObject temp = new JSONObject();
				temp.put("category", paymentHistoryDTO.getCategory());
				temp.put("item_code", paymentHistoryDTO.getItem_code());
				temp.put("item_name", paymentHistoryDTO.getItem_name());
				temp.put("item_content", paymentHistoryDTO.getItem_content());
				temp.put("item_img", paymentHistoryDTO.getItem_img());
				temp.put("item_charge", paymentHistoryDTO.getItem_charge());
				temp.put("pay_log", paymentHistoryDTO.getPay_log());
				temp.put("su", su);
				items.put(i, temp);
			}
			json.put("items", items);
		} else if (total == 0) {
			JSONArray items = new JSONArray();

			JSONObject temp = new JSONObject();

			temp.put("su", 19);
			items.put(0, temp);

			json.put("items", items);
		}

		System.out.println(json);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userInfo_page_url", "../user/charInfo_page.jsp");
		modelAndView.addObject("display", "../user/userInfo_title.jsp");
		modelAndView.addObject("list", list);
		modelAndView.addObject("startNum", startNum);
		modelAndView.addObject("endNum", endNum);
		modelAndView.addObject("su", su);
		modelAndView.addObject("json", json);

		modelAndView.setViewName("../user/item_list_json.jsp");
		return modelAndView;

		/////////////////////////////////////////////////

	}

	@RequestMapping(value = "/user/cashCharge.do")
	public ModelAndView cashCharge(HttpServletRequest request) {

		String charge_price = request.getParameter("cash_input");
		int price = Integer.parseInt(charge_price);
		String id = String.valueOf(request.getSession().getAttribute("session_id"));

		HttpSession session = request.getSession();

		UserDTO dto = (UserDTO) session.getAttribute("session_dto");
		int cur_cash = dto.getUser_cash();

		int charge_count = userService.cashCharge(id, price);

		if (charge_count > 0) {
			dto.setUser_cash(cur_cash + price);
			session.setAttribute("session_dto", dto);
		}

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("userInfo_page_url", "../user/cashCharge_result.jsp");
		modelAndView.addObject("display", "../user/userInfo_title.jsp");
		modelAndView.addObject("charge_price", price);
		modelAndView.addObject("charge_count", charge_count);
		modelAndView.setViewName("../main/index.jsp");

		return modelAndView;
	}

}
