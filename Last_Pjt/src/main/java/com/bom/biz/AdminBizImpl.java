package com.bom.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bom.dao.AdminDao;
import com.bom.dto.AdminDto;

@Service
public class AdminBizImpl implements AdminBiz {

	@Autowired
	private AdminDao dao;

	@Override
	public List<AdminDto> selectAll(int startPost, int endPost) {
		return dao.selectAll(startPost, endPost);
	}

	@Override
	public AdminDto selectOne(String member_id) {
		return dao.selectOne(member_id);
	}

	@Override
	public int insert(AdminDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int delete(String member_id) {
		return dao.delete(member_id);
	}

	@Override
	public int update(AdminDto dto) {
		return dao.update(dto);
	}

	public List<AdminDto> searchList(String Admin_search, String Admin_keyword) {
		return dao.searchList(Admin_search, Admin_keyword);
	}

	public int roleUP(String member_id, String member_role) {
		return dao.roleUP(member_id, member_role);
	}
	
	public int getTotalCount() {
		return dao.getTotalCount();
	}

}