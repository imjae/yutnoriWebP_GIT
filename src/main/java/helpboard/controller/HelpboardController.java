package helpboard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import helpboard.bean.HelpboardVO;

@Controller
public class HelpboardController {
	
	@Autowired
	private HelpboardService helpboardService;
	
	@RequestMapping(value = "/helpboardc/mytestForm.do")
	public ModelAndView myTesttttForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "../helpboardc/myTestttt.jsp");
		modelAndView.setViewName("../main/index.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "/helpboard/helpboardWriteForm.do")
	public ModelAndView helpboardWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display", "../helpboard/helpboardWriteForm.jsp");
		modelAndView.setViewName("../helpboard/helpboardWriteForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "/helpboard/helpboardWrite.do", method = RequestMethod.POST)
	public ModelAndView helpboardWrite(HttpServletRequest request) {
		String sort1 = request.getParameter("sort1");
		String sort2 = request.getParameter("sort2");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		HelpboardVO helpboardVO = new HelpboardVO();
		helpboardVO.setSort1(sort1);
		helpboardVO.setSort2(sort2);
		helpboardVO.setTitle(title);
		helpboardVO.setContent(content);
		
		int su = helpboardService.helpboardWrite(helpboardVO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("../helpboard/helpboardWrite.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/helpboard/helpboardListAllAdmin.do")
	public ModelAndView helpboardList(HttpServletRequest request) {
		String str_pg = request.getParameter("pg");
		
		int pg = 1;
		if(str_pg != null) {
			pg = Integer.parseInt(str_pg);
		}

		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		int totalA = helpboardService.getTotalAAllAdmin();
		int totalP = (totalA + 4) / 5;
		
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage + 2;
		if (endPage > totalP) {
			endPage = totalP;
		}
		
		HelpListDTO helpListDTO = new HelpListDTO();
		helpListDTO.setPg(pg);
		helpListDTO.setStartNum(startNum);
		helpListDTO.setEndNum(endNum);
		helpListDTO.setStartPage(startPage);
		helpListDTO.setEndPage(endPage);
		helpListDTO.setTotalA(totalA);
		helpListDTO.setTotalP(totalP);
		
		List<HelpboardVO> list = helpboardService.helpboardListAllAdmin(helpListDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("sector", "all");
		modelAndView.addObject("list", list);
		modelAndView.addObject("hldto", helpListDTO);
		
		modelAndView.setViewName("../helpboard/helpboardList.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/helpboard/helpboardListAdmin.do")
	public ModelAndView helpboardListAdmin(HttpServletRequest request) {
		String str_pg = request.getParameter("pg");
		String sort1 = request.getParameter("sort1");
		String sort2 = request.getParameter("sort2");
		System.out.println(sort1);
		System.out.println(sort2);
		
		int pg = 1;
		if(str_pg != null) {
			pg = Integer.parseInt(str_pg);
		}

		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		int totalA = helpboardService.getTotalA(sort1, sort2);
		System.out.println(totalA);
		int totalP = (totalA + 4) / 5;
		
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage + 2;
		if (endPage > totalP) {
			endPage = totalP;
		}
		
		HelpListDTO helpListDTO = new HelpListDTO();
		helpListDTO.setPg(pg);
		helpListDTO.setSort1(sort1);
		helpListDTO.setSort2(sort2);
		helpListDTO.setStartNum(startNum);
		helpListDTO.setEndNum(endNum);
		helpListDTO.setStartPage(startPage);
		helpListDTO.setEndPage(endPage);
		helpListDTO.setTotalA(totalA);
		helpListDTO.setTotalP(totalP);
		
		///////////////////////////
		
		List<HelpboardVO> list = helpboardService.helpboardListAll(helpListDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("sector", "sort");
		modelAndView.addObject("list", list);
		modelAndView.addObject("hldto", helpListDTO);
		
		modelAndView.setViewName("../helpboard/helpboardList.jsp");
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="/helpboard/helpboardView.do")
	public ModelAndView helpboardView(HttpServletRequest request) {
		
		int helpboard_num = Integer.parseInt(request.getParameter("helpboard_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		// BoardDAO boardDAO = new BoardDAO();
		HelpboardVO helpboardVO = helpboardService.helpboardView(helpboard_num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("helpboardVO", helpboardVO);
		modelAndView.addObject("helpboard_num", helpboard_num);
		modelAndView.addObject("pg", pg);
		
		modelAndView.setViewName("../helpboard/helpboardView.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/helpboard/helpboardDelete.do")
	public ModelAndView helpboardDelete(HttpServletRequest request) {
		int helpboard_num = Integer.parseInt(request.getParameter("helpboard_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		// DB
		// BoardDAO boardDAO = new BoardDAO();
		int su = helpboardService.helpboardDelete(helpboard_num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.addObject("pg", pg);
		
		modelAndView.setViewName("../helpboard/helpboardDelete.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/helpboard/helpboardModifyForm.do")
	public ModelAndView helpboardModifyForm(HttpServletRequest request) {
		int helpboard_num = Integer.parseInt(request.getParameter("helpboard_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		// DB
		// BoardDAO boardDAO = new BoardDAO();
		HelpboardVO helpboardVO = new HelpboardVO();
		helpboardVO = helpboardService.helpboardView(helpboard_num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("helpboardVO", helpboardVO);
		modelAndView.addObject("pg", pg);
		
		modelAndView.setViewName("../helpboard/helpboardModifyForm.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/helpboard/helpboardModify.do", method = RequestMethod.POST)
	public ModelAndView helpboardModify(HttpServletRequest request) {
		int helpboard_num = Integer.parseInt(request.getParameter("helpboard_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		HelpboardVO helpboardVO = new HelpboardVO();
		helpboardVO.setHelpboard_num(helpboard_num);
		helpboardVO.setTitle(title);
		helpboardVO.setContent(content);
		
		int su = helpboardService.helpboardModify(helpboardVO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("../helpboard/helpboardModify.jsp");
		
		return modelAndView;
	}

	//////////////////////////////////////////////////////////////////////////
	
	// client 
	
	@RequestMapping(value="/helpboardc/helpboardListAll.do")
	public ModelAndView clientHelpboardList(HttpServletRequest request) {
		String sort1 = request.getParameter("sort1");
		String sort2 = request.getParameter("sort2");
		String str_pg = request.getParameter("pg");
		
		int pg = 1;
		if(str_pg != null) {
			pg = Integer.parseInt(str_pg);
		}

		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		int totalA = helpboardService.getTotalA(sort1, sort2);
		int totalP = (totalA + 4) / 5;
		
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage + 2;
		if (endPage > totalP) {
			endPage = totalP;
		}
		
		HelpListDTO helpListDTO = new HelpListDTO();
		helpListDTO.setPg(pg);
		helpListDTO.setSort1(sort1);
		helpListDTO.setSort2(sort2);
		helpListDTO.setStartNum(startNum);
		helpListDTO.setEndNum(endNum);
		helpListDTO.setStartPage(startPage);
		helpListDTO.setEndPage(endPage);
		helpListDTO.setTotalA(totalA);
		helpListDTO.setTotalP(totalP);
		
		List<HelpboardVO> list = helpboardService.helpboardListAll(helpListDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("hldto", helpListDTO);
		modelAndView.addObject("display", "../helpboardc/myTestttt.jsp");
		modelAndView.addObject("display2", "../helpboardc/helpBody.jsp");
		
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;
	}

	
}
