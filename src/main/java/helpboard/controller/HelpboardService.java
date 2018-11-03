package helpboard.controller;

import java.util.List;

import helpboard.bean.HelpboardVO;

public interface HelpboardService {

	int helpboardWrite(HelpboardVO helpboardVO);
	
	int helpboardDelete(int helpboard_num);
	
	HelpboardVO helpboardView(int helpboard_num);
	
	List<HelpboardVO> helpboardListAll(HelpListDTO helpListDTO);
	
	List<HelpboardVO> helpboardListAllAdmin(HelpListDTO helpListDTO);
	
	int getTotalA(String sort1, String sort2);
	
	int getTotalAAllAdmin();
	
	int helpboardModify(HelpboardVO helpboardVO);
	
}
