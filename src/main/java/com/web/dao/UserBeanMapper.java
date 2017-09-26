package com.web.dao;

import java.util.List;

import com.web.entity.Resources;
import com.web.entity.UserBean;

public interface UserBeanMapper {
	
	List<Resources> getResouces(int id);
	
	UserBean getUserBean(int id);
	
	void updateUserBean(UserBean bean);

}
