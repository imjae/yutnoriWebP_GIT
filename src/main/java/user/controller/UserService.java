package user.controller;

import java.util.List;

import itemShop.bean.PaymentHistoryDTO;
import user.bean.UserDTO;

public interface UserService {
	
	UserDTO userLogin(UserDTO userDTO);

	int userSignUp(UserDTO userDTO);
	
	int userIdCheck(String user_id);
	
	int userPwCheck(String user_password);
	
	int userNameCheck(String user_password);
	
	int userJuminCheck(String user_password);
	
	int userPhoneCheck(String user_password);
	
	UserDTO findIdPwSelect(UserDTO userDTO);
	
	UserDTO userIdPwCheck(UserDTO userDTO);
	
	int userModify(UserDTO userDTO);
	
	List<PaymentHistoryDTO> haveItemList();
	
}
