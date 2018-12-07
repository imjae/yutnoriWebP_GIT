package phone.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mail.controller.GenerateCertCharacter;
import user.bean.UserDTO;

@Controller
public class SMSController {
	@RequestMapping(value = "/user/smsAuth_send.do", method=RequestMethod.POST)
	public ModelAndView sendSms(HttpServletRequest request) throws Exception {

		String api_key = "NCSDCEL7CY5B4FDO";
		String api_secret = "MIQRUQDMZNCSYSM50K1TBKGQVATYQLZZ";
		Coolsms coolsms = new Coolsms(api_key, api_secret);
		String name = request.getParameter("name");
		String phone1 = request.getParameter("user_phone1");
		String phone2 = request.getParameter("user_phone2");
		String phone3 = request.getParameter("user_phone3");
		String phone = phone1 + phone2 + phone3;
		
		UserDTO dto = new UserDTO();
		dto.setUser_name(name);
		dto.setUser_phone(phone);
		
		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", phone); // 수신번호
		System.out.println(phone);
		GenerateCertCharacter gcc = new GenerateCertCharacter();
		String authNum = gcc.excuteGenerate();
		
		String text = "@@@@@ 윷놀이 인증 번호 @@@@@ \r\n"
				+ name + "님의 "
				+ "인증번호는 ["+ authNum +"] "
						+ "입니다.\r\n 인증번호를 정확히 입력해 주세요 : )";
		
		set.put("from", phone); // 발신번호
		set.put("text", text); // 문자내용
		set.put("type", "sms"); // 문자 타입

		JSONObject result = coolsms.send(set); // 보내기&전송결과받기

		HttpSession session = request.getSession();
		session.removeAttribute("smsAuth_num");
		
		session.setAttribute("smsAuth_num", authNum);
		System.out.println(session.getAttribute("smsAuth_num"));
		session.setMaxInactiveInterval(180);
		
		/*if ((boolean) result.get("status") == true) {
			// 메시지 보내기 성공 및 전송결과 출력
			System.out.println("성공");
			System.out.println(result.get("group_id")); // 그룹아이디
			System.out.println(result.get("result_code")); // 결과코드
			System.out.println(result.get("result_message")); // 결과 메시지
			System.out.println(result.get("success_count")); // 메시지아이디
			System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
		} else {
			// 메시지 보내기 실패
			System.out.println("실패");
			System.out.println(result.get("code")); // REST API 에러코드
			System.out.println(result.get("message")); // 에러메시지
		}*/
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("id_pw_findPage.jsp?step=02");
		modelAndView.addObject("dto",dto);
		return modelAndView;
	}
}
