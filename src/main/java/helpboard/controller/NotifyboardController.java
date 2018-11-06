package helpboard.controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import helpboard.bean.NotifyboardVO;

@Controller
public class NotifyboardController {

	@Autowired
	private NotifyboardService notifyboardService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	// �Ű��ϱ� �Խ��� (�����)
	@RequestMapping(value = "/helpboardc/helpboardNotifyForm.do")
	public ModelAndView helpboardNotifyForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "../helpboardc/myTestttt.jsp");
		modelAndView.addObject("display2", "../helpboardc/notifyForm.jsp");
		modelAndView.setViewName("../main/index.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "/helpboardc/helpboardNotify.do")
	public ModelAndView helpboardNotify(HttpServletRequest request) {
		String notify_sort = request.getParameter("notify_sort");
		// HttpSession session = request.getSession();
		// String reporter_id = (String)session.getAttribute("session_id");
		
		// �ӽ� �̸��� �ڵ� �Է�
		String reporter_id = "iris9469@naver.com";
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		NotifyboardVO notifyboardVO = new NotifyboardVO();
		notifyboardVO.setNotify_sort(notify_sort);
		notifyboardVO.setReporter_id(reporter_id);
		notifyboardVO.setTitle(title);
		notifyboardVO.setContent(content);
		int su = notifyboardService.notifyboardWrite(notifyboardVO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.addObject("display", "../helpboardc/myTestttt.jsp");
		modelAndView.setViewName("../main/index.jsp");
		return modelAndView;
	}
	
	/////////////////////////////////////////////////
	// �Ű��ϱ� �Խ���(������)
	@RequestMapping(value="/helpboard/notifyboardListAll.do")
	public ModelAndView notifyboardListAll(HttpServletRequest request) {
		String str_pg = request.getParameter("pg");
		
		int pg = 1;
		if(str_pg != null) {
			pg = Integer.parseInt(str_pg);
		}

		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		int totalA = notifyboardService.notifyGetTotalAAll();
		int totalP = (totalA + 4) / 5;
		
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage + 2;
		if (endPage > totalP) {
			endPage = totalP;
		}
		
		NotifyListDTO notifyListDTO = new NotifyListDTO();
		notifyListDTO.setPg(pg);
		notifyListDTO.setStartNum(startNum);
		notifyListDTO.setEndNum(endNum);
		notifyListDTO.setStartPage(startPage);
		notifyListDTO.setEndPage(endPage);
		notifyListDTO.setTotalA(totalA);
		notifyListDTO.setTotalP(totalP);
		
		List<NotifyboardVO> list = notifyboardService.notifyboardListAll(notifyListDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("sector", "all");
		modelAndView.addObject("list", list);
		modelAndView.addObject("nldto", notifyListDTO);
		
		modelAndView.setViewName("../helpboard/notifyboardList.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/helpboard/notifyboardList.do")
	public ModelAndView notifyboardList(HttpServletRequest request) {
		String str_pg = request.getParameter("pg");
		String notify_sort = request.getParameter("notify_sort");

		int pg = 1;
		if(str_pg != null) {
			pg = Integer.parseInt(str_pg);
		}

		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		int totalA = notifyboardService.notifyGetTotalA(notify_sort);
		System.out.println(totalA);
		int totalP = (totalA + 4) / 5;
		
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage + 2;
		if (endPage > totalP) {
			endPage = totalP;
		}
		
		NotifyListDTO notifyListDTO = new NotifyListDTO();
		notifyListDTO.setPg(pg);
		notifyListDTO.setNotify_sort(notify_sort);;
		notifyListDTO.setStartNum(startNum);
		notifyListDTO.setEndNum(endNum);
		notifyListDTO.setStartPage(startPage);
		notifyListDTO.setEndPage(endPage);
		notifyListDTO.setTotalA(totalA);
		notifyListDTO.setTotalP(totalP);
		
		List<NotifyboardVO> list = notifyboardService.notifyboardList(notifyListDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("sector", "sort");
		modelAndView.addObject("list", list);
		modelAndView.addObject("nldto", notifyListDTO);
		
		modelAndView.setViewName("../helpboard/notifyboardList.jsp");
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="/helpboard/notifyboardView.do")
	public ModelAndView notifyboardView(HttpServletRequest request) {
		
		int notifyboard_num = Integer.parseInt(request.getParameter("notifyboard_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		// BoardDAO boardDAO = new BoardDAO();
		NotifyboardVO notifyboardVO = notifyboardService.notifyboardView(notifyboard_num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("notifyboardVO", notifyboardVO);
		modelAndView.addObject("notifyboard_num", notifyboard_num);
		modelAndView.addObject("pg", pg);
		
		modelAndView.setViewName("../helpboard/notifyboardView.jsp");
		
		return modelAndView;
	}
	
	//////////////////////////////////////////////////
	// ȸ�ſ� ���� ����
	@RequestMapping(value = "/helpboard/mailForm.do")
	public ModelAndView mailForm(HttpServletRequest request) {
		String tomail = request.getParameter("tomail");
		int notifyboard_num = Integer.parseInt(request.getParameter("notifyboard_num"));
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("tomail", tomail);
		modelAndView.addObject("notifyboard_num", notifyboard_num);
		modelAndView.setViewName("../helpboard/mailForm.jsp");

		return modelAndView;
	}
	
	@RequestMapping(value = "/mail/mailSending.do")
	public String mailSending(HttpServletRequest request) {
		
		int notifyboard_num = Integer.parseInt(request.getParameter("notifyboard_num"));
		
		String setFrom = "iris9469@gmail.com";
		String tomail = request.getParameter("tomail");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setFrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
			
			notifyboardService.notifyboardRespondDone(notifyboard_num);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return "../helpboard/notifyboardListAll.do";
	}
}
