/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Enviame;

import java.util.List;

/**
 *
 * @author pc
 */
public class Carrier {
    private String name;
    private String code;
    private List<CarrierService> services;

    public Carrier() {
        this.name = "";
        this.code = "";
        this.services = null;
    }

    public Carrier(String name, String code, List<CarrierService> services) {
        this.name = name;
        this.code = code;
        this.services = services;
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

    public List<CarrierService> getServices() {
        return services;
    }

    public void setServices(List<CarrierService> services) {
        this.services = services;
    }
    
    
}
