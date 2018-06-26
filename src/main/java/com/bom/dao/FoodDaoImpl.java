package com.bom.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Sheet;

import com.bom.dto.FoodDto;

public class FoodDaoImpl implements FoodDao {

	@Override
	public List<FoodDto> parseXls(String fileName) throws FileNotFoundException, IOException {
		FileInputStream xlsFile = new FileInputStream(new File(fileName));
		HSSFWorkbook workbook = new HSSFWorkbook(xlsFile);
		HSSFSheet sheet = workbook.getSheetAt(0);
		int xlsRows = sheet.getPhysicalNumberOfRows();
		List<FoodDto> list = new ArrayList<FoodDto>();
		for(int rownum = 0; rownum < xlsRows; rownum++) {
			HSSFRow xlsRow = sheet.getRow(rownum);
			FoodDto dto = new FoodDto();
			dto.setFoodNum(xlsRow.getCell(0));
			dto.setFoodKind(xlsRow.getCell(1));
			dto.setFoodName(xlsRow.getCell(3));
			dto.setFoodOneProv(xlsRow.getCell(4));
			dto.setFoodKcal(xlsRow.getCell(5));
			dto.setFoodCarbo(xlsRow.getCell(6));
			dto.setFoodProtein(xlsRow.getCell(7));
			dto.setFoodFat(xlsRow.getCell(8));
			dto.setFoodGlucos(xlsRow.getCell(9));
			dto.setFoodNat(xlsRow.getCell(10));
			dto.setFoodChole(xlsRow.getCell(11));
			dto.setFoodSFA(xlsRow.getCell(12));
			dto.setFoodTFA(xlsRow.getCell(13));
			list.add(dto);
		}
		return list;
	}

}
