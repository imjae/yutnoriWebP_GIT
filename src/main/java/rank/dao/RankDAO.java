package rank.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rank.bean.MoneyRankDTO;
import rank.bean.PreviewDTO;
import rank.bean.RankDTO;
import user.bean.UserDTO;

@Repository
public class RankDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 글 목록보기
	public List<UserDTO> userList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.rankMapper.yutnoriiiRankList", map);
	}
	
	public List<RankDTO> yutnoriiiRankList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.rankMapper.rankList", map);
	}
	
	// 글 목록수 구하기
		public int getTotalA() {
			return sqlSession.selectOne("mybatis.rankMapper.getTotalA");
		}

		public List<PreviewDTO> rankPreview(int startNum, int endNum) {
			Map<String, Integer> map = new HashMap<>();
			map.put("startNum", startNum);
			map.put("endNum", endNum);
			return sqlSession.selectList("mybatis.rankMapper.rankPreview", map);
		}
		public List<MoneyRankDTO> MoneyRankList(int startNum, int endNum) {
			Map<String, Integer> map = new HashMap<>();
			map.put("startNum", startNum);
			map.put("endNum", endNum);
			return sqlSession.selectList("mybatis.rankMapper.moneyRankList", map);
		}
		
		// 검색기능
		public List<RankDTO>listAll(String searchOption, String keyword ,int startNumm, int endNumm) {
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption",searchOption);
		map.put("keyword",keyword);
		map.put("startNum", startNumm);
		map.put("endNum" , endNumm);
		return sqlSession.selectList("mybatis.rankMapper.listAll", map);
		}
		
		public int getcountArticle() {
			return sqlSession.selectOne("mybatis.rankMapper.getcountArticle");
		}
}
