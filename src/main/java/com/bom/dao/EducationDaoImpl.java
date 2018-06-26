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
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.bom.dto.EducDto;

public class EducationDaoImpl implements EducationDao{

	@Override
	public List<EducDto> education(String fileName) throws IOException, FileNotFoundException {
		FileInputStream xlsFile = new FileInputStream(new File(fileName));
		HSSFWorkbook workbook = new HSSFWorkbook(xlsFile);
		HSSFSheet sheet = workbook.getSheetAt(0);
		int xlsRows = sheet.getPhysicalNumberOfRows();
		List<EducDto> list = new ArrayList<EducDto>();
		
		for(int rownum = 1; rownum < xlsRows; rownum++) {
			HSSFRow xlsRow = sheet.getRow(rownum);
			EducDto dto = new EducDto();
			dto.setName(xlsRow.getCell(0));
			dto.setTeacher(xlsRow.getCell(1));
			dto.setStart(xlsRow.getCell(2));
			dto.setEnd(xlsRow.getCell(3));
			dto.setStartTime(xlsRow.getCell(4));
			dto.setEndTime(xlsRow.getCell(5));
			dto.setContent(xlsRow.getCell(6));
			dto.setObject(xlsRow.getCell(7));
			dto.setWay(xlsRow.getCell(8));
			dto.setOpWeek(xlsRow.getCell(9));
			dto.setPlace(xlsRow.getCell(10));
			dto.setMax(xlsRow.getCell(11));
			dto.setPrice(xlsRow.getCell(12));
			dto.setRoadName(xlsRow.getCell(13));
			dto.setOpName(xlsRow.getCell(14));
			dto.setCallNum(xlsRow.getCell(15));
			dto.setAcceptStart(xlsRow.getCell(16));
			dto.setAcceptEnd(xlsRow.getCell(17));
			dto.setAcceptWay(xlsRow.getCell(18));
			dto.setSelectWay(xlsRow.getCell(19));
			dto.setURL(xlsRow.getCell(20));
			
			list.add(dto);
		}
		return list;
	}

}
