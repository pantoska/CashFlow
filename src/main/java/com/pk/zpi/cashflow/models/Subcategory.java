package com.pk.zpi.cashflow.models;

public class Subcategory {
    private int id_subcategory;
    private String name;

    public Subcategory(int id_subcategory, String name) {
        this.id_subcategory = id_subcategory;
        this.name = name;
    }

    public int getId_subcategory() {
        return id_subcategory;
    }

    public void setId_subcategory(int id_subcategory) {
        this.id_subcategory = id_subcategory;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
