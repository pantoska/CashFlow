package com.pk.zpi.cashflow.models;


public class Category {
    private int id_category;
    private String name;
    private String color;
    private boolean is_income;
    private int id_def_subcategory;

    public Category(int id_category, String name, String color, boolean is_income, int id_def_subcategory) {
        this.id_category = id_category;
        this.name = name;
        this.color = color;
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

