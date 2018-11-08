package inform.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import inform.bean.EventVO;
import inform.dao.EventDAO;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	EventDAO eventDAO;

	@Override
	public int eventWrite(EventVO eventVO) {
		return eventDAO.eventWrite(eventVO);
	}

	@Override
	public List<EventVO> eventListOn(int startNum, int endNum) {
		return eventDAO.eventListOn(startNum, endNum);
	}

	@Override
	public List<EventVO> eventListOff(int startNum, int endNum) {
		return eventDAO.eventListOff(startNum, endNum);
	}

	@Override
	public EventVO eventView(int e_num) {
		return eventDAO.eventView(e_num);
	}

	@Override
	public int eventDelete(int e_num) {
		return eventDAO.eventDelete(e_num);
	}

	@Override
	public int eventModify(EventVO eventVO) {
		return eventDAO.eventModify(eventVO);
	}

	@Override
	public int getTotalAOn() {
		return eventDAO.getTotalAOn();
	}

	@Override
	public int getTotalAOff() {
		return eventDAO.getTotalAOff();
	}

}
