package com.web.entity;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Menus implements Serializable{
	
	private Integer id;
	
	private String name;
	
	private String imgName;
	
	private Integer price;
	
	private String remark;
	
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	private Integer mtid;
	
	//private MenuType menuType;
	
	public Integer getMtid() {
		return mtid;
	}

	public void setMtid(Integer mtid) {
		this.mtid = mtid;
	}

	private String discription;

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	/*public MenuType getMenuType() {
		return menuType;
	}

	public void setMenuType(MenuType menuType) {
		this.menuType = menuType;
	}*/

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	
	

}
