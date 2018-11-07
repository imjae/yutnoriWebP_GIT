package user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import itemShop.bean.PaymentHistoryDTO;
import user.bean.UserDTO;
import user.dao.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public UserDTO userLogin(UserDTO userDTO) {
		return userDAO.userLogin(userDTO);
	}

	@Override
	public int userSignUp(UserDTO userDTO) {
		return userDAO.userSignUp(userDTO);
	}

	@Override
	public int userIdCheck(String user_id) {
		return userDAO.userIdCheck(user_id);
	}

	@Override
	public int userPwCheck(String user_password) {
		return userDAO.userPwCheck(user_password);
	}

	@Override
	public int userNameCheck(String user_name) {
		return userDAO.userNameCheck(user_name);
	}

	@Override
	public int userJuminCheck(String user_jumin) {
		return userDAO.userJuminCheck(user_jumin);
	}

	@Override
	public int userPhoneCheck(String user_phone) {
		return userDAO.userPhoneCheck(user_phone);
	}

	@Override
	public UserDTO findIdPwSelect(UserDTO userDTO) {
		return userDAO.findIdPwSelect(userDTO);
	}

	@Override
	public UserDTO userIdPwCheck(UserDTO userDTO) {
		return userDAO.userIdPwCheck(userDTO);
	}

	@Override
	public int userModify(UserDTO userDTO) {
		return userDAO.userModify(userDTO);
	}

	@Override
	public List<PaymentHistoryDTO> haveItemList(String category,String user_id,int startNum, int endNum) {
		return userDAO.haveItemList(category, user_id, startNum, endNum);
	}

	@Override
	public int haveItemCount(String user_id) {
		return userDAO.haveItemCount(user_id);
	}

	@Override
	public List<PaymentHistoryDTO> haveItemListAll(String user_id, int startNum, int endNum) {
		return userDAO.haveItemListAll(user_id, startNum, endNum);
	}

	@Override
	public int cashCharge(String user_id, int charge_price) {
		return userDAO.cashCharge(user_id, charge_price);
	}

	@Override
	public int insertHistory(String user_id, String item_code) {
		return userDAO.insertHistory(user_id, item_code);
	}
<<<<<<< HEAD

=======
<<<<<<< HEAD
	
=======
>>>>>>> c6ace745a1dfca5d3c38d47aeeeb722ac106c83d
>>>>>>> d7dd6b8f7da11bf70fd4ebce02f5a6a3ac338b24
	public int equipItemCreate(String user_id) {
		return userDAO.equipItemCreate(user_id);
	}

	@Override
	public int equipItem(String user_id, String item_code, String column_name) {
		return userDAO.equipItem(user_id, item_code, column_name);
	}
	
	
	
	
	
	
	
	
	
}
