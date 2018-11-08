package inform.controller;

import java.util.List;

import inform.bean.EventVO;

public interface EventService {

	int eventWrite(EventVO eventVO);
	
	List<EventVO> eventListOn(int startNum, int endNum);
	
	List<EventVO> eventListOff(int startNum, int endNum);
	
	EventVO eventView(int e_num);
	
	int eventDelete(int e_num);
	
	int eventModify(EventVO eventVO);
	
	int getTotalAOn();
	
	int getTotalAOff();
	
}
