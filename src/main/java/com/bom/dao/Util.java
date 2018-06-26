package com.bom.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import com.bom.dto.IndiDto;

public class Util {
	private String toDates;
	
	public String getToDates() {
		return toDates;
	}
	
	public void setToDates(String mDate) {
		String m = mDate.substring(0, 4) + "-"
				 + mDate.substring(4, 6) + "-"
				 + mDate.substring(6, 8) + "-"
				 + mDate.substring(8, 10) + ":"
				 + mDate.substring(10) + ":00";
		
		Timestamp tm = Timestamp.valueOf(m);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분");
		
		this.toDates = sdf.format(tm);
	}
	
	public static String fontColor(int date, int dayOfWeek) {
		String color="";
		
		if((dayOfWeek - 1 + date) % 7 == 0) {
			color = "blue";
		}else if((dayOfWeek - 1 + date) % 7 == 1) {
			color = "red";
		}else {
			color = "black";
		}
		return color;
	}
	
	public static String isTwo(String msg) {
		return (msg.length() != 2)? "0"+msg : msg;
	}
	
	public static String getCalView(int i, List<IndiDto> clist) {
		String day = isTwo(i+"");
		String res = "";
		
		for(IndiDto dto  : clist) {
			if(dto.getInMdate().substring(6, 8).equals(day)) {
				res += "<p><a href='detail.do?No="+dto.getInNo()+"'>"
						+(dto.getInTitle().length()>6?dto.getInTitle().substring(0,5)+"..":dto.getInTitle())
						+"</a></p>";
			}
		}
		
		return res;
	}
}
