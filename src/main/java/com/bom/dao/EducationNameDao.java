package com.bom.dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dto.EducDto;

public interface EducationNameDao {
	public List<EducDto> educationName(String fileName, String search) throws IOException, FileNotFoundException;
}
