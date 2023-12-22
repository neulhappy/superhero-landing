package com.shop;

import jakarta.servlet.http.HttpServletRequest;

import java.sql.Date;
import java.util.ArrayList;

public class OrderDTO {
    private int id;
    private int custom_id;
    private int status;
    private String purchaser_name;
    private String recipient_name;
    private String address;
    private String contact;
    private Date order_date;
    private String invoice;

    //이하 주문 상품 목록 테이블
    private ArrayList<ProductSet> productList;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustom_id() {
        return custom_id;
    }

    public void setCustom_id(int custom_id) {
        this.custom_id = custom_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getPurchaser_name() {
        return purchaser_name;
    }

    public void setPurchaser_name(String purchaser_name) {
        this.purchaser_name = purchaser_name;
    }

    public String getRecipient_name() {
        return recipient_name;
    }

    public void setRecipient_name(String recipient_name) {
        this.recipient_name = recipient_name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public String getInvoice() {
        return invoice;
    }

    public void setInvoice(String invoice) {
        this.invoice = invoice;
    }

    public ArrayList<ProductSet> getProductList() {
        return productList;
    }

    public void setProductList(ArrayList<ProductSet> productList) {
        this.productList = productList;
    }

    public int getProductListLength() {
        return productList.size();
    }

    public int getProductId(int num) {
        return productList.get(num).prod_id;
    }

    public int getProductQuantity(int num) {
        return productList.get(num).quantity;
    }

    public int setProductListByRequest(HttpServletRequest req) {
        ArrayList<ProductSet> productList = new ArrayList<>();
        int i = 0;
        while (req.getParameter("prod_id_" + i) != null) {
            int prodId = Integer.parseInt(req.getParameter("prod_id_" + i));
            int quantity = Integer.parseInt(req.getParameter("quantity_" + i));
            ProductSet product = new ProductSet(prodId, quantity);
            productList.add(product);
            i++;
        }
        this.productList = productList;
        return i;
    }

    static class ProductSet {
        private int prod_id;
        private int quantity;

        public ProductSet(int prodId, int quantity) {
            this.prod_id = prodId;
            this.quantity = quantity;
        }

        public ProductSet() {
        }

        public int getProd_id() {
            return prod_id;
        }

        public void setProd_id(int prod_id) {
            this.prod_id = prod_id;
        }

        public int getQuantity() {
            return quantity;
        }

        public void setQuantity(int quantity) {
            this.quantity = quantity;
        }
    }


}
