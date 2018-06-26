package com.bom.biz;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dao.NutritionKindDao;
import com.bom.dao.NutritionKindDaoImpl;
import com.bom.dto.NutritionDto;

public class NutritionKindBizImpl implements NutritionKindBiz {

	@Override
	public List<NutritionDto> kindSearch(String fileName, String search) throws IOException, FileNotFoundException {
		NutritionKindDao dao =  new NutritionKindDaoImpl();
		return dao.kindSearch(fileName, search);
	}

}
