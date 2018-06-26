package com.bom.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bom.dao.NoticDao;
import com.bom.dto.NoticDto;
@Service
public class NoticBizImpl implements NoticBiz{
	
	@Autowired
	NoticDao dao;
	
	@Override
	public List<NoticDto> notice(int startPost, int endPost) {
		return dao.notice(startPost, endPost);
	}

	@Override
	public NoticDto noticeOne(int no) {
		int res = dao.ReadCount(no);
		if(res > 0) {
		}else {
			System.out.println("Failed count");
		}
		return dao.noticeOne(no);
	}

	@Override
	public int noticeInsert(NoticDto dto) {
		return dao.noticeInsert(dto);
	}

	@Override
	public int noticeUpdate(NoticDto dto) {
		return dao.noticeUpdate(dto);
	}

	@Override
	public int noticeDelete(int no) {
		return dao.noticeDelete(no);
	}

	@Override
	public int countPost() {
		return dao.countPost();
	}
}
