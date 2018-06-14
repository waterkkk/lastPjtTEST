package com.bom.dao;

import com.bom.biz.*;
import com.bom.dto.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreecommDao {

	private String commspace = "Freecomm_mapper.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<FreecommDto> commSelectAll(int freetable_no) {
		List<FreecommDto> res = new ArrayList<FreecommDto>();
		try {
			System.out.println("commSelectAll");
			res = sqlSession.selectList(commspace + "commSelectAll", freetable_no);
		} catch (Exception e) {
			System.out.println("commSelectAll error");
			e.printStackTrace();
		}
		return res;
	}

	public FreecommDto commSelectOne(int freecomm_no) {
		FreecommDto res = new FreecommDto();
		try {
			System.out.println("commSelectOne");
			res = sqlSession.selectOne(commspace + "commSelectOne", freecomm_no);
		} catch (Exception e) {
			System.out.println("commSelectOne error");
			e.printStackTrace();
		}
		return res;
	}

	
	// 댓글입력
	public int commInsert(FreecommDto dto) {
		int res = 0;
		try {
			System.out.println("commInsert");
			res = sqlSession.insert(commspace + "commInsert", dto);
		} catch (Exception e) {
			System.out.println("commInsert error");
			e.printStackTrace();
		}
		return res;
	}
	
	//댓글삭제
	public boolean delReply(int freecomm_no) {
		int res=0;
		try {
			System.out.println("delReply");
			res=sqlSession.delete(commspace+"delReply",freecomm_no);
		} catch (Exception e) {
			System.out.println("delReply error");
			e.printStackTrace();
		}
		if(res>0) {
			return true;
		}else {
			return false;
		}
	  }
	
	


	//대댓글-1 updateStep2
	public boolean updateStep2(int freecomm_groupNo, int freecomm_step) {
		int res=0;
		Map<String,Integer> map= new HashMap<String, Integer>();
		map.put("freecomm_groupNo", freecomm_groupNo);
		map.put("freecomm_step", freecomm_step);
		try {
			System.out.println("updateStep2");
			res=sqlSession.update(commspace+"updateStep2",map);
		} catch (Exception e) {
			System.out.println("updateStep2 error");
			e.printStackTrace();
		}
		if(res>0) {
			return true;
		}else {
			return false;
		}
	}
	
	// 대댓글-2 : 새로운 대댓글 insert 넣기: 원글과 같은 groupNo, step+1, titletab+1
	public boolean insertReply2(FreecommDto dto) {
		int res = 0;
		try {
			System.out.println("insertReply2");
			res = sqlSession.insert(commspace + "insertReply2", dto);
			
		} catch (Exception e) {
			System.out.println("insertReply2 error");
			e.printStackTrace();
		}
		if(res>0) {
			return true;
		}else {
			return false;
		}
	}


	
}
