package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.UserBeanMapper;
import com.web.entity.Resources;
import com.web.entity.UserBean;

@Service
public class UserBeanService {
	
	@Autowired
	private UserBeanMapper userBeanMapper;
	
	public List<Resources> getResources(int id){
		return userBeanMapper.getResouces(id);
	}
	
	public UserBean getUserBean(int id){
		return userBeanMapper.getUserBean(id);
	}
	
	public void updateUserBean(UserBean bean){
		userBeanMapper.updateUserBean(bean);
	}

}
