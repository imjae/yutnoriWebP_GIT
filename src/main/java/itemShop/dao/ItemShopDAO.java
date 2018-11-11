package itemShop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import itemShop.bean.ItemShopDTO;

@Repository
public class ItemShopDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<ItemShopDTO> allItemShopList(int startNum, int endNum, String order) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("order", order);
		return sqlSession.selectList("mybatis.itemShopMapper.allItemShopList", map);
	}

	public List<ItemShopDTO> itemShopList(int startNum, int endNum, String order, String category) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("order", order);
		map.put("category", category);
		return sqlSession.selectList("mybatis.itemShopMapper.itemShopList", map);
	}
	
	public int getTotalA() {
		return sqlSession.selectOne("mybatis.itemShopMapper.getTotalA");
	}
	
	public int getCategoryA(String category) {
		return sqlSession.selectOne("mybatis.itemShopMapper.getCategoryA", category);
	}
	
	public ItemShopDTO itemDetail(String item_code) {
		return sqlSession.selectOne("mybatis.itemShopMapper.itemDetail", item_code);
	}
	
	public int itemPaymentSuccess(int item_charge,String user_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item_charge", item_charge);
		map.put("user_id", user_id);
		return sqlSession.update("mybatis.itemShopMapper.itemPaymentSuccess", map);
	}
	
	public int checkCart(String user_id, String item_code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("item_code", item_code);
		return sqlSession.selectOne("mybatis.itemShopMapper.checkCart", map);
	}
	
	public int deleteCart(String user_id, String item_code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("item_code", item_code);
		return sqlSession.delete("mybatis.itemShopMapper.deleteCart", map);
	}
	
	public int insertCart(String user_id, String item_code) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("item_code", item_code);
		return sqlSession.insert("mybatis.itemShopMapper.insertCart", map);
	}
	
	public List<ItemShopDTO> itemShoppingCart(String user_id){
		return sqlSession.selectList("mybatis.itemShopMapper.itemShoppingCart", user_id);	
	}
	
	
}
