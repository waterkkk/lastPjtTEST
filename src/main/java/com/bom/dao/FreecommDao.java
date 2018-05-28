package com.bom.dao;

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

	public FreecommDto commSelectOne(int freetable_no) {
		FreecommDto res = new FreecommDto();
		try {
			System.out.println("commSelectOne");
			res = sqlSession.selectOne(commspace + "commSelectOne", freetable_no);
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

	// 대댓글-1 : 기존의 대댓글 미뤄주기 : 원글 parent와 groupNo가 같고 step이 더 큰 기존 대댓글의 step+1
	public int stepUpdate(int freecomm_groupNo, int freecomm_step) {
		int res = 0;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("freecomm_groupNo", freecomm_groupNo);
		map.put("freecomm_step", freecomm_step);

		try {
			System.out.println("stepUpdate");
			res = sqlSession.update(commspace + "stepUpdate", map);
			if (res > 0) {
				sqlSession.commit();
			}
		} catch (Exception e) {
			System.out.println("stepUpdate error");
			e.printStackTrace();
			sqlSession.rollback();
		}
		return res;
	}

	// 대댓글-2 : 새로운 대댓글 insert 넣기: 원글과 같은 groupNo, step+1, titletab+1
	public int insertReply2(FreecommDto dto) {
		int res = 0;
		try {
			System.out.println("insertReply2");
			res = sqlSession.insert(commspace + "insertReply2", dto);
			if (res > 0) {
				sqlSession.commit();
			}
		} catch (Exception e) {
			System.out.println("insertReply2 error");
			e.printStackTrace();
		}
		return res;
	}


	
}
