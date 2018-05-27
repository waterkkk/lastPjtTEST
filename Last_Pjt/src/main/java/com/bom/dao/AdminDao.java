package com.bom.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bom.dto.AdminDto;

public interface AdminDao {
	
	String namespace = "admin.";
	
	public AdminDto selectOne(String member_id);
	public int insert(AdminDto dto);
	public int delete(String member_id);
	public int update(AdminDto dto);
	public List<AdminDto> searchList(String Admin_search,String Admin_keyword);
	public int roleUP(String member_id, String member_role);
	public int getTotalCount();
	public List<AdminDto> selectAll(int startNum, int endNum);

}
