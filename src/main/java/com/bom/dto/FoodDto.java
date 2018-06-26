package com.bom.dto;

import org.apache.poi.hssf.usermodel.HSSFCell;

public class FoodDto {
	private HSSFCell foodNum;
	private HSSFCell foodKind;
	private HSSFCell foodName;
	private HSSFCell foodOneProv;
	private HSSFCell foodKcal;
	private HSSFCell foodCarbo;
	private HSSFCell foodProtein;
	private HSSFCell foodFat;
	private HSSFCell foodGlucos;
	private HSSFCell foodNat;
	private HSSFCell foodChole;
	private HSSFCell foodSFA;
	private HSSFCell foodTFA;
	
	public FoodDto() {
		
	}
	
	public FoodDto(HSSFCell foodNum, HSSFCell foodKind, HSSFCell foodName, HSSFCell foodOneProv, HSSFCell foodKcal, HSSFCell foodCarbo, HSSFCell foodProtein, HSSFCell foodFat, HSSFCell foodGlucos, HSSFCell foodNat, HSSFCell foodChole, HSSFCell foodSFA, HSSFCell foodTFA) {
		this.foodNum = foodNum;
		this.foodKind = foodKind;
		this.foodName = foodName;
		this.foodOneProv = foodOneProv;
		this.foodKcal = foodKcal;
		this.foodCarbo = foodCarbo;
		this.foodProtein = foodProtein;
		this.foodFat = foodFat;
		this.foodGlucos = foodGlucos;
		this.foodNat = foodNat;
		this.foodChole = foodChole;
		this.foodSFA = foodSFA;
		this.foodTFA = foodTFA;
	}

	public HSSFCell getFoodNum() {
		return foodNum;
	}

	public void setFoodNum(HSSFCell foodNum) {
		this.foodNum = foodNum;
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

	public HSSFCell getFoodOneProv() {
		return foodOneProv;
	}

	public void setFoodOneProv(HSSFCell foodOneProv) {
		this.foodOneProv = foodOneProv;
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

	public HSSFCell getFoodSFA() {
		return foodSFA;
	}

	public void setFoodSFA(HSSFCell foodSFA) {
		this.foodSFA = foodSFA;
	}

	public HSSFCell getFoodTFA() {
		return foodTFA;
	}

	public void setFoodTFA(HSSFCell foodTFA) {
		this.foodTFA = foodTFA;
	}	
}
