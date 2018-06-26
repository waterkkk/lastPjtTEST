package com.bom.dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dto.EducDto;

public interface EducationDao {
	public List<EducDto> education(String fileName) throws IOException, FileNotFoundException;
}
