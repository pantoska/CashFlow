package com.pk.zpi.cashflow.model.request;

public class NewCategoryRequest {
    public String categoryName;
    public int id_color = -1;
    public int id_user = -1;
    public boolean is_income;

    public NewCategoryRequest() {}

    public NewCategoryRequest(String categoryName, int id_color, int id_user, boolean is_income) {
        this.categoryName = categoryName;
        this.id_color = id_color;
        this.id_user = id_user;
        this.is_income = is_income;
    }

    public boolean isAllData() {
        return categoryName.length() != 0 && id_color != -1 && id_user != -1;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getId_color() {
        return id_color;
    }

    public void setId_color(int id_color) {
        this.id_color = id_color;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public boolean isIs_income() {
        return is_income;
    }

    public void setIs_income(boolean is_income) {
        this.is_income = is_income;
    }
}

