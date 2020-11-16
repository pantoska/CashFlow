package com.pk.zpi.cashflow.model;

import com.pk.zpi.cashflow.services.dataModels.MoneyAccount;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MoneyAccountService {

    public List<MoneyAccount> getUserMoneyAccounts(int idUser) {
        ConnectionManager cManager = new ConnectionManager();
        try{
            List<MoneyAccount> result = new ArrayList<>();
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("SELECT *  FROM money_account_sum WHERE id_user = ?");
            statement.setInt(1, idUser);
            ResultSet rs = statement.executeQuery();

            if(rs != null) {
                while(rs.next()) {
                    result.add(new MoneyAccount(rs.getInt("id_m_acc"),
                            rs.getString("name"),
                            rs.getBoolean("visible"),
                            rs.getInt("amount")));
                }
            }

            rs.close();
            cManager.close();
            return result;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public boolean createMoneyAccount(int idUser, String name) {
        ConnectionManager cManager = new ConnectionManager();
        try{
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("INSERT INTO money_account (name, id_user, visible) " +
                            "VALUES (?, ?, 1)");
            statement.setString(1, name);
            statement.setInt(2, idUser);
            statement.executeUpdate();

            cManager.close();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }

    public boolean editMoneyAccount(int idUser, String name, int moneyAccountId) {
        ConnectionManager cManager = new ConnectionManager();
        try{
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("UPDATE money_account SET name = ? " +
                            "WHERE  id_user = ? AND id_m_acc = ?");
            statement.setString(1, name);
            statement.setInt(2, idUser);
            statement.setInt(3, moneyAccountId);
            statement.executeUpdate();

            cManager.close();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }

    public boolean deleteMoneyAccount(int idMoneyAccount, int idUser) {
        ConnectionManager cManager = new ConnectionManager();
        try{
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("DELETE FROM money_account WHERE " +
                            "id_m_acc = ? AND id_user = ?");
            statement.setInt(1, idMoneyAccount);
            statement.setInt(2, idUser);
            statement.executeUpdate();

            cManager.close();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }
}
