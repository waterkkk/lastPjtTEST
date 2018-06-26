package com.bom.biz;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dto.EducDto;

public interface EducationBiz {
	List<EducDto> education(String fileName) throws FileNotFoundException, IOException;
}
