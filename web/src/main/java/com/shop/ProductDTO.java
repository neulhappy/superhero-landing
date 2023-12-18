package com.shop;

public class ProductDTO {
    private int id;
    private String name;
    private int price;
    private int hero;
    private boolean able;

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setAble(boolean able) {
        this.able = able;
    }

    public void setHero(int hero) {
        this.hero = hero;
    }
}
