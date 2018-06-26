package com.bom.biz;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dto.NutritionDto;

public interface NutritionBiz {
	public List<NutritionDto> ParseXls(String fileName) throws FileNotFoundException, IOException;
}
