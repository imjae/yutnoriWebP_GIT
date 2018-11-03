package inform.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import inform.bean.NewsVO;


@Controller
public class NewsController {

	@Autowired
	private NewsService newsService;
	
	@RequestMapping(value = "/news/newsMainAll.do")
	public ModelAndView newsMain(HttpServletRequest request) {
		
		String str_pg = request.getParameter("pg");
		
		int pg = 1;
		if(str_pg != null) {
			pg = Integer.parseInt(str_pg);
		}
		
		int endNum = pg * 10;
		int startNum = endNum - 9;
		
		int totalA = newsService.getTotalAAll();
		int totalP = (totalA + 9) / 10;
		
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage + 2;
		if (endPage > totalP) {
			endPage = totalP;
		}
		
		NewsListDTO newsListDTO = new NewsListDTO();
		newsListDTO.setPg(pg);
		newsListDTO.setStartNum(startNum);
		newsListDTO.setEndNum(endNum);
		newsListDTO.setStartPage(startPage);
		newsListDTO.setEndPage(endPage);
		newsListDTO.setTotalA(totalA);
		newsListDTO.setTotalP(totalP);
		
		List<NewsVO> list = newsService.newsListAll(newsListDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("sector", "all");
		modelAndView.addObject("list", list);
		modelAndView.addObject("newsdto", newsListDTO);
		modelAndView.addObject("display", "../news/cnewsMain.jsp");
		
		modelAndView.setViewName("../main/index.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/news/newsViewMain.do")
	public ModelAndView newsViewMain(HttpServletRequest request) {
		
		int news_num = Integer.parseInt(request.getParameter("news_num"));
		
		NewsVO newsVO = newsService.newsView(news_num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("newsVO", newsVO);
		modelAndView.addObject("news_num", news_num);
		modelAndView.addObject("display", "../news/cnewsMain.jsp");
		modelAndView.addObject("display2", "../news/cnewsView.jsp");
		
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/news/newsWriteForm.do")
	public ModelAndView newsWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../news/newsWriteForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "/news/newsWrite.do", method = RequestMethod.POST)
	public ModelAndView newsWrite(HttpServletRequest request) {
		String sort = request.getParameter("sort");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// System.out.println(sort);
		// System.out.println(title);
		// System.out.println(content);
		
		NewsVO newsVO = new NewsVO();
		newsVO.setSort(sort);
		newsVO.setTitle(title);
		newsVO.setContent(content);
		
		int su = newsService.newsWrite(newsVO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("../news/newsWrite.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/news/newsListAll.do")
	public ModelAndView newsListAll(HttpServletRequest request) {
		String str_pg = request.getParameter("pg");
		
		int pg = 1;
		if(str_pg != null) {
			pg = Integer.parseInt(str_pg);
		}

		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		int totalA = newsService.getTotalAAll();
		int totalP = (totalA + 4) / 5;
		
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage + 2;
		if (endPage > totalP) {
			endPage = totalP;
		}
		
		
		NewsListDTO newsListDTO = new NewsListDTO();
		newsListDTO.setPg(pg);
		newsListDTO.setStartNum(startNum);
		newsListDTO.setEndNum(endNum);
		newsListDTO.setStartPage(startPage);
		newsListDTO.setEndPage(endPage);
		newsListDTO.setTotalA(totalA);
		newsListDTO.setTotalP(totalP);
		
		List<NewsVO> list = newsService.newsListAll(newsListDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("sector", "all");
		modelAndView.addObject("list", list);
		modelAndView.addObject("newsdto", newsListDTO);
		
		modelAndView.setViewName("../news/newsList.jsp");
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="/news/newsList.do")
	public ModelAndView newsList(HttpServletRequest request) {
		String str_pg = request.getParameter("pg");
		String sort = request.getParameter("sort");
		// System.out.println(sort);
		
		int pg = 1;
		if(str_pg != null) {
			pg = Integer.parseInt(str_pg);
		}

		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		int totalA = newsService.getTotalA(sort);
		// System.out.println(totalA);
		int totalP = (totalA + 4) / 5;
		
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage + 2;
		if (endPage > totalP) {
			endPage = totalP;
		}
		
		NewsListDTO newsListDTO = new NewsListDTO();
		newsListDTO.setPg(pg);
		newsListDTO.setSort(sort);
		newsListDTO.setStartNum(startNum);
		newsListDTO.setEndNum(endNum);
		newsListDTO.setStartPage(startPage);
		newsListDTO.setEndPage(endPage);
		newsListDTO.setTotalA(totalA);
		newsListDTO.setTotalP(totalP);
		
		List<NewsVO> list = newsService.newsList(newsListDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("sector", "sort");
		modelAndView.addObject("list", list);
		modelAndView.addObject("newsdto", newsListDTO);
		
		modelAndView.setViewName("../news/newsList.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/news/newsView.do")
	public ModelAndView newsView(HttpServletRequest request) {
		
		int news_num = Integer.parseInt(request.getParameter("news_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		NewsVO newsVO = newsService.newsView(news_num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("newsVO", newsVO);
		modelAndView.addObject("news_num", news_num);
		modelAndView.addObject("pg", pg);
		
		modelAndView.setViewName("../news/newsView.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/news/newsModifyForm.do")
	public ModelAndView newsModifyForm(HttpServletRequest request) {
		int news_num = Integer.parseInt(request.getParameter("news_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		NewsVO newsVO = new NewsVO();
		newsVO = newsService.newsView(news_num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("newsVO", newsVO);
		modelAndView.addObject("pg", pg);
		
		modelAndView.setViewName("../news/newsModifyForm.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/news/newsModify.do", method = RequestMethod.POST)
	public ModelAndView newsModify(HttpServletRequest request) {
		int news_num = Integer.parseInt(request.getParameter("news_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		NewsVO newsVO = new NewsVO();
		newsVO.setNews_num(news_num);
		newsVO.setTitle(title);
		newsVO.setContent(content);
		
		int su = newsService.newsModify(newsVO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.addObject("pg", pg);
		modelAndView.setViewName("../news/newsModify.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/news/newsDelete.do")
	public ModelAndView helpboardDelete(HttpServletRequest request) {
		int news_num = Integer.parseInt(request.getParameter("news_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int su = newsService.newsDelete(news_num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.addObject("pg", pg);
		
		modelAndView.setViewName("../news/newsDelete.jsp");
		
		return modelAndView;
	}
}
