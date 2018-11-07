package inform.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import inform.bean.EventVO;

@Repository
public class EventDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int eventWrite(EventVO eventVO) {
		return sqlSession.insert("eventMapper.eventWrite", eventVO);
	}
	
	public List<EventVO> eventListOn(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("eventMapper.eventListOn", map);
	}
	
	public List<EventVO> eventListOff(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("eventMapper.eventListOff", map);
	}
	
	public EventVO eventView(int e_num) {
		return sqlSession.selectOne("eventMapper.eventView", e_num);
	}
	
	public int eventDelete(int e_num) {
		return sqlSession.delete("eventMapper.eventDelete", e_num);
	}
	
	public int eventModify(EventVO eventVO) {
		return sqlSession.update("eventMapper.eventModify", eventVO);
	}
	
	public int getTotalAOn() {
		return sqlSession.selectOne("eventMapper.getTotalAOn");
	}
	
	public int getTotalAOff() {
		return sqlSession.selectOne("eventMapper.getTotalAOff");
	}
}
