package com.bom.biz;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dao.FoodNameDao;
import com.bom.dao.FoodNameDaoImpl;
import com.bom.dto.FoodDto;

public class FoodNameBizImpl implements FoodNameBiz {

	@Override
	public List<FoodDto> searchName(String fileName, String search) throws FileNotFoundException, IOException {
		FoodNameDao dao = new FoodNameDaoImpl();
		return dao.searchName(fileName, search);
	}

}
