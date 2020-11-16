package com.pk.zpi.cashflow.model.request;

public class ChangePasswordRequest {
    public int id_user = -1;
    public String oldPassword;
    public String newPassword;

    public boolean isAllData() {
        return oldPassword.length() != 0 && newPassword.length() != 0 && id_user != -1;
    }
}

