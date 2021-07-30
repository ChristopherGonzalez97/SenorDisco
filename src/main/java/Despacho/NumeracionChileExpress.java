/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Despacho;

/**
 *
 * @author chris
 */
public class NumeracionChileExpress {
    private int number;
    private double latitude;
    private double longitude;
    private int addresId;

    public NumeracionChileExpress(int number, double latitude, double longitude, int addresId) {
        this.number = number;
        this.latitude = latitude;
        this.longitude = longitude;
        this.addresId = addresId;
    }

    public NumeracionChileExpress() {
        this.number = 0;
        this.latitude = 0;
        this.longitude = 0;
        this.addresId = 0;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public int getAddresId() {
        return addresId;
    }

    public void setAddresId(int addresId) {
        this.addresId = addresId;
    }
    
    
    
}
