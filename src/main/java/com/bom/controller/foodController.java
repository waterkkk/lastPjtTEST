package com.bom.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bom.biz.FoodBiz;
import com.bom.biz.FoodBizImpl;
import com.bom.biz.FoodKindBiz;
import com.bom.biz.FoodKindBizImpl;
import com.bom.biz.FoodNameBiz;
import com.bom.biz.FoodNameBizImpl;
import com.bom.dto.FoodDto;

@Controller
public class foodController {
	@RequestMapping(value="food.do", method=RequestMethod.GET)
	public String food(Model model, @RequestParam("currentPage") String currentPage) throws FileNotFoundException, IOException {

		String fileName = "C:\\SpringWorkspace\\Last_Pjt_180621_11\\src\\main\\resources\\xls\\OPENDATA_FOOD_2..xls";
		FoodBiz biz = new FoodBizImpl();
		List<FoodDto> list = biz.parseXls(fileName);
		int total = list.size();
		int current = Integer.parseInt(currentPage);
		int start = (current * 10) - 9;
		int end = current * 10;
		int startPage = (int)(((Math.ceil((current/9)))*9))+1;
		int before = (int)(Math.ceil((current/10)))+1;
		int endPage = (int)((((Math.ceil((current/9)))+1)*9));
		int lastPage = 0;
		if((total%10) == 0) {
			lastPage = (int)(Math.ceil(total/10));
		}else if((total%10)!=0) {
			lastPage = (int)(Math.ceil(total/10))+1;
		}
		if(lastPage <= endPage) {
			endPage = lastPage;
		}
		if(current == lastPage && (int)(total%10) != 0) {
			end = (int)(start + (total%10)-2);
		}
		System.out.println(start);
		System.out.println(end);
		System.out.println(list.size());
		System.out.println(startPage);
		System.out.println(endPage);
		model.addAttribute("list", list);
		model.addAttribute("current" , current);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("before" , before);
		model.addAttribute("lastPage", lastPage);
		return "food/Food_list";
	}
	@RequestMapping(value="foodSearch.do", method=RequestMethod.GET)
	public String FoodSearch(Model model, @RequestParam("currentPage") String currentPage, @RequestParam("kind") String kind, @RequestParam("search") String search) throws FileNotFoundException, IOException {
		String fileName = "C:\\SpringWorkspace\\Last_Pjt_180621_11\\src\\main\\resources\\xls\\OPENDATA_FOOD_2..xls";
		FoodKindBiz KindBiz = new FoodKindBizImpl();
		FoodNameBiz NameBiz = new FoodNameBizImpl();
		List<FoodDto> slist = null;
		if(kind.equals("kind")) {
			slist = KindBiz.searchKind(fileName, search);
		}else if(kind.equals("name")) {
			slist = NameBiz.searchName(fileName, search);
		}
		int total = slist.size();
		int current = Integer.parseInt(currentPage);
		int start = (current * 10) - 9;
		int end = current * 10;
		int startPage = (int)(((Math.ceil((current/9)))*9))+1;
		int before = (int)(Math.ceil((current/10)))+1;
		int next = before + 9;
		int endPage = (int)((((Math.ceil((current/9)))+1)*9));
		int lastPage = 0;
		if((total%10) == 0) {
			lastPage = (int)(Math.ceil(total/10));
		}else if((total%10)!=0) {
			lastPage = (int)(Math.ceil(total/10))+1;
		}
		if(lastPage <= endPage) {
			endPage = lastPage;
		}
		if(current == lastPage && (int)(total%10) != 0) {
			end = (int)(start + (total%10)-2);
		}
		System.out.println(startPage);
		System.out.println(endPage);
		model.addAttribute("current", current);
		model.addAttribute("slist", slist);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("endPage", endPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("next", next);
		model.addAttribute("before", before);
		model.addAttribute("search", search);
		model.addAttribute("kind", kind);
		return "food/Food_list";
	}
}
