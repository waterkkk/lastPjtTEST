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

import com.bom.dto.NutritionDto;

public class NutritionDaoImpl implements NutritionDao {
	
	@Override
	public List<NutritionDto> ParseXls(String fileName) throws FileNotFoundException, IOException {
		FileInputStream xlsFile = new FileInputStream(new File(fileName));
		HSSFWorkbook workbook = new HSSFWorkbook(xlsFile);
		HSSFSheet sheet = workbook.getSheetAt(0);
		int xlsRows = sheet.getPhysicalNumberOfRows();
		List<NutritionDto> list = new ArrayList<NutritionDto>();
		for(int rownum = 0; rownum<xlsRows; rownum++) {
			HSSFRow xlsRow = sheet.getRow(rownum);
			NutritionDto dto = new NutritionDto();
			dto.setFoodNo(xlsRow.getCell(0));
			dto.setFoodKind(xlsRow.getCell(1));
			dto.setFoodName(xlsRow.getCell(2));
			dto.setFoodOne(xlsRow.getCell(3));
			dto.setFoodKcal(xlsRow.getCell(4));
			dto.setFoodCarbo(xlsRow.getCell(5));
			dto.setFoodProtein(xlsRow.getCell(6));
			dto.setFoodFat(xlsRow.getCell(7));
			dto.setFoodGlucos(xlsRow.getCell(8));
			dto.setFoodNat(xlsRow.getCell(9));
			dto.setFoodChole(xlsRow.getCell(10));
			dto.setFoodsfa(xlsRow.getCell(11));
			dto.setFoodtfa(xlsRow.getCell(12));
			list.add(dto);
		}
		return list;
	}
}
	
