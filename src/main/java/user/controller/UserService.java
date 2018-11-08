package user.controller;

import java.util.List;

import itemShop.bean.PaymentHistoryDTO;
import user.bean.UserDTO;
import user.bean.UserEquipDTO;

public interface UserService {
	
	UserDTO userLogin(UserDTO userDTO);

	int userSignUp(UserDTO userDTO);
	
	int equipItemCreate(String user_id);
	
	int equipItem(String user_id, String item_code, String column_name);
	UserEquipDTO equipItemStatus(String user_id);
	
	int userIdCheck(String user_id);
	
	int userPwCheck(String user_password);
	
	int userNameCheck(String user_password);
	
	int userJuminCheck(String user_password);
	
	int userPhoneCheck(String user_password);
	
	UserDTO findIdPwSelect(UserDTO userDTO);
	
	UserDTO userIdPwCheck(UserDTO userDTO);
	
	int userModify(UserDTO userDTO);
	
	List<PaymentHistoryDTO> haveItemList(String category,String user_id,int startNum, int endNum);
	List<PaymentHistoryDTO> haveItemListAll(String user_id,int startNum, int endNum);
	int haveItemCount(String user_id);
	
	int cashCharge(String user_id, int charge_price);

	
	int insertHistory(String user_id, String item_code);
	

}
