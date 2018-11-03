package helpboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import helpboard.bean.HelpboardVO;
import helpboard.dao.HelpboardDAO;


@Service
public class HelpboardServiceImpl implements HelpboardService {

	@Autowired
	private HelpboardDAO helpboardDAO;

	@Override
	public int helpboardWrite(HelpboardVO helpboardVO) {
		return helpboardDAO.helpboardWrite(helpboardVO);
	}

	@Override
	public int getTotalA(String sort1, String sort2) {
		return helpboardDAO.getTotalA(sort1, sort2);
	}

	@Override
	public int helpboardDelete(int helpboard_num) {
		return helpboardDAO.helpboardDelete(helpboard_num);
	}

	@Override
	public HelpboardVO helpboardView(int helpboard_num) {
		return helpboardDAO.helpboardView(helpboard_num);
	}

	@Override
	public List<HelpboardVO> helpboardListAll(HelpListDTO helpListDTO) {
		return helpboardDAO.helpboardListAll(helpListDTO);
	}

	@Override
	public int helpboardModify(HelpboardVO helpboardVO) {
		return helpboardDAO.helpboardModify(helpboardVO);
	}

	@Override
	public List<HelpboardVO> helpboardListAllAdmin(HelpListDTO helpListDTO) {
		return helpboardDAO.helpboardListAllAdmin(helpListDTO);
	}

	@Override
	public int getTotalAAllAdmin() {
		return helpboardDAO.getTotalAAllAdmin();
	}

}
