package com.pk.zpi.cashflow.model.request;

public class NewSubcategoryRequest {
    public String name;
    public int id_category = -1;

    public boolean isAllData() {
        return name.length() != 0 && id_category != -1;
    }
}

