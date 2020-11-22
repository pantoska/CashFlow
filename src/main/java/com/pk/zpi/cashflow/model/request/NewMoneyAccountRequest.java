package com.pk.zpi.cashflow.model.request;

public class NewMoneyAccountRequest {
    public String accountName;
    public int id_user = -1;

    public boolean isAllData() {
        return accountName.length() > 0 && id_user != -1;
    }
}
