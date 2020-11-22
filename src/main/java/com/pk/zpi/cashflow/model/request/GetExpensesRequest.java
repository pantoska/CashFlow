package com.pk.zpi.cashflow.model.request;

import java.sql.Date;
import java.sql.Timestamp;

public class GetExpensesRequest {
    public Date startDate;
    public Date endDate;
    public int id_user;

    public Timestamp getStartDateTime() {
        return new Timestamp(startDate.getYear(), startDate.getMonth(), startDate.getDate(), 0, 0, 0, 0);
    }

    public Timestamp getEndDateTime() {
        return new Timestamp(endDate.getYear(), endDate.getMonth(), endDate.getDate(), 23, 59, 59, 0);
    }
}
