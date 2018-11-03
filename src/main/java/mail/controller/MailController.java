package mail.controller;

import java.util.Calendar;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import user.bean.UserDTO;

@Controller
public class MailController {

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value = "/user/sign_mail.do")
	public ModelAndView sendMail(HttpServletRequest request) {
		ModelAndView modelAndView = null;
		UserDTO dto = new UserDTO();

		String id = request.getParameter("user_id");
		String password = request.getParameter("user_password");
		String name = request.getParameter("user_name");
		String jumin = request.getParameter("user_jumin1") + "-" + request.getParameter("user_jumin2");
		String gender = "";
		int su = Integer.parseInt(request.getParameter("user_jumin2").substring(0, 1));
		String phone = request.getParameter("user_phone1")+"-"+request.getParameter("user_phone2")+"-"+request.getParameter("user_phone3");
		if (su % 2 == 0) {
			gender = "F";
		} else {
			gender = "M";
		}
		
		dto.setUser_id(id);
		dto.setUser_password(password);
		dto.setUser_jumin(jumin);
		dto.setUser_name(name);
		dto.setUser_gender(gender);
		dto.setUser_phone(phone);
		
		GenerateCertCharacter gcc = new GenerateCertCharacter();
		String authNum = gcc.excuteGenerate();
		
		String content = 
				" 인증 메일 입니다. \r\n " + name + " 님 의 "
				+ "인증번호 : " + authNum + "\r\n"+
				"홈페이지로 돌아가 인증번호를 입력해주세요.";
				
		String subject = "@@@@@@@@@@@ 윷노리 인증 메일 @@@@@@@@@@@";
		String setfrom = "jakeim1111@gmail.com";
		
		try {
			
			//String tomail = request.getParameter(id); // 받는 사람 이메일
			//String title = request.getParameter("test 메일 발송"); // 제목
			//String content = request.getParameter("test 메일 내용"); // 내용

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(id); // 받는사람 이메일
			messageHelper.setSubject(subject); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		HttpSession session = request.getSession();
		session.setAttribute("authNum", authNum);
		session.setMaxInactiveInterval(60*60*3);
		
		Calendar cal = Calendar.getInstance();/*
        java.util.Date date = calendar.getTime();
        int hour = date.getHours()+3;*/
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int min = cal.get(Calendar.MINUTE);
		int sec = cal.get(Calendar.SECOND);
		
		String month_s = month+"";
		String day_s = day+"";
		String min_s = min+"";
		String hour_s = hour+"";
		String sec_s = sec+"";
		
		//System.out.println(min +" , "+ day + "<------");
		
		String today = "";
		if((hour+3) > 24) {
			hour = (hour+3) - 24;
			day = (day+1);
		}
		if(month<10) { month_s = "0"+month;} 
		if(day<10) { day_s = "0"+day; }
		if(hour<10) { month_s = "0"+month;} 
		if(min<10) { day_s = "0"+day; }
		if(sec<10) { sec_s = "0"+sec; }
		
		System.out.println(min_s +" , "+ day_s + "<------");
		
		today = year+"-"+month_s+"-"+day_s+" " +
     			hour_s+":"+min_s+":"+sec_s;
		 
		modelAndView = new ModelAndView();
		modelAndView.addObject("dto", dto);
		modelAndView.addObject("today",today);
		modelAndView.setViewName("signUp.jsp?step=signUp_step03");
		
		return modelAndView;
	}
	
	
	
}
