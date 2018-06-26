package com.bom.biz;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.bom.dao.FoodKindDao;
import com.bom.dao.FoodKindDaoImpl;
import com.bom.dto.FoodDto;

public class FoodKindBizImpl implements FoodKindBiz {

	@Override
	public List<FoodDto> searchKind(String fileName, String search) throws FileNotFoundException, IOException {
		FoodKindDao dao = new FoodKindDaoImpl();
		return dao.searchKind(fileName, search);
	}

}
