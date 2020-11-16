package com.pk.zpi.cashflow.model;

import com.pk.zpi.cashflow.security.MyUserDetails;
import com.pk.zpi.cashflow.security.Role;
import com.pk.zpi.cashflow.services.dataModels.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserService {

    public MyUserDetails getUserByName(String login) throws Exception {
//        return new MyUserDetails("krzysiek.swal@gmail.com", "admin", Role.ADMIN, true, 1);
        ConnectionManager cManager = new ConnectionManager();

        MyUserDetails myUserDetails = null;
        try {
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("SELECT * FROM users_list WHERE email = ?");
            statement.setString(1, login);
            ResultSet result = statement.executeQuery();

            if (result != null && result.next()) {
                myUserDetails = new MyUserDetails(result.getString("email"),
                        result.getString("password"),
                        getRoleFromInt(result.getInt("rol")),
                        result.getBoolean("active"),
                        result.getInt("id_user"));
            } else {
                result.close();
                cManager.close();
                throw new Exception("Bad user name");
            }
            result.close();
            cManager.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return myUserDetails;
    }

    public int getUserIdByName(String login) {
        ConnectionManager cManager = new ConnectionManager();
        int resultInt = -1;
        try {
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("SELECT id_user FROM users_list WHERE email = ?");
            statement.setString(1, login);
            ResultSet result = statement.executeQuery();

            if (result != null && result.next()) {
                resultInt = result.getInt("id_user");
            }
            result.close();
            cManager.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultInt;
    }

    public User getUserById(int id) {
        ConnectionManager cManager = new ConnectionManager();
        User myUserDetails = null;
        try {
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("SELECT * FROM users_list WHERE id_user = ?");
            statement.setInt(1, id);
            ResultSet result = statement.executeQuery();

            if (result != null && result.next()) {
                myUserDetails = new User(result.getInt("id_user"),
                        result.getString("email"),
                        result.getString("name"),
                        result.getInt("rol")
                );
            }
            result.close();
            cManager.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return myUserDetails;
    }

    public int createNewUser(String email, String password, String name) {
        ConnectionManager cManager = new ConnectionManager();
        if (getUserIdByName(email) != -1) {
            return -1;
        }

        try {
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("INSERT INTO users (email, password, name, active) VALUES (?, ?, ?, 1)");
            statement.setString(1, email);
            statement.setString(2, password);
            statement.setString(3, name);
            statement.executeUpdate();

            cManager.close();
            return 1;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }

    public boolean deleteUser(String email, String password) {
        ConnectionManager cManager = new ConnectionManager();
        try {
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("DELETE FROM users WHERE email = ? AND password = ?");
            statement.setString(1, email);
            statement.setString(2, password);
            statement.executeUpdate();

            cManager.close();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }

    public boolean changePassword(int idUser, String actualPassword, String newPassword) {
        ConnectionManager cManager = new ConnectionManager();
        try {
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("UPDATE users SET password = ? WHERE id_user = ? AND password = ?");
            statement.setString(1, newPassword);
            statement.setInt(2, idUser);
            statement.setString(3, actualPassword);
            statement.executeUpdate();

            cManager.close();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }

    private Role getRoleFromInt(int role) {
        if (role == 0)
            return Role.ROLE_USER;
        else if (role == 1)
            return Role.ROLE_ADMIN;
        return null;
    }

    public List<User> adminGetAllUsers() {
        ConnectionManager cManager = new ConnectionManager();
        try {
            List<User> userList = null;
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("SELECT * FROM users_list");
            ResultSet rs = statement.executeQuery();

            if (rs != null) {
                userList = new ArrayList<>();
                while(rs.next()){
                    userList.add(new User(rs.getInt("id_user"),
                            rs.getString("email"),
                            rs.getString("name"),
                            rs.getInt("rol")));
                }
            }

            cManager.close();
            return userList;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
    }

    public boolean adminDeleteUser(int idUser) {
        ConnectionManager cManager = new ConnectionManager();
        try {
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("DELETE FROM users WHERE id_user = ?");
            statement.setInt(1, idUser);
            statement.executeUpdate();

            cManager.close();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }
}
