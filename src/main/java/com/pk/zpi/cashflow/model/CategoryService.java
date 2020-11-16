package com.pk.zpi.cashflow.model;

import com.pk.zpi.cashflow.services.dataModels.Category;
import com.pk.zpi.cashflow.services.dataModels.Color;
import com.pk.zpi.cashflow.services.dataModels.Subcategory;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryService {

    public List<Category> getAllCategory(int idUser) {
        ConnectionManager cManager = new ConnectionManager();
        List<Category> categoryList = new ArrayList<>();
        try {
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("SELECT category.id_category, category.name AS catName, color, is_income, " +
                            "id_def_subcategory, subcategory.name AS subcatname, id_sub_cat  FROM category " +
                            "JOIN subcategory ON category.id_category = subcategory.id_category " +
                            "JOIN color ON category.id_color = color.id_color " +
                            " WHERE id_user = ? " +
                            "ORDER BY id_category ");
            statement.setInt(1, idUser);
            ResultSet result = statement.executeQuery();

            if (result != null) {
                int idPrefSubcategory = -1;
                int actualIdCategory;
                while (result.next()) {
                    actualIdCategory = result.getInt("id_category");
                    if (actualIdCategory == idPrefSubcategory) {
                        categoryList.get(categoryList.size() - 1).getSubcategoryList().add(
                                new Subcategory(result.getInt("id_sub_cat"),
                                        result.getString("subcatname"))
                        );

                    } else {
                        List<Subcategory> subcategoryList = new ArrayList<>();
                        subcategoryList.add(
                                new Subcategory(result.getInt("id_sub_cat"),
                                        result.getString("subcatname"))
                        );

                        categoryList.add(new Category(result.getInt("id_category"),
                                result.getString("catName"),
                                result.getString("color"),
                                subcategoryList,
                                result.getBoolean("is_income"),
                                result.getInt("id_def_subcategory")
                        ));
                    }

                    idPrefSubcategory = actualIdCategory;
                }
            }
            result.close();
            cManager.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return categoryList;
    }

    public boolean createCategory(int id_user, String name, int id_color, boolean is_income) {
        ConnectionManager cManager = new ConnectionManager();
        try {
            int catId, subcategoryId;
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("INSERT INTO category (name, id_user, id_color, is_income) " +
                            "VALUES (?, ?, ?, ?)");
            statement.setString(1, name);
            statement.setInt(2, id_user);
            statement.setInt(3, id_color);
            statement.setBoolean(4, is_income);
            statement.executeUpdate();

            ResultSet rs = cManager.getStatement().executeQuery("SELECT LAST_INSERT_ID() AS ID");
            rs.next();
            catId = rs.getInt("ID");

            subcategoryId = createNewSubcategoryQuery("Ogólnie - " + name, catId);

            statement = cManager.getConnection()
                    .prepareStatement("UPDATE category SET id_def_subcategory = ? WHERE id_category = ? ");
            statement.setInt(1, subcategoryId);
            statement.setInt(2, catId);
            statement.executeUpdate();

            rs.close();
            cManager.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
        return true;
    }

    private int createNewSubcategoryQuery(String name, int id_category) throws SQLException {
        ConnectionManager cManager = new ConnectionManager();
        cManager.connect();
        PreparedStatement statement = cManager.getConnection()
                .prepareStatement("INSERT INTO subcategory (name, id_category) " +
                        "VALUES (?, ?)");
        statement.setString(1, name);
        statement.setInt(2, id_category);
        statement.executeUpdate();

        ResultSet rs = cManager.getStatement().executeQuery("SELECT LAST_INSERT_ID() AS ID");
        rs.next();
        int result = rs.getInt("ID");
        rs.close();
        cManager.close();
        return result;
    }

    public int createNewSubcategory(String name, int id_category) {
        ConnectionManager cManager = new ConnectionManager();
        int result = -1;
        try {
            cManager.connect();
            result = createNewSubcategoryQuery(name, id_category);
            cManager.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return result;
        }
        return result;
    }

    public List<Color> getColors() {
        ConnectionManager cManager = new ConnectionManager();
        List<Color> result = new ArrayList<>();
        try {
            cManager.connect();
            PreparedStatement statement = cManager.getConnection()
                    .prepareStatement("SELECT * FROM color ");
            ResultSet rs = statement.executeQuery();

            if (rs != null) {
                while (rs.next()) {
                    result.add(new Color(rs.getInt("id_color"), rs.getString("color")));
                }
            }

            rs.close();
            cManager.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return null;
        }
        return result;
    }
}
