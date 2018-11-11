package rank.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.functors.EqualPredicate;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import rank.bean.MoneyRankDTO;
import rank.bean.PreviewDTO;
import rank.bean.RankDTO;
import user.bean.UserEquipDTO;
import user.controller.UserService;

@Controller
public class RankController {
	@Autowired
	private RankService rankService;
<<<<<<< HEAD

	@RequestMapping(value = "/rank/yutnoriiiRankList.do")
=======
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/rank/yutnoriiiRankList.do")
>>>>>>> 5b49dfba5b144e1b9dc8cb48208e1279c2b14922
	public ModelAndView yutnoriiiRankList(HttpServletRequest request) {
		// (1) 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		// 목록수 : 10개씩
		int endNum = pg * 8;
		int startNum = endNum - 7;
		// (2) DB
		List<RankDTO> list = rankService.rankList(startNum, endNum);
		
<<<<<<< HEAD
		List<RankDTO> new_list = new ArrayList<RankDTO>();

		Iterator<RankDTO> it = list.iterator();

		RankDTO rankDTO = null;
		while (it.hasNext()) {
			rankDTO = it.next();
			System.out.println(rankDTO.getEqu_character()+"<---- 캐릭터 장착ㄱ아럼니;ㅇ라ㅓㅁ니;ㅇ럼ㄴ이;ㅏ러");
			String[] charArr = rankDTO.getEqu_character().split("_");

			rankDTO.setEqu_character(charArr[1]);
			new_list.add(rankDTO);
		}

=======
		
		
>>>>>>> 5b49dfba5b144e1b9dc8cb48208e1279c2b14922
		// 페이징 처리
		int totalA = rankService.getTotalA(); // 총글수 = 43
		int totalP = (totalA + 9) / 10; // 총페이지수 = 9
		int startPage = (pg - 1) / 3 * 3 + 1;
		int endPage = startPage + 2;
		if (endPage > totalP)
			endPage = totalP;
		// (3) 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("list", new_list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("display", "../rank/rankInfo.jsp");
		modelAndView.addObject("rank_page_url", "../rank/yutnoriiiRankList.jsp");
		modelAndView.setViewName("../main/index.jsp");
		return modelAndView;

	}

	@RequestMapping(value = "/rank/rankPreview.do")
	public ModelAndView rankPreview(HttpServletRequest request) {
		// (1) 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		// 목록수 : 5개씩
		int endNum = pg * 5;
		int startNum = endNum - 4;
		// (2) DB
		List<PreviewDTO> list = rankService.rankPreview(startNum, endNum);

		String rt = null;
		int total = list.size(); // 조회된 데이터 수

		if (total > 0) {
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
				PreviewDTO previewDTO = list.get(i);

				JSONObject temp = new JSONObject();
				temp.put("name", previewDTO.getName());
				temp.put("rank", previewDTO.getRank());
				temp.put("win", previewDTO.getWin());
				temp.put("lose", previewDTO.getLose());
				items.put(i, temp);
			}
			json.put("items", items);
		}

		// System.out.println(json);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("json", json);
		modelAndView.setViewName("../main/index_json.jsp");
		return modelAndView;

		/*
		 * // 페이징 처리 int totalA = rankService.getTotalA(); // 총글수 = 43 int totalP =
		 * (totalA + 4) / 5; // 총페이지수 = 9 int startPage = (pg-1)/3*3+1; int endPage =
		 * startPage + 2; if(endPage > totalP) endPage = totalP; // (3) 화면 네비게이션
		 * ModelAndView modelAndView = new ModelAndView(); modelAndView.addObject("pg",
		 * pg); modelAndView.addObject("list", list);
		 * modelAndView.addObject("startPage", startPage);
		 * modelAndView.addObject("endPage", endPage); modelAndView.addObject("totalP",
		 * totalP); modelAndView.addObject("display", "../rank/rankPreview.jsp");
		 * 
		 * 
		 * modelAndView.setViewName("../main/index.jsp"); return modelAndView;
		 */

	}

	@RequestMapping(value = "/rank/MoneyRankList.do")
	public ModelAndView MoneyRankList(HttpServletRequest request) {
		// (1) 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		// 목록수 : 10개씩
		int endNum = pg * 10;
		int startNum = endNum - 9;
		// (2) DB
		List<MoneyRankDTO> list = rankService.MoneyRankList(startNum, endNum);

		List<MoneyRankDTO> new_list = new ArrayList<MoneyRankDTO>();

		Iterator<MoneyRankDTO> it = list.iterator();

		MoneyRankDTO rankDTO = null;
		while (it.hasNext()) {
			rankDTO = it.next();

			String[] charArr = rankDTO.getEqu_character().split("_");

			rankDTO.setEqu_character(charArr[1]);
			new_list.add(rankDTO);
		}

		// 페이징 처리
		int totalA = rankService.getTotalA(); // 총글수 = 43
		int totalP = (totalA + 9) / 10; // 총페이지수 = 9
		int startPage = (pg - 1) / 3 * 3 + 1;
		int endPage = startPage + 2;
		if (endPage > totalP)
			endPage = totalP;

		// (3) 화면 네비게이션
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("list", new_list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("rank_page_url", "../rank/MoneyRankList.jsp");
		modelAndView.addObject("display", "../rank/rankInfo.jsp");
		modelAndView.setViewName("../main/index.jsp");

		return modelAndView;

	}

	@RequestMapping(value = "/rank/RankList.do", produces = "text/plain;charset=UTF-8")
	public ModelAndView RankList(HttpServletRequest request) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		String searchOption = request.getParameter("searchOption");
		String keyword = request.getParameter("keyword");

		int pgg = Integer.parseInt(request.getParameter("pgg"));

		System.out.println(pgg);
		// 목록수 : 10개씩
		int endNumm = pgg * 10;
		int startNumm = endNumm - 9;
		// (2) DB
		List<RankDTO> listAll = rankService.listAll(searchOption, keyword, startNumm, endNumm);
		// 페이징 처리
		List<RankDTO> new_list = new ArrayList<RankDTO>();

		Iterator<RankDTO> it = listAll.iterator();

		RankDTO rankDTO = null;
		while (it.hasNext()) {
			rankDTO = it.next();

			String[] charArr = rankDTO.getEqu_character().split("_");

			rankDTO.setEqu_character(charArr[1]);
			new_list.add(rankDTO);
		}
		int countArticle = rankService.getcountArticle(searchOption, keyword, startNumm, endNumm); // 총글수 = 43

		System.out.println(countArticle);

		int totalPP = (countArticle + 9) / 10; // 총페이지수 = 9
		int startPagee = (pgg - 1) / 3 * 3 + 1;
		int endPagee = startPagee + 2;
		if (endPagee > totalPP)
			endPagee = totalPP;

		System.out.println(searchOption + "," + keyword);
		System.out.println(startPagee + "," + endPagee + "," + totalPP);

		// 화면 네비게이션
		ModelAndView modelAndVieww = new ModelAndView();

		modelAndVieww.addObject("pgg", pgg);
		modelAndVieww.addObject("listAll", new_list);
		modelAndVieww.addObject("countArticle", countArticle);
		modelAndVieww.addObject("searchOption", searchOption);
		modelAndVieww.addObject("keyword", keyword);
		modelAndVieww.addObject("startPagee", startPagee);
		modelAndVieww.addObject("endPagee", endPagee);
		modelAndVieww.addObject("totalPP", totalPP);
		modelAndVieww.addObject("rank_page_url", "../rank/RankList.jsp");
		modelAndVieww.addObject("display", "../rank/rankInfo.jsp");
		modelAndVieww.setViewName("../main/index.jsp");

		return modelAndVieww;
	}

}
