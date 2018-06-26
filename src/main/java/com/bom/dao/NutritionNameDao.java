package com.bom.dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dto.NutritionDto;

public interface NutritionNameDao {
	public List<NutritionDto> NameSearch(String fileName, String search) throws IOException, FileNotFoundException;
}
