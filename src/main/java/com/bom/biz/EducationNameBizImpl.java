package com.bom.biz;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dao.EducationNameDao;
import com.bom.dao.EducationNameDaoImpl;
import com.bom.dto.EducDto;

public class EducationNameBizImpl implements EducationNameBiz{

	@Override
	public List<EducDto> educationName(String fileName, String search) throws IOException, FileNotFoundException {
		EducationNameDao dao = new EducationNameDaoImpl();
		return dao.educationName(fileName, search);
	}

}
