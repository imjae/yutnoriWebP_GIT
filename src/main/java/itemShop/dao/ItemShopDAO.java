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
	
}
