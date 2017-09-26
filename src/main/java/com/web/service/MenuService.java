package com.web.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.dao.MenuMapper;
import com.web.entity.Menus;

@Service
public class MenuService {

	@Autowired
	private MenuMapper menuMapper;
	
	public List<Menus> getMenusByPage(int count1 ,int count2){
		return menuMapper.getMenusByPage(count1,count2);
	}
	
	public List<Menus> getAllMenus(){
		return menuMapper.getAllMenus();
	}
	
	public void deleteMenu(int id,HttpServletRequest request){
		Menus menus = menuMapper.getOneMenu(id);
		HttpSession session = request.getSession();
		ServletContext servletContext = session.getServletContext();		
		String requpath = servletContext.getRealPath("/");
		
		String fileName = menus.getImgName();
		String filePath = requpath+"\\images\\" + fileName;
		File file = new File(filePath);
		if(file.exists()){
			file.delete();
		}
		
		menuMapper.deleteMenu(id);
	}
	
	//删除之前的图片
	//获取新图片的名字debug
	public void updateMenu(Menus menus,HttpServletRequest request) throws Exception{
		String oldImgName = menus.getImgName();
		HttpSession session = request.getSession();
		ServletContext servletContext = session.getServletContext();		
		String requpath = servletContext.getRealPath("/");
		
		String oldFilePath =requpath+ "\\images\\" + oldImgName;
		File file = new File(oldFilePath);
		if(file.exists()){
			file.delete();
		}
				
		MultipartHttpServletRequest servletRequest = (MultipartHttpServletRequest) request;
		MultipartFile mfile = servletRequest.getFile("photo");
		String imgName = mfile.getOriginalFilename();
		imgName = UUID.randomUUID()+imgName;
		String filePath = requpath+"\\images\\"+imgName;
		byte[] b = new byte[1048576];
		InputStream inputStream = mfile.getInputStream();
		int length = inputStream.read(b);
		FileOutputStream outputStream = new FileOutputStream(filePath);
		outputStream.write(b, 0, length);
		inputStream.close();
		outputStream.close();
		
		menus.setImgName(imgName);
		
		
		menuMapper.updateMenu(menus);
		
		
	}
	
	public void addMenu(Menus menus,HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest servletRequest = (MultipartHttpServletRequest) request;
		MultipartFile mfile = servletRequest.getFile("photo");
		String imgName = mfile.getOriginalFilename();
		HttpSession session = request.getSession();
		ServletContext servletContext = session.getServletContext();		
		String requpath = servletContext.getRealPath("/");
		imgName = UUID.randomUUID()+imgName;
		String filePath = requpath+"\\images\\"+imgName;
		byte[] b = new byte[1048576];
		InputStream inputStream = mfile.getInputStream();
		int length = inputStream.read(b);
		FileOutputStream outputStream = new FileOutputStream(filePath);
		outputStream.write(b, 0, length);
		inputStream.close();
		outputStream.close();
		
		menus.setImgName(imgName);
		menuMapper.insertMenu(menus);
	}
	
	public int getTotalCount(){
		return menuMapper.getTotalCount();
	}
	
	public Menus getOneMenu(int id){
		return menuMapper.getOneMenu(id);
	}
}
