package com.bom.biz;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dto.FoodDto;

public interface FoodKindBiz {
	public List<FoodDto> searchKind(String fileName, String search) throws FileNotFoundException, IOException;
}
