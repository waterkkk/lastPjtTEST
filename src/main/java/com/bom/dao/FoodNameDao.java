package com.bom.dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dto.FoodDto;

public interface FoodNameDao {
	public List<FoodDto> searchName(String fileName, String search) throws FileNotFoundException, IOException;
}
