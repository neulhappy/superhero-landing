package com.shop;

import java.sql.Date;

public class PaymentDTO {

    private String payment;  // 결제 타입

    private String payDate; // 결제 일자

    private String isPay; //결제 되었는지

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getPayDate() {
        return payDate;
    }

    public void setPayDate(String payDate) {
        this.payDate = payDate;
    }

    public String getIsPay() {
        return isPay;
    }

    public void setIsPay(String isPay) {
        this.isPay = isPay;
    }
}
