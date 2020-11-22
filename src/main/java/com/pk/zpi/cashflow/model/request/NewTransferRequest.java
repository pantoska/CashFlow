package com.pk.zpi.cashflow.model.request;

import java.util.Date;

public class NewTransferRequest {
    public int sourceAccountId = -1;
    public int destinationAccountId = -1;
    public Date date = null;
    public String note;
    public int amount = 0;
    public int id_user = -1;

    public boolean isAllData() {
        if (sourceAccountId == -1 || destinationAccountId == -1 || amount <= 0 || id_user == -1)
            return false;

        return date != null;
    }
}
