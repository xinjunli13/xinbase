package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.MenuTypeMapper;
import com.web.entity.MenuType;

@Service
public class MenuTypeService {

	@Autowired
	private MenuTypeMapper menuTypeMapper;
	
	public List<MenuType> getMtList(){
		return menuTypeMapper.getMenuTypeList();
	}
	
}
