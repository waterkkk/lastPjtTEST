package com.bom.biz;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dto.NutritionDto;

public interface NutritionNameBiz {
	public List<NutritionDto> NameSearch(String fileName, String search) throws IOException, FileNotFoundException;
}
