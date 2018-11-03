package helpboard.controller;

import java.util.List;

import helpboard.bean.NotifyboardVO;

public interface NotifyboardService {

	int notifyboardWrite(NotifyboardVO notifyboardVO);
	
	List<NotifyboardVO> notifyboardListAll(NotifyListDTO notifyListDTO);
	
	List<NotifyboardVO> notifyboardList(NotifyListDTO notifyListDTO);
	
	NotifyboardVO notifyboardView(int notifyboard_num);
	
	int notifyboardDelete(int notifyboard_num);
	
	int notifyGetTotalA(String notify_sort);
	
	int notifyGetTotalAAll();
	
	void notifyboardRespondDone(int notifyboard_num);
}
