package user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import itemShop.bean.PaymentHistoryDTO;
import user.bean.UserDTO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public UserDTO userLogin(UserDTO dto) {
		return sqlSession.selectOne("mybatis.userMapper.userLogin", dto);
	}

	public int userSignUp(UserDTO dto) {
		return sqlSession.insert("mybatis.userMapper.userSignUp", dto);
	}

	public int userIdCheck(String user_id) {
		return sqlSession.selectOne("mybatis.userMapper.userIdCheck", user_id);
	}

	public int userPwCheck(String user_password) {
		return sqlSession.selectOne("mybatis.userMapper.userPwCheck", user_password);
	}

	public int userNameCheck(String user_name) {
		return sqlSession.selectOne("mybatis.userMapper.userNameCheck", user_name);
	}

	public int userJuminCheck(String user_jumin) {
		return sqlSession.selectOne("mybatis.userMapper.userJuminCheck", user_jumin);
	}

	public int userPhoneCheck(String user_phone) {
		return sqlSession.selectOne("mybatis.userMapper.userPhoneCheck", user_phone);
	}

	public UserDTO findIdPwSelect(UserDTO dto) {
		return sqlSession.selectOne("mybatis.userMapper.findIdPwSelect", dto);
	}

	public UserDTO userIdPwCheck(UserDTO dto) {
		return sqlSession.selectOne("mybatis.userMapper.userIdPwCheck", dto);
	}

	public int userModify(UserDTO dto) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("ses_id", dto.getUser_id());
		map.put("re_pw", dto.getUser_password());
		return sqlSession.update("mybatis.userMapper.userModify", map);
	}

	public List<PaymentHistoryDTO> haveItemList(String category, String user_id, int startNum, int endNum) {

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("category", category);
		map.put("user_id", user_id);
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		return sqlSession.selectList("mybatis.userMapper.haveItemList", map);
	}

	public List<PaymentHistoryDTO> haveItemListAll(String user_id, int startNum, int endNum) {

		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("user_id", user_id);
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		return sqlSession.selectList("mybatis.userMapper.haveItemListAll", map);
	}

	public int haveItemCount(String user_id) {
		return sqlSession.selectOne("mybatis.userMapper.haveItemCount", user_id);
	}
	
	public int cashCharge(String user_id, int charge_price) {
		
	Map<Object, Object> map = new HashMap<Object,Object>();
		
		map.put("user_id", user_id);
		map.put("charge_price", charge_price);
		
		return sqlSession.update("mybatis.userMapper.cashCharge", map);
	}
	
	public int equipItemCreate(String user_id) {
		
		return sqlSession.insert("mybatis.userMapper.equipItemCreate",user_id);
	}
	
	public int equipItem(String user_id,String item_code, String column_name) {
		
		Map<Object, Object> map = new HashMap<Object,Object>();
		
		map.put("user_id", user_id);
		map.put("item_code", item_code);
		map.put("column_name", column_name);
		
		return sqlSession.update("mybatis.userMapper.equipItem", map);
	}

}
