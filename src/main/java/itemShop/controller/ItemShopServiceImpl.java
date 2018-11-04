package itemShop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itemShop.bean.ItemShopDTO;
import itemShop.dao.ItemShopDAO;

@Service
public class ItemShopServiceImpl implements ItemShopService{


	@Autowired
	private ItemShopDAO itemShopDAO;

	
	@Override
	public List<ItemShopDTO> allItemShopList(int startNum, int endNum, String order) {
		return itemShopDAO.allItemShopList(startNum, endNum, order);
	}
	
	@Override
	public List<ItemShopDTO> itemShopList(int startNum, int endNum, String order, String category) {
		return itemShopDAO.itemShopList(startNum, endNum, order, category);
	}
	
	@Override
	public int getTotalA() {
		return itemShopDAO.getTotalA();
	}

	@Override
	public int getCategoryA(String category) {
		return itemShopDAO.getCategoryA(category);
	}

	@Override
	public ItemShopDTO itemDetail(String item_code) {
		return itemShopDAO.itemDetail(item_code);
	}

	@Override
	public int itemPaymentSuccess(int item_charge, String user_id) {
		return itemShopDAO.itemPaymentSuccess(item_charge, user_id);
	}

	
	
}
