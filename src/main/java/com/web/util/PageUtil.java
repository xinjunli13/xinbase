package com.web.util;

public class PageUtil {
	
	public static boolean isHasNext(int total,int nowpage,int pagecount){
		int totalpage = 0;
		if(total%pagecount == 0 && total>=pagecount){
			totalpage = total/pagecount;
		}
		else {
			totalpage = total/pagecount+1;
		}
		
		if(nowpage < totalpage){
			return true;
		}
		return false;
	}
	
	public static boolean isHasPre(int nowpage){
		if(nowpage == 1){
			return false;
		}
		return true;
	}
	
	public static int getTotalPage(int total,int pageCount){
		int totalpage = 0;
		if(total%pageCount == 0 && total>=pageCount){
			totalpage = total/pageCount;
		}
		else {
			totalpage = total/pageCount+1;
		}
		return totalpage;
	}

}
