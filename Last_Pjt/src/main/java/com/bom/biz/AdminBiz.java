package com.bom.biz;

import java.util.List;

import com.bom.dto.APItest;
import com.bom.dto.AdminDto;

public interface AdminBiz {
	
	public AdminDto selectOne(String member_id);
	public int insert(AdminDto dto);
	public int delete(String member_id);
	public int update(AdminDto dto);
	public List<AdminDto> searchList(String Admin_search,String Admin_keyword);
	public int roleUP(String member_id, String member_role);
	public int getTotalCount();
	public List<AdminDto> selectAll(int startNum, int endNum);
	public List<APItest> searchLoadList(String COURSE_CATEGORY_NM, String Admin_keywordload);

}
