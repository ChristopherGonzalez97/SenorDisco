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
public class RegionChileExpress {
    private String regionId;
    private String regionName;
    private int ineRegionCode;

    public RegionChileExpress(String regionId, String regionName, int ineRegionCode) {
        this.regionId = regionId;
        this.regionName = regionName;
        this.ineRegionCode = ineRegionCode;
    }

    public RegionChileExpress() {
        this.regionId = "";
        this.regionName = "";
        this.ineRegionCode = 0;
    }

    public String getRegionId() {
        return regionId;
    }

    public String getRegionName() {
        return regionName;
    }

    public int getIneRegionCode() {
        return ineRegionCode;
    }

    public void setRegionId(String regionId) {
        this.regionId = regionId;
    }

    public void setRegionName(String regionName) {
        this.regionName = regionName;
    }

    public void setIneRegionCode(int ineRegionCode) {
        this.ineRegionCode = ineRegionCode;
    }
    
    
    
}
