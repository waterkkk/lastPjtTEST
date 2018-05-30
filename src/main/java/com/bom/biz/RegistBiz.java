package com.bom.biz;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bom.dao.RegistDao;
import com.bom.dto.RegistDto;

@Service
public class RegistBiz {
	private String regispace="Regist_mapper.";
	
	@Autowired
	private RegistDao dao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
    
	//회원정보 입력
	public int insertUser(RegistDto dto) {
		return dao.insertUser(dto);
	}

	//id 중복체크
		public RegistDto idChk(String member_id) {
			RegistDto res= new RegistDto();
			Map<String,String> map=new HashMap<String,String>();
			map.put("member_id", member_id);
			
			try {
				res=sqlSession.selectOne(regispace+"idChk",map);
				System.out.println("idchk returned");
			} catch (Exception e) {
				System.out.println("idchk error");
				e.printStackTrace();
			}
			return res;
		}
		
		
		//email 중복체크
			public RegistDto emailChk(String member_email) {
				RegistDto res= new RegistDto();
				Map<String,String> map=new HashMap<String,String>();
				map.put("member_email", member_email);
				
				try {
					res=sqlSession.selectOne(regispace+"emailChk",map);
					System.out.println("emailChk returned");
				} catch (Exception e) {
					System.out.println("emailChk error");
					e.printStackTrace();
				}
				return res;
			}
			
			
			//phone 중복체크
			public RegistDto phoneChk(String member_phone) {
				RegistDto res= new RegistDto();
				Map<String,String> map=new HashMap<String,String>();
				map.put("member_phone", member_phone);
				
				try {
					res=sqlSession.selectOne(regispace+"phoneChk",map);
					System.out.println("phoneChk returned");
				} catch (Exception e) {
					System.out.println("phoneChk error");
					e.printStackTrace();
				}
				return res;
			}
}
