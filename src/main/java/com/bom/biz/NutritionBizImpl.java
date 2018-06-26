package com.bom.biz;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dao.NutritionDao;
import com.bom.dao.NutritionDaoImpl;
import com.bom.dto.NutritionDto;

public class NutritionBizImpl implements NutritionBiz {

	@Override
	public List<NutritionDto> ParseXls(String fileName) throws FileNotFoundException, IOException {
		NutritionDao dao = new NutritionDaoImpl();
		return dao.ParseXls(fileName);
	}

}
