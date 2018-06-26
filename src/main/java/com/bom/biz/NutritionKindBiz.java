package com.bom.biz;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dto.NutritionDto;

public interface NutritionKindBiz {
	public List<NutritionDto> kindSearch(String fileName, String search)  throws IOException, FileNotFoundException;
}
