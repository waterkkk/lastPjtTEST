package com.bom.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bom.dto.FreetableDto;

@Repository
public class FreetableDao {
	private String namespace = "Freetable_mapper.";
	

	@Autowired
	private SqlSessionTemplate sqlSession;

	// paging-1
	public List<FreetableDto> selectFTAll(int startPost, int endPost) {
		List<FreetableDto> res = new ArrayList<FreetableDto>();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startPost", startPost);
		map.put("endPost", endPost);

		try {
			System.out.println("selectFTAll");
			res = sqlSession.selectList(namespace + "paging", map);
		} catch (Exception e) {
			System.out.println("selectFTAll error");
			e.printStackTrace();
		} 
		return res;
	}

	
	// paging-2 : 글 갯수 구하기
	public int getTotalCnt() {
		int res = 0;
		try {
			System.out.println("getTotalCnt");
			res = sqlSession.selectOne(namespace + "getTotalCnt");
		} catch (Exception e) {
			System.out.println("getTotalCnt error");
			e.printStackTrace();
		} 
		return res;
	}

	public List<FreetableDto> selectAll() {
		List<FreetableDto> res = new ArrayList<FreetableDto>();
		try {		
			res = sqlSession.selectList(namespace + "selectAll");
			System.out.println("selectAll");
		} catch (Exception e) {
			System.out.println("selectAll error");
			e.printStackTrace();
		} 
		return res;
	}

	public FreetableDto selectOne(String freetable_id) {
		FreetableDto res = new FreetableDto();
		try {
			res = sqlSession.selectOne(namespace + "selectOne", freetable_id);
		} catch (Exception e) {
			System.out.println("selectOne error");
			e.printStackTrace();
		}
		return res;
	}

	public boolean insert(FreetableDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(namespace + "insert", dto);
		} catch (Exception e) {
			System.out.println("insert error");
			e.printStackTrace();
		}
		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	public boolean update(FreetableDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(namespace + "update", dto);
		} catch (Exception e) {
			System.out.println("update error");
			e.printStackTrace();
		}
		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

	public boolean delete(String freetable_id) {
		System.out.println("test1");

		int res = 0;
				try {
			res = sqlSession.delete(namespace + "delete", freetable_id);
		} catch (Exception e) {
			System.out.println("delete error");
			e.printStackTrace();
		}
		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

// 답글-1 updateStep
	public boolean updateStep(int freetable_groupNo, int freetable_step) {
		int res = 0;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("freetable_groupNo", freetable_groupNo);
		map.put("freetable_step", freetable_step);
		try {
			System.out.println("updateStep");
			res = sqlSession.update(namespace + "updateStep", map);
		} catch (Exception e) {
			System.out.println("updateStep error");
			e.printStackTrace();
		} 
		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

// 답글-2 insertReply
	public boolean insertReply(FreetableDto dto) {
		int res = 0;
		try {
			System.out.println("insertReply");
			res = sqlSession.insert(namespace + "insertReply", dto);
		} catch (Exception e) {
			System.out.println("insertReply error");
			e.printStackTrace();
		} 
		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}

// 글조회수
	public boolean updateReadCount(String freetable_id) {
		int res = 0;
		try {
			System.out.println("updateReadCount");
			res = sqlSession.update(namespace + "updateReadCount", freetable_id);
		} catch (Exception e) {
			System.out.println("updateReadCount error");
			e.printStackTrace();
		} 
		if (res > 0) {
			return true;
		} else {
			return false;
		}
	}
	
// 검색
	public List<FreetableDto> searchId(String freetable_id) {
		List<FreetableDto> res = new ArrayList<FreetableDto>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("freetable_id", freetable_id);

		try {
			res = sqlSession.selectList(namespace + "searchId", map);
			System.out.println("searchId ok");
		} catch (Exception e) {
			System.out.println("searchId error");
			e.printStackTrace();
		}
		return res;
	}

	
	public List<FreetableDto> searchTitle(String freetable_title) {
		List<FreetableDto> res = new ArrayList<FreetableDto>();
		Map<String, String> map = new HashMap<String, String>();
		map.put("freetable_title", freetable_title);

		try {
			res = sqlSession.selectList(namespace + "searchTitle", map);
			System.out.println("searchTitle ok");
		} catch (Exception e) {
			System.out.println("searchTitle error");
			e.printStackTrace();
		}
		return res;
	}

	
	public List<FreetableDto> searchNo(int freetable_no) {
		List<FreetableDto> res = new ArrayList<FreetableDto>();
		try {
			res = sqlSession.selectList(namespace + "searchNo", freetable_no);
			System.out.println("searchNo ok");
		} catch (Exception e) {
			System.out.println("searchNo error");
			e.printStackTrace();
		}
		return res;
	}

	
	public List<FreetableDto> searchContent(String freetable_content) {
		List<FreetableDto> res = new ArrayList<FreetableDto>();
		Map<String, String> map = new HashMap<String, String>();
		map.put("freetable_content", freetable_content);

		try {
			res = sqlSession.selectList(namespace + "searchContent", map);
			System.out.println("searchContent ok");
		} catch (Exception e) {
			System.out.println("searchContent error");
			e.printStackTrace();
		}
		return res;
	}


}
