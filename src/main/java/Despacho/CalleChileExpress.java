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
public class CalleChileExpress {
    private int streetId;
    private String streetName;
    private String countyName;
    private String roadType;

    public CalleChileExpress(int streetId, String streetName, String countyName, String roadType) {
        this.streetId = streetId;
        this.streetName = streetName;
        this.countyName = countyName;
        this.roadType = roadType;
    }

    public CalleChileExpress() {
         this.streetId = 0;
        this.streetName ="";
        this.countyName = "";
        this.roadType = "";
    }

    public int getStreetId() {
        return streetId;
    }

    public void setStreetId(int streetId) {
        this.streetId = streetId;
    }

    public String getStreetName() {
        return streetName;
    }

    public void setStreetName(String streetName) {
        this.streetName = streetName;
    }

    public String getCountyName() {
        return countyName;
    }

    public void setCountyName(String countyName) {
        this.countyName = countyName;
    }

    public String getRoadType() {
        return roadType;
    }

    public void setRoadType(String roadType) {
        this.roadType = roadType;
    }
    
}
