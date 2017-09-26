package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.TableMapper;
import com.web.entity.Tables;

@Service
public class TableService {

	@Autowired
	private TableMapper tableMapper;
	
	public List<Tables> getAllTables(){
		return tableMapper.getAllTables();
	}
	
	public List<Tables> getTablesBypage(int count1,int count2){
		return tableMapper.getTablesByPage(count1,count2);
	}
	
	public void updateTable(Tables tables){
		tableMapper.updateTable(tables);
	}
	
	public int getTotalCount(){
		return tableMapper.getTotalTableCount();
	}
	
	public Tables getOneTable(int id){
		return tableMapper.getOneTable(id);
	}
	
	public void addTables(Tables tables){
		tableMapper.addTables(tables);
	}
	
	public void deleteTables(int id){
		tableMapper.deleteTables(id);
	}
	
}
