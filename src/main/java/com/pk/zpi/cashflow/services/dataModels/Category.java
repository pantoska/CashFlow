package com.pk.zpi.cashflow.services.dataModels;


import java.util.List;

public class Category {
    private int id_category;
    private String name;
    private String color;
    private List<Subcategory> subcategoryList;
    private boolean is_income;
    private int id_def_subcategory;

    public Category(int id_category, String name, String color, List<Subcategory> subcategoryList, boolean is_income, int id_def_subcategory) {
        this.id_category = id_category;
        this.name = name;
        this.color = color;
        this.subcategoryList = subcategoryList;
        this.is_income = is_income;
        this.id_def_subcategory = id_def_subcategory;
    }

    public int getId_category() {
        return id_category;
    }

    public void setId_category(int id_category) {
        this.id_category = id_category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public List<Subcategory> getSubcategoryList() {
        return subcategoryList;
    }

    public void setSubcategoryList(List<Subcategory> subcategoryList) {
        this.subcategoryList = subcategoryList;
    }

    public boolean isIs_income() {
        return is_income;
    }

    public void setIs_income(boolean is_income) {
        this.is_income = is_income;
    }

    public int getId_def_subcategory() {
        return id_def_subcategory;
    }

    public void setId_def_subcategory(int id_def_subcategory) {
        this.id_def_subcategory = id_def_subcategory;
    }
}
