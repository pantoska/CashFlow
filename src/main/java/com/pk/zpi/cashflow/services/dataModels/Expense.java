package com.pk.zpi.cashflow.services.dataModels;

public class Expense {
    private int expenseId;
    private String moneyAccountName;
    private int moneyAccountId;
    private String date;
    private int amount;
    private String note;
    private int type;
    private String subcategoryName;
    private int subcategoryId;
    private String categoryName;
    private int categoryId;
    private String color;

    public Expense(int expenseId, String moneyAccountName, int moneyAccountId, String date, int amount, String note, int type, String subcategoryName, int subcategoryId, String categoryName, int categoryId, String color) {
        this.expenseId = expenseId;
        this.moneyAccountName = moneyAccountName;
        this.moneyAccountId = moneyAccountId;
        this.date = date;
        this.amount = amount;
        this.note = note;
        this.type = type;
        this.subcategoryName = subcategoryName;
        this.subcategoryId = subcategoryId;
        this.categoryName = categoryName;
        this.categoryId = categoryId;
        this.color = color;
    }

    public String getMoneyAccountName() {
        return moneyAccountName;
    }

    public void setMoneyAccountName(String moneyAccountName) {
        this.moneyAccountName = moneyAccountName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getSubcategoryName() {
        return subcategoryName;
    }

    public void setSubcategoryName(String subcategoryName) {
        this.subcategoryName = subcategoryName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getMoneyAccountId() {
        return moneyAccountId;
    }

    public void setMoneyAccountId(int moneyAccountId) {
        this.moneyAccountId = moneyAccountId;
    }

    public int getSubcategoryId() {
        return subcategoryId;
    }

    public void setSubcategoryId(int subcategoryId) {
        this.subcategoryId = subcategoryId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getExpenseId() {
        return expenseId;
    }

    public void setExpenseId(int expenseId) {
        this.expenseId = expenseId;
    }
}
