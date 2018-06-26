package com.bom.biz;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dto.EducDto;

public interface EducationTeacherBiz {
	public List<EducDto> educationTeacher(String fileName, String search) throws IOException, FileNotFoundException;
}
