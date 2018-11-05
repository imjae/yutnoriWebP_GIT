package community.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import community.bean.FreeboardDTO;
import community.bean.Freeboard_commentDTO;
import community.bean.ImgboardDTO;

@Controller
public class CommunityController {
	@Autowired
	private CommunityService communityService;
	
	// 자유 게시판(게시글)
	@RequestMapping(value="/freeboard/freeboard_writeForm.do")
	public ModelAndView freeboard_writeForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("freeboard_page_url", "../freeboard/freeboard_writeForm.jsp");
		mav.addObject("display", "../freeboard/freeboard_info.jsp");
		mav.setViewName("../main/index.jsp");
		return mav;
	}
	
	@RequestMapping(value="/freeboard/freeboard_write.do", method=RequestMethod.POST)
	public ModelAndView freeboard_write(HttpServletRequest request, HttpSession session) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String user_id = (String)session.getAttribute("session_id");
		String freeboard_writer = user_id;
		String freeboard_subject = request.getParameter("freeboard_subject");
		String freeboard_content = request.getParameter("freeboard_content");
		
		FreeboardDTO freeboardDTO = new FreeboardDTO();
		freeboardDTO.setFreeboard_writer(freeboard_writer);
		freeboardDTO.setFreeboard_subject(freeboard_subject);
		freeboardDTO.setFreeboard_content(freeboard_content);
		
		int num = communityService.freeboard_write(freeboardDTO);
		ModelAndView mav = new ModelAndView();
		mav.addObject("num", num);
		mav.addObject("freeboard_page_url", "../freeboard/freeboard_write.jsp");
		mav.addObject("display", "../freeboard/freeboard_info.jsp");
		mav.setViewName("../main/index.jsp");
		return mav;
	}
	
	@RequestMapping(value="/freeboard/freeboard_modifyForm.do")
	public ModelAndView freeboard_modifyForm(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		int freeboard_num = Integer.parseInt(request.getParameter("freeboard_num"));
		int freeboard_pg = Integer.parseInt(request.getParameter("freeboard_pg"));
		
		FreeboardDTO freeboardDTO = communityService.freeboard_view(freeboard_num);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("freeboardDTO", freeboardDTO);
		mav.addObject("freeboard_pg", freeboard_pg);
		mav.addObject("freeboard_page_url", "../freeboard/freeboard_modifyForm.jsp");
		mav.addObject("display", "../freeboard/freeboard_info.jsp");
		mav.setViewName("../main/index.jsp");
		return mav;
	}
	
	@RequestMapping(value="/freeboard/freeboard_modify.do", method=RequestMethod.POST)
	public ModelAndView freeboard_modify(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		int freeboard_num = Integer.parseInt(request.getParameter("freeboard_num"));
		int freeboard_pg = Integer.parseInt(request.getParameter("freeboard_pg"));
		String freeboard_writer = request.getParameter("freeboard_writer");
		String freeboard_subject = request.getParameter("freeboard_subject");
		String freeboard_content = request.getParameter("freeboard_content");
		
		FreeboardDTO freeboardDTO = new FreeboardDTO();
		freeboardDTO.setFreeboard_num(freeboard_num);
		freeboardDTO.setFreeboard_writer(freeboard_writer);
		freeboardDTO.setFreeboard_subject(freeboard_subject);
		freeboardDTO.setFreeboard_content(freeboard_content);
		
		int num = communityService.freeboard_modify(freeboardDTO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("num", num);
		mav.addObject("freeboardDTO", freeboardDTO);
		mav.addObject("freeboard_pg", freeboard_pg);
		mav.addObject("freeboard_page_url", "../freeboard/freeboard_modify.jsp");
		mav.addObject("display", "../freeboard/freeboard_info.jsp");
		mav.setViewName("../main/index.jsp");
		return mav;
	}
	
	@RequestMapping(value="/freeboard/freeboard_delete.do")
	public ModelAndView freeboard_delete(HttpServletRequest request) {
		int freeboard_num = Integer.parseInt(request.getParameter("freeboard_num"));
		
		int num = communityService.freeboard_delete(freeboard_num);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("num", num);
		mav.addObject("freeboard_page_url", "../freeboard/freeboard_delete.jsp");
		mav.addObject("display", "../freeboard/freeboard_info.jsp");
		mav.setViewName("../main/index.jsp");
		return mav;
	}
	
	@RequestMapping(value="/freeboard/freeboard_list.do")
	public ModelAndView freeboard_list(HttpServletRequest request) {
		// data
		int freeboard_pg = Integer.parseInt(request.getParameter("freeboard_pg"));
		int free_endNum = freeboard_pg * 15;
		int free_startNum = free_endNum - 14;
		
		// DB
		List<FreeboardDTO> freeboard_list = communityService.freeboard_list(free_startNum, free_endNum);
		
		// paging
		int free_totalA = communityService.freeboard_getTotalA();
		int free_totalP = (free_totalA + 14) / 15;
		int free_startPg = (freeboard_pg - 1) / 10 * 10 + 1;
		int free_endPg = free_startPg + 9;
		if(free_endPg > free_totalP) free_endPg = free_totalP;
		
		// navigation
		ModelAndView mav = new ModelAndView();
		mav.addObject("freeboard_pg", freeboard_pg);
		mav.addObject("freeboard_list", freeboard_list);
		mav.addObject("free_startPg", free_startPg);
		mav.addObject("free_endPg", free_endPg);
		mav.addObject("free_totalP", free_totalP);
		mav.addObject("freeboard_page_url", "../freeboard/freeboard_list.jsp");
		mav.addObject("display", "../freeboard/freeboard_info.jsp");
		mav.setViewName("../main/index.jsp");
		return mav;
	}
	
	@RequestMapping(value="/freeboard_listJson.do")
	public ModelAndView freeboard_listJson(HttpServletRequest request) throws Exception {
		
		int freeboard_pg = 1;
		int free_endNum = freeboard_pg * 10;
		int free_startNum = free_endNum - 9;
		
		List<FreeboardDTO> freeboard_list = communityService.freeboard_list(free_startNum, free_endNum);
		
		// json으로 결과값 반환
		String freeboard_rt = null;
		int freeboard_total = freeboard_list.size();		// 조회된 data 수
		if(freeboard_total > 0) {
			freeboard_rt = "OK";
		} else {
			freeboard_rt = "FAIL";
		}
		
		JSONObject json = new JSONObject();		// 첫 번째 중괄호
		json.put("freeboard_rt", freeboard_rt);
		json.put("freeboard_total", freeboard_total);
		if(freeboard_total > 0) {
			JSONArray items = new JSONArray();
			for(int i=0; i<freeboard_list.size(); i++) {
				FreeboardDTO freeboardDTO = freeboard_list.get(i);
				JSONObject temp = new JSONObject();
				temp.put("freeboard_num", freeboardDTO.getFreeboard_num());
				temp.put("freeboard_writer", freeboardDTO.getFreeboard_writer());
				temp.put("freeboard_subject", freeboardDTO.getFreeboard_subject());
				temp.put("freeboard_content", freeboardDTO.getFreeboard_content());
				temp.put("freeboard_readCount", freeboardDTO.getFreeboard_readCount());
				temp.put("freeboard_date", freeboardDTO.getFreeboard_date());
				
				items.put(i, temp);
			}
			
			json.put("items", items);
		}
		
		System.out.println(json);
		
		// 3. 검색 결과를 세션에 저장하고 목록 화면으로 이동
		ModelAndView mav = new ModelAndView();
		mav.addObject("json", json);
		mav.setViewName("../main/index_json.jsp");
		return mav;
	}
	
	@RequestMapping(value="/freeboard/freeboard_view.do")
	public ModelAndView freeboard_view(HttpServletRequest request) {
		// data
		int freeboard_num = Integer.parseInt(request.getParameter("freeboard_num"));
		int freeboard_pg = Integer.parseInt(request.getParameter("freeboard_pg"));
		
		// DB
		communityService.freeboard_hit(freeboard_num);
		FreeboardDTO freeboardDTO = communityService.freeboard_view(freeboard_num);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("freeboardDTO", freeboardDTO);
		mav.addObject("freeboard_num", freeboard_num);
		mav.addObject("freeboard_pg", freeboard_pg);
		mav.addObject("freeboard_page_url", "../freeboard/freeboard_view.jsp");
		mav.addObject("display", "../freeboard/freeboard_info.jsp");
		mav.setViewName("../main/index.jsp");
		return mav;
	}
	
	
	// 자유 게시판(댓글)
//	@RequestMapping(value="/freeboard/freeboard_commentForm.do")
//	public void free_comment_write(HttpServletRequest request, HttpSession session) {
//		try {
//			request.setCharacterEncoding("utf-8");
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
//		
//		int freeboard_num = Integer.parseInt(request.getParameter("freeboard_num"));
//		
//		String free_comment_writer = (String)session.getAttribute("session_id");
//		
//		Freeboard_commentDTO freeboard_commentDTO = new Freeboard_commentDTO();
//		freeboard_commentDTO.setFreeboard_num(freeboard_num);
//		freeboard_commentDTO.setFree_comment_writer(free_comment_writer);
//		freeboard_commentDTO.setFree_comment_content(request.getParameter("free_comment_content"));
//		
//		communityService.free_commentInsert(freeboard_commentDTO);
//	}
	
//	@RequestMapping(value="/freeboard/freeboard_commentJson.do")
//	public ModelAndView freeboard_commentJson(HttpServletRequest request, HttpSession session) {
//		
//		int freeboard_num = Integer.parseInt(request.getParameter("freeboard_num"));
//		
//		System.out.println("freeboard_num : " + freeboard_num);
//		
//		List<Freeboard_commentDTO> free_commentJson = communityService.free_commentList(freeboard_num);
//		
//		String rt = null;
//		int total = free_commentJson.size();
//		if(total > 0) {
//			rt = "OK";
//		} else {
//			rt = "FAIL";
//		}
//		
//		JSONObject json = new JSONObject();
//		json.put("rt", rt);
//		json.put("total", total);
//		if(total > 0) {
//			JSONArray items = new JSONArray();
//			for(int i=0; i<free_commentJson.size(); i++) {
//				Freeboard_commentDTO freeboard_commentDTO = free_commentJson.get(i);
//				JSONObject temp = new JSONObject();
//				temp.put("free_comment_num", freeboard_commentDTO.getFree_comment_num());
//				temp.put("free_comment_writer", free_comment_writer);
//				temp.put("free_comment_content", freeboard_commentDTO.getFree_comment_content());
//				temp.put("free_comment_date", freeboard_commentDTO.getFree_comment_date());
//				
//				items.put(i, temp);
//			}
//			
//			json.put("items", items);
//		}
//		
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("json", json);
//		mav.setViewName("../freeboard/freeboard_commentJson.jsp");
//		return mav;
//	}
	
	
	// 스샷 게시판(게시글)
	@RequestMapping(value="/imgboard/imgboard_writeForm.do")
	public ModelAndView imgboard_writeForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("imgboard_page_url", "../imgboard/imgboard_writeForm.jsp");
		mav.addObject("display", "../imgboard/imgboard_info.jsp");
		mav.setViewName("../main/index.jsp");
		return mav;
	}
	
	@RequestMapping(value="/imgboard/imgboard_write.do", method=RequestMethod.POST)
	public ModelAndView write(HttpSession session, MultipartFile imgboard_file, HttpServletRequest request) {
		String filePath = "/storage";
		System.out.println("filePath : " + filePath);
		String fileName = imgboard_file.getOriginalFilename();
		File file = new File(filePath, fileName);
		
		// file 복사
		try {
			// getInputStream() : upload한 file data를 읽어오는 InputStream을 구한다.
			FileCopyUtils.copy(imgboard_file.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String user_id = (String)session.getAttribute("session_id");
		String imgboard_writer = user_id;
		
		// data
		ImgboardDTO imgboardDTO = new ImgboardDTO();
		imgboardDTO.setImgboard_writer(imgboard_writer);
		imgboardDTO.setImgboard_subject(request.getParameter("imgboard_subject"));
		imgboardDTO.setImgboard_content(request.getParameter("imgboard_content"));
		imgboardDTO.setImgboard_img(fileName);
		
		int num = communityService.imgboard_write(imgboardDTO);
		
		// 화면 navigation
		ModelAndView mav = new ModelAndView();
		mav.addObject("num", num);
		mav.addObject("imgboard_page_url", "../imgboard/imgboard_write.jsp");
		mav.addObject("display", "../imgboard/imgboard_info.jsp");
		mav.setViewName("../main/index.jsp");
		return mav;
	}
	
	@RequestMapping(value="/imgboard/imgboard_modifyForm.do")
	public ModelAndView imgboard_modifyForm(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		int imgboard_num = Integer.parseInt(request.getParameter("imgboard_num"));
		int imgboard_pg = Integer.parseInt(request.getParameter("imgboard_pg"));
		
		ImgboardDTO imgboardDTO = communityService.imgboard_view(imgboard_num);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("imgboardDTO", imgboardDTO);
		mav.addObject("imgboard_pg", imgboard_pg);
		mav.addObject("imgboard_page_url", "../imgboard/imgboard_modifyForm.jsp");
		mav.addObject("display", "../imgboard/imgboard_info.jsp");
		mav.setViewName("../main/index.jsp");
		return mav;
	}
	
	@RequestMapping(value="/imgboard/imgboard_modify.do", method=RequestMethod.POST)
	public ModelAndView write(MultipartFile imgboard_file, HttpServletRequest request) {
		String filePath = "F:/spring/workspace/community/src/main/webapp/storage";
		String fileName = imgboard_file.getOriginalFilename();
		File file = new File(filePath, fileName);
		
		// file 복사
		try {
			// getInputStream() : upload한 file data를 읽어오는 InputStream을 구한다.
			FileCopyUtils.copy(imgboard_file.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int imgboard_num = Integer.parseInt(request.getParameter("imgboard_num"));
		int imgboard_pg = Integer.parseInt(request.getParameter("imgboard_pg"));
		
		// data
		ImgboardDTO imgboardDTO = new ImgboardDTO();
		imgboardDTO.setImgboard_num(imgboard_num);
		imgboardDTO.setImgboard_writer(request.getParameter("imgboard_writer"));
		imgboardDTO.setImgboard_subject(request.getParameter("imgboard_subject"));
		imgboardDTO.setImgboard_content(request.getParameter("imgboard_content"));
		imgboardDTO.setImgboard_img(fileName);
		
		int num = communityService.imgboard_modify(imgboardDTO);
		
		// 화면 navigation
		ModelAndView mav = new ModelAndView();
		mav.addObject("num", num);
		mav.addObject("imgboardDTO", imgboardDTO);
		mav.addObject("imgboard_pg", imgboard_pg);
		mav.addObject("imgboard_page_url", "../imgboard/imgboard_modify.jsp");
		mav.addObject("display", "../imgboard/imgboard_info.jsp");
		mav.setViewName("../main/index.jsp");
		return mav;
	}
	
	@RequestMapping(value="/imgboard/imgboard_delete.do")
	public ModelAndView imgboard_delete(HttpServletRequest request) {
		int imgboard_num = Integer.parseInt(request.getParameter("imgboard_num"));
		
		int num = communityService.imgboard_delete(imgboard_num);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("num", num);
		mav.addObject("imgboard_page_url", "../imgboard/imgboard_delete.jsp");
		mav.addObject("display", "../imgboard/imgboard_info.jsp");
		mav.setViewName("../main/index.jsp");
		return mav;
	}
	
	@RequestMapping(value="/imgboard/imgboard_list.do")
	public ModelAndView imgboard_list(HttpServletRequest request) {
		// data
		int imgboard_pg = Integer.parseInt(request.getParameter("imgboard_pg"));
		int img_endNum = imgboard_pg * 16;
		int img_startNum = img_endNum - 15;
		
		// DB
		List<ImgboardDTO> imgboard_list = communityService.imgboard_list(img_startNum, img_endNum);
		
		// paging
		int img_totalA = communityService.imgboard_getTotalA();
		int img_totalP = (img_totalA + 15) / 16;
		int img_startPg = (imgboard_pg-1) / 10 * 10 + 1;
		int img_endPg = img_startPg + 9;
		if(img_endPg > img_totalP) img_endPg = img_totalP;
		
		// navigation
		ModelAndView mav = new ModelAndView();
		mav.addObject("imgboard_pg", imgboard_pg);
		mav.addObject("imgboard_list", imgboard_list);
		mav.addObject("img_startPg", img_startPg);
		mav.addObject("img_endPg", img_endPg);
		mav.addObject("img_totalP", img_totalP);
		
		mav.addObject("imgboard_page_url", "../imgboard/imgboard_list.jsp");
		mav.addObject("display", "../imgboard/imgboard_info.jsp");
		mav.setViewName("../main/index.jsp");
		return mav;
	}
	
	@RequestMapping(value="/imgboard/imgboard_view.do")
	public ModelAndView imgboard_view(HttpServletRequest request) {
		// data
		int imgboard_num = Integer.parseInt(request.getParameter("imgboard_num"));
		int imgboard_pg = Integer.parseInt(request.getParameter("imgboard_pg"));
		
		// DB
		communityService.imgboard_hit(imgboard_num);
		ImgboardDTO imgboardDTO = communityService.imgboard_view(imgboard_num);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("imgboardDTO", imgboardDTO);
		mav.addObject("imgboard_num", imgboard_num);
		mav.addObject("imgboard_pg", imgboard_pg);
		mav.addObject("imgboard_page_url", "../imgboard/imgboard_view.jsp");
		mav.addObject("display", "../imgboard/imgboard_info.jsp");
		mav.setViewName("../main/index.jsp");
		return mav;
	}
}

































