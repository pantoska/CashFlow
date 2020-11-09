package com.pk.zpi.cashflow.models;

public class User {
    private int id_user;
    private String email;
    private String name;
    private int role;


    public User(int id_user, String email, String name, int role) {
        this.id_user = id_user;
        this.email = email;
        this.name = name;
        this.role = role;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
}
