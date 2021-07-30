/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Despacho;

/**
 *
 * @author pc
 */
public class HeaderResponse {
    private double certificateNumber;
    private int countOfGeneratedOrders;

    public HeaderResponse() {
        
        this.certificateNumber=0;
        this.countOfGeneratedOrders=0;
    }

    public double getCertificateNumber() {
        return certificateNumber;
    }

    public void setCertificateNumber(double certificateNumber) {
        this.certificateNumber = certificateNumber;
    }

    public int getCountOfGeneratedOrders() {
        return countOfGeneratedOrders;
    }

    public void setCountOfGeneratedOrders(int countOfGeneratedOrders) {
        this.countOfGeneratedOrders = countOfGeneratedOrders;
    }

    @Override
    public String toString() {
        return "HeaderResponse{" + "certificateNumber=" + certificateNumber + ", countOfGeneratedOrders=" + countOfGeneratedOrders + '}';
    }

    public HeaderResponse(double certificateNumber, int countOfGeneratedOrders) {
        this.certificateNumber = certificateNumber;
        this.countOfGeneratedOrders = countOfGeneratedOrders;
    }
    
    
}
