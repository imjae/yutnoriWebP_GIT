package helpboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import helpboard.bean.HelpboardVO;
import helpboard.controller.HelpListDTO;

@Repository
public class HelpboardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int helpboardWrite(HelpboardVO helpboardVO) {
		return sqlSession.insert("helpboardMapper.helpboardWrite", helpboardVO);
	}
	
	public List<HelpboardVO> helpboardListAll(HelpListDTO helpListDTO) {
		return sqlSession.selectList("helpboardMapper.helpboardListAll", helpListDTO);
	}
	
	public List<HelpboardVO> helpboardListAllAdmin(HelpListDTO helpListDTO) {
		return sqlSession.selectList("helpboardMapper.helpboardListAllAdmin", helpListDTO);
	}
	
	public HelpboardVO helpboardView(int helpboard_num) {
		return sqlSession.selectOne("helpboardMapper.helpboardView", helpboard_num);
	}
	
	public int helpboardDelete(int helpboard_num) {
		return sqlSession.delete("helpboardMapper.helpboardDelete", helpboard_num);
	}
	
	public int getTotalA(String sort1, String sort2) {
		Map<String, String> map = new HashMap<>();
		map.put("sort1", sort1);
		map.put("sort2", sort2);
		return sqlSession.selectOne("helpboardMapper.getTotalA", map);
	}
	
	public int getTotalAAllAdmin() {
		return sqlSession.selectOne("helpboardMapper.getTotalAAllAdmin");
	}
	
	public int helpboardModify(HelpboardVO helpboardVO) {
		return sqlSession.update("helpboardMapper.helpboardModify", helpboardVO);
	}
	
}
