package com.bom.dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dto.FoodDto;

public interface FoodDao {
	public List<FoodDto> parseXls(String fileName) throws FileNotFoundException, IOException;
}
