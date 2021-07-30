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
public class ComunaChileExpress {
    private String countyCode;
    private String countyName;
    private String regionCode;
    private int ineCountyCode;
    private int queryMode;
    private String coverageName;

    public ComunaChileExpress() {
        this.countyCode = "";
        this.countyName = "";
        this.regionCode = "";
        this.ineCountyCode =0;
        this.queryMode = 0;
        this.coverageName ="";
        
    }
    
    public ComunaChileExpress ComunaOrigenChileExpress()
    {
        this.countyCode="PEDR";
        this.countyName="PEDRO AGUIRRE CERDA";
        this.regionCode="RM";
        this.ineCountyCode=626;
        this.queryMode=1;
        this.coverageName="PEDRO AGUIRRE CERDA";
        return this;
    }

    public ComunaChileExpress(String countyCode, String countyName, String regionCode, int ineCountyCode, int queryMode, String coverageName) {
        this.countyCode = countyCode;
        this.countyName = countyName;
        this.regionCode = regionCode;
        this.ineCountyCode = ineCountyCode;
        this.queryMode = queryMode;
        this.coverageName = coverageName;
    }

    public String getCountyCode() {
        return countyCode;
    }

    public String getCountyName() {
        return countyName;
    }

    public String getRegionCode() {
        return regionCode;
    }

    public int getIneCountyCode() {
        return ineCountyCode;
    }

    public int getQueryMode() {
        return queryMode;
    }

    public String getCoverageName() {
        return coverageName;
    }

    public void setCountyCode(String countyCode) {
        this.countyCode = countyCode;
    }

    public void setCountyName(String countyName) {
        this.countyName = countyName;
    }

    public void setRegionCode(String regionCode) {
        this.regionCode = regionCode;
    }

    public void setIneCountyCode(int ineCountyCode) {
        this.ineCountyCode = ineCountyCode;
    }

    public void setQueryMode(int queryMode) {
        this.queryMode = queryMode;
    }

    public void setCoverageName(String coverageName) {
        this.coverageName = coverageName;
    }
    
    
}