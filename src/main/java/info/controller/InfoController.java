package info.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InfoController {

	@RequestMapping(value="/info/infoTotal.do")
	public ModelAndView total(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("display","../info/infoInfo_title.jsp");
		modelAndView.addObject("infoInfo_page_url", "../info/mean.jsp");
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/info/info_controll.do")
	public ModelAndView controll(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("display","../info/infoInfo_title.jsp");
		modelAndView.addObject("infoInfo_page_url", "../info/controll.jsp");
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="/info/info_download.do")
	public ModelAndView download(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("display", "../info/infoInfo_title.jsp");
		modelAndView.addObject("infoInfo_page_url", "../info/download.jsp");
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="/info/info_screenset.do")
	public ModelAndView screenset(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("display", "../info/infoInfo_title.jsp");
		modelAndView.addObject("infoInfo_page_url", "../info/screenset.jsp");
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;
	}
	@RequestMapping(value="/info/info_mean.do")
	public ModelAndView mean(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("display", "../info/infoInfo_title.jsp");
		modelAndView.addObject("infoInfo_page_url", "../info/mean.jsp");
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;
	}
}
