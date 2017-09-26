package com.web.dao;

import java.util.List;

import com.web.entity.Tables;

public interface TableMapper {
	
	List<Tables> getAllTables();
	
	List<Tables> getTablesByPage(int count1,int count2);
	
	void updateTable(Tables tables);
	
	int getTotalTableCount();
	
	Tables getOneTable(int id);
	
	void addTables(Tables tables);
	
	void deleteTables(int id);

}
