package com.web.dao;

import java.util.List;

import com.web.entity.Menus;

public interface MenuMapper {
	
	List<Menus> getAllMenus();
	
	List<Menus> getMenusByPage(int count1,int count2);
	
	void deleteMenu(int id);
	
	void updateMenu(Menus menus);
	
	void insertMenu(Menus menus);
	
	int getTotalCount();
	
	Menus getOneMenu(int id);
	

}
