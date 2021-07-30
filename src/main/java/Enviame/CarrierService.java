/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Enviame;

/**
 *
 * @author pc
 */
public class CarrierService {
    private String name,code,priceFormatted;
    private int transitDays,price;

    public CarrierService() {
        this.name = "";
        this.code = "";
        this.priceFormatted = "";
        this.transitDays = 0;
        this.price = 0;
    }

    public CarrierService(String name, String code, String priceFormatted, int transitDays, int price) {
        this.name = name;
        this.code = code;
        this.priceFormatted = priceFormatted;
        this.transitDays = transitDays;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPriceFormatted() {
        return priceFormatted;
    }

    public void setPriceFormatted(String priceFormatted) {
        this.priceFormatted = priceFormatted;
    }

    public int getTransitDays() {
        return transitDays;
    }

    public void setTransitDays(int transitDays) {
        this.transitDays = transitDays;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    
}
