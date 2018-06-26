package com.bom.dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dto.FoodDto;

public interface FoodKindDao {
	public List<FoodDto> searchKind(String fileName, String search) throws FileNotFoundException, IOException;
}
