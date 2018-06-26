package com.bom.biz;

import java.util.List;

import com.bom.dto.NoticDto;

public interface NoticBiz {
	public List<NoticDto> notice(int startPost, int endPost);
	public NoticDto noticeOne(int no);
	public int noticeInsert(NoticDto dto);
	public int noticeUpdate(NoticDto dto);
	public int noticeDelete(int no);
	public int countPost();
}
