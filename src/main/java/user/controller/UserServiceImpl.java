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
	public List<PaymentHistoryDTO> haveItemList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
	
	
	
}
