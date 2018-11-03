package rank.controller;

import java.util.List;

import rank.bean.MoneyRankDTO;
import rank.bean.PreviewDTO;
import rank.bean.RankDTO;
import user.bean.UserDTO;

public interface RankService {
	
		// 랭킹 목록
		List<UserDTO> yutnoriiiRankList(int startNum, int endNum);
		List<RankDTO> rankList(int startNum, int endNum);
		List<PreviewDTO> rankPreview(int startNum, int endNum);
		List<MoneyRankDTO> MoneyRankList(int startNum, int endNum);
		
		List<RankDTO> listAll(String searchOption, String keyword,int startNumm, int endNumm);
		
	    
		// 전체 게시판 글 갯수 조회
		int getTotalA();
		int getcountArticle(String searchOption, String keyword);
		
		
}
