package rank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import rank.bean.MoneyRankDTO;
import rank.bean.PreviewDTO;
import rank.bean.RankDTO;
import rank.dao.RankDAO;
import user.bean.UserDTO;

@Service
public class RankServiceImpl implements RankService{
	@Autowired
	private RankDAO yutnoriiiDAO;
	
	@Override
	public List<UserDTO> yutnoriiiRankList(int startNum, int endNum) {
		return yutnoriiiDAO.userList(startNum, endNum);
	}
	
	@Override
	public int getTotalA() {
		return yutnoriiiDAO.getTotalA();
	}

	@Override
	public List<RankDTO> rankList(int startNum, int endNum) {
		return yutnoriiiDAO.yutnoriiiRankList(startNum, endNum);
	}
	@Override
	public List<PreviewDTO> rankPreview(int startNum, int endNum) {
		return yutnoriiiDAO.rankPreview(startNum, endNum);
	}

	@Override
	public List<MoneyRankDTO> MoneyRankList(int startNum, int endNum) {
		return yutnoriiiDAO.MoneyRankList(startNum,endNum);
	}
	@Override
	public List<RankDTO> listAll(String searchOption, String keyword ,int startNumm, int endNumm) {
		return yutnoriiiDAO.listAll(searchOption, keyword, startNumm,  endNumm);
	}
	
	
	@Override
	public int getcountArticle(String searchOption, String keyword, int startNumm, int endNumm) {
		return yutnoriiiDAO.getcountArticle(searchOption, keyword, startNumm, endNumm);
	}

	
	
}
