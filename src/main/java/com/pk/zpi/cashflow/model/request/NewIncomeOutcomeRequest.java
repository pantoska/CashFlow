package com.pk.zpi.cashflow.model.request;

import java.util.Date;

public class NewIncomeOutcomeRequest {
    public int amount = 0;
    public Date date = null;
    public String note;
    public int id_subcategory = -1;
    public int id_m_acc = -1;
    public int type = -1;

    public boolean isAllData() {
        if (amount == 0 || id_subcategory == -1 || id_m_acc == -1) return false;

        if(!(type == 0 || type == 1)) return false;

        return date!= null;
    }
}
