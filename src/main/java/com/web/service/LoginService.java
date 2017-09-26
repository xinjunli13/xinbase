package com.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.LoginMapper;
import com.web.entity.UserBean;

@Service
public class LoginService {
	
	@Autowired
	private LoginMapper loginMapper;
	
	public UserBean getLoginUser(UserBean userBean)
	{
		return loginMapper.UserLogin(userBean);
	}

}
