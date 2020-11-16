package com.pk.zpi.cashflow.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionManager {
    private Connection connection;
    private Statement statement;

    public void connect() throws SQLException {
        connection = DriverManager.getConnection("jdbc:mysql://192.168.0.9:3306/budggeter2?serverTimezone=UTC", "root", "@Goni8Leopardow");
        statement = connection.createStatement();
    }

    public void close() throws SQLException {
        statement.close();
        connection.close();
    }

    public Statement getStatement() {
        return statement;
    }

    public Connection getConnection() {
        return connection;
    }

}
