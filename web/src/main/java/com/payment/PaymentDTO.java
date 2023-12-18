package com.payment;

import java.sql.Date;

public class PaymentDTO {

    private String payment;  // 결제 타입

    private Date orderDate; // 주문일자

    private String isPay; //결제 되었는지

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getIsPay() {
        return isPay;
    }

    public void setIsPay(String isPay) {
        this.isPay = isPay;
    }
}
