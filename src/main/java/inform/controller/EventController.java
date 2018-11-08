package inform.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import inform.bean.EventVO;

@Controller
public class EventController {

	@Autowired
	EventService eventService;
	
	@RequestMapping(value = "/event/eventPreview.do", method = RequestMethod.POST)
	public ModelAndView eventPreview(HttpServletRequest request) {
		
		System.out.println("난 eventPreview야");
		List<EventVO> list = eventService.eventListOn(1, 4);
		
		int total = list.size();
		
		JSONObject json = new JSONObject();
		json.put("total", total);
		
		if(total > 0) {
			JSONArray items = new JSONArray();
			for(int i=0; i<total; i++) {
				EventVO eventVO = list.get(i);
				
				JSONObject temp = new JSONObject();
				temp.put("e_num", eventVO.getE_num());
				temp.put("e_img", eventVO.getE_img());
				temp.put("title", eventVO.getTitle());
				temp.put("sub_title", eventVO.getSub_title());
				temp.put("s_date", eventVO.getS_date());
				temp.put("e_date", eventVO.getE_date());
				items.put(i, temp);
			}
			json.put("items", items);
		}
		
		// System.out.println(json);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("json", json);
		
		modelAndView.setViewName("../event/event_json.jsp");
		
		return modelAndView;	
	}
	
	@RequestMapping(value = "/event/eventMainOn.do")
	public ModelAndView eventMainOn(HttpServletRequest request) {
		String str_pg = request.getParameter("pg");
		
		int pg = 1;
		if(str_pg != null) {
			pg = Integer.parseInt(str_pg);
		}

		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		int totalA = eventService.getTotalAOn();
		int totalP = (totalA + 4) / 5;
		
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage + 2;
		if (endPage > totalP) {
			endPage = totalP;
		}
		
		List<EventVO> list = eventService.eventListOn(startNum, endNum);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("startNum", startNum);
		modelAndView.addObject("endNum", endNum);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalA", totalA);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("sector", "on");
		modelAndView.addObject("display", "../event/ceventMain.jsp");
		modelAndView.addObject("e_display", "../event/ceventCenter.jsp");
		
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;	
	}
	
	@RequestMapping(value = "/event/eventMainOff.do")
	public ModelAndView eventMainOff(HttpServletRequest request) {
		String str_pg = request.getParameter("pg");
		
		int pg = 1;
		if(str_pg != null) {
			pg = Integer.parseInt(str_pg);
		}

		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		int totalA = eventService.getTotalAOff();
		int totalP = (totalA + 4) / 5;
		
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage + 2;
		if (endPage > totalP) {
			endPage = totalP;
		}
		
		List<EventVO> list = eventService.eventListOff(startNum, endNum);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("startNum", startNum);
		modelAndView.addObject("endNum", endNum);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalA", totalA);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("sector", "off");
		modelAndView.addObject("display", "../event/ceventMain.jsp");
		modelAndView.addObject("e_display", "../event/ceventCenter.jsp");
		
		modelAndView.setViewName("../main/index.jsp");
		
		return modelAndView;	
	}
	
	@RequestMapping(value = "/event/eventMainView.do")
	public ModelAndView eventViewMain(HttpServletRequest request) {
		
		int e_num = Integer.parseInt(request.getParameter("e_num"));
		
		EventVO eventVO = new EventVO();
		eventVO = eventService.eventView(e_num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("e_num", e_num);
		modelAndView.addObject("eventVO", eventVO);
		modelAndView.addObject("display", "../event/ceventMain.jsp");
		modelAndView.addObject("eventView", "../event/ceventView.jsp");
		
		modelAndView.setViewName("../main/index.jsp");
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/event/eventWriteForm.do")
	public ModelAndView eventWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../event/eventWriteForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "/event/eventWrite.do", method = RequestMethod.POST)
	public ModelAndView eventWrite(HttpServletRequest request) {
		int e_num = Integer.parseInt(request.getParameter("e_num"));
		String e_img = request.getParameter("e_img");
		String title = request.getParameter("title");
		String sub_title = request.getParameter("sub_title");
		String s_date = request.getParameter("s_date");
		String e_date = request.getParameter("e_date");
		
		EventVO eventVO = new EventVO();
		eventVO.setE_num(e_num);
		eventVO.setE_img(e_img);
		eventVO.setTitle(title);
		eventVO.setSub_title(sub_title);
		eventVO.setS_date(s_date);
		eventVO.setE_date(e_date);
		
		int su = eventService.eventWrite(eventVO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.setViewName("../event/eventWrite.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "/event/eventListOn.do")
	public ModelAndView eventListOn(HttpServletRequest request) {
		String str_pg = request.getParameter("pg");
		
		int pg = 1;
		if(str_pg != null) {
			pg = Integer.parseInt(str_pg);
		}

		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		int totalA = eventService.getTotalAOn();
		int totalP = (totalA + 4) / 5;
		
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage + 2;
		if (endPage > totalP) {
			endPage = totalP;
		}
		
		List<EventVO> list = eventService.eventListOn(startNum, endNum);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("startNum", startNum);
		modelAndView.addObject("endNum", endNum);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalA", totalA);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("sector", "on");
		
		modelAndView.setViewName("../event/eventList.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/event/eventListOff.do")
	public ModelAndView eventListOff(HttpServletRequest request) {
		String str_pg = request.getParameter("pg");
		
		int pg = 1;
		if(str_pg != null) {
			pg = Integer.parseInt(str_pg);
		}

		int endNum = pg * 5;
		int startNum = endNum - 4;
		
		int totalA = eventService.getTotalAOff();
		System.out.println(totalA);
		int totalP = (totalA + 4) / 5;
		
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage + 2;
		if (endPage > totalP) {
			endPage = totalP;
		}
		
		List<EventVO> list = eventService.eventListOff(startNum, endNum);
		System.out.println(list.toString());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("startNum", startNum);
		modelAndView.addObject("endNum", endNum);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalA", totalA);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("sector", "off");
		
		modelAndView.setViewName("../event/eventList.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/event/eventView.do")
	public ModelAndView eventView(HttpServletRequest request) {
		
		int e_num = Integer.parseInt(request.getParameter("e_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		String sector = request.getParameter("sector");
		// System.out.println(sector);
		
		EventVO eventVO = eventService.eventView(e_num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("eventVO", eventVO);
		modelAndView.addObject("e_num", e_num);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("sector", sector);
		
		modelAndView.setViewName("../event/eventView.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/event/eventModifyForm.do")
	public ModelAndView eventModifyForm(HttpServletRequest request) {
		int e_num = Integer.parseInt(request.getParameter("e_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		String sector = request.getParameter("sector");
		
		EventVO eventVO = new EventVO();
		eventVO = eventService.eventView(e_num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("eventVO", eventVO);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("sector", sector);
		modelAndView.setViewName("../event/eventModifyForm.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "/event/eventModify.do", method = RequestMethod.POST)
	public ModelAndView eventModify(HttpServletRequest request) {
		int e_num = Integer.parseInt(request.getParameter("e_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		String e_img = request.getParameter("e_img");
		String title = request.getParameter("title");
		String sub_title = request.getParameter("sub_title");
		String s_date = request.getParameter("s_date");
		String e_date = request.getParameter("e_date");
		String sector = request.getParameter("sector");
		
		EventVO eventVO = new EventVO();
		eventVO.setE_num(e_num);
		eventVO.setE_img(e_img);
		eventVO.setTitle(title);
		eventVO.setSub_title(sub_title);
		eventVO.setS_date(s_date);
		eventVO.setE_date(e_date);
		
		int su = eventService.eventModify(eventVO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("sector", sector);
		modelAndView.setViewName("../event/eventModify.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value = "/event/eventDelete.do")
	public ModelAndView eventDelete(HttpServletRequest request) {
		int e_num = Integer.parseInt(request.getParameter("e_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		String sector = request.getParameter("sector");
		
		int su = eventService.eventDelete(e_num);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("sector", sector);
		modelAndView.setViewName("../event/eventDelete.jsp");
		return modelAndView;
	}
	
}
