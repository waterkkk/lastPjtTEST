package com.bom.biz;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dao.NutritionNameDao;
import com.bom.dao.NutritionNameDaoImpl;
import com.bom.dto.NutritionDto;

public class NutritionNameBizImpl implements NutritionNameBiz {

	@Override
	public List<NutritionDto> NameSearch(String fileName, String search) throws IOException, FileNotFoundException {
		NutritionNameDao dao = new NutritionNameDaoImpl();
		return dao.NameSearch(fileName, search);
	}

}
