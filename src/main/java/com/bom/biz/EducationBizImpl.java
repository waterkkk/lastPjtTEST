package com.bom.biz;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dao.EducationDao;
import com.bom.dao.EducationDaoImpl;
import com.bom.dto.EducDto;

public class EducationBizImpl implements EducationBiz{

	@Override
	public List<EducDto> education(String fileName) throws FileNotFoundException, IOException {
		EducationDao dao = new EducationDaoImpl();
		return dao.education(fileName);
	}
	
}
