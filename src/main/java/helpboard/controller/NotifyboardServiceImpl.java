package helpboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helpboard.bean.NotifyboardVO;
import helpboard.dao.NotifyboardDAO;

@Service
public class NotifyboardServiceImpl implements NotifyboardService {

	@Autowired
	private NotifyboardDAO notifyboardDAO;
	
	@Override
	public int notifyboardWrite(NotifyboardVO notifyboardVO) {
		return notifyboardDAO.notifyboardWrite(notifyboardVO);
	}

	@Override
	public List<NotifyboardVO> notifyboardListAll(NotifyListDTO notifyListDTO) {
		return notifyboardDAO.notifyboardListAll(notifyListDTO);
	}

	@Override
	public List<NotifyboardVO> notifyboardList(NotifyListDTO notifyListDTO) {
		return notifyboardDAO.notifyboardList(notifyListDTO);
	}

	@Override
	public NotifyboardVO notifyboardView(int notifyboard_num) {
		return notifyboardDAO.notifyboardView(notifyboard_num);
	}

	@Override
	public int notifyboardDelete(int notifyboard_num) {
		return notifyboardDAO.notifyboardDelete(notifyboard_num);
	}

	@Override
	public int notifyGetTotalA(String notify_sort) {
		return notifyboardDAO.notifyGetTotalA(notify_sort);
	}

	@Override
	public int notifyGetTotalAAll() {
		return notifyboardDAO.notifyGetTotalAAll();
	}

	@Override
	public void notifyboardRespondDone(int notifyboard_num) {
		notifyboardDAO.notifyboardRespondDone(notifyboard_num);
	}

}
