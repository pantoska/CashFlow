package com.pk.zpi.cashflow.model;

import com.pk.zpi.cashflow.services.dataModels.Expense;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ExpenseService {

    public List<Expense> getExpenses(Timestamp startDate, Timestamp endDate, int userId) {
        ConnectionManager cManager = new ConnectionManager();
        List<Expense> resultList = new ArrayList<>();
        try {
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("SELECT * FROM expense_list WHERE id_user = ? AND date >= ? AND date <= ?" +
                            "ORDER BY date DESC");
            statement.setInt(1, userId);
            statement.setTimestamp(2, startDate);
            statement.setTimestamp(3, endDate);
            ResultSet result = statement.executeQuery();


            if (result != null) {
                while (result.next()) {
                    resultList.add(new Expense(result.getInt("id_expense"),
                            result.getString("account"),
                            result.getInt("id_m_acc"),
                            result.getString("date"),
                            result.getInt("amount"),
                            result.getString("note"),
                            result.getInt("type"),
                            result.getString("subcategory"),
                            result.getInt("id_subcategory"),
                            result.getString("category"),
                            result.getInt("id_category"),
                            result.getString("color")));
                }
            }
            result.close();
            cManager.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            resultList = null;
        }
        return resultList;
    }

    public long getMoneySum(int idUser) {
        ConnectionManager cManager = new ConnectionManager();
        try {
            long result = -1;
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("SELECT SUM(amount) AS amount FROM expense_list WHERE id_user = ?");
            statement.setInt(1, idUser);
            ResultSet rs = statement.executeQuery();

            if (rs != null && rs.next()) {
                result = rs.getLong("amount");
            }

            rs.close();
            cManager.close();
            return result;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return -1;
        }
    }

    public boolean newIncomeOutcome(int amount, Date date, String note, int id_subcategory, int id_m_acc, int type) {
        ConnectionManager cManager = new ConnectionManager();
        try {
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("INSERT INTO expense (id_m_acc, amount, date, note, id_subcategory, type) " +
                            "VALUES (?, ?/100, ? ,?, ?, ?)");
            statement.setInt(1, id_m_acc);
            statement.setInt(2, amount);
            statement.setTimestamp(3, new Timestamp(date.getTime()));
            statement.setString(4, note);
            statement.setInt(5, id_subcategory);
            statement.setInt(6, type);
            statement.executeUpdate();

            cManager.close();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }

    public boolean newTransfer(int amount, int sourceAccountId, int destinationAccountId, Date date, String note) {
        ConnectionManager cManager = new ConnectionManager();
        try {
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("INSERT INTO expense (id_m_acc, amount, date, note, type) " +
                            "VALUES (?, ?/100, ? ,?, ?)");
            statement.setInt(1, sourceAccountId);
            statement.setInt(2, amount * -1);
            statement.setTimestamp(3, new Timestamp(date.getTime()));
            statement.setString(4, note);
            statement.setInt(5, 2);
            statement.executeUpdate();

            statement = cManager.getConnection()
                    .prepareStatement("INSERT INTO expense (id_m_acc, amount, date, note, type) " +
                            "VALUES (?, ?/100, ? ,?, ?)");
            statement.setInt(1, destinationAccountId);
            statement.setInt(2, amount);
            statement.setTimestamp(3, new Timestamp(date.getTime()));
            statement.setString(4, note);
            statement.setInt(5, 3);
            statement.executeUpdate();

            cManager.close();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }
}
