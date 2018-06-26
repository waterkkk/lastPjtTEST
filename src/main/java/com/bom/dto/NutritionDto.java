package com.bom.dto;

import org.apache.poi.hssf.usermodel.HSSFCell;

public class NutritionDto {
	private HSSFCell foodNo;
	private HSSFCell foodKind;
	private HSSFCell foodName;
	private HSSFCell foodOne;
	private HSSFCell foodKcal;
	private HSSFCell foodCarbo;
	private HSSFCell foodProtein;
	private HSSFCell foodFat;
	private HSSFCell foodGlucos;
	private HSSFCell foodNat;
	private HSSFCell foodChole;
	private HSSFCell foodsfa;
	private HSSFCell foodtfa;
	
	
	public HSSFCell getFoodNo() {
		return foodNo;
	}


	public void setFoodNo(HSSFCell foodNo) {
		this.foodNo = foodNo;
	}


	public HSSFCell getFoodKind() {
		return foodKind;
	}


	public void setFoodKind(HSSFCell foodKind) {
		this.foodKind = foodKind;
	}


	public HSSFCell getFoodName() {
		return foodName;
	}


	public void setFoodName(HSSFCell foodName) {
		this.foodName = foodName;
	}


	public HSSFCell getFoodOne() {
		return foodOne;
	}


	public void setFoodOne(HSSFCell foodOne) {
		this.foodOne = foodOne;
	}


	public HSSFCell getFoodKcal() {
		return foodKcal;
	}


	public void setFoodKcal(HSSFCell foodKcal) {
		this.foodKcal = foodKcal;
	}


	public HSSFCell getFoodCarbo() {
		return foodCarbo;
	}


	public void setFoodCarbo(HSSFCell foodCarbo) {
		this.foodCarbo = foodCarbo;
	}


	public HSSFCell getFoodProtein() {
		return foodProtein;
	}


	public void setFoodProtein(HSSFCell foodProtein) {
		this.foodProtein = foodProtein;
	}


	public HSSFCell getFoodFat() {
		return foodFat;
	}


	public void setFoodFat(HSSFCell foodFat) {
		this.foodFat = foodFat;
	}


	public HSSFCell getFoodGlucos() {
		return foodGlucos;
	}


	public void setFoodGlucos(HSSFCell foodGlucos) {
		this.foodGlucos = foodGlucos;
	}


	public HSSFCell getFoodNat() {
		return foodNat;
	}


	public void setFoodNat(HSSFCell foodNat) {
		this.foodNat = foodNat;
	}


	public HSSFCell getFoodChole() {
		return foodChole;
	}


	public void setFoodChole(HSSFCell foodChole) {
		this.foodChole = foodChole;
	}


	public HSSFCell getFoodsfa() {
		return foodsfa;
	}


	public void setFoodsfa(HSSFCell foodsfa) {
		this.foodsfa = foodsfa;
	}


	public HSSFCell getFoodtfa() {
		return foodtfa;
	}


	public void setFoodtfa(HSSFCell foodtfa) {
		this.foodtfa = foodtfa;
	}

	public NutritionDto() {
		
	}
	public NutritionDto(HSSFCell foodNo, HSSFCell foodKind, HSSFCell foodName, HSSFCell foodOne, HSSFCell foodKcal, HSSFCell foodCarbo, HSSFCell foodProtein, HSSFCell foodFat, HSSFCell foodGlucos, HSSFCell foodNat, HSSFCell foodChole, HSSFCell foodsfa, HSSFCell foodtfa) {
		this.foodNo = foodNo;
		this.foodKind = foodKind;
		this.foodName = foodName;
		this.foodOne = foodOne;
		this.foodKcal = foodKcal;
		this.foodCarbo = foodCarbo;
		this.foodProtein = foodProtein;
		this.foodFat = foodFat;
		this.foodGlucos = foodGlucos;
		this.foodNat = foodNat;
		this.foodChole = foodChole;
		this.foodsfa = foodsfa;
		this.foodtfa = foodtfa;
	}
	
	
}
