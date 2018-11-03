package helpboard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import helpboard.bean.NotifyboardVO;
import helpboard.controller.NotifyListDTO;

@Repository
public class NotifyboardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int notifyboardWrite(NotifyboardVO notifyboardVO) {
		return sqlSession.insert("notifyboardMapper.notifyboardWrite", notifyboardVO);
	}
	
	public List<NotifyboardVO> notifyboardListAll(NotifyListDTO notifyListDTO) {
		return sqlSession.selectList("notifyboardMapper.notifyboardListAll", notifyListDTO);
	}
	
	public List<NotifyboardVO> notifyboardList(NotifyListDTO notifyListDTO) {
		return sqlSession.selectList("notifyboardMapper.notifyboardList", notifyListDTO);
	}
	
	public NotifyboardVO notifyboardView(int notifyboard_num) {
		return sqlSession.selectOne("notifyboardMapper.notifyboardView", notifyboard_num);
	}
	
	public int notifyboardDelete(int notifyboard_num) {
		return sqlSession.delete("notifyboardMapper.notifyboardDelete", notifyboard_num);
	}
	
	public int notifyGetTotalA(String notify_sort) {
		return sqlSession.selectOne("notifyboardMapper.getTotalA", notify_sort);
	}
	
	public int notifyGetTotalAAll() {
		return sqlSession.selectOne("notifyboardMapper.getTotalAAll");
	}
	
	public void notifyboardRespondDone(int notifyboard_num) {
		sqlSession.update("notifyboardMapper.notifyboardRespondDone", notifyboard_num);
	}
}

