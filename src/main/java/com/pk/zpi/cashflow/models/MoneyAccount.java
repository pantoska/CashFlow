package com.pk.zpi.cashflow.models;


public class MoneyAccount {
    private int id_m_acc;
    private String accountName;
    private boolean visible;
    private int amount;

    public MoneyAccount(int id_m_acc, String accountName, boolean visible, int amount) {
        this.id_m_acc = id_m_acc;
        this.accountName = accountName;
        this.visible = visible;
        this.amount = amount;
    }

    public int getId_m_acc() {
        return id_m_acc;
    }

    public void setId_m_acc(int id_m_acc) {
        this.id_m_acc = id_m_acc;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public boolean isVisible() {
        return visible;
    }

    public void setVisible(boolean visible) {
        this.visible = visible;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}

