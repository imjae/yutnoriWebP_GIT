package itemShop.controller;

import java.util.List;

import itemShop.bean.ItemShopDTO;

public interface ItemShopService {
	// 목록
	List<ItemShopDTO> allItemShopList(int startNum, int endNum, String order);	// all
	List<ItemShopDTO> itemShopList(int startNum, int endNum, String order, String category); //나머지

	// 전체갯수
	int getTotalA();
	int getCategoryA(String category);
	
	// detail
	ItemShopDTO itemDetail(String item_code);
	
	// 가격차감
	int itemPaymentSuccess(int item_charge, String user_id);
	
}
