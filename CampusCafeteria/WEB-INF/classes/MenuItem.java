package com.cafeteria.models;

public class MenuItem {
    private int item_id;
    private String name;
    private String description;
    private double price;

    // Getters and Setters
    public int getId() {
        return item_id;
    }

    public void setId(int item_id) {
        this.item_id = item_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
