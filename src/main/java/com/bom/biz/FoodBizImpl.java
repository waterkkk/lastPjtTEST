package com.bom.biz;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dao.FoodDao;
import com.bom.dao.FoodDaoImpl;
import com.bom.dto.FoodDto;

public class FoodBizImpl implements FoodBiz {

	@Override
	public List<FoodDto> parseXls(String fileName) throws FileNotFoundException, IOException {
		FoodDao dao = new FoodDaoImpl();
		return dao.parseXls(fileName);
	}

}
