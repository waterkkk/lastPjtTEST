package com.bom.biz;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dao.EducationTeacherDao;
import com.bom.dao.EducationTeacherDaoImpl;
import com.bom.dto.EducDto;

public class EducationTeacherBizImpl implements EducationTeacherBiz{

	@Override
	public List<EducDto> educationTeacher(String fileName, String search) throws IOException, FileNotFoundException {
		EducationTeacherDao dao = new EducationTeacherDaoImpl();
		return dao.educationTeacher(fileName, search);
	}

}
