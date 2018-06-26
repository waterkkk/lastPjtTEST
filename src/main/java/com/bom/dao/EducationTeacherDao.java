package com.bom.dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dto.EducDto;

public interface EducationTeacherDao {
	public List<EducDto> educationTeacher(String fileName, String search) throws IOException, FileNotFoundException;
}
